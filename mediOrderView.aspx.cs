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
    public static class g1 { public static double gtotal; }
    public partial class mediOrderView : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);

                BindGrid();
            }

        }
        private void BindGrid()
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql1 = "SELECT [datetime] FROM [dbo].[order] where licNo='"+Session["licno"]+"' AND id='"+id+"' ";
                string order_datetime=string.Empty;
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();

                // Call ExecuteReader to return a DataReader  
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                     order_datetime = reader["datetime"].ToString();
                    
                }
                order_details.Text = id.ToString();
                order_details1.Text =order_datetime;
                reader.Close();
                string sql = "SELECT i.[id],[name],[distributorName],[manufacturer],[category],[packaging],[gst],[i].[price],[quantity],[total],[oi].[status] FROM[dbo].[item] as i,distributor as d,[dbo].[order] as o,order_item as oi WHERE d.licNo=i.dLic AND o.id=oi.order_id  AND oi.item_id=i.id AND o.[licNo]='"+Session["licno"]+"' AND oi.order_id='"+id+"'";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                grid1.DataSource = dt;
                grid1.DataBind();
                //calculate Grand Total

                g1.gtotal=Convert.ToDouble(dt.AsEnumerable().Sum(row => row.Field<double>("total")));
                Grtotal.Text= "Grand Total :"+ g1.gtotal.ToString();
                con.Close();
            }
      
        }
       
        
    }
}