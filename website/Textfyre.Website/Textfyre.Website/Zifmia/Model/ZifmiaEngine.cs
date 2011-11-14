using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaEngine
    {
        [ID]
        internal long UID;
        public virtual string Key
        {
            get
            {
                return this.UID.ToString("X");
            }
        }
        public byte[] Data { get; set; }

        public ZifmiaEngine(byte[] data)
        {
            this.Data = data;
        }

        public void Save()
        {
            using (DB db = EQ.GetInstance.DB)
            {
                db.Store(this);
            }
        }
    }
}
