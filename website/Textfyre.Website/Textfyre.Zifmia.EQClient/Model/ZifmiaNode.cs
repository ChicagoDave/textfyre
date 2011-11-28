using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading;
using System.Xml.Serialization;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Binary;
using System.Security.Cryptography;
using System.Text;

using Zifmia.Service.Database;
using Zifmia.FyreVM.Service;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaNode
    {
        private List<ZifmiaChannel> _channels = null;

        [ID]
        internal long UID;
        public Int64 EngineId { get; set; }
        public int EngineLength { get; set; }

        public ZifmiaNode() { }
        
        public ZifmiaBranch Branch { get; set; }
        public DateTime Created { get; set; }
        public int Turn {
            get
            {
                if (_channels != null && _channels.Count > 0)
                {
                    int count = (from ZifmiaChannel c in _channels where c.Name == "TURN" select c).Count<ZifmiaChannel>();

                    if (count > 0)
                    {
                        ZifmiaChannel channel = (from ZifmiaChannel c in _channels where c.Name == "TURN" select c).First<ZifmiaChannel>();

                        if (channel != null)
                        {
                            return Convert.ToInt32(channel.Content);
                        }
                    }
                }

                return 0;
            }
        }
        public ZifmiaPlayer Player { get; set; }
        public string Command { get; set; }

        public List<ZifmiaChannel> Channels
        {
            get
            {
                if (_channels == null)
                    _channels = new List<ZifmiaChannel>();
                return _channels;
            }
            set
            {
                _channels = value;
            }
        }

        public static void SetEngine(EngineWrapper engine, ref Int64 engineId, ref int engineLength)
        {
            BinaryFormatter serializer = new BinaryFormatter();
            MemoryStream stream = new MemoryStream();
            serializer.Serialize(stream, engine);
            byte[] engineStream = stream.ToArray();

            SetEngine(engineStream, ref engineId, ref engineLength);
        }

        public static void SetEngine(byte[] engineStream, ref Int64 engineId, ref int engineLength)
        {
            string md5hash = "";
            using (MD5 md5Hash = MD5.Create())
            {
                byte[] hash = md5Hash.ComputeHash(engineStream);

                StringBuilder sb = new StringBuilder();

                for (int i = 0; i < hash.Length; i++)
                {
                    sb.Append(hash[i].ToString("x2"));
                }

                md5hash = sb.ToString();
            }

            //
            // Check if the engine in its current state has been saved before and if so, set this node's engine
            // to that data. There's no need to store multiple copies of the same engine state.
            //
            ZifmiaEngine engine = (from ZifmiaEngine ze in EQ.GetInstance.DB where ze.MD5Hash == md5hash select ze).FirstOrDefault<ZifmiaEngine>();

            if (engine == null)
            {
                ZifmiaEngine newEngine = new ZifmiaEngine(engineStream);
                newEngine.Save();

                engineId = newEngine.UID;
                engineLength = newEngine.Data.Length;
            }
            else
            {
                engineId = engine.Id;
                engineLength = engine.Data.Length;
            }
        }

        public byte[] GetEngine()
        {
            if (this.EngineId <= 0)
            {
                return null;
            }

            ZifmiaEngine engine = null;
            using (DB db = EQ.GetInstance.DB)
            {
                engine = (from ZifmiaEngine e in db where db.UID == this.EngineId select e).First<ZifmiaEngine>();
            }

            return engine.Data;
        }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }

    }
}
