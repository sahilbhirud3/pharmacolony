using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MongoDB.Bson;
using MongoDB.Driver;
using System.Security.Cryptography;
using System.Text;

namespace pharmacolony
{
    public partial class distributorLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);

        }
        protected void Button1_distLogin(object sender, EventArgs e)
        {
            String vemail = String.Empty;
            String pass = String.Empty;
            var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            var db = client.GetDatabase("pharmacolony");
            var things = db.GetCollection<BsonDocument>("distributor");
            vemail = email.Text;
            pass = EncodePasswordToBase64(password.Text);


            var filter = Builders<BsonDocument>.Filter.Eq("email", vemail);
            var filter1 = Builders<BsonDocument>.Filter.Eq("password", pass);

            var combinefil = Builders<BsonDocument>.Filter.And(filter1, filter);

            var present = things.Find(combinefil).FirstOrDefault();
            if (present == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Credential')", true);

            }
            else
            {
                if (present.GetElement("status").Value == 1)
                {
                    Session["email"] = vemail;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successfully'); window.location.href='distDash.aspx'", true);

                }
                else
                {


                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account is not Active yet !!')", true);
                }

            }

        }
    }
}