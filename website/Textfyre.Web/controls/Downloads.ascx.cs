using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Textfyre.Web.Extensions;
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.Web.controls {

    public static class DownloadFiles {
        public static string SecretLetterDeluxe = "secretletter-deluxe";
        public static string SecretLetterStandard = "secretletter-standard";
        public static string SecretLetterHobbyist = "secretletter-hobbyist";
        public static string SecretLetterClassroom = "secretletter-classroom";
        public static string ShadowDeluxe = "shadow-deluxe";
        public static string ShadowStandard = "shadow-standard";
        public static string ShadowHobbyist = "shadow-hobbyist";
        public static string ShadowClassroom = "shadow-classroom";
    }

    public partial class Downloads : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            string email = Page.User.Identity.Name; // We can't be on this page unless we're logged in.

            CustomerDownload cd = new CustomerDownload();
            CustomerDownloadCollection allDownloads = cd.LoadAll();

            IEnumerable<string> myDownloads =
                from CustomerDownload in allDownloads where CustomerDownload.Email == email
                    select CustomerDownload.ProductId;

            List<Download> files = new List<Download>();

            Download dn = new Download();
            DownloadCollection allFiles = dn.LoadAll();

            foreach (string download in myDownloads) {
                IEnumerable<Download> myFiles =
                    from Download in allFiles
                    where Download.ProductId == download
                    select Download;

                foreach (Download downloadFile in myFiles) {
                    files.Add(downloadFile);
                }
            }

            Guid guid = Guid.NewGuid();
            Session.Add("files",String.Concat(Server.MapPath("~/TempFiles"), @"\", guid.ToString()));

            // Create a temporary session folder
            System.IO.Directory.CreateDirectory(Session["files"].ToString());

            // Copy the files to the temporary folder
            foreach (Download file in files) {
                System.IO.File.Copy(String.Concat(@"D:\TextfyreDownloads\",file.Filename),String.Concat(Session["files"].ToString(),@"\",file.Filename));

                HyperLink newLink = new HyperLink();
                newLink.NavigateUrl = String.Concat("~/TempFiles/", guid.ToString(), "/", file.Filename);
                newLink.Text = GetDescription(file.ProductId);

                downloadList.Controls.Add(newLink);
            }

        }

        private string GetDescription(string ProductId) {

            Product p = new Product();
            ProductCollection products = p.LoadAll();

            IEnumerable<string> descriptions = from Product in products where Product.ProductId == ProductId select Product.Description;

            return descriptions.ToArray<string>()[0];
        }
    }
}