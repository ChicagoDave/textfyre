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
    /// Data Factory class that handles all database interaction for the aspnet_Applications table.
    /// </summary>
    [Serializable()]
    public abstract class aspnet_ApplicationsDataBase {

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
        /// Instance of the parameter factory class for the aspnet_Applications table.
        /// </summary>
        private Textfyre.TextfyreWeb.DataLayer.aspnet_ApplicationsParameterFactory _parameterFactory;

        /// <summary>
        /// Instance of the cache manager.
        /// </summary>
        private ICacheManager _cacheManager;

        /// <summary>
        /// Expiration time period for a caching call.
        /// </summary>
        private string _cacheExpiration;

        /// <summary>
        /// String constant containing 'aspnet_Applications'.
        /// </summary>
        private const string TABLE_NAME = "aspnet_Applications";

        #endregion        

        /// <summary> 
        /// Empty default constructor. 
        /// </summary> 
        public aspnet_ApplicationsDataBase() {
            GetDBControllers();
            GetCacheManager();
            _parameterFactory = new aspnet_ApplicationsParameterFactory();
        }

        /// <summary>
        /// Protected property for the parameter factory.
        /// </summary>
        protected Textfyre.TextfyreWeb.DataLayer.aspnet_ApplicationsParameterFactory ParameterFactory {
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
        public virtual List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> GetAllaspnet_Applications() {
            return ExecuteSqlGetCollection("SELECT [ApplicationName], [LoweredApplicationName], [ApplicationId], [Description] FROM aspnet_Applications", null);
        }

        /// <summary>
        /// Get a single record in the table.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset Getaspnet_ApplicationsById(Guid ApplicationId) {
            if (ApplicationId == Guid.Empty)
                return null;

            string sql = "SELECT [ApplicationName], [LoweredApplicationName], [ApplicationId], [Description] FROM aspnet_Applications WHERE [ApplicationId] = @ApplicationId";
            List<SqlParameter> parameters = new List<SqlParameter>();
            
			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.ApplicationId, ApplicationId));            

            return ExecuteSqlGetRecord(sql, parameters);
        }

        /// <summary>
        /// Insert a record into the table.
        /// </summary>
        public virtual Guid Insertaspnet_Applications(Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset record) {
            string sql = "INSERT INTO aspnet_Applications([ApplicationName], [LoweredApplicationName], [Description]) VALUES (@ApplicationName, @LoweredApplicationName, @Description); SELECT SCOPE_IDENTITY() as ID;";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.ApplicationName, record.ApplicationName));

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.LoweredApplicationName, record.LoweredApplicationName));

			if(record.Description != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.Description, record.Description));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.Description, DBNull.Value));

            
			return (Guid)(ExecuteSqlGetScalar(sql, parameters));
        }

        /// <summary>
        /// Update a record in the table.
        /// </summary>
        public virtual int Updateaspnet_Applications(Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset record) {
            string sql = "UPDATE aspnet_Applications SET [ApplicationName] = @ApplicationName, [LoweredApplicationName] = @LoweredApplicationName, [Description] = @Description WHERE [ApplicationId] = @ApplicationId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.ApplicationName, record.ApplicationName));

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.LoweredApplicationName, record.LoweredApplicationName));

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.ApplicationId, record.ApplicationId));
			if(record.Description != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.Description, record.Description));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.Description, DBNull.Value));

            
            return ExecuteSqlGetNonScalar(sql, parameters);
        }

        /// <summary>
        /// Delete a record in the table.
        /// </summary>
        public virtual int Deleteaspnet_Applications(Guid ApplicationId) {
            string sql = "DELETE FROM aspnet_Applications WHERE [ApplicationId] = @ApplicationId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_ApplicationsFields.ApplicationId, ApplicationId));

            
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
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset ExecuteQueryNameGetRecord(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(_mainDBController.SqlText(QueryName), Parameters);
        }

        /// <summary>
        /// Execute a direct SQL statement and return a strongly typed recordset.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset ExecuteSqlGetRecord(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(SqlText, Parameters);
        }        

        /// <summary>
        /// Private method that executes a sql command and returns a strongly typed recordset.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset ExecuteGetRecord(string CmdText, List<SqlParameter> Parameters) {
            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> newaspnet_ApplicationsRecordsetList = ExecuteReader(CmdText, Parameters, false);
            if(newaspnet_ApplicationsRecordsetList.Count == 0)
                return null;

            return newaspnet_ApplicationsRecordsetList[0];
        }        
        #endregion

        #region GetCollection
        /// <summary>
        /// Execute a query stored by name in the web.config file and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> ExecuteQueryNameGetCollection(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteReader(_mainDBController.SqlText(QueryName), Parameters, false);
        }

        /// <summary>
        /// Execute a direct SQL statement and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> ExecuteSqlGetCollection(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteReader(SqlText, Parameters, false);
        }

        /// <summary>
        /// Execute a stored procedure and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        protected List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> ExecuteSPGetCollection(string StoredProcedureName, List<SqlParameter> Parameters) {
            return ExecuteReader(StoredProcedureName, Parameters, true);
        }

        #endregion

        #region Private functions

        /// <summary> 
        /// Load Items collection with data. 
        /// </summary> 
        /// <param name="draspnet_Applications"></param> 
        private List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> LoadItems(SqlDataReader draspnet_Applications) {           

            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> newaspnet_ApplicationsRecordsetList = new List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset>();
            bool namesMapped = false;
            Dictionary<string, int> fieldMap = null;

            // read through datareader, add items 
            while (draspnet_Applications.Read()) {

                if (!namesMapped) {
                    //Map field name to ordinal position
                    fieldMap = new Dictionary<string, int>();
                    for (int i = 0; i < draspnet_Applications.FieldCount; i++)
                        fieldMap.Add(draspnet_Applications.GetName(i), i);

                    namesMapped = true;
                }

                Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset newaspnet_ApplicationsRecordset = new Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset();
                object o = null;

				if (fieldMap.ContainsKey("ApplicationName")) {
					o = draspnet_Applications[fieldMap["ApplicationName"]];
					if (o != DBNull.Value)
						newaspnet_ApplicationsRecordset.ApplicationName = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("LoweredApplicationName")) {
					o = draspnet_Applications[fieldMap["LoweredApplicationName"]];
					if (o != DBNull.Value)
						newaspnet_ApplicationsRecordset.LoweredApplicationName = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("ApplicationId")) {
					o = draspnet_Applications[fieldMap["ApplicationId"]];
					if (o != DBNull.Value)
						newaspnet_ApplicationsRecordset.ApplicationId = (Guid)o;
				}

				if (fieldMap.ContainsKey("Description")) {
					o = draspnet_Applications[fieldMap["Description"]];
					if (o != DBNull.Value)
						newaspnet_ApplicationsRecordset.Description = ((string)o).Trim();
				}


                newaspnet_ApplicationsRecordset.IsDirty = false;
                newaspnet_ApplicationsRecordsetList.Add(newaspnet_ApplicationsRecordset);
            }
            
            return newaspnet_ApplicationsRecordsetList;
        }

        /// <summary>
        /// Private method that returns a List<T> of aspnet_ApplicationsRecordset
        /// </summary>
        private List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> ExecuteReader(string CmdText, List<SqlParameter> Parameters, bool isStoredProcedure) {
            SqlDataReader selectReader                                                           = null;
            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> newaspnet_ApplicationsRecordsetList = null;
            string cacheKey                                                                      = null;

            if (_cacheManager != null) {
                cacheKey = _cacheManager.CreateCacheKey(TABLE_NAME, Parameters);

                if (_cacheManager.Exists2(cacheKey)) {
                    newaspnet_ApplicationsRecordsetList = _cacheManager.Get2< List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ApplicationsRecordset> >(cacheKey);
                }
            }

            if (newaspnet_ApplicationsRecordsetList == null) {
                try {
                    if (!_mainDBController.HasTransaction)
                        _mainDBController.CurrentConnection.Open();

                    SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, isStoredProcedure);
                    selectReader = sqlCmd.ExecuteReader();

                    newaspnet_ApplicationsRecordsetList = LoadItems(selectReader);
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
                    _cacheManager.Set2(cacheKey, newaspnet_ApplicationsRecordsetList, _cacheExpiration);
                }
            }

            return newaspnet_ApplicationsRecordsetList;
        }

        /// <summary>
        /// Private method to log and handle SQL Exceptions.
        /// </summary>
        private void LogSqlException(string methodName, SqlException sqlEx) {            
            if (sqlEx.Class >= 20) {
                Logger.LogMessage(typeof(aspnet_ApplicationsDataBase).FullName, methodName, sqlEx,
                                  Severity.FATAL, LogLocation.ALL);
            } else if ((sqlEx.Class >= 11) && (sqlEx.Class < 20)) {
                Logger.LogMessage(typeof(aspnet_ApplicationsDataBase).FullName, methodName, sqlEx,
                                  Severity.ERROR, LogLocation.ALL);
            } else if (sqlEx.Class < 11) {
                Logger.LogMessage(typeof(aspnet_ApplicationsDataBase).FullName, methodName, sqlEx,
                                  Severity.INFO, LogLocation.ALL);
            }
        }

        /// <summary>
        /// Private method to log and handle general exceptions.
        /// </summary>
        private void LogGenericException(string methodName, Exception ex) {
            Logger.LogMessage(typeof(aspnet_ApplicationsDataBase).FullName, methodName, ex,
                              Severity.ERROR, LogLocation.ALL);
        }

        #endregion
    }
}