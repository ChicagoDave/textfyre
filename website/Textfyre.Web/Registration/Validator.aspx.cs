using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Textfyre.Web.Registration {
    public partial class Validator : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

            string vid = Request.QueryString["vid"];

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                string sql = "select userid from Customer where ValidationId = @ValidationId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@ValidationId", vid));

                try {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (!reader.Read()) {
                        valError.Text = "Invalid key. Please check your e-mail and click the link again. If you tried to copy and past the link, make sure you copy the entire link.";
                        valError.Style.Add(HtmlTextWriterStyle.Color, "Red");
                        conn.Close();
                        return;
                    }

                    string userId = reader["UserId"].ToString();
                    reader.Close();

                    sql = "update aspnet_membership set isapproved = 1 where userid = @UserId";
                    cmd.CommandText = sql;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add(new SqlParameter("@UserId", userId));

                    int rows = cmd.ExecuteNonQuery();

                    valError.Text = "Your registration is validated. You may now sign into Textfyre.Com.";

                } catch (SqlException se) {
                    valError.Text = "A problem ocurred validating your account. The error has been logged and will be reviewed by our staff soon. An e-mail will be sent to you when the problem is resolved.";
                    System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                    log.Source = "Textfyre.Com";
                    log.WriteEntry(string.Format("Error with new account validation - {0}", se.Message));
                    log.Close();
                    log.Dispose();
                    return;
                }
            }

        }
    }
}
