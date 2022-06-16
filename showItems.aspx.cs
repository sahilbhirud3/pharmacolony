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
    public partial class showItems : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;


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
                var distlic = Session["licNo"];
                string sql = "select * from item where dLic='"+distlic+"'";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
            }
        }

        
        protected void lnkadd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            var distlic = Session["licNo"];

            string query = "Insert into item(dLic,name,price,manufacturer,category,gst,packaging) Values" +
                    "('" + distlic + "','" +item.Text + "','" + price.Text + "','" + manufacturer.Text + "','" + category.Text + "','" + gst.Text + "','" + packaging.Text+ "')";
                SqlDataAdapter da1 = new SqlDataAdapter(query, con);
                con.Open();
                da1.SelectCommand.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added Successfully')", true);

                con.Close();
            Response.Redirect("~/showItems.aspx");


        }
        
        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnkEdit = (LinkButton)sender;
            int id = Convert.ToInt32(lnkEdit.CommandArgument.ToString());
            Response.Redirect(string.Format("~/editItem.aspx?id={0}",id));
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (LinkButton)sender;
            int id = Convert.ToInt32(lnkDelete.CommandArgument.ToString());
            string sql = @"DELETE FROM [dbo].[item] WHERE [id]=@ID
                           ";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Item record deleted successfully');", true);
            }
            BindGrid();
        }

        
    }
}