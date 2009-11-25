using System;
using System.Collections;
using System.Collections.Generic;
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
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.Web {
    public partial class Main : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.User.Identity.IsAuthenticated) {
                string username = Page.User.Identity.Name;
                LoggedInName.Text = String.Concat("Logged in as ", username);
                headerIn.Visible = false;
                headerOut.Visible = true;
                LogoutButton.Visible = true;
                DownloadLink.Visible = false;
                if (((Textfyre.TextfyreWeb.BusinessLayer.Customer)Session["User"]).HasDownloads == true) {
                    DownloadLink.Visible = true;
                }
                if (HasOnlineGames()) {
                    PlayOnlineLink.Visible = true;
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e) {
            string username = Login1.UserName;
            string password = Login1.Password;
            if (Membership.ValidateUser(username, password)) {
                MembershipUser member = Membership.GetUser(username);

                Session["User"] = new Textfyre.TextfyreWeb.BusinessLayer.Customer((Guid)member.ProviderUserKey);

                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, username, DateTime.Now, DateTime.Now.AddDays(14), true, username, "textfyre");
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

        private bool HasOnlineGames() {
            if (Page.User.Identity.IsAuthenticated) {
                Textfyre.TextfyreWeb.BusinessLayer.Customer user = (Textfyre.TextfyreWeb.BusinessLayer.Customer)Session["User"];
                string email = Page.User.Identity.Name; // We can't be on this page unless we're logged in.

                CustomerDownload cd = new CustomerDownload();
                CustomerDownloadCollection allDownloads = cd.LoadAll();

                IEnumerable<string> myDownloads =
                    from CustomerDownload in allDownloads
                    where CustomerDownload.Email == email
                    select CustomerDownload.ProductId;

                foreach (string download in myDownloads) {
                    if (download.Contains("online")) {
                        return true;
                    }
                }
            }

            return false;
        }
    }
}
