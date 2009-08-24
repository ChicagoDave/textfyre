using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Textfyre.Common.Utilities {
    /// <summary>
    /// Helper class to get the connectionstring from the Configuration file
    /// </summary>
    public class ConnectionstringHelper {
        public string GetConnectionstring() {
            // Get Environment
            string _connectionString= "",_Environment = "";
            
            _Environment = System.Configuration.ConfigurationManager.AppSettings.Get(string.Concat(System.Environment.MachineName,".DataBaseEnvironment"));

            if (_Environment.Trim().Length >0){
                // Get the connectionstring
                _connectionString=  System.Configuration.ConfigurationManager.AppSettings.Get(string.Concat("Auction,",_Environment));
            }
            return _connectionString;
        }
    }
}
