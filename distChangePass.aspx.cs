using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class distChangePass : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showInfo();
            }
        }
        protected void showInfo()
        {
            distributorName.Text = (string)Session["distributorName"];
            distributorUser.Text = (string)Session["email"];
            licNo.Text=(string)Session["licno"];

        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);

        }

        protected void chngPass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql1 = "SELECT * FROM distributor where licNo='"+Session["licno"]+"' ";
                string pass = string.Empty;
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();

                // Call ExecuteReader to return a DataReader  
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    pass=reader["password"].ToString();

                }

                reader.Close();
                if (pass==EncodePasswordToBase64(password.Text))
                {
                    string sql2 = @"UPDATE [dbo].[medical]
                       SET 
                          [password] = @password
                     WHERE [licNo]=@licno";
                    SqlCommand cmd1 = new SqlCommand(sql2, con);
                    cmd1.Parameters.AddWithValue("@password", EncodePasswordToBase64(newCpassword.Text.Trim()));
                    cmd1.Parameters.AddWithValue("@licNo", Session["licno"]);

                    cmd1.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Successfully');", true);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Current Password')", true);

                con.Close();
            }
        }
    }
}