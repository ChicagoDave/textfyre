using System;
using System.Globalization;
using System.Runtime.Serialization;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public abstract class ZifmiaObject
    {
        [Index]
        public virtual Int64 Id { get; set; }

        public virtual string Key
        {
            get
            {
                return this.Id.ToString("X");
            }
        }
    }
}
