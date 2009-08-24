using System;
using System.Collections.Generic;
using System.Text;
using Textfyre.Common.DataLayer;

namespace Textfyre.Common.Codegen.Framework {
    public enum SqlTableType {
        BaseTable,
        View,
    }

    public class SqlTable {

        #region Members
        private bool _hasCompositePK;
        private bool _hasNoPK;
        private string _name;
        private SqlTableType _tableType;
        private List<SqlColumn> _columns;
        private Dictionary<string, string> _keyMap = new Dictionary<string,string>(); //Maps PK column name to data type
        private string _primaryKeyColumnName;
        #endregion

        #region Constructors
        public SqlTable() { }

        public SqlTable(string tableName, SqlTableType tableType) {
            _name = tableName;
            _tableType = Type;
        }
        #endregion

        #region Properties
        public string Name { get { return _name; } set { _name = value; } }
        public SqlTableType Type { get { return _tableType; } set { _tableType = value; } }
        public bool HasCompositePK { get { return _hasCompositePK; } }
        public bool HasNoPK { get { return _hasNoPK; } }        

        public string PrimaryKeyColumn { 
            get {
                return _primaryKeyColumnName;
            } 
        }

        public string PrimaryKeyDataType { 
            get {
                return _keyMap[_primaryKeyColumnName];
            } 
        }

        public Dictionary<string, string> CompositeKey {
            get { return _keyMap; }
        }

        public List<SqlColumn> Columns
        {
            get {                
                if (_columns == null)
                    _columns = new List<SqlColumn>();
                return _columns;
            }
            set { _columns = value; }
        }
        #endregion

        public void DeterminePKInformation() {
            int pkCount = 0;
            foreach (SqlColumn column in _columns) {
                if (column.IsPrimaryKey)
                    pkCount++;
            }

            if (pkCount == 0) {
                _hasNoPK = true;
            } else if (pkCount >= 2) {            
                _hasCompositePK = true;                
            }

            if (pkCount >= 1) {
                foreach (SqlColumn column in _columns) {
                    if (column.IsPrimaryKey) {

                        if (pkCount == 1) {
                            _primaryKeyColumnName = column.Name;
                            _keyMap.Add(_primaryKeyColumnName, DatabaseFactory.SqlTypeName(column.DataType));
                            break;
                        } else {
                            string dataTypeName = DatabaseFactory.SqlTypeName(column.DataType);
                            //if ((dataTypeName != "string") && (dataTypeName != "byte[]"))
                            _keyMap.Add(column.Name, dataTypeName);
                            //else
                            //    _keyMap.Add(column.Name, dataTypeName);
                        }

                    } //end if
                } //end foreach
            } //end if
        }
    }
}
