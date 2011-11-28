using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.Serialization;
using System.Linq;

namespace Zifmia.Model
{
    /// <summary>
    /// This is the view model for all game oriented calls to the web service. Most of the time,
    /// the data will be the last turn of a branch. For history calls, CurrentBranch and CurrentNode
    /// will reflect the selected branch and turn while the branch list and node list will have all
    /// of the data. This allowed the main constructor to accept a session object and fill the
    /// view model for session creation, normal game play, branched game play, or just a call for
    /// a history node for display.
    /// </summary>
    
    public class ZifmiaViewModel : IZifmiaViewModel
    {
        public ZifmiaViewModel()
        {
            this.Channels = new List<ZifmiaChannel>();
            this.Branches = new List<ZifmiaBranchViewData>();
        }

        public ZifmiaViewModel(ZifmiaSession session, int branchId, int turn)
        {
            SetData(session);

            this.BranchId = branchId;
            this.Turn = turn;

            ZifmiaBranch branch = (from ZifmiaBranch b in session.Branches where b.BranchId == branchId select b).FirstOrDefault<ZifmiaBranch>();

            if (branch == null)
                this.Channels = new List<ZifmiaChannel>();
            else
            {
                ZifmiaNode node = (from ZifmiaNode n in branch.Nodes where n.Turn == turn select n).FirstOrDefault<ZifmiaNode>();

                if (node == null)
                    this.Channels = new List<ZifmiaChannel>();
                else
                {
                    this.Channels = node.Channels;
                    this.Command = node.Command;
                }
            }
        }

        public ZifmiaViewModel(ZifmiaSession session)
        {
            SetData(session);
        }

        private void SetData(ZifmiaSession session)
        {
            this.Channels = new List<ZifmiaChannel>();
            this.Branches = new List<ZifmiaBranchViewData>();

            this.AuthKey = session.Owner.AuthKey;
            this.Player = session.Owner;
            this.Game = session.Game;
            this.SessionKey = session.Key;
            this.BranchId = session.CurrentBranch.BranchId;
            this.Turn = session.CurrentBranch.CurrentNode.Turn;
            this.Command = session.CurrentBranch.CurrentNode.Command;
            this.HasPreviousNode = (session.CurrentBranch.Nodes.Count > 1);
            this.HasNextNode = (session.CurrentBranch.Nodes[session.CurrentBranch.Nodes.Count - 1].Turn > this.Turn);
            this.Channels = session.CurrentBranch.CurrentNode.Channels;

            // create branch map
            foreach (ZifmiaBranch branch in session.Branches)
            {
                ZifmiaBranchViewData branchViewData = new ZifmiaBranchViewData();
                branchViewData.BranchId = branch.BranchId;
                branchViewData.StartNodeTurn = branch.Nodes[0].Turn;
                branchViewData.EndNodeTurn = branch.Nodes[branch.Nodes.Count - 1].Turn;
                branchViewData.Nodes = new List<ZifmiaNodeViewData>();

                foreach (ZifmiaNode node in branch.Nodes)
                {
                    ZifmiaNodeViewData nodeViewData = new ZifmiaNodeViewData();
                    nodeViewData.Turn = node.Turn;
                    nodeViewData.LocationName = (from ZifmiaChannel channel in node.Channels where channel.Name == "LOCN" select channel.Content).FirstOrDefault<string>();
                    nodeViewData.Time = (from ZifmiaChannel channel in node.Channels where channel.Name == "TIME" select channel.Content).FirstOrDefault<string>();
                    nodeViewData.Score = Convert.ToInt32((from ZifmiaChannel channel in node.Channels where channel.Name == "SCOR" select channel.Content).FirstOrDefault<string>());
                    nodeViewData.Command = node.Command;
                    nodeViewData.Inventory = "";

                    branchViewData.Nodes.Add(nodeViewData);
                }

                this.Branches.Add(branchViewData);
            }

        }

        public string AuthKey { get; set; }
        public ZifmiaPlayer Player { get; set; }
        public ZifmiaGame Game { get; set; }
        public string SessionKey { get; set; }
        public Int64 BranchId { get; set; }
        public int Turn { get; set; }
        public string Command { get; set; }
        public bool HasPreviousNode { get; set; }
        public bool HasNextNode { get; set; }
        public List<ZifmiaChannel> Channels { get; set; }
        public List<ZifmiaBranchViewData> Branches { get; set; }
        public string Message { get; set; }
        public ZifmiaStatus Status { get; set; }
        public string BranchesViewHtml { get; set; }

    }
}
