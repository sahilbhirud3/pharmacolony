using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class distDash : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }
        protected void show()
        {
            Label5.Text = DateTime.Now.ToString("MMMM");
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT COUNT(id) FROM item WHERE dLic='"+Session["licno"]+"'";
                string sql1 = "SELECT  count(DISTINCT [o].[id]) FROM [dbo].[order] as o,[dbo].[order_item] as oi,[dbo].[item] as i WHERE [o].id=[oi].order_id AND [oi].item_id=[i].id AND [i].dLic='"+Session["licno"]+"' AND cast(datetime as date)=cast(getdate() as date) ";
                string sql2 = "SELECT  count(DISTINCT [o].[id]) FROM [dbo].[order] as o,[dbo].[order_item] as oi,[dbo].[item] as i WHERE [o].id=[oi].order_id AND [oi].item_id=[i].id AND [i].dLic='"+Session["licno"]+"' AND DATEPART(mm,datetime)=DATEPART(MONTH,getdate()) AND datepart(yyyy,datetime) =year(getdate())  ";
                string sql3 = "SELECT  count(DISTINCT [o].[id]) FROM [dbo].[order] as o,[dbo].[order_item] as oi,[dbo].[item] as i WHERE [o].id=[oi].order_id AND [oi].item_id=[i].id AND [i].dLic='"+Session["licno"]+"'";

                //string sql2 = "SELECT COUNT(id) FROM item";
                // string sql3 = "SELECT COUNT(id) FROM [dbo].[order]";

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmd1 = new SqlCommand(sql1, con);
                SqlCommand cmd2 = new SqlCommand(sql2, con);
                SqlCommand cmd3 = new SqlCommand(sql3, con);
                con.Open();


                Label1.Text = cmd.ExecuteScalar().ToString();
                Label2.Text = cmd1.ExecuteScalar().ToString();
                Label3.Text = cmd2.ExecuteScalar().ToString();
                Label4.Text = cmd3.ExecuteScalar().ToString();
                con.Close();
            }

        }
    }
}