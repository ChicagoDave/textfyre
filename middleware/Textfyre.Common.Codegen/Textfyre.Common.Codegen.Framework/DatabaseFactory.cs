using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Textfyre.Common.Utilities;

namespace Textfyre.Common.Codegen.Framework {

    public class DatabaseFactory {

        #region Constants
        private const string NAME = "name";
        private const string XTYPE = "xtype";

        private const string BASE_TABLE       = "BASE TABLE";
        private const string YES              = "YES";        

        private const string TEXT             = "text";
        private const string UNIQUEIDENTIFIER = "uniqueidentifier";
        private const string TINYINT          = "tinyint";
        private const string SMALLINT         = "smallint";
        private const string INT              = "int";
        private const string SMALLDATETIME    = "smalldatetime";
        private const string REAL             = "real";
        private const string MONEY            = "money";
        private const string DATETIME         = "datetime";
        private const string FLOAT            = "float";
        private const string NTEXT            = "ntext";
        private const string BIT              = "bit";
        private const string DECIMAL          = "decimal";
        private const string NUMERIC          = "numeric";
        private const string SMALLMONEY       = "smallmoney";
        private const string BIGINT           = "bigint";
        private const string VARCHAR          = "varchar";
        private const string CHAR             = "char";
        private const string TIMESTAMP        = "timestamp";
        private const string NVARCHAR         = "nvarchar";
        private const string NCHAR            = "nchar";
        private const string VARBINARY        = "varbinary";
        private const string BINARY           = "binary";
        private const string IMAGE            = "image";
        private const string XML              = "xml";

        private const string TABLE_VIEW_SQL = "SELECT TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '{0}'";
        private const string PRIMARY_KEY_SQL = "SELECT cu.CONSTRAINT_NAME, cu.COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE cu WHERE EXISTS ( SELECT tc.* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc WHERE tc.CONSTRAINT_CATALOG = '{0}' AND tc.TABLE_NAME = '{1}' AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY' AND tc.CONSTRAINT_NAME = cu.CONSTRAINT_NAME )";
        private const string COLUMN_SQL = "SELECT COLUMN_NAME, ORDINAL_POSITION, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM {0}.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{1}'";
        #endregion

        #region Enumerations
        public enum ClassType {
            DataLayer,
            BusinessLayer,
            Recordset
        }
        #endregion        

        #region Members
        private SqlConnection _connection;
        private string _databaseName;
        #endregion

        #region Constructor
        public DatabaseFactory(string databaseName, string connectionString) {
            _databaseName = databaseName;
            _connection = new SqlConnection(connectionString);
        }
        #endregion

        public SqlTable LoadTable(string TableName) {
            SqlTable table = new SqlTable(TableName, SqlTableType.BaseTable);
            
            //Open the connection to the database
            _connection.Open();

            //Determine if the selected item is a table or a view
            SqlCommand command = new SqlCommand(String.Format(TABLE_VIEW_SQL, TableName), _connection);
            string result = command.ExecuteScalar() as string;
            table.Type = General.iif<SqlTableType>((result == BASE_TABLE), SqlTableType.BaseTable, SqlTableType.View);

            //Determine what the primary key(s) are of the table or view            
            command.CommandText = String.Format(PRIMARY_KEY_SQL, _databaseName, TableName);
            List<string> primary_key_columns = new List<string>();
            using (SqlDataReader reader = command.ExecuteReader()) {                
                while (reader.Read())
                    primary_key_columns.Add(reader.GetString(1));
            }            

            //Determine what columns belong to the table
            command.CommandText = String.Format(COLUMN_SQL, _databaseName, TableName);
            using (SqlDataReader reader = command.ExecuteReader()) {               
                while (reader.Read()) {
                    string columnName   = reader.GetString(0);
                    int ordinalPosition = reader.GetInt32(1);
                    bool isNullable = General.iif<bool>((reader.GetString(2) == YES), true, false);
                    string dataType = reader.GetString(3);

                    int? maxLength = null;
                    if (!reader.IsDBNull(4))
                        maxLength = reader.GetInt32(4);

                    bool isPrimaryKey = primary_key_columns.Contains(columnName);
                    bool isUniqueIdentifier = (isPrimaryKey && dataType == "UNQIUEIDENTIFIER");

                    table.Columns.Add(new SqlColumn(columnName, ordinalPosition, isNullable, dataType, maxLength, isPrimaryKey, isUniqueIdentifier));
                }
                reader.Close();
            }

            _connection.Close();
            command.Dispose();
            command = null;

            table.DeterminePKInformation();
            return table;
        }

        public static string SqlTypeName(string typeName)
        {
            string nonNullType = typeName;
            if (nonNullType.EndsWith("?"))
                nonNullType = nonNullType.Substring(0,nonNullType.Length-1);

            switch (nonNullType) {
                case TEXT             : return "string";
                case UNIQUEIDENTIFIER : return "Guid";
                case TINYINT          : return "Byte";
                case SMALLINT         : return "Int16";
                case INT              : return "Int32";
                case SMALLDATETIME    : return "DateTime";
                case REAL             : return "single";
                case MONEY            : return "decimal";
                case DATETIME         : return "DateTime";
                case FLOAT            : return "double";
                case NTEXT            : return "string";
                case BIT              : return "bool";
                case DECIMAL          : return "decimal";
                case NUMERIC          : return "decimal";
                case SMALLMONEY       : return "decimal";
                case BIGINT           : return "Int64";
                case VARCHAR          : return "string";
                case CHAR             : return "string";
                case TIMESTAMP        : return "byte[]";
                case NVARCHAR         : return "string";
                case NCHAR            : return "string";
                case VARBINARY        : return "byte[]";
                case BINARY           : return "byte[]";
                case IMAGE            : return "byte[]";
                case XML              : return "string";
            }

            throw new Exception("Unknown type name in DatabaseFactory.SqlTypeName.");
        }

        public static string SqlDbTypeName(string typeName)
        {
            switch (typeName)
            {
                case TEXT:
                    return "SqlDbType.Text";
                case UNIQUEIDENTIFIER:
                    return "SqlDbType.UniqueIdentifier";
                case TINYINT:
                    return "SqlDbType.TinyInt";
                case SMALLINT:
                    return "SqlDbType.SmallInt";
                case INT:
                    return "SqlDbType.Int";
                case SMALLDATETIME:
                    return "SqlDbType.SmallDateTime";
                case REAL:
                    return "SqlDbType.Real";
                case MONEY:
                    return "SqlDbType.Money";
                case DATETIME:
                    return "SqlDbType.DateTime";
                case FLOAT:
                    return "SqlDbType.Float";
                case NTEXT:
                    return "SqlDbType.NText";
                case BIT:
                    return "SqlDbType.Bit";
                case DECIMAL:
                    return "SqlDbType.Decimal";
                case NUMERIC:
                    return "SqlDbType.Decimal";
                case SMALLMONEY:
                    return "SqlDbType.SmallMoney";
                case BIGINT:
                    return "SqlDbType.BigInt";
                case VARCHAR:
                    return "SqlDbType.VarChar";
                case CHAR:
                    return "SqlDbType.Char";
                case TIMESTAMP:
                    return "SqlDbType.Timestamp";
                case NVARCHAR:
                    return "SqlDbType.NVarChar";
                case NCHAR:
                    return "SqlDbType.NChar";
                case VARBINARY:
                    return "SqlDbType.VarBinary";
                case BINARY:
                    return "SqlDbType.Binary";
                case IMAGE:
                    return "SqlDbType.Image";
                case XML:                    
                    return "SqlDbType.Xml";
            }

            throw new Exception("Unknown type name in DatabaseFactory.SqlDbTypeName");
        }

        #region Create public properties
        public static string SetPublicProperties(TranslationData transData, ClassType classType, bool isVirtual, string output)
        {
            //string propertyTemplateDL = "\t\tpublic#virtual# #dataType# #columnName#\r\n\t\t{\r\n\t\t\tget { return _recordset.#columnName#; }\r\n\t\t\tset\r\n\t\t\t{\r\n\t\t\t\tif (_recordset.#columnName# != value)\r\n\t\t\t\t{\r\n\t\t\t\t\t_recordset.IsDirty = true;\r\n\t\t\t\t}\r\n\t\t\t_recordset.#columnName# = value;\r\n\t\t\t}\r\n\t\t}\r\n\r\n";
            string properties = null;

            switch (classType) {
                case ClassType.BusinessLayer:
                    properties = CreateBusinessLayerProperties(transData, isVirtual);
                    break;
                case ClassType.Recordset:
                    properties = CreateRecordsetProperties(transData, isVirtual);
                    break;
            }                                    
            
            output = output.Replace(FrameworkDriver.PH_PUBLIC_PROPERTIES, properties);
            return output;
        }

        private static string CreateBusinessLayerProperties(TranslationData transData, bool isVirtual) {
            //public #virtual# #dataType# #columnName# {
            //  get { return _recordset.#columnName#; }
            //  set {
            //      if(_recordset.#columnName# != value) {
            //        _recordset.#columnName# = value;
            //        NotifyPropertyChanged("#columnName#");
            //      }
            //  }
            //}
            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns) {                

                #region Property Definition
                sb.Append("\r\n\t\t");
                sb.Append("public ");

                if (isVirtual)
                    sb.Append("virtual ");

                string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                sb.Append(dataType);

                if (column.IsNullable) {
                    if ((dataType != "string") && (dataType != "byte[]"))
                        sb.Append("?");
                }

                sb.Append(" ");
                sb.Append(column.Name);
                sb.Append(" {");
                #endregion

                #region Property Body

                //Get line
                sb.Append("\r\n\t\t\t");
                sb.Append("get { return _recordset.");
                sb.Append(column.Name);
                sb.Append("; }");

                //set line
                sb.Append("\r\n\t\t\t");
                sb.Append("set {");               

                //first if line
                sb.Append("\r\n\t\t\t\t");
                sb.Append("if (_recordset.");
                sb.Append(column.Name);
                sb.Append(" != value) {");
                
                sb.Append("\r\n\t\t\t\t\t");
                sb.Append("_recordset.");
                sb.Append(column.Name);
                sb.Append(" = value;");

                sb.Append("\r\n\t\t\t\t\t");
                sb.Append("NotifyPropertyChanged(");
                sb.Append('"');
                sb.Append(column.Name);
                sb.Append('"');
                sb.Append(");");

                sb.Append("\r\n\t\t\t\t}");
                sb.Append("\r\n\t\t\t}");
                sb.Append("\r\n\t\t}");

                sb.Append(Environment.NewLine);

                #endregion
            }

            return sb.ToString();
        }

        private static string CreateRecordsetProperties(TranslationData transData, bool isVirtual) {
            //public #dataType# #columnName# {
            //  get { return _#columnName#; }
            //  set { 
            //      if(_#columnName# != value) {
            //          _isDirty = true;
            //          _#columnName# = value;
            //      }
            //  }
            //}   
            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns) {

                #region Property Definition
                sb.Append("\r\n\t\t");
                sb.Append("public ");

                if (isVirtual)
                    sb.Append("virtual ");

                string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                sb.Append(dataType);

                if (column.IsNullable) {
                    if ((dataType != "string") && (dataType != "byte[]"))
                        sb.Append("?");
                }

                sb.Append(" ");
                sb.Append(column.Name);
                sb.Append(" {");
                #endregion

                #region Property Body

                sb.Append("\r\n\t\t\t");
                sb.Append("get { return _");
                sb.Append(column.Name);
                sb.Append("; }");

                sb.Append("\r\n\t\t\t");
                sb.Append("set {");
                sb.Append("\r\n\t\t\t\t");
                sb.Append("if(_");
                sb.Append(column.Name);
                sb.Append(" != value) {");

                sb.Append("\r\n\t\t\t\t\t");
                sb.Append("_isDirty = true;");                

                sb.Append("\r\n\t\t\t\t\t");
                sb.Append("_");
                sb.Append(column.Name);
                sb.Append(" = value;");

                sb.Append("\r\n\t\t\t\t}");
                sb.Append("\r\n\t\t\t}");
                sb.Append("\r\n\t\t}");

                sb.Append(Environment.NewLine);

                #endregion

            }

            return sb.ToString();
        }
        #endregion
    }
}
