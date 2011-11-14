using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    public class ZifmiaSessionViewModel
    {
        public ZifmiaSessionViewModel() { }

        public ZifmiaSessionViewModel(ZifmiaSession session)
        {
            this.SessionKey = session.Key;
            this.PlayerKey = session.Owner.Key;
            this.PlayerName = session.Owner.FullName;
            this.StartDate = session.StartDate;
            this.GameKey = session.Game.Key;
            this.GameTitle = session.Game.Title;
            this.BranchMap = new List<ZifmiaBranchMap>();

            // create branch map
            foreach (ZifmiaBranch branch in session.Branches)
            {
                ZifmiaBranchMap map = new ZifmiaBranchMap();
                map.BranchId = branch.Id;
                if (branch.ParentBranch == null)
                    map.ParentBranchId = 0;
                else
                    map.ParentBranchId = branch.ParentBranch.Id;
                map.StartNodeTurn = branch.Nodes[0].Turn;
                map.EndNodeTurn = branch.Nodes[branch.Nodes.Count - 1].Turn;

                this.BranchMap.Add(map);
            }

        }

        public string SessionKey { get; set; }
        public string PlayerKey { get; set; }
        public string PlayerName { get; set; }
        public DateTime StartDate { get; set; }
        public string GameKey { get; set; }
        public string GameTitle { get; set; }
        public List<ZifmiaBranchMap> BranchMap { get; set; }
    }
}
