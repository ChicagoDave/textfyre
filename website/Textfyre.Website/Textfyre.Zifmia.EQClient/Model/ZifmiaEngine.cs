using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

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
        public string MD5Hash { get; set; }

        public ZifmiaEngine(byte[] data)
        {
            this.Data = data;
        }

        public void Save()
        {
            using (MD5 md5Hash = MD5.Create())
            {
                byte[] hash = md5Hash.ComputeHash(this.Data);

                StringBuilder sb = new StringBuilder();

                for (int i = 0; i < hash.Length; i++)
                {
                    sb.Append(hash[i].ToString("x2"));
                }

                this.MD5Hash = sb.ToString();
            }

            using (DB db = EQ.GetInstance.DB)
            {
                this.UID = db.Store(this);
            }
        }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }

    }
}
