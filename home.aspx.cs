using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace pharmacolony
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void query_Click(object sender, EventArgs e)
        {
            String name = String.Empty;
            String email = String.Empty;
            String subject = String.Empty;
            String message = String.Empty;

            var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            var db = client.GetDatabase("pharmacolony");
            var things = db.GetCollection<BsonDocument>("query");

            name = qname.Text;
            email = qemail.Text;
            subject = qsub.Text;
            message= qmsg.Text;

            var doc = new BsonDocument
                    {
                        {"name", name},{"email", email},{"subject",subject },{"message", message}
                      };

            things.InsertOne(doc);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Query Submitted Successfully,Be patient'); window.location.href='home.aspx#contact'", true);
        }
    }
}