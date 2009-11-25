using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Textfyre.Web {
    public partial class CompletedSale : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            custname.Text = String.Concat(Request.QueryString["first_name"], " ", Request.QueryString["last_name"]);
            custemail.Text = Request.QueryString["payer_email"];
        }
    }
}
