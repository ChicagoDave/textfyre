using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaSession : ZifmiaObject, IEQObject
    {
        private List<ZifmiaBranch> _branches = null;

        public ZifmiaSession() { }

        /// <summary>
        /// Create a new session for the given game and player. The first branch and
        /// first node are also created with engine and channel data coming from the game.
        /// </summary>
        /// <param name="game"></param>
        /// <param name="owner"></param>
        public ZifmiaSession(DB client, ZifmiaGame game, ZifmiaPlayer owner)
        {
            this.Id = ZifmiaSessionId.GetNextId(client);
            this.Game = game;
            this.Owner = owner;
            this.StartDate = DateTime.Now;
            this.CurrentBranch = new ZifmiaBranch(this, "Start Branch", null);
            this.Branches.Add(this.CurrentBranch);

            ZifmiaNode node = new ZifmiaNode();
            node.Branch = this.CurrentBranch;
            node.Channels = new List<ZifmiaChannel>();
            foreach (ZifmiaChannel channel in game.Channels)
            {
                node.Channels.Add(new ZifmiaChannel(channel.Name, channel.Content));
            }
            node.Command = "";
            node.Created = DateTime.Now;

            Int64 engineId = 0;
            int engineLength = 0;
            ZifmiaNode.SetEngine(this.Game.Engine, ref engineId, ref engineLength);
            node.EngineId = engineId;
            node.EngineLength = engineLength;
            node.Player = this.Owner;

            this.CurrentBranch.Nodes.Add(node);
            this.CurrentBranch.CurrentNode = node;
        }

        public long UID { get; set; }
        public ZifmiaGame Game { get; set; }
        public ZifmiaPlayer Owner { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime LastUpdated { get; set; }
        public ZifmiaBranch CurrentBranch { get; set; }
        public Int64 DiskUsage { get; set; }

        public List<ZifmiaBranch> Branches {
            get
            {
                if (_branches == null)
                    _branches = new List<ZifmiaBranch>();

                return _branches;
            }
            set
            {
                _branches = value;
            }
        }

    }
}