using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Eloquera.Client;

using Zifmia.Model;

namespace Zifmia.Service.Database
{
    public class EQ
    {
        private static volatile EQ _conn = null;
        private static DB _db = null;
        private static object locker = new object();

        private const string connectionString = "server=localhost;password=pwd;options=none;";
        private const string databaseName = "ZifmiaTextfyreDB";

        private bool _checked = false;

        private EQ() {
            _db = new DB(connectionString);
        }

        public static EQ GetInstance
        {
            get
            {
                if (_conn == null)
                {
                    lock (locker)
                    {
                        _conn = new EQ();
                    }
                }

                return _conn;
            }
        }

        public DB DB
        {
            get {
                if (!this._checked)
                {
                    CheckDatabase();
                    this._checked = true;
                }
                _db.OpenDatabase(databaseName);
                return _db;
            }
        }

        private void CheckDatabase()
        {
            string[] dbs = _db.GetDbList();
            bool dbExists = (dbs.Contains<string>(databaseName));

            if (!dbExists)
            {
                _db.CreateDatabase(databaseName);
                _db.OpenDatabase(databaseName);
                _db.RegisterType(typeof(ZifmiaAuthorizationId));
                _db.RegisterType(typeof(ZifmiaBranch));
                _db.RegisterType(typeof(ZifmiaChannel));
                _db.RegisterType(typeof(ZifmiaGame));
                _db.RegisterType(typeof(ZifmiaNode));
                _db.RegisterType(typeof(ZifmiaEngine));
                _db.RegisterType(typeof(ZifmiaPlayer));
                _db.RegisterType(typeof(ZifmiaGameId));
                _db.RegisterType(typeof(ZifmiaEngineId));
                _db.RegisterType(typeof(ZifmiaPlayerId));
                _db.RegisterType(typeof(ZifmiaSessionId));
                _db.RegisterType(typeof(ZifmiaStatus));
            }

            _db.Close();
        }
    }

}