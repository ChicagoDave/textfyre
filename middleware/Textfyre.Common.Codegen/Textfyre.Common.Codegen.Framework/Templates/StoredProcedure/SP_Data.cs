using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using #systemNamespace#.Common.DataLayer;
using #systemNamespace#.Common.WebCache;
using #rootNamespace#.BusinessLayer;

namespace #rootNamespace#.DataLayer {

    /// <summary>
    /// DataBase class for #spName#.
    /// </summary>
    [Serializable()]
    [DataSource("#databaseName#", "#databaseName#Errors")]
    public class #spName#Data : #spName#DataBase {
        private const string SP_NAME = "#spName#";

        /// <summary>
        /// Empty default constructor.
        /// </summary>
        public #spName#Data() : base() {
        }

        #generatedMethod#        
    }
}