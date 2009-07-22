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

namespace Textfyre.Web.controls {
    public partial class MenuBar : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                MakeMenuItem(menuHome, "Default.aspx", "Home");
                MakeMenuItem(menuGames, "Games.aspx", "Games");
                MakeMenuItem(menuParents, "Parents.aspx", "Parents");
                MakeMenuItem(menuTeachers, "Teachers.aspx", "Teachers");
                MakeMenuItem(menuLibrarians, "Librarians.aspx", "Librarians");
                MakeMenuItem(menuAbout, "About.aspx", "About");
            }
        }

        private void MakeMenuItem(PlaceHolder holder, string pageName, string label) {
            bool onPage = false;
            if (pageName == "Default.aspx" && Request.Path.EndsWith("/"))
                onPage = true;
            if (Request.Path.Contains(pageName))
                onPage = true;
            if (onPage) {
                Label menuLabel = new Label();
                menuLabel.ID = string.Concat(label.ToLower(), "TabLabel");
                menuLabel.Text = label;
                menuLabel.CssClass = "menuTab";
                holder.Controls.Add(menuLabel);
            } else {
                HyperLink menuLink = new HyperLink();
                menuLink.ID = string.Concat(label.ToLower(), "Tab");
                menuLink.Text = label;
                menuLink.NavigateUrl = String.Concat("~/",pageName);
                holder.Controls.Add(menuLink);
            }
        }

    }
}