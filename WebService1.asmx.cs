using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace pharmacolony
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public List<Category> GetCategories(string searchText)
        {
            List<Category> categories = new List<Category>();
            string conString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            string query = "SELECT id,name,category FROM item WHERE (name LIKE @Name + '%' OR category LIKE @Name + '%') OR @Name IS NULL";
            using (SqlConnection con = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(searchText))
                {
                    cmd.Parameters.AddWithValue("@Name", searchText);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Name", (object)DBNull.Value);
                }
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    categories.Add(new Category
                    {
                        Id = Convert.ToInt32(sdr["id"]),
                        Name = sdr["name"].ToString(),
                        Categorys = sdr["category"].ToString()
                    });
                }
                con.Close();
            }

            return categories;
        }
        public class Category
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Categorys { get; set; }
        }
    }
}