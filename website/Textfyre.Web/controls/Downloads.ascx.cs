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
    public partial class Downloads : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            Textfyre.TextfyreWeb.BusinessLayer.Customer customer = (Textfyre.TextfyreWeb.BusinessLayer.Customer)Session["User"];
            foreach (Download download in customer.Downloads) {
                System.Web.UI.Control control = new Control();
            }
        }
    }
}