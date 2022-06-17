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
    public static class g{ public static double gtotal; }
    public partial class medicalCart : System.Web.UI.Page
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

                string sql = "SELECT [id],[distributorName],[name],c.price,[manufacturer],[category],[gst],[packaging],[quantity],[total] FROM [dbo].[item] as i, distributor as d, cart as c where d.licNo=i.dLic AND c.item_id=i.id AND c.licNo='"+Session["licno"]+"'; ";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();

                //calculate Grand Total
                
                g.gtotal=Convert.ToDouble(dt.AsEnumerable().Sum(row => row.Field<double>("total")));
                Grtotal.Text= "Grand Total :"+ g.gtotal.ToString();
            }
        }
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (LinkButton)sender;
            int id = Convert.ToInt32(lnkDelete.CommandArgument.ToString());
            string sql = @"DELETE FROM [dbo].[cart] WHERE item_id=@ID AND licNo=@LICNO ";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@LICNO", Session["licno"]);
                con.Open();
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Item Removed from Cart');", true);
            }
            BindGrid();
        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "INSERT INTO[dbo].[order]([licNo],[gtotal],[status]) OUTPUT INSERTED.id VALUES(@licNo,@gtotal,@status)";
                SqlCommand cmd = new SqlCommand(sql, con);
                var templic = Session["licno"];
                cmd.Parameters.AddWithValue("@licNo", templic);
                cmd.Parameters.AddWithValue("@gtotal", g.gtotal);
                cmd.Parameters.AddWithValue("@status", "pending");
                con.Open();
                int order_id = Convert.ToInt32(cmd.ExecuteScalar());
                string sql1 = "INSERT INTO order_item(order_id, item_id, quantity, price, total) SELECT '"+order_id+"', item_id,quantity,price,total FROM cart;";
                SqlCommand cmd1 = new SqlCommand(sql1, con);

                cmd1.ExecuteNonQuery();
                string sql2 = @"DELETE FROM [dbo].[cart] WHERE [licNo]=@licno";

                    SqlCommand cmd2 = new SqlCommand(sql2, con);

                    cmd2.Parameters.AddWithValue("@licno", Session["licno"]);

                    
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Order Placed');", true);
                BindGrid();
            }
        }
    }
}