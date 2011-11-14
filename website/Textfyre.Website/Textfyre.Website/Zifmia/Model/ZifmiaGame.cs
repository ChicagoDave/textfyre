using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaGame : ZifmiaObject, IEQObject
    {
        public ZifmiaGame() { }

        public ZifmiaGame(DB client, string title, byte[] engine, List<ZifmiaChannel> channels)
        {
            this.Title = title;
            this.Id = ZifmiaGameId.GetNextId(client);
            this.Engine = engine;
            this.Channels = channels;
            this.Installed = DateTime.Now;
        }

        public long UID { get; set; }
        public string Title { get; set; }
        public DateTime Installed { get; set; }
        public byte[] Engine { get; set; }
        public List<ZifmiaChannel> Channels { get; set; }
    }
}