using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace pharmacolony
{
    public partial class registration : System.Web.UI.Page
    {
        //private CancellationToken cancellationToken;
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
        protected void BtnMedicalReg_Click(object sender, EventArgs e)
        {
           
            String pass = String.Empty;
            pass = EncodePasswordToBase64(password.Text);
            SqlConnection con = new SqlConnection(connectionString);
            string encryptpass = EncodePasswordToBase64(password.Text);

            SqlCommand cmd = new SqlCommand("select * from medical where email =@email or licNo=@licNo", con);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@licNo", licenseNumber.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Already,Try Login')", true);
            }
            else
            {

                 string query = "Insert into medical(medicalName,licNo,firstName,lastName,email,contact,address,city,state,password) Values" +
                     "('" + medicalName.Text + "','" + licenseNumber.Text + "','" + oFirstName.Text + "','" + oLastName.Text + "','" + email.Text + "','" + contactNumber.Text + "','" + address.Text + "','" + city.Text + "','" + state.Text + "','" + pass + "')";
                 SqlDataAdapter da1 = new SqlDataAdapter(query, con);
                 con.Open();
                 da1.SelectCommand.ExecuteNonQuery();
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Successfully,Try Login after sometime'); window.location.href='home.aspx'", true);

                 con.Close();
                
            }
        }   
       


        protected  void BtnDistributorReg_Click(object sender, EventArgs e)
        {


            String pass = String.Empty;
            pass = EncodePasswordToBase64(dPassword.Text);
            SqlConnection con = new SqlConnection(connectionString);
            string encryptpass = EncodePasswordToBase64(password.Text);

            SqlCommand cmd = new SqlCommand("select * from distributor where email =@email or licNo=@licNo", con);
            cmd.Parameters.AddWithValue("@email", dEmail.Text);
            cmd.Parameters.AddWithValue("@licNo", dlicenseNumber.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Already,Try Login')", true);
            }
            else
            {

                string query = "Insert into distributor(distributorName,licNo,firstName,lastName,email,contact,address,city,state,password) Values" +
                    "('" + distributorName.Text + "','" + dlicenseNumber.Text + "','" + doFirstName.Text + "','" + doLastName.Text + "','" + dEmail.Text + "','" + dContactNumber.Text + "','" + dAddress.Text + "','" + dCity.Text + "','" + dState.Text + "','" + pass + "')";
                SqlDataAdapter da1 = new SqlDataAdapter(query, con);
                con.Open();
                da1.SelectCommand.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registered Successfully,Try Login after sometime'); window.location.href='home.aspx'", true);

                con.Close();

            }
           
        }
    }
}
