using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Razorpay.Api;

namespace pharmacolony
{
    public partial class mediOrder : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        private const string _key = "rzp_test_DYab9rvJPLuu32";
        private const string _secret = "wf7QWq2tKadi4XsH6boUmZio";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }

        }
        private void BindGrid()
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT [id],[datetime],[gtotal],[status] FROM [dbo].[order] where licNo='"+Session["licno"]+"' ORDER BY datetime DESC ";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();

            }
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            LinkButton lnkView = (LinkButton)sender;
            int id = Convert.ToInt32(lnkView.CommandArgument.ToString());
            Response.Redirect(string.Format("~/mediOrderView.aspx?id={0}", id));



        }
        //protected void lnkPay_Click(object sender, EventArgs e)
        //{
        //    LinkButton lnkView = (LinkButton)sender;
        //    int id = Convert.ToInt32(lnkView.CommandArgument.ToString());
        //    Response.Redirect(string.Format("~/pay.aspx?id={0}", id));



        //}

        protected void grid1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid1.Rows[rowIndex];
            int id = Convert.ToInt32(row.Cells[0].Text);
            double gtotal = Convert.ToDouble(row.Cells[2].Text);
            string contact = string.Empty;
            string chkstatus = string.Empty;



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Creating the command object
                SqlCommand cmd = new SqlCommand("select * from medical where licNo='"+Session["licno"]+"'", connection);
                // Opening Connection  
                connection.Open();
                // Executing the SQL query  
                SqlDataReader sdr = cmd.ExecuteReader();
                //Looping through each record
                while (sdr.Read())
                {
                    contact = (string)sdr["contact"];


                }
            }

            decimal amountinSubunits = (decimal)(gtotal * 100);
            string currency = "INR";
            string name = "PharmaColony";
            string description = "Payment Towards PharmaColony";
            string imageLogo = "img/pharmlogo.png";
            string profileName = (string)Session["medicalName"];
            string profileMobile = contact;
            string profileEmail = (string)Session["email"];
            Dictionary<string, string> notes = new Dictionary<string, string>()
            {
                { "note 1", "this is a payment note" }, { "note 2", "here another note, you can add max 15 notes" }
            };

            string orderId = CreateOrder(amountinSubunits, currency, notes);

            string jsFunction = "OpenPaymentWindow('"+ _key +"', '"+ amountinSubunits +"', '"+ currency +"', '"+ name +"', '"+ description +"', '"+ imageLogo +"', '"+ orderId +"', '"+ profileName +"', '"+ profileEmail +"', '"+ profileMobile +"', '"+ JsonConvert.SerializeObject(notes) +"','"+id+"');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);




        }
        private string CreateOrder(decimal amountInSubunits, string currency, Dictionary<string, string> notes)
        {
            try
            {
                int paymentCapture = 1;

                RazorpayClient client = new RazorpayClient(_key, _secret);
                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", amountInSubunits);
                options.Add("currency", currency);
                options.Add("payment_capture", paymentCapture);
                options.Add("notes", notes);

                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                System.Net.ServicePointManager.Expect100Continue = false;

                Order orderResponse = client.Order.Create(options);
                var orderId = orderResponse.Attributes["id"].ToString();
                return orderId;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void grid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType==DataControlRowType.DataRow)
            {
                LinkButton lnkPay = (LinkButton)e.Row.FindControl("lnkPay");

                if (e.Row.Cells[3].Text.Contains("Paid"))
                {
                    lnkPay.Visible= false;

                }
            }
        }
    }

}