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
    public partial class distProfile : System.Web.UI.Page
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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql1 = "SELECT * FROM distributor where licNo='"+Session["licno"]+"' ";
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();

                // Call ExecuteReader to return a DataReader  
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    fName.Text=reader["firstName"].ToString();
                    lName.Text = reader["lastName"].ToString();
                    contact.Text = reader["contact"].ToString();
                    address.Text = reader["address"].ToString();
                    city.Text = reader["city"].ToString();
                    state.Text = reader["state"].ToString();
                }

                reader.Close();
                con.Close();
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string sql = @"UPDATE [dbo].[distributor]
                       SET 
                          [firstName] = @firstName
                          ,[lastName] = @lastName
                          ,[contact] = @contact
                          ,[address] = @address
                          ,[state] = @state
                          ,[city] = @city
                     WHERE [licNo]=@licno";


            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@firstName", fName.Text.Trim());
                cmd.Parameters.AddWithValue("@lastName", lName.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.Text.Trim());
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@licNo", Session["licno"]);

                con.Open();

                cmd.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Update Successfully');", true);

                con.Close();

            }
        }


    }
}