using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacolony
{
    public partial class adminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Label1.Text = (string)Session["email"];
            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            if (Session["email"]== null)
            {
               
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Logout Successfully'); window.location.href='home.aspx'", true);

                
            }
        }
    }
}
