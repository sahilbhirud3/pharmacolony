using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace pharmacolony
{
    public partial class home : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM[dbo].[medical] ";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                 Label2.Text = dt.Rows.Count.ToString();
                sql = "SELECT * FROM[dbo].[distributor] ";
                da = new SqlDataAdapter(sql, con);
                dt = new DataTable();
                da.Fill(dt);
                Label1.Text = dt.Rows.Count.ToString();
            }

            //protected void query_Click(object sender, EventArgs e)
            //{
            //    //String name = String.Empty;
            //String email = String.Empty;
            //String subject = String.Empty;
            //String message = String.Empty;

            //var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            //var db = client.GetDatabase("pharmacolony");
            //var things = db.GetCollection<BsonDocument>("query");

            //name = qname.Text;
            //email = qemail.Text;
            //subject = qsub.Text;
            //message= qmsg.Text;

            //var doc = new BsonDocument
            //        {
            //            {"name", name},{"email", email},{"subject",subject },{"message", message}
            //          };

            //things.InsertOne(doc);

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Query Submitted Successfully,Be patient'); window.location.href='home.aspx#contact'", true);
            // }
        }
    }
}