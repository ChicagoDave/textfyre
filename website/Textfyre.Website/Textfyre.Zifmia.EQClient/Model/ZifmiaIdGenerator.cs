using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaIdGenerator<T> where T : ZifmiaIdGenerator<T>, new()
    {
        private static object locker = new object();

        public Int64 Id { get; set; }

        public static Int64 GetNextId(DB client)
        {
            T id = new T();

            lock (locker)
            {
                id = (from T a in client select a).FirstOrDefault<T>();

                if (id == null)
                {
                    id = new T();
                    id.Id = ZifmiaDatabase.BASE_KEY + 1;
                }
                else
                {
                    id.Id++;
                }

                client.Store(id);
            }

            return id.Id;
        }

        public static string GetNextKey(ZifmiaDatabase database)
        {
            T id = new T();
            using (DB db = EQ.GetInstance.DB)
            {

                lock (locker)
                {
                    id = (from T a in db select a).FirstOrDefault<T>();

                    if (id == null)
                    {
                        id = new T();
                        id.Id = ZifmiaDatabase.BASE_KEY + 1;
                    }
                    else
                    {
                        id.Id++;
                    }

                    db.Store(id);
                }
            }

            return id.Id.ToString("X");
        }
    }
}
