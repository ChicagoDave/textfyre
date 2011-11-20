using System;
using System.Runtime.Serialization;

using Eloquera.Client;

namespace Zifmia.Model
{
    
    public class ZifmiaBranchMap
    {
        public ZifmiaBranchMap() { }

        [ID]
        internal long UID;
        public Int64 BranchId { get; set; }
        public Int64 ParentBranchId { get; set; }
        public int StartNodeTurn { get; set; }
        public int EndNodeTurn { get; set; }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }

    }
}
