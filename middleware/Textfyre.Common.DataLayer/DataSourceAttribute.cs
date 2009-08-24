using System;

namespace Textfyre.Common.DataLayer
{
    public class DataSourceAttribute : Attribute
    {
        private string _mainDBKey;
        private string _errorDBKey;
        private string _machineName;

        private DBController _mainDBController;
        private DBController _errorDBController;

        public DataSourceAttribute() { }

        public DataSourceAttribute(string mainDBKey)
        {
            _machineName = String.Format("{0}.DatabaseEnvironment",System.Environment.MachineName);
            _mainDBKey = mainDBKey;
        }

        public DataSourceAttribute(string mainDBKey, string errorDBKey)
        {
            _machineName = String.Format("{0}.DatabaseEnvironment", System.Environment.MachineName);
            _mainDBKey = mainDBKey;
            _errorDBKey = errorDBKey;
        }

        public DBController MainDBController
        {
            get {
                if ((_mainDBController == null) && !String.IsNullOrEmpty(_mainDBKey))
                    _mainDBController = new DBController(_machineName, _mainDBKey);
                return _mainDBController;
            }
        }

        public DBController ErrorDBController
        {
            get {
                if ((_errorDBController == null) && !String.IsNullOrEmpty(_errorDBKey))
                    _errorDBController = new DBController(_machineName, _errorDBKey);
                return _errorDBController;
            }
        }

    }
}
