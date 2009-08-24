using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using #systemNamespace#.Common.DataLayer;
using #rootNamespace#.BusinessLayer;

namespace #rootNamespace#.DataLayer {

    /// <summary>
    /// Original base data class where custom queries are implemented. This class
    /// is generated once and is not over-written by the code generation tool.
    /// </summary>
    [DataSource("#databaseName#", "#databaseName#Errors"),Serializable()]
    public class #tableName#Data : #rootNamespace#.DataLayer.#tableName#DataBase {
        /// <summary>
        /// Empty default constructor.
        /// </summary>
        public #tableName#Data() : base() {
        }
    }
}