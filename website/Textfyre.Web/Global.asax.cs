using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.SessionState;
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.Web {
    public class Global : System.Web.HttpApplication {

        protected void Application_Start(object sender, EventArgs e) {
        }

        protected void Session_Start(object sender, EventArgs e) {
            if (User.Identity.IsAuthenticated) {
                string username = User.Identity.Name;
                MembershipUser member = Membership.GetUser(username);

                // bring the user profile into the session...
                Session["User"] = new Textfyre.TextfyreWeb.BusinessLayer.Customer((Guid)member.ProviderUserKey);
            }

            Session.Timeout = 60;
        }

        protected void Application_BeginRequest(object sender, EventArgs e) {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) {

        }

        protected void Application_Error(object sender, EventArgs e) {

        }

        protected void Session_End(object sender, EventArgs e) {
            // Clean up download directory and files...
            try {
                if (Session["files"].ToString() != "") {
                    System.IO.Directory.Delete(Session["files"].ToString(), true);
                }
            } catch {
                // do nothing
            }

            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void Application_End(object sender, EventArgs e) {

        }
    }
}