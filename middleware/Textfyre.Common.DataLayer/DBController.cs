using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Serialization;

namespace Textfyre.Common.DataLayer
{
    /// <summary>
    /// 
    /// </summary>
    [Serializable()]
    public class DBController {

        #region Private Fields
        [XmlIgnore()]
        private SqlConnection _connection = new SqlConnection();
        [XmlIgnore()]
        private SqlTransaction _transaction;
        private bool _hasTransaction = false;
        #endregion

        #region Constructor
        /// <summary>
        /// Contra
        /// </summary>
        /// <param name="databaseName"></param>
        public DBController(string machineName, string databaseName) {
            _connection.ConnectionString = GetConnectionString(machineName, databaseName);
        }
        #endregion

        #region Public Interface
        /// <summary>
        /// Current database connection.
        /// </summary>
        [XmlIgnore()]
        public SqlConnection CurrentConnection { get { return _connection; } }
        /// <summary>
        /// Current database transaction.
        /// </summary>
        [XmlIgnore()]
        public SqlTransaction CurrentTransaction { get { return _transaction; } }
        /// <summary>
        /// Returns true if we're running in a transaction.
        /// </summary>
        public bool HasTransaction { get { return _hasTransaction; } }

        /// <summary>
        /// Returns the connection string for a given database name.
        /// </summary>
        /// <param name="databaseName"></param>
        /// <returns></returns>
        public static string GetConnectionString(string machineName, string databaseName) {
            string environment = ConfigurationManager.AppSettings[machineName];
            string dbkey = String.Concat(databaseName, ",", environment);
            string connectionString = ConfigurationManager.AppSettings[dbkey];

            if (connectionString == null)
                throw new Exception("Missing configuration for " + dbkey);

            return connectionString;
        }

        /// <summary>
        /// Retrieves a SQL statement from the Web or App config file.
        /// </summary>
        /// <param name="queryName"></param>
        /// <returns></returns>
        public string SqlText(string queryName) {
            return ConfigurationManager.AppSettings[String.Concat("Query.", queryName)];
        }        

        /// <summary>
        /// Begins a transaction for the current connection.
        /// </summary>
        public void BeginTransaction() {
            if (_connection.State == ConnectionState.Open) {
                if (_transaction == null) {
                    _transaction = _connection.BeginTransaction();
                    _hasTransaction = true;
                }
            }
        }

        /// <summary>
        /// Ends the transaction.
        /// </summary>
        /// <param name="commit"></param>
        public void EndTransaction(bool commit) {
            if (_connection.State == ConnectionState.Open) {
                if (_transaction != null) {
                    if (commit)
                        _transaction.Commit();
                    else
                        _transaction.Rollback();

                    _transaction = null;
                    _hasTransaction = false;
                }
            }
        }
        #endregion
    }
}
