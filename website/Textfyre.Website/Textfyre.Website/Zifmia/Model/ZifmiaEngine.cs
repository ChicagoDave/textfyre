using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaEngine : ZifmiaObject
    {
        public byte[] Data { get; set; }

        public ZifmiaEngine(byte[] data)
        {
            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                using (DB db = database.GetDatabaseConnection())
                {
                    this.Id = ZifmiaEngineId.GetNextId(db);
                }
            }
            this.Data = data;
        }

        public void Save()
        {
            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                using (DB db = database.GetDatabaseConnection())
                {
                    db.Store(this);
                }
            }
        }
    }
}
