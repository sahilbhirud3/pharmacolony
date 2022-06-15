using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class EditStudentList : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["conectionStrings"].ConnectionString;

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                BindCity();
                BindCourses();

                GetStudentDetails(id);
            }
        }

         protected void btnsubmit_Click(object sender, EventArgs e)
            {
                
                string sql = @"DELETE FROM [dbo].[StudentCourses] WHERE [StudentId]=@ID
                               
                                UPDATE [dbo].[Students]
                                SET [FirstName] =@fname
                                ,[LastName] =@lname
                                ,[ContactNo] =@contact
                                ,[Email]=@email
                                ,[CityId]=@CityId
                                ,[Salary]=@salary
                                ,[DOB]=@DOB
                                ,[Gender]=@Gender
                                  WHERE [Id]=@ID
                                ";


                using (SqlConnection con = new SqlConnection(connectionString))
                {

                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@ID", txtid.Text.Trim());

                    cmd.Parameters.AddWithValue("@fname", fname.Text.Trim());

                    cmd.Parameters.AddWithValue("@lname", lname.Text.Trim());

                    cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());

                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    cmd.Parameters.AddWithValue("@CityId", citylist.SelectedValue);

                    cmd.Parameters.AddWithValue("@salary", salary.Text.Trim());

                    cmd.Parameters.AddWithValue("@DOB", date.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender",bmale.Checked ? bmale.Text : bfemale.Text);
                //cmd.Parameters.AddWithValue("@Pincode", pin.Text.Trim());
                //cmd.Parameters.AddWithValue("@Address", address.Text.Trim());


                con.Open();

                cmd.ExecuteNonQuery();
                for (int i = 0; i < courses.Items.Count; i++)
                {
                    if (courses.Items[i].Selected)
                    {
                        SqlCommand cmd1 = new SqlCommand("Insert_Students_Course", con);
                        cmd1.Parameters.AddWithValue("@StudentId", txtid.Text.Trim());
                        cmd1.Parameters.AddWithValue("@CourseId", courses.Items[i].Value);

                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.ExecuteNonQuery();
                    }
                }

                lblmessage.Text = "Record Updated successfully!!";

                con.Close();
                
            }

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/StudentList.aspx");

        }
        #endregion

        #region METHODS
        private void BindCity()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql ="Select Id,Name FROM City";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet(); /*DataSet ds = new DataSet(); It will return single querry*/
                da.Fill(ds);
                citylist.DataSource = ds;
                citylist.DataTextField = "Name";
                citylist.DataValueField = "Id";
                citylist.DataBind();
            }
        }

        private void BindCourses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql ="Select Id,Name FROM Courses";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable(); /*DataSet ds = new DataSet(); It will return single querry*/
                da.Fill(dt);
                courses.DataSource = dt;
                courses.DataTextField = "Name";
                courses.DataValueField = "Id";
                courses.DataBind();
            }
        }

        private DataTable GetStudentCourses(int id)
        {

            string sql = @"SELECT  [StudentId],[CourseId]
                 FROM[dbo].[StudentCourses]
                 where StudentId = @StudentId";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@StudentId", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;

            }
        }
        

        private void GetStudentDetails(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT [Id]
                             ,[FirstName]
                             ,[LastName]
                             ,[ContactNo]
                             ,[Email]
                              ,[CityId]
                             ,[Salary]
                             ,[DOB]
                             ,[Gender]
                         FROM[dbo].[Students]
                         where Id = @ID";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ID", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)   /*It means datatable contains row or record*/
                {
                    txtid.Text = Convert.ToString(dt.Rows[0]["Id"]);
                    fname.Text = Convert.ToString(dt.Rows[0]["FirstName"]);
                    lname.Text = Convert.ToString(dt.Rows[0]["LastName"]);
                    email.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    date.Text = Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("yyyy-MM-dd");
                    salary.Text = Convert.ToString(dt.Rows[0]["Salary"]);
                    contact.Text = Convert.ToString(dt.Rows[0]["ContactNo"]);
                    citylist.SelectedValue = Convert.ToString(dt.Rows[0]["CityId"]);

                    if (Convert.ToString(dt.Rows[0]["Gender"]) == "Male")
                    {
                        bmale.Checked = true;
                    }
                    else
                    {
                        bfemale.Checked = true;
                    }

                    dt = GetStudentCourses(id);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        foreach (ListItem item in courses.Items)
                        {
                            if (Convert.ToString(dt.Rows[i]["CourseId"]) == item.Value)
                            {
                                item.Selected = true;
                            }
                        }
                    }   
                 }
            }
        }
     #endregion     
    }
}