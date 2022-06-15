using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class addItems : System.Web.UI.Page
    {

        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        int id;
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
                int dLic = Convert.ToInt32(Request.QueryString["dLic"]);

                getItemDetails(id,dLic);
            }
        }
        //DELETE FROM[dbo].[item] WHERE[id]=@txtid
        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            string sql = @"UPDATE [dbo].[item]
                                SET     
                                [name] =@name
                                ,[price] =@price
                                ,[manufacturer]=@manufacturer
                                ,[category] =@category
                                ,[gst]=@gst
                                ,[packaging]=@packaging
                                  WHERE [id]=@txtid
                                ";
            /*[dLic] =@distlic*/

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@txtid", txtid.Text.Trim());


                //cmd.Parameters.AddWithValue("@dLic", distlic);

                cmd.Parameters.AddWithValue("@name", name.Text.Trim());

                cmd.Parameters.AddWithValue("@price", price.Text.Trim());

                cmd.Parameters.AddWithValue("@manufacturer", manufacturer.Text.Trim());
                
                cmd.Parameters.AddWithValue("@category", category.Text.Trim());

                cmd.Parameters.AddWithValue("@gst", gst.Text.Trim());

                cmd.Parameters.AddWithValue("@packaging", packaging.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                lblmessage.Text = "Item Updated successfully!!";

                con.Close();

            }

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/showItems.aspx");

        }
        #endregion

        #region METHODS

        private void getItemDetails(int id,int dLic)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT [id],[dLic]
                             ,[name]
                             ,[price]
                             ,[manufacturer]
                             ,[category]
                             ,[gst]
                              ,[packaging]
                             
                         FROM[dbo].[item]
                         where id = @id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
    
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)   /*It means datatable contains row or record*/
                {
                    txtid.Text = Convert.ToString(dt.Rows[0]["id"]);
                    txtdLic.Text = Convert.ToString(dt.Rows[0]["dLic"]);

                    name.Text = Convert.ToString(dt.Rows[0]["name"]);
                    price.Text = Convert.ToString(dt.Rows[0]["price"]);
                    manufacturer.Text = Convert.ToString(dt.Rows[0]["manufacturer"]);
                    category.Text = Convert.ToString(dt.Rows[0]["category"]);
                    gst.Text = Convert.ToString(dt.Rows[0]["gst"]);
                    packaging.Text = Convert.ToString(dt.Rows[0]["packaging"]);

                }
            }
        }
        #endregion
    }

}