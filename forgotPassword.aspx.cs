using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uniqueCode = string.Empty;
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // get the records matching the supplied username or email id.         
                cmd = new SqlCommand("select * from medical where licNo COLLATE Latin1_general_CS_AS=@licno and email COLLATE Latin1_general_CS_AS=@emailId", con);

                cmd.Parameters.AddWithValue("@licno", Convert.ToString(licenseNumber.Text.Trim()));
                cmd.Parameters.AddWithValue("@emailId", Convert.ToString(email.Text.Trim()));
                dr = cmd.ExecuteReader();
                cmd.Dispose();
                if (dr.HasRows)
                {
                    dr.Read();
                    //generate unique code
                    uniqueCode = Convert.ToString(System.Guid.NewGuid());
                    //Updating an unique random code in then UniquCode field of the database table
                    cmd = new SqlCommand("update medical set uniqueCode=@uniqueCode where licNo=@licno and email=@emailid", con);
                    cmd.Parameters.AddWithValue("@uniqueCode", uniqueCode);
                    cmd.Parameters.AddWithValue("@licno", licenseNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@emailid", email.Text.Trim());

                    StringBuilder strBody = new StringBuilder();
                    //Passing emailid,licno and generated unique code via querystring. For testing pass your localhost number and while making online pass your domain name instead of localhost path.
                    strBody.Append("Dear "+licenseNumber.Text.Trim()+",<br>Your Password Reset Link is here,<br><a href=https://localhost:44364/resetPassword?emailId=" + email.Text + "&licno=" + licenseNumber.Text + "&uCode=" + uniqueCode + ">Click here to change your password</a>");
                    // sbody.Append("&uCode=" + uniqueCode + "&uName=" + txtUserName.Text + ">Click here to change your password</a>");

                    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("pharmacolonynsk@gmail.com", dr["email"].ToString(), "Reset Your PharmaColony's Password", strBody.ToString());
                    //pasing the Gmail credentials to send the email

                    System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("pharmacolonynsk@gmail.com", "dlxmgopvaqyqpqao");

                    System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    mailclient.EnableSsl = true;
                    mailclient.UseDefaultCredentials = false;
                    mailclient.Credentials = mailAuthenticaion;
                    mail.IsBodyHtml = true;
                    mailclient.Send(mail);
                    dr.Close();
                    dr.Dispose();
                    cmd.ExecuteReader();
                    cmd.Dispose();
                    con.Close();
                    //lblStatus.Text = "Reset password link has been sent to your email address";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Reset password link has been sent to your email address');window.location.href = 'medicalLogin.aspx';", true);

                    email.Text = string.Empty;
                    licenseNumber.Text = string.Empty;
                }
                else
                {
                    //lblStatus.Text = "Please enter valid email address or username";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter valid email address or username');", true);

                    email.Text = string.Empty;
                    licenseNumber.Text = string.Empty;
                    con.Close();
                    return;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error Occured');", true);

                //lblStatus.Text = "Error Occured: " + ex.Message.ToString();
            }
            finally
            {
                cmd.Dispose();
            }
        }
    }
}