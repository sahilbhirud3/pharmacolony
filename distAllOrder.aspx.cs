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
    public partial class distAllOrder : System.Web.UI.Page
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

                string sql = "SELECT DISTINCT [o].[id] ,[m].[medicalName],[o].[datetime],[o].[gtotal] FROM [dbo].[order] as o,[dbo].[order_item] as oi,[dbo].[item] as i,[dbo].[distributor] as d,[dbo].[medical] as m WHERE [o].id=[oi].order_id AND [oi].item_id=[i].id AND [i].dLic=[d].licNo AND [o].licNo=[m].licNo AND [d].licNo='"+Session["licno"]+"' ORDER BY datetime DESC ";

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
            Response.Redirect(string.Format("~/distAllOrderView.aspx?id={0}", id));



        }
    }
}