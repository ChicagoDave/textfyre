using System;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Textfyre.Common.Logging {
    public static class Logger {

        public static void LogMessage(string className, string methodName, string message,
                                      Severity messageSeverity, LogLocation logLocation) {
            if (!string.IsNullOrEmpty(message)) {
                LoggingWSProxy proxy = new LoggingWSProxy();
                proxy.PreAuthenticate = true;
                proxy.UseDefaultCredentials = true;

                try {
                    proxy.LogMessage(className, methodName, message, messageSeverity, logLocation);
                } catch {
                    //Exceptions intentionally squelched (per Subbu - Failure to log should not bring down the application)
                }
            }
        }

        public static void LogMessage(string className, string methodName, Exception ex,
                                      Severity messageSeverity, LogLocation logLocation) {
            if (ex != null) {
                LogMessage(className, methodName, ex.ToString(), messageSeverity, logLocation);
            }
        }

        public static void LogMessage(string className, string methodName, string message, Exception ex,
                                      Severity messageSeverity, LogLocation logLocation) {
            if (!string.IsNullOrEmpty(message) && (ex != null)) {
                string combinedMessage = string.Concat(message, Environment.NewLine, Environment.NewLine, ex.ToString());
                LogMessage(className, methodName, combinedMessage, messageSeverity, logLocation);
            }
        }

    }
}
