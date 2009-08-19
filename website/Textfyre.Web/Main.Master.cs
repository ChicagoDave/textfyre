using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Textfyre.Web.Domain;

namespace Textfyre.Web {
    public partial class Main : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.User.Identity.IsAuthenticated) {
                string username = Page.User.Identity.Name;
                LoggedInName.Text = String.Concat("Logged in as ", username);
                headerIn.Visible = false;
                headerOut.Visible = true;
                LogoutButton.Visible = true;
            } //else
              //  form1.DefaultButton = "Login1.LoginButton";
        }

        protected void LoginButton_Click(object sender, EventArgs e) {
            string username = Login1.UserName;
            string password = Login1.Password;
            if (Membership.ValidateUser(username, password)) {
                MembershipUser member = Membership.GetUser(username);

                Session["User"] = new User((Guid)member.ProviderUserKey, member.Email);

                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,username,DateTime.Now,DateTime.Now.AddDays(14),true,username,"textfyre");
                string encTicket = FormsAuthentication.Encrypt(ticket);
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));
                LoggedInName.Text = string.Concat("Logged in as ", username);
                headerIn.Visible = false;
                headerOut.Visible = true;
                LogoutButton.Visible = true;
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e) {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}
