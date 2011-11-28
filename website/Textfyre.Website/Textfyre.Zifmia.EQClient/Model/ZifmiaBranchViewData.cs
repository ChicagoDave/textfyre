using System;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaBranchViewData
    {
        public ZifmiaBranchViewData() { }

        public Int64 BranchId { get; set; }
        public int StartNodeTurn { get; set; }
        public int EndNodeTurn { get; set; }
        public List<ZifmiaNodeViewData> Nodes { get; set; }
    }
}
