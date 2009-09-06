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
    /// Data Factory class that handles all database interaction for the aspnet_WebEvent_Events table.
    /// </summary>
    [Serializable()]
    public abstract class aspnet_WebEvent_EventsDataBase {

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
        /// Instance of the parameter factory class for the aspnet_WebEvent_Events table.
        /// </summary>
        private Textfyre.TextfyreWeb.DataLayer.aspnet_WebEvent_EventsParameterFactory _parameterFactory;

        /// <summary>
        /// Instance of the cache manager.
        /// </summary>
        private ICacheManager _cacheManager;

        /// <summary>
        /// Expiration time period for a caching call.
        /// </summary>
        private string _cacheExpiration;

        /// <summary>
        /// String constant containing 'aspnet_WebEvent_Events'.
        /// </summary>
        private const string TABLE_NAME = "aspnet_WebEvent_Events";

        #endregion        

        /// <summary> 
        /// Empty default constructor. 
        /// </summary> 
        public aspnet_WebEvent_EventsDataBase() {
            GetDBControllers();
            GetCacheManager();
            _parameterFactory = new aspnet_WebEvent_EventsParameterFactory();
        }

        /// <summary>
        /// Protected property for the parameter factory.
        /// </summary>
        protected Textfyre.TextfyreWeb.DataLayer.aspnet_WebEvent_EventsParameterFactory ParameterFactory {
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
        public virtual List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> GetAllaspnet_WebEvent_Events() {
            return ExecuteSqlGetCollection("SELECT [EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details] FROM aspnet_WebEvent_Events", null);
        }

        /// <summary>
        /// Get a single record in the table.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset Getaspnet_WebEvent_EventsById(string EventId) {
            if (EventId == "")
                return null;

            string sql = "SELECT [EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details] FROM aspnet_WebEvent_Events WHERE [EventId] = @EventId";
            List<SqlParameter> parameters = new List<SqlParameter>();
            
			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventId, EventId));            

            return ExecuteSqlGetRecord(sql, parameters);
        }

        /// <summary>
        /// Insert a record into the table.
        /// </summary>
        public virtual int Insertaspnet_WebEvent_Events(Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset record) {
            string sql = "INSERT INTO aspnet_WebEvent_Events([EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (@EventTimeUtc, @EventTime, @EventType, @EventSequence, @EventOccurrence, @EventCode, @EventDetailCode, @Message, @ApplicationPath, @ApplicationVirtualPath, @MachineName, @RequestUrl, @ExceptionType, @Details); SELECT SCOPE_IDENTITY() as ID;";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventTimeUtc, record.EventTimeUtc));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventTime, record.EventTime));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventType, record.EventType));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventSequence, record.EventSequence));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventOccurrence, record.EventOccurrence));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventCode, record.EventCode));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventDetailCode, record.EventDetailCode));

			if(record.Message != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Message, record.Message));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Message, DBNull.Value));

			if(record.ApplicationPath != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationPath, record.ApplicationPath));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationPath, DBNull.Value));

			if(record.ApplicationVirtualPath != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationVirtualPath, record.ApplicationVirtualPath));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationVirtualPath, DBNull.Value));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.MachineName, record.MachineName));

			if(record.RequestUrl != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.RequestUrl, record.RequestUrl));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.RequestUrl, DBNull.Value));

			if(record.ExceptionType != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ExceptionType, record.ExceptionType));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ExceptionType, DBNull.Value));

			if(record.Details != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Details, record.Details));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Details, DBNull.Value));

            
			return ExecuteSqlGetNonScalar(sql, parameters);
        }

        /// <summary>
        /// Update a record in the table.
        /// </summary>
        public virtual int Updateaspnet_WebEvent_Events(Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset record) {
            string sql = "UPDATE aspnet_WebEvent_Events SET [EventTimeUtc] = @EventTimeUtc, [EventTime] = @EventTime, [EventType] = @EventType, [EventSequence] = @EventSequence, [EventOccurrence] = @EventOccurrence, [EventCode] = @EventCode, [EventDetailCode] = @EventDetailCode, [Message] = @Message, [ApplicationPath] = @ApplicationPath, [ApplicationVirtualPath] = @ApplicationVirtualPath, [MachineName] = @MachineName, [RequestUrl] = @RequestUrl, [ExceptionType] = @ExceptionType, [Details] = @Details WHERE [EventId] = @EventId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventId, record.EventId));
			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventTimeUtc, record.EventTimeUtc));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventTime, record.EventTime));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventType, record.EventType));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventSequence, record.EventSequence));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventOccurrence, record.EventOccurrence));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventCode, record.EventCode));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventDetailCode, record.EventDetailCode));

			if(record.Message != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Message, record.Message));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Message, DBNull.Value));

			if(record.ApplicationPath != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationPath, record.ApplicationPath));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationPath, DBNull.Value));

			if(record.ApplicationVirtualPath != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationVirtualPath, record.ApplicationVirtualPath));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ApplicationVirtualPath, DBNull.Value));

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.MachineName, record.MachineName));

			if(record.RequestUrl != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.RequestUrl, record.RequestUrl));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.RequestUrl, DBNull.Value));

			if(record.ExceptionType != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ExceptionType, record.ExceptionType));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.ExceptionType, DBNull.Value));

			if(record.Details != null)
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Details, record.Details));
			else
				parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.Details, DBNull.Value));

            
            return ExecuteSqlGetNonScalar(sql, parameters);
        }

        /// <summary>
        /// Delete a record in the table.
        /// </summary>
        public virtual int Deleteaspnet_WebEvent_Events(string EventId) {
            string sql = "DELETE FROM aspnet_WebEvent_Events WHERE [EventId] = @EventId";
            List<SqlParameter> parameters = new List<SqlParameter>();

			parameters.Add(ParameterFactory.GetParameter(aspnet_WebEvent_EventsFields.EventId, EventId));

            
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
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset ExecuteQueryNameGetRecord(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(_mainDBController.SqlText(QueryName), Parameters);
        }

        /// <summary>
        /// Execute a direct SQL statement and return a strongly typed recordset.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset ExecuteSqlGetRecord(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteGetRecord(SqlText, Parameters);
        }        

        /// <summary>
        /// Private method that executes a sql command and returns a strongly typed recordset.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset ExecuteGetRecord(string CmdText, List<SqlParameter> Parameters) {
            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> newaspnet_WebEvent_EventsRecordsetList = ExecuteReader(CmdText, Parameters, false);
            if(newaspnet_WebEvent_EventsRecordsetList.Count == 0)
                return null;

            return newaspnet_WebEvent_EventsRecordsetList[0];
        }        
        #endregion

        #region GetCollection
        /// <summary>
        /// Execute a query stored by name in the web.config file and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> ExecuteQueryNameGetCollection(string QueryName, List<SqlParameter> Parameters) {
            return ExecuteReader(_mainDBController.SqlText(QueryName), Parameters, false);
        }

        /// <summary>
        /// Execute a direct SQL statement and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> ExecuteSqlGetCollection(string SqlText, List<SqlParameter> Parameters) {
            return ExecuteReader(SqlText, Parameters, false);
        }

        /// <summary>
        /// Execute a stored procedure and return
        /// a strongly typed collection of recordsets.
        /// </summary>
        protected List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> ExecuteSPGetCollection(string StoredProcedureName, List<SqlParameter> Parameters) {
            return ExecuteReader(StoredProcedureName, Parameters, true);
        }

        #endregion

        #region Private functions

        /// <summary> 
        /// Load Items collection with data. 
        /// </summary> 
        /// <param name="draspnet_WebEvent_Events"></param> 
        private List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> LoadItems(SqlDataReader draspnet_WebEvent_Events) {           

            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> newaspnet_WebEvent_EventsRecordsetList = new List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset>();
            bool namesMapped = false;
            Dictionary<string, int> fieldMap = null;

            // read through datareader, add items 
            while (draspnet_WebEvent_Events.Read()) {

                if (!namesMapped) {
                    //Map field name to ordinal position
                    fieldMap = new Dictionary<string, int>();
                    for (int i = 0; i < draspnet_WebEvent_Events.FieldCount; i++)
                        fieldMap.Add(draspnet_WebEvent_Events.GetName(i), i);

                    namesMapped = true;
                }

                Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset newaspnet_WebEvent_EventsRecordset = new Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset();
                object o = null;

				if (fieldMap.ContainsKey("EventId")) {
					o = draspnet_WebEvent_Events[fieldMap["EventId"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventId = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("EventTimeUtc")) {
					o = draspnet_WebEvent_Events[fieldMap["EventTimeUtc"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventTimeUtc = (DateTime)o;
				}

				if (fieldMap.ContainsKey("EventTime")) {
					o = draspnet_WebEvent_Events[fieldMap["EventTime"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventTime = (DateTime)o;
				}

				if (fieldMap.ContainsKey("EventType")) {
					o = draspnet_WebEvent_Events[fieldMap["EventType"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventType = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("EventSequence")) {
					o = draspnet_WebEvent_Events[fieldMap["EventSequence"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventSequence = (decimal)o;
				}

				if (fieldMap.ContainsKey("EventOccurrence")) {
					o = draspnet_WebEvent_Events[fieldMap["EventOccurrence"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventOccurrence = (decimal)o;
				}

				if (fieldMap.ContainsKey("EventCode")) {
					o = draspnet_WebEvent_Events[fieldMap["EventCode"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventCode = (Int32)o;
				}

				if (fieldMap.ContainsKey("EventDetailCode")) {
					o = draspnet_WebEvent_Events[fieldMap["EventDetailCode"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.EventDetailCode = (Int32)o;
				}

				if (fieldMap.ContainsKey("Message")) {
					o = draspnet_WebEvent_Events[fieldMap["Message"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.Message = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("ApplicationPath")) {
					o = draspnet_WebEvent_Events[fieldMap["ApplicationPath"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.ApplicationPath = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("ApplicationVirtualPath")) {
					o = draspnet_WebEvent_Events[fieldMap["ApplicationVirtualPath"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.ApplicationVirtualPath = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("MachineName")) {
					o = draspnet_WebEvent_Events[fieldMap["MachineName"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.MachineName = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("RequestUrl")) {
					o = draspnet_WebEvent_Events[fieldMap["RequestUrl"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.RequestUrl = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("ExceptionType")) {
					o = draspnet_WebEvent_Events[fieldMap["ExceptionType"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.ExceptionType = ((string)o).Trim();
				}

				if (fieldMap.ContainsKey("Details")) {
					o = draspnet_WebEvent_Events[fieldMap["Details"]];
					if (o != DBNull.Value)
						newaspnet_WebEvent_EventsRecordset.Details = ((string)o).Trim();
				}


                newaspnet_WebEvent_EventsRecordset.IsDirty = false;
                newaspnet_WebEvent_EventsRecordsetList.Add(newaspnet_WebEvent_EventsRecordset);
            }
            
            return newaspnet_WebEvent_EventsRecordsetList;
        }

        /// <summary>
        /// Private method that returns a List<T> of aspnet_WebEvent_EventsRecordset
        /// </summary>
        private List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> ExecuteReader(string CmdText, List<SqlParameter> Parameters, bool isStoredProcedure) {
            SqlDataReader selectReader                                                           = null;
            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> newaspnet_WebEvent_EventsRecordsetList = null;
            string cacheKey                                                                      = null;

            if (_cacheManager != null) {
                cacheKey = _cacheManager.CreateCacheKey(TABLE_NAME, Parameters);

                if (_cacheManager.Exists2(cacheKey)) {
                    newaspnet_WebEvent_EventsRecordsetList = _cacheManager.Get2< List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> >(cacheKey);
                }
            }

            if (newaspnet_WebEvent_EventsRecordsetList == null) {
                try {
                    if (!_mainDBController.HasTransaction)
                        _mainDBController.CurrentConnection.Open();

                    SqlCommand sqlCmd = CreateCommand(CmdText, Parameters, isStoredProcedure);
                    selectReader = sqlCmd.ExecuteReader();

                    newaspnet_WebEvent_EventsRecordsetList = LoadItems(selectReader);
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
                    _cacheManager.Set2(cacheKey, newaspnet_WebEvent_EventsRecordsetList, _cacheExpiration);
                }
            }

            return newaspnet_WebEvent_EventsRecordsetList;
        }

        /// <summary>
        /// Private method to log and handle SQL Exceptions.
        /// </summary>
        private void LogSqlException(string methodName, SqlException sqlEx) {            
            if (sqlEx.Class >= 20) {
                Logger.LogMessage(typeof(aspnet_WebEvent_EventsDataBase).FullName, methodName, sqlEx,
                                  Severity.FATAL, LogLocation.ALL);
            } else if ((sqlEx.Class >= 11) && (sqlEx.Class < 20)) {
                Logger.LogMessage(typeof(aspnet_WebEvent_EventsDataBase).FullName, methodName, sqlEx,
                                  Severity.ERROR, LogLocation.ALL);
            } else if (sqlEx.Class < 11) {
                Logger.LogMessage(typeof(aspnet_WebEvent_EventsDataBase).FullName, methodName, sqlEx,
                                  Severity.INFO, LogLocation.ALL);
            }
        }

        /// <summary>
        /// Private method to log and handle general exceptions.
        /// </summary>
        private void LogGenericException(string methodName, Exception ex) {
            Logger.LogMessage(typeof(aspnet_WebEvent_EventsDataBase).FullName, methodName, ex,
                              Severity.ERROR, LogLocation.ALL);
        }

        #endregion
    }
}