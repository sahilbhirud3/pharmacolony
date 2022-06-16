using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace pharmacolony
{
    public partial class mediDash : System.Web.UI.Page
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
              
                string sql = "SELECT [id],[distributorName],[name],[price],[manufacturer],[category],[gst],[packaging] FROM[dbo].[item]as i, distributor as d where d.licNo=i.dLic; ";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
            }
        }
       



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            

            using (SqlConnection con = new SqlConnection(connectionString))
            {
               
                var search = TextBox1.Text.Trim();
                
                string sql = "SELECT [id],[distributorName],[name],[price],[manufacturer],[category],[gst],[packaging] FROM[dbo].[item]as i, distributor as d where d.licNo=i.dLic AND name LIKE '%"+search+"%'";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
               
           
            }
        }
        

        protected void grid1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex=Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid1.Rows[rowIndex];
            int Quantity = Convert.ToInt32((row.FindControl("TextBox2") as TextBox).Text);
            int id = Convert.ToInt32(row.Cells[0].Text);
            double price=Convert.ToDouble(row.Cells[3].Text);
            SqlConnection con = new SqlConnection(connectionString);
            string query="IF EXISTS(select * from cart where item_id='"+id+"' AND licNo='" + Session["licno"] + "')  update cart set quantity = '"+Quantity+"' where item_id='"+id+"' AND licNo='" + Session["licno"] + "' ELSE insert into cart(licNo,item_id,price,quantity) Values ('" + Session["licno"] + "','" + id + "','" + price + "','" + Quantity + "')";
            SqlDataAdapter da1 = new SqlDataAdapter(query, con);
            con.Open();
            da1.SelectCommand.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Added');", true);
           
            con.Close();

        }
    }
}