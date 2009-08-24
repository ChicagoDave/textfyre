using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Textfyre.Common.Codegen.Framework
{
    public class TranslationData
    {
        private string _systemNamespace;
        private string _databaseName;
        private string _rootNamespace;
        private SqlTable _table;
        private string _filesPath;
        private bool _overwrite;

        public TranslationData(string databaseName, string systemNamespace, string rootNamespace, SqlTable table, string filesPath, bool overwrite)
        {
            _databaseName = databaseName;
            _systemNamespace = systemNamespace;
            _rootNamespace = rootNamespace;
            _table = table;
            _filesPath = filesPath;
            _overwrite = overwrite;
        }

        public string DatabaseName { get { return _databaseName; } set { _databaseName = value; } }
        public string SystemNamespace { get { return _systemNamespace; } set { _systemNamespace = value; } }
        public string RootNamespace { get { return _rootNamespace; } set { _rootNamespace = value; } }
        public SqlTable Table { get { return _table; } set { _table = value; } }
        public string FilesPath { get { return _filesPath; } set { _filesPath = value; } }
        public bool Overwrite { get { return _overwrite; } set { _overwrite = value; } }
    }
}
