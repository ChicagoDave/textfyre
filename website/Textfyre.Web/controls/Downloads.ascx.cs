using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Textfyre.Web.Extensions;
using Textfyre.Web.Domain;

namespace Textfyre.Web.controls {
    public partial class Downloads : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {

            //User user = (User)Session["User"];

            //using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
            //    string insert = "insert into aspnet_RawData (RawData) VALUES (@RawData)";
            //    SqlCommand command = new SqlCommand(insert, conn);
            //    command.Parameters.Add(new SqlParameter("@RawData", rawData));
            //    try {
            //        conn.Open();
            //        command.ExecuteNonQuery();
            //    } catch (Exception se) {
            //        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
            //        log.Source = "Textfyre.Com";
            //        log.WriteEntry(string.Format("Error with available download list: {0}", se.Message));
            //        log.Close();
            //        log.Dispose();
            //    }
            //    conn.Close();
            //}
        }
    }
}