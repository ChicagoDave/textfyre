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
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void regRegisterButton_Click(object sender, EventArgs e) {
            MembershipCreateStatus status;
            MembershipUser newUser = Membership.CreateUser(regUsername.Text, regPassword.Text, regEmail.Text, regQuestion.Text, regAnswer.Text, false, out status);

            if (newUser == null) {
                regError.Text = GetErrorMessage(status);
                return;
            }

            // We have a new user...add extra bits to TFProfile table...
            string vID = System.Guid.NewGuid().ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                string insert = "insert into aspnet_TFProfile (UserId,FirstName,LastName,City,State,School,ValidationId) VALUES (@UserId,@FirstName,@LastName,@City,@State,@School,@ValidationId)";
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
                    log.WriteEntry(string.Format("Error with new account '{0}' - {1}",regUsername,se.Message));
                    log.Close();
                    log.Dispose();
                    return;
                }
                conn.Close();
            }
            
            // Now everything is cool...so we send them a verification e-mail...
            string vLink = string.Format("http://www.textfyre.com/registration/validator.aspx?vid={0}", vID);
            string body = string.Format("Dear {0},\r\n\r\nPlease click the following link to validate your registration with Textfyre.com:\r\n\r\n{1}\r\n\r\nThank you,\r\n\r\nThe Textfyre Team",regFirstName.Text,vLink);
            System.Net.Mail.MailMessage email = new System.Net.Mail.MailMessage("Textfyre Web Admin <webadmin@textfyre.com>", regEmail.Text, "Welcome to Textfyre.Com!", body);
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential("webadmin@textfyre.com", "tfwebADMIN!@#");
            smtp.Send(email);
            regError.Text = "";
            Server.Transfer("~/Registration/Welcome.aspx");
        }

        public string GetErrorMessage(MembershipCreateStatus status) {
            switch (status) {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

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
