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
    public partial class Success : System.Web.UI.Page
    {

        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id=0;
            string orderId=string.Empty, paymentId=string.Empty;
            if (!Page.IsPostBack)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
                orderId = Request.QueryString["orderId"];
                paymentId = Request.QueryString["paymentId"];
            }
            string query = @"UPDATE [dbo].[order]
                                   SET 
                                      [status] = 'Paid'
                                      ,[payment_order_id] = @orderId
                                      ,[payment_id] = @paymentId
                                 WHERE id=@id";
            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.Parameters.AddWithValue("@orderId", orderId);
                cmd.Parameters.AddWithValue("@paymentId", paymentId);
                cmd.Parameters.AddWithValue("@id", id);

                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment Successfull');window.location='mediOrder.aspx';", true);

            }






        }
    }
}