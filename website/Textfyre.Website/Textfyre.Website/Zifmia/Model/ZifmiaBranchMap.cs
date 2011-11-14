using System;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaBranchMap
    {
        public ZifmiaBranchMap() { }


        public Int64 BranchId { get; set; }

        public Int64 ParentBranchId { get; set; }

        public int StartNodeTurn { get; set; }

        public int EndNodeTurn { get; set; }
    }
}
