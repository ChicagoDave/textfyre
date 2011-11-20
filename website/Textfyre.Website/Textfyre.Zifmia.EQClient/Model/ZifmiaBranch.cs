using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaBranch
    {
        private List<ZifmiaNode> _nodes = null;

        public ZifmiaBranch() { }

        public ZifmiaBranch(ZifmiaSession session, string branchName, ZifmiaBranch parentBranch)
        {
            this.Session = session;
            this.BranchId = session.Branches.Count + 1;
            this.BranchName = branchName;
            this.ParentBranch = parentBranch;
            this.Started = DateTime.Now;
            this.LastUpdated = DateTime.Now;
        }

        [ID]
        internal long UID;
        public int BranchId { get; set; }
        public ZifmiaSession Session { get; set; }
        public string BranchName { get; set; }
        public ZifmiaNode CurrentNode { get; set; }
        public List<ZifmiaNode> Nodes
        {
            get
            {
                if (_nodes == null)
                    _nodes = new List<ZifmiaNode>();
                return _nodes;
            }
            set
            {
                _nodes = value;
            }
        }
        public ZifmiaBranch ParentBranch { get; set; }
        public DateTime Started { get; set; }
        public DateTime LastUpdated { get; set; }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }

    }
}
