using System;
using System.Collections;
using System.Collections.Generic;
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
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.Web.Registration {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void regCancel_Click(object sender, EventArgs e) {
            Server.Transfer("~/Default.aspx");
        }

        protected void regRegisterButton_Click(object sender, EventArgs e) {
            if (Page.IsValid) {
                MembershipCreateStatus status;
                MembershipUser newUser = Membership.CreateUser(regEmail.Text, regPassword.Text, regEmail.Text, regQuestion.Text, regAnswer.Text, false, out status);

                if (newUser == null) {
                    regError.Text = GetErrorMessage(status);
                    return;
                }

                // We have a new user...add extra bits to TFProfile table...
                Guid newGuid = System.Guid.NewGuid();
                string vID = newGuid.ToString();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                    string insert = "insert into Customer (UserId,FirstName,LastName,City,State,School,ValidationId) VALUES (@UserId,@FirstName,@LastName,@City,@State,@School,@ValidationId)";
                    SqlCommand command = new SqlCommand(insert, conn);
                    command.Parameters.Add(new SqlParameter("@UserId", newUser.ProviderUserKey));
                    command.Parameters.Add(new SqlParameter("@FirstName", regFirstName.Text));
                    command.Parameters.Add(new SqlParameter("@LastName", regLastName.Text));
                    command.Parameters.Add(new SqlParameter("@City", regCity.Text));
                    command.Parameters.Add(new SqlParameter("@State", regState.Text));
                    command.Parameters.Add(new SqlParameter("@School", regSchool.Text));
                    command.Parameters.Add(new SqlParameter("@ValidationId", vID));

                    try {
                        conn.Open();
                        int rows = command.ExecuteNonQuery();
                    } catch (SqlException se) {
                        regError.Text = "A problem ocurred writing your registration to the database. The error has been logged and will be reviewed by our staff soon. An e-mail will be sent to you when the problem is resolved.";
                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "Textfyre.Com";
                        log.WriteEntry(string.Format("Error in database query with new account '{0}' - {1}", regEmail,
                            String.Concat(se.Message, " - ", newUser.ProviderUserKey, " - ", regFirstName.Text, " - ", regLastName.Text,
                            " - ", regCity.Text, " - ", regState.Text, " - ", regSchool.Text, " - ", vID)));
                        log.Close();
                        log.Dispose();
                        return;
                    } catch (Exception ex) {
                        regError.Text = "A problem ocurred writing your registration to the database. The error has been logged and will be reviewed by our staff soon. An e-mail will be sent to you when the problem is resolved.";
                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "Textfyre.Com";
                        log.WriteEntry(string.Format("System Error with new account '{0}' - {1}", regEmail,
                            String.Concat(ex.Message, " - ", newUser.ProviderUserKey, " - ", regFirstName.Text, " - ", regLastName.Text,
                            " - ", regCity.Text, " - ", regState.Text, " - ", regSchool.Text, " - ", vID)));
                        log.Close();
                        log.Dispose();
                        return;
                    }
                    conn.Close();
                }

                CustomerDownload cust = new CustomerDownload();
                CustomerDownloadCollection downloads = cust.LoadAll();

                IEnumerable<string> myFiles = from CustomerDownload in downloads where CustomerDownload.Email == regEmail.Text select CustomerDownload.ProductId;

                if (myFiles.ToArray<string>().Length > 0) {
                    Textfyre.TextfyreWeb.BusinessLayer.Customer newCustomer = new Textfyre.TextfyreWeb.BusinessLayer.Customer();
                    newCustomer.Load((Guid)newUser.ProviderUserKey);
                    newCustomer.HasDownloads = true;
                    newCustomer.Save();
                }

                // Now everything is cool...so we send them a verification e-mail...
                string vLink = string.Format("https://www.textfyre.com/registration/validator.aspx?vid={0}", vID);
                string body = string.Format("Dear {0},\r\n\r\nPlease click the following link to validate your registration with Textfyre.com:\r\n\r\n{1}\r\n\r\nThank you,\r\n\r\nThe Textfyre Team", regFirstName.Text, vLink);
                System.Net.Mail.MailMessage email = new System.Net.Mail.MailMessage("Textfyre Web Admin <webadmin@textfyre.com>", regEmail.Text, "Welcome to Textfyre.Com!", body);
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("webadmin@textfyre.com", "wEETA@#$");
                smtp.Send(email);
                regError.Text = "";
                Server.Transfer("~/Registration/Welcome.aspx");
            }
        }

        public string GetErrorMessage(MembershipCreateStatus status) {
            switch (status) {
                case MembershipCreateStatus.DuplicateUserName:
                case MembershipCreateStatus.DuplicateEmail:
                    return "Your email already exists. Please enter a different e-mail or use the password recovery page.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }

    }
}
