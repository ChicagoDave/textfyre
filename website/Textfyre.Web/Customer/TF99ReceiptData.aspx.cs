using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Textfyre.Web.Customer {
    public partial class TF99ReceiptData : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            string rawData = "";

            for (int f = 0; f < Request.Form.Count; f++) {
                rawData = String.Concat(Request.Form.Keys[f], "=", Request.Form[f], ";", rawData);
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                string insert = "insert into aspnet_RawData (RawData) VALUES (@RawData)";
                SqlCommand command = new SqlCommand(insert, conn);
                command.Parameters.Add(new SqlParameter("@RawData", rawData ));
                try {
                    conn.Open();
                    command.ExecuteNonQuery();
                } catch (Exception se) {
                    System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                    log.Source = "Textfyre.Com";
                    log.WriteEntry(string.Format("Error with new raw sales data: {0}", se.Message));
                    log.Close();
                    log.Dispose();
                    return;
                }
                conn.Close();
            }
        }
    }
}
