using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{

    //global variable for grand total
    public static class g3 { public static double gtotal; public static int id; }
    public partial class distOrderView : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                g3.id = Convert.ToInt32(Request.QueryString["id"]);

                BindGrid();
            }

        }
        private void BindGrid()
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql1 = "SELECT [medicalName],[datetime] FROM [dbo].[order],[medical] where id='"+g3.id+"' AND [order].licNo=[medical].licNo ";
                string order_datetime = string.Empty, order_medical = string.Empty;
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();

                // Call ExecuteReader to return a DataReader  
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    order_medical=reader["medicalName"].ToString();
                    order_datetime = reader["datetime"].ToString();

                }
                order_details.Text =g3.id.ToString();
                order_details1.Text=order_medical;
                order_details2.Text=order_datetime;

                reader.Close();
                string sql = "SELECT i.[id],[name],[manufacturer],[category],[packaging],[gst],[i].[price],[quantity],[total],[oi].[status] FROM[dbo].[item] as i,[dbo].[order] as o,order_item as oi WHERE o.id=oi.order_id  AND oi.item_id=i.id AND i.[dLic]='"+Session["licno"]+"' AND oi.order_id='"+g3.id+"'";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
                //calculate Grand Total

                g3.gtotal=Convert.ToDouble(dt.AsEnumerable().Sum(row => row.Field<double>("total")));
                Grtotal.Text= "Grand Total :"+ g3.gtotal.ToString();
                con.Close();
            }

        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnkEdit = (LinkButton)sender;
            string i_id = lnkEdit.CommandArgument.ToString();
            string sql = "UPDATE [dbo].[order_item] SET [status] = 'confirm' WHERE [item_id]=@id AND order_id=@id1";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", i_id);
                cmd.Parameters.AddWithValue("@id1", g3.id);
                con.Open();
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Status Updated');", true);
            }
            BindGrid();
        }
    }
}