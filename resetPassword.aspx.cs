using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class resetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataReader dr;
                try
                {
                    //Here we will check from the passed querystring that if the email id/username and generated unique code is same then the panel for resetting password will be visible otherwise not
                    cmd = new SqlCommand("select licNo,email,uniqueCode from medical where uniqueCode=@uniqueCode and email=@emailid and licNo=@licno", con);
                    cmd.Parameters.AddWithValue("@uniqueCode", Convert.ToString(Request.QueryString["uCode"]));
                    cmd.Parameters.AddWithValue("@emailid", Convert.ToString(Request.QueryString["emailId"]));
                    cmd.Parameters.AddWithValue("@licno", Convert.ToString(Request.QueryString["licno"]));

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    dr = cmd.ExecuteReader();

                    if (!dr.HasRows)
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "Showalert1();", true);
                        
                    }
                    dr.Close();
                    dr.Dispose();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", string.Format("alert('{1}', '{0}');", "ERROR OCCURED", ex.Message.ToString()), true);

                }
                finally
                {
                    cmd.Dispose();
                    con.Close();
                }
            }
        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);

        }
        protected void btnChangePwd_Click(object sender, EventArgs e)
        {
            try
            {   // Here we will update the new password and also set the unique code to null so that it can be used only for once.
                cmd = new SqlCommand("update medical set uniqueCode='',password=@pwd where uniqueCode=@uniqueCode and email=@emailid and licNo=@licno", con);
                cmd.Parameters.AddWithValue("@uniqueCode", Convert.ToString(Request.QueryString["uCode"]));
                cmd.Parameters.AddWithValue("@emailid", Convert.ToString(Request.QueryString["emailId"]));
                cmd.Parameters.AddWithValue("@licno", Convert.ToString(Request.QueryString["licno"]));
                cmd.Parameters.AddWithValue("@pwd", EncodePasswordToBase64(cPassword.Text.Trim()));
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "Showalert();", true) ;
                
                password.Text = string.Empty;
                cPassword.Text = string.Empty;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", string.Format("alert('{1}', '{0}');", "ERROR OCCURED", ex.Message.ToString()), true);
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }
    }
}