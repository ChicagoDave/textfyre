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
            string productid = "";
            string payer = "";

            for (int f = 0; f < Request.Form.Count; f++) {
                rawData = String.Concat(Request.Form.Keys[f], "=", Request.Form[f], ";", rawData);

                // item_number1 and payer_email

                string key = Request.Form.Keys[f];
                string value = Request.Form[f];

                // Save this data to allow registered customer to download files/updates
                if (key == "item_number1") productid = value;
                if (key == "payer_email") payer = value;
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                string insert = "insert into RawData (RawData) VALUES (@RawData)";
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

            if (payer != "" && productid != "") {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                    string insert = "insert into CustomerDownload (Email,ProductId) VALUES (@Email,@ProductId)";
                    SqlCommand command = new SqlCommand(insert, conn);
                    command.Parameters.Add(new SqlParameter("@Email", payer));
                    command.Parameters.Add(new SqlParameter("@ProductId", productid));
                    try {
                        conn.Open();
                        command.ExecuteNonQuery();
                    } catch (SqlException sex) {
                        if (sex.Number != 2627)
                            throw;
                    } catch (Exception se) {
                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "Textfyre.Com";
                        log.WriteEntry(string.Format("Error with new customer download information: {0}", se.Message));
                        log.Close();
                        log.Dispose();
                        return;
                    }
                    conn.Close();
                }

                // give the customer the hobbyist edition, if they didn't order it...
                if (!productid.EndsWith("hobbyist")) {
                    productid = productid.Replace("deluxe", "hobbyist").Replace("standard", "hobbyist");
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                        string insert = "insert into CustomerDownload (Email,ProductId) VALUES (@Email,@ProductId)";
                        SqlCommand command = new SqlCommand(insert, conn);
                        command.Parameters.Add(new SqlParameter("@Email", payer));
                        command.Parameters.Add(new SqlParameter("@ProductId", productid));
                        try {
                            conn.Open();
                            command.ExecuteNonQuery();
                        } catch (SqlException sex) {
                            if (sex.Number != 2627)
                                throw;
                        } catch (Exception se) {
                            System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                            log.Source = "Textfyre.Com";
                            log.WriteEntry(string.Format("Error with new customer download information: {0}", se.Message));
                            log.Close();
                            log.Dispose();
                            return;
                        }
                        conn.Close();
                    }
                }
            }
        }
    }
}
