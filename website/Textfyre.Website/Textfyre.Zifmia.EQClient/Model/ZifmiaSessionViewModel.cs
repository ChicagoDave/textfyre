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
            this.GameName = session.Game.Name;
            this.Branches = new List<ZifmiaBranchViewData>();

            // create branch map
            foreach (ZifmiaBranch branch in session.Branches)
            {
                ZifmiaBranchViewData branchViewData = new ZifmiaBranchViewData();
                branchViewData.BranchId = branch.BranchId;
                branchViewData.StartNodeTurn = branch.Nodes[0].Turn;
                branchViewData.EndNodeTurn = branch.Nodes[branch.Nodes.Count - 1].Turn;

                foreach (ZifmiaNode node in branch.Nodes)
                {
                    ZifmiaNodeViewData nodeViewData = new ZifmiaNodeViewData();
                    nodeViewData.Turn = node.Turn;
                    nodeViewData.LocationName = (from ZifmiaChannel channel in node.Channels where channel.Name == "LOCN" select channel.Content).FirstOrDefault<string>();
                    nodeViewData.Time = (from ZifmiaChannel channel in node.Channels where channel.Name == "TIME" select channel.Content).FirstOrDefault<string>();
                    nodeViewData.Score = Convert.ToInt32((from ZifmiaChannel channel in node.Channels where channel.Name == "SCOR" select channel.Content).FirstOrDefault<string>());
                    nodeViewData.Inventory = "";

                    branchViewData.Nodes.Add(nodeViewData);
                }

                this.Branches.Add(branchViewData);
            }

        }

        public string SessionKey { get; set; }
        public string PlayerKey { get; set; }
        public string PlayerName { get; set; }
        public DateTime StartDate { get; set; }
        public string GameKey { get; set; }
        public string GameTitle { get; set; }
        public string GameName { get; set; }
        public List<ZifmiaBranchViewData> Branches { get; set; }
    }
}
