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
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace pharmacolony
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);

        }
        protected void Button1_mediLogin(object sender, EventArgs e)
        {
            string encryptpass = EncodePasswordToBase64(password.Text);
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from medical where email =@email and password=@password", con);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@password", encryptpass);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if(dt.Rows[0]["status"].Equals(1))
                {
                    Session["email"] = email.Text;
                    Session["medicalName"] = dt.Rows[0]["medicalName"];
                    Session["licno"] = dt.Rows[0]["licNo"];
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successfully'); window.location.href='mediDash.aspx'", true);
                    Response.Redirect("mediDash.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account not activated yet')", true);

                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Credential')", true);
            }



        }
    }
}