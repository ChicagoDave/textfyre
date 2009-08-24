using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Textfyre.Common.Codegen.Framework
{
    public class SqlColumn
    {
        private string _name;
        private int _ordinalPosition;
        private bool _isNullable;
        private string _dataType;
        private int? _maxLength;
        private bool _isPrimaryKey;
        private bool _isUniqueIdentifier;

        public SqlColumn() { }

        public SqlColumn(string name, int ordinalPosition, bool isNullable, string dataType, int? maxLength, bool isPrimaryKey, bool isUniqueIdentifier)
        {
            _name = name;
            _ordinalPosition = ordinalPosition;
            _isNullable = isNullable;
            _dataType = dataType;
            _maxLength = maxLength;
            _isPrimaryKey = isPrimaryKey;
            _isUniqueIdentifier = isUniqueIdentifier;
        }

        public string Name { get { return _name; } set { _name = value; } }
        public int OrdinalPosition { get { return _ordinalPosition; } set { _ordinalPosition = value; } }
        public bool IsNullable { get { return _isNullable; } set { _isNullable = value; } }
        public string DataType { get { return _dataType; } set { _dataType = value; } }
        public int? MaxLength { get { return _maxLength; } set { _maxLength = value; } }
        public bool IsPrimaryKey { get { return _isPrimaryKey; } set { _isPrimaryKey = value; } }
        public bool IsUniqueIdentifier { get { return _isUniqueIdentifier; } set { _isUniqueIdentifier = value; } }
    }
}
