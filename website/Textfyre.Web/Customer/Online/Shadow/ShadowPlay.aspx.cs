using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.Web.Customer {
    public partial class ShadowPlay : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (User.Identity.IsAuthenticated) {
                Textfyre.TextfyreWeb.BusinessLayer.Customer user = (Textfyre.TextfyreWeb.BusinessLayer.Customer)Session["User"];
                string email = Page.User.Identity.Name; // We can't be on this page unless we're logged in.

                CustomerDownload cd = new CustomerDownload();
                CustomerDownloadCollection allDownloads = cd.LoadAll();

                IEnumerable<string> myDownloads =
                    from CustomerDownload in allDownloads
                    where CustomerDownload.Email == email
                    select CustomerDownload.ProductId;

                bool hasShadow = false;
                foreach (string download in myDownloads) {
                    if (download.Contains("shadow")) {
                        hasShadow = true;
                        break;
                    }
                }

                // in case someone tries a copied link
                if (!hasShadow) {
                    Response.Redirect("~/");
                }

            } else
                Response.Redirect("~/");
        }
    }
}
