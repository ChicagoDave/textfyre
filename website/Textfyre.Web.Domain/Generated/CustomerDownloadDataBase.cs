/*
 *  DO NOT EDIT THIS CLASS.
 * 
 *  This class is generated by a tool and should not be edited. If you need to change the functionality of 
 *  this class, you should discuss your changes with the team and they should be implemented in the
 *  appropriate template.
 *  
 */
using System;
using System.Reflection;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using Textfyre.Common.DataLayer;
using Textfyre.Common.Logging;
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.TextfyreWeb.DataLayer {

    /// <summary>
    /// Data Factory class that handles all database interaction for the CustomerDownload table.
    /// </summary>
    [Serializable()]
    public abstract class CustomerDownloadDataBase {

        #region Members
        /// <summary>
        /// Main database controller for this table.
        /// </summary>
        [NonSerialized]
        private DBController _mainDBController;

        /// <summary>
        /// Main error and logging controller for this table.
        /// </summary>
        [NonSerialized]
        private DBController _errorDBController;

        /// <summary>
        /// Instance of the parameter factory class for the CustomerDownload table.
        /// </summary>
        private Textfyre.TextfyreWeb.DataLayer.CustomerDownloadParameterFactory _parameterFactory;

        /// <summary>
        /// Instance of the cache manager.
        /// </summary>
        private ICacheManager _cacheManager;

        /// <summary>
        /// Expiration time period for a caching call.
        /// </summary>
        private string _cacheExpiration;

        /// <summary>
        /// String constant containing 'CustomerDownload'.
        /// </summary>
        private const string TABLE_NAME = "CustomerDownload";

        #endregion        

        /// <summary> 
        /// Empty default constructor. 
        /// </summary> 
        public CustomerDownloadDataBase() {
            GetDBControllers();
            GetCacheManager();
            _parameterFactory = new CustomerDownloadParameterFactory();
        }

        /// <summary>
        /// Protected property for the parameter factory.
        /// </summary>
        protected Textfyre.TextfyreWeb.DataLayer.CustomerDownloadParameterFactory ParameterFactory {
            get { return _parameterFactory; }
        }

        /// <summary>
        /// Protected property for the MainDBController.
        /// </summary>
        protected DBController MainDBController {
            get { return _mainDBController; }
        }

        /// <summary>
        /// Protected property for the ErrorDBController.
        /// </summary>
        protected DBController ErrorDBController {
            get { return _errorDBController; }
        }

        /// <summary>
        /// Public property for the cache manager.
        /// </summary>
        public ICacheManager CacheManager {
            get { return _cacheManager; }
        }

        /// <summary>
        /// Retrieves controllers using attribute search.
        /// </summary>
        private void GetDBControllers() {
            Type type = this.GetType();

            //Querying Class Attributes
            foreach (Attribute attr in type.GetCustomAttributes(true)) {
                if (attr.GetType() == typeof(DataSourceAttribute)) {
                    DataSourceAttribute dataSourceAttribute = attr as DataSourceAttribute;
                    _mainDBController = dataSourceAttribute.MainDBController;
                    _errorDBController = dataSourceAttribute.ErrorDBController;
                    break;
                }
            }
        }

        /// <summary>
        /// Private method that returns an instance of the cache manager object.
        /// </summary>
        private void GetCacheManager() {
            Type type = this.GetType();

            //Querying Class Attributes
            foreach (Attribute attr in type.GetCustomAttributes(true)) {
                if (attr.GetType() == typeof(CacheAttribute)) {
                    CacheAttribute cacheAttribute = attr as CacheAttribute;
                    _cacheManager = cacheAttribute.CacheManager;
                    _cacheExpiration = cacheAttribute.Expiration;
                    break;
                }
            }

            // If it doesn't find a cache attribute, then caching is not enabled for this domain object.
        }

        /// <summary>
        /// Private method that returns a SqlCommand from a list of arguments.
        /// </summary>
        private SqlCommand CreateCommand(string CommandText, List<SqlParameter> Parameters, bool isStoredProcedure) {
            SqlCommand sqlCmd = _mainDBController.CurrentConnection.CreateCommand();
            sqlCmd.CommandText = CommandText;

            if (isStoredProcedure)
                sqlCmd.CommandType = CommandType.StoredProcedure;
            else
                sqlCmd.CommandType = CommandType.Text;

            if((Parameters != null) && (Parameters.Count > 0))
                sqlCmd.Parameters.AddRange(Parameters.ToArray());

            //If there is an existing transaction, join it
            if(_mainDBController.HasTransaction)
                sqlCmd.Transaction = _mainDBController.CurrentTransaction;           

            return sqlCmd;
        }

        #region Standard DB Interface
        /// <sumamry>
        /// Get all records in the table.
        /// </summary>
        public virtual List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> GetAllCustomerDownload() {
            return ExecuteSqlGetCollection("SELECT [UserId], [ProductId], [PurchaseDateTime] FROM CustomerDownload", null);
        }

        /// <summary>
        /// Get a single record in the table.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset GetCustomerDownloadById(Guid UserId, Int32 ProductId) {
            if (UserId == Guid.Empty && ProductId < 1)
                return null;

            string sql = "SELECT [UserId], [ProductId], [PurchaseDateTime] FROM CustomerDownload WHERE [UserId] = @UserId AND [ProductId] = @ProductId";
            List<SqlParameter> parameters = new List<SqlParameter>();
            
			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.UserId, UserId));
			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.ProductId, ProductId));
            

            return ExecuteSqlGetRecord(sql, parameters);
        }

        /// <summary>
        /// Insert a record into the table.
        /// </summary>
        public virtual int InsertCustomerDownload(Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset record) {
            string sql = "INSERT INTO CustomerDownload([UserId], [ProductId], [PurchaseDateTime]) VALUES (@UserId, @ProductId, @PurchaseDateTime)";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.UserId, record.UserId));
			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.ProductId, record.ProductId));
			if(record.PurchaseDateTime.HasValue)
				parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.PurchaseDateTime, record.PurchaseDateTime.Value));
			else
				parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.PurchaseDateTime, DBNull.Value));

            
			return ExecuteSqlGetNonScalar(sql, parameters);
        }

        /// <summary>
        /// Update a record in the table.
        /// </summary>
        public virtual int UpdateCustomerDownload(Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset record) {
            string sql = "UPDATE CustomerDownload SET [PurchaseDateTime] = @PurchaseDateTime WHERE [UserId] = @UserId AND [ProductId] = @ProductId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.UserId, record.UserId));
			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.ProductId, record.ProductId));
			if(record.PurchaseDateTime.HasValue)
				parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.PurchaseDateTime, record.PurchaseDateTime.Value));
			else
				parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.PurchaseDateTime, DBNull.Value));

            
            return ExecuteSqlGetNonScalar(sql, parameters);
        }

        /// <summary>
        /// Delete a record in the table.
        /// </summary>
        public virtual int DeleteCustomerDownload(Guid UserId, Int32 ProductId) {
            string sql = "DELETE FROM CustomerDownload WHERE [UserId] = @UserId AND [ProductId] = @ProductId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.UserId, UserId));
			parameters.Add(ParameterFactory.GetParameter(CustomerDownloadFields.ProductId, ProductId));

            
            return ExecuteSqlGetNonScalar(sql, parameters);
        }
        #endregion

        #region GetDataTable
        /// <summary>
        /// Execute a query stored by name in the web.config file and return a DataTable.
        /// </summary>
        public DataTable ExecuteQueryNameGetDataTable(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteGetDataTable(_mainDBController.SqlText(QueryName), Parameters, false);
        }

        /// <summary>
        /// Execute a direct SQL statement and return a DataTable.
        /// </summary>
        public DataTable ExecuteSqlGetDataTable(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteGetDataTable(SqlText, Parameters, false);
        }

        /// <summary>
        /// Execute a stored procedure and return a DataTable.
        /// </summary>
        public DataTable ExecuteSPGetDataTable(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteGetDataTable(SqlText, Parameters, true);
        }

        /// <summary>
        /// Private method that handles public query execution.
        /// </summary>
        private DataTable ExecuteGetDataTable(string CmdText, List<SqlParameter> Parameters, bool isStoredProc) {
            SqlDataReader selectReader = null;
            DataTable selectTable = new DataTable();

            try {
                if(!_mainDBController.HasTransaction)
                    _mainDBController.CurrentConnection.Open();

                SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, false);
                if (isStoredProc)
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                else
                    sqlCmd.CommandType = CommandType.Text;
                selectReader = sqlCmd.ExecuteReader();

                // 
                // Use custom adapter to convert the reader to a datatable. 
                //
                SqlDataReaderAdapter Adapter = new SqlDataReaderAdapter();
                Adapter.Fill(selectTable, selectReader);

                sqlCmd.Parameters.Clear();
            } catch (SqlException sqlEx) {
                LogSqlException("ExecuteGetDataTable", sqlEx);                
                throw;
            } catch (Exception ex) {
                LogGenericException("ExecuteGetDataTable", ex);
                throw;
            } finally {
                if((selectReader != null) && (!selectReader.IsClosed))
                    selectReader.Close();

                if(!_mainDBController.HasTransaction) {
                    if(_mainDBController.CurrentConnection.State != ConnectionState.Closed)
                        _mainDBController.CurrentConnection.Close();
                }
            }

            return selectTable;
        }
        #endregion

        #region GetScalar
        /// <summary>
        /// Execute a query stored by name in the web.config file and return a scalar value.
        /// </summary>
        public object ExecuteQueryNameGetScalar(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteScalar(_mainDBController.SqlText(QueryName), Parameters);
        }

        /// <summary>
        /// Execute a direct SQL Staement and return a scalar value.
        /// </summary>
        public object ExecuteSqlGetScalar(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteScalar(SqlText, Parameters);
        }

        /// <summary>
        /// Private method that executes the scalar SQL call.
        /// </summary>
        private object ExecuteScalar(string CmdText, List<SqlParameter> Parameters) {             
            object o = null;

            try {
                if(!_mainDBController.HasTransaction)
                    _mainDBController.CurrentConnection.Open();

                SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, false);
                o = sqlCmd.ExecuteScalar();
                sqlCmd.Parameters.Clear();
            } catch (SqlException sqlEx) {
                LogSqlException("ExecuteScalar", sqlEx);                
                throw;
            } catch (Exception ex) {
                LogGenericException("ExecuteScalar", ex);
                throw;
            } finally {
                if(!_mainDBController.HasTransaction) {
                    if(_mainDBController.CurrentConnection.State != ConnectionState.Closed)
                        _mainDBController.CurrentConnection.Close();
                }
            }
  
            return o;
        }
        #endregion

        #region GetNonScalar
        /// <summary>
        /// Execute a query stored by name in the web.config file. Returns the number of rows that
        /// were affected.
        /// </summary>
        public int ExecuteQueryNameGetNonScalar(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteNonQuery(_mainDBController.SqlText(QueryName), Parameters);
        }

        /// <summary>
        /// Execute a direct SQL statement and return the number of rows affected.
        /// </summary>
        public int ExecuteSqlGetNonScalar(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteNonQuery(SqlText, Parameters);
        }

        /// <summary>
        /// Private method that execute the nonquery.
        /// </summary>
        private int ExecuteNonQuery(string CmdText, List<SqlParameter> Parameters) {
            int rowsAffected = 0;

            try {
                if(!_mainDBController.HasTransaction)
                    _mainDBController.CurrentConnection.Open();

                SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, false);
                rowsAffected = sqlCmd.ExecuteNonQuery();
                sqlCmd.Parameters.Clear();
            } catch (SqlException sqlEx) {
                LogSqlException("ExecuteNonQuery", sqlEx);                
                throw;
            } catch (Exception ex) {
                LogGenericException("ExecuteNonQuery", ex);
                throw;
            } finally {                
                if(!_mainDBController.HasTransaction) {
                    if(_mainDBController.CurrentConnection.State != ConnectionState.Closed)
                        _mainDBController.CurrentConnection.Close();
                }
            }

            return rowsAffected;
        }
        #endregion

        #region GetRecord
        /// <summary>
        /// Execute a query stored by name in the web.config file and return a strongly typed recordset.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset ExecuteQueryNameGetRecord(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(_mainDBController.SqlText(QueryName), Parameters);
        }

        /// <summary>
        /// Execute a direct SQL statement and return a strongly typed recordset.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset ExecuteSqlGetRecord(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(SqlText, Parameters);
        }        

        /// <summary>
        /// Private method that executes a sql command and returns a strongly typed recordset.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset ExecuteGetRecord(string CmdText, List<SqlParameter> Parameters) {
            List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> newCustomerDownloadRecordsetList = ExecuteReader(CmdText, Parameters, false);
            if(newCustomerDownloadRecordsetList.Count == 0)
                return null;

            return newCustomerDownloadRecordsetList[0];
        }        
        #endregion

        #region GetCollection
        /// <summary>
        /// Execute a query stored by name in the web.config file and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> ExecuteQueryNameGetCollection(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteReader(_mainDBController.SqlText(QueryName), Parameters, false);
        }

        /// <summary>
        /// Execute a direct SQL statement and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> ExecuteSqlGetCollection(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteReader(SqlText, Parameters, false);
        }

        /// <summary>
        /// Execute a stored procedure and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        protected List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> ExecuteSPGetCollection(string StoredProcedureName, List<SqlParameter> Parameters) {
            return ExecuteReader(StoredProcedureName, Parameters, true);
        }

        #endregion

        #region Private functions

        /// <summary> 
        /// Load Items collection with data. 
        /// </summary> 
        /// <param name="drCustomerDownload"></param> 
        private List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> LoadItems(SqlDataReader drCustomerDownload) {           

            List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> newCustomerDownloadRecordsetList = new List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset>();
            bool namesMapped = false;
            Dictionary<string, int> fieldMap = null;

            // read through datareader, add items 
            while (drCustomerDownload.Read()) {

                if (!namesMapped) {
                    //Map field name to ordinal position
                    fieldMap = new Dictionary<string, int>();
                    for (int i = 0; i < drCustomerDownload.FieldCount; i++)
                        fieldMap.Add(drCustomerDownload.GetName(i), i);

                    namesMapped = true;
                }

                Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset newCustomerDownloadRecordset = new Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset();
                object o = null;

				if (fieldMap.ContainsKey("UserId")) {
					o = drCustomerDownload[fieldMap["UserId"]];
					if (o != DBNull.Value)
						newCustomerDownloadRecordset.UserId = (Guid)o;
				}

				if (fieldMap.ContainsKey("ProductId")) {
					o = drCustomerDownload[fieldMap["ProductId"]];
					if (o != DBNull.Value)
						newCustomerDownloadRecordset.ProductId = (Int32)o;
				}

				if (fieldMap.ContainsKey("PurchaseDateTime")) {
					o = drCustomerDownload[fieldMap["PurchaseDateTime"]];
					if (o != DBNull.Value)
						newCustomerDownloadRecordset.PurchaseDateTime = (DateTime)o;
				}


                newCustomerDownloadRecordset.IsDirty = false;
                newCustomerDownloadRecordsetList.Add(newCustomerDownloadRecordset);
            }
            
            return newCustomerDownloadRecordsetList;
        }

        /// <summary>
        /// Private method that returns a List<T> of CustomerDownloadRecordset
        /// </summary>
        private List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> ExecuteReader(string CmdText, List<SqlParameter> Parameters, bool isStoredProcedure) {
            SqlDataReader selectReader                                                           = null;
            List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> newCustomerDownloadRecordsetList = null;
            string cacheKey                                                                      = null;

            if (_cacheManager != null) {
                cacheKey = _cacheManager.CreateCacheKey(TABLE_NAME, Parameters);

                if (_cacheManager.Exists2(cacheKey)) {
                    newCustomerDownloadRecordsetList = _cacheManager.Get2< List<Textfyre.TextfyreWeb.BusinessLayer.CustomerDownloadRecordset> >(cacheKey);
                }
            }

            if (newCustomerDownloadRecordsetList == null) {
                try {
                    if (!_mainDBController.HasTransaction)
                        _mainDBController.CurrentConnection.Open();

                    SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, isStoredProcedure);
                    selectReader = sqlCmd.ExecuteReader();

                    newCustomerDownloadRecordsetList = LoadItems(selectReader);
                    sqlCmd.Parameters.Clear();
                } catch (SqlException sqlEx) {
                    LogSqlException("ExecuteReader", sqlEx);
                    throw;
                } catch (Exception ex) {
                    LogGenericException("ExecuteReader", ex);
                    throw;
                } finally {
                    if ((selectReader != null) && (!selectReader.IsClosed))
                        selectReader.Close();

                    if (!_mainDBController.HasTransaction) {
                        if (_mainDBController.CurrentConnection.State != ConnectionState.Closed)
                            _mainDBController.CurrentConnection.Close();
                    }
                }

                if (_cacheManager != null) {
                    _cacheManager.Set2(cacheKey, newCustomerDownloadRecordsetList, _cacheExpiration);
                }
            }

            return newCustomerDownloadRecordsetList;
        }

        /// <summary>
        /// Private method to log and handle SQL Exceptions.
        /// </summary>
        private void LogSqlException(string methodName, SqlException sqlEx) {            
            if (sqlEx.Class >= 20) {
                Logger.LogMessage(typeof(CustomerDownloadDataBase).FullName, methodName, sqlEx,
                                  Severity.FATAL, LogLocation.ALL);
            } else if ((sqlEx.Class >= 11) && (sqlEx.Class < 20)) {
                Logger.LogMessage(typeof(CustomerDownloadDataBase).FullName, methodName, sqlEx,
                                  Severity.ERROR, LogLocation.ALL);
            } else if (sqlEx.Class < 11) {
                Logger.LogMessage(typeof(CustomerDownloadDataBase).FullName, methodName, sqlEx,
                                  Severity.INFO, LogLocation.ALL);
            }
        }

        /// <summary>
        /// Private method to log and handle general exceptions.
        /// </summary>
        private void LogGenericException(string methodName, Exception ex) {
            Logger.LogMessage(typeof(CustomerDownloadDataBase).FullName, methodName, ex,
                              Severity.ERROR, LogLocation.ALL);
        }

        #endregion
    }
}