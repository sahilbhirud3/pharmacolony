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
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        private void BindGrid()
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT[distributorName],[licNo],[firstName],[lastName],[email],[contact],[address],[state],[city] FROM[dbo].[distributor] WHERE [status]=0";



                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
            }
        }
        protected void lnkApprove_Click(object sender, EventArgs e)
        {
            LinkButton lnkApprove = (LinkButton)sender;
            string licno = lnkApprove.CommandArgument.ToString();
            string sql = "UPDATE [dbo].[distributor] SET[status] = 1 WHERE [licNo]=@licno";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@licno", licno);

                con.Open();
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Approved successfully');", true);
            }
            BindGrid();
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (LinkButton)sender;
            string licno = lnkDelete.CommandArgument.ToString();
            string sql = "DELETE FROM[dbo].[distributor] WHERE [licNo]=@licno";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@licno", licno);

                con.Open();
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Successful", "alert('Record deleted successfully');", true);
            }
            BindGrid();
        }
    }
}