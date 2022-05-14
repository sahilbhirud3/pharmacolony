using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using MongoDB.Bson;
using MongoDB.Driver;
using System.Security.Cryptography;

using System.Threading.Tasks;
using System.Threading;

namespace pharmacolony
{
    public partial class registration : System.Web.UI.Page
    {
        //private CancellationToken cancellationToken;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
            
        }
        protected void BtnMedicalReg_Click(object sender, EventArgs e)
        {
            String name = String.Empty;
            String vcity = String.Empty;
            String vstate = String.Empty;
            String lno = String.Empty;
            String fname = String.Empty;
            String lname = String.Empty;
            String vemail = String.Empty;
            String contact = String.Empty;
            String addr = String.Empty;
            String pass = String.Empty;


            var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            var db = client.GetDatabase("pharmacolony");
            var things = db.GetCollection<BsonDocument>("medical");

            name = medicalName.Text;
            lno = licenseNumber.Text;
            fname = oFirstName.Text;
            lname = oLastName.Text;
            vemail = email.Text;
            contact = contactNumber.Text;
            addr = address.Text;
            vcity = city.Text;
            vstate = state.Text;
            pass = EncodePasswordToBase64(password.Text);
            var filter = Builders<BsonDocument>.Filter.Eq("licno", lno);
            var filter1 = Builders<BsonDocument>.Filter.Eq("email", vemail);
            var combinefil = Builders<BsonDocument>.Filter.Or(filter1,filter);

            var present =  things.Find(combinefil).FirstOrDefault();
            if (present == null)//to check already register or not
            {
               
                        var doc = new BsonDocument
                    {
                        {"name", name},{"licno", lno},{"fname", fname},{"lname", lname},
                        {"email", vemail},{"contact", contact},{"address", addr},
                        {"city", vcity},{"state", vstate},{"password", pass},{ "status",1}

                    };

                things.InsertOne(doc);
            
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Successfully,Try Login after sometime'); window.location.href='home.aspx'", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Already,Try Login')", true);

            }
        }

    

        

        protected  void BtnDistributorReg_Click(object sender, EventArgs e)
        {
            String name = String.Empty;
            String fname = String.Empty;
            String vemail = String.Empty;
            String addr = String.Empty;
            String vstate = String.Empty;

            String lno = String.Empty;
            String lname = String.Empty;
            String contact = String.Empty;
            String vcity = String.Empty;
            String pass = String.Empty;


            var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            var db = client.GetDatabase("pharmacolony");
            var things = db.GetCollection<BsonDocument>("distributor");

            name = distributorName.Text;
            lno = dlicenseNumber.Text;
            fname = doFirstName.Text;
            lname = doLastName.Text;
            vemail = dEmail.Text;
            contact = dContactNumber.Text;
            addr = dAddress.Text;
            vcity = dCity.Text;
            vstate = dState.Text;
            pass = EncodePasswordToBase64(dPassword.Text);
            var filter = Builders<BsonDocument>.Filter.Eq("licno", lno);
            var present = things.Find(filter).FirstOrDefault();
            if (present == null)
              {
                var doc = new BsonDocument
               {
                    {"name", name},{"licno", lno},{"fname", fname},{"lname", lname},
                    {"email", vemail},{"contact", contact},{"address", addr},
                    {"city", vcity},{"state", vstate},{"password", pass},{ "status",1}

               };

            things.InsertOne(doc);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Successfully,Try Login after sometime'); window.location.href='home.aspx'", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Already,Try Login')", true);

            }
        }
    }
}
