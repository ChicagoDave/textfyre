using System;
using System.Collections.Generic;
using System.Linq;

using Zifmia.Service.Database;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaGame
    {
        public ZifmiaGame() { }

        public ZifmiaGame(string title, string name, byte[] engine, List<ZifmiaChannel> channels)
        {
            this.Title = title;
            this.Name = name;
            this.Engine = engine;
            this.Channels = channels;
            this.Installed = DateTime.Now;
        }

        [ID]
        internal long UID;
        public virtual string Key
        {
            get
            {
                return this.UID.ToString("X");
            }
        }
        public string Title { get; set; }
        public string Name { get; set; }
        public DateTime Installed { get; set; }
        public byte[] Engine { get; set; }
        public List<ZifmiaChannel> Channels { get; set; }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }

        public void Clean()
        {
            ZifmiaDatabase zdb = new ZifmiaDatabase();
            zdb.CleanGame(this.UID);
        }

    }
}