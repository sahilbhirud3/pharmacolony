using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class distMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["email"] != null)
            //{
            Label1.Text = (string)Session["email"];
            Label2.Text = (string)Session["distributorName"];
            //}
            //else
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are not logged in,Try Login'); window.location.href='home.aspx#login'", true);

            //}
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["distributorName"] = null;
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            if (Session["email"] == null)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Logout Successfully'); window.location.href='home.aspx'", true);


            }
        }
    }
}