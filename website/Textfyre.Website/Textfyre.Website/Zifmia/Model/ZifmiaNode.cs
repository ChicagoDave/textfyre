using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading;
using System.Xml.Serialization;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Binary;

using Zifmia.Service.Database;
using Zifmia.FyreVM.Service;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaNode
    {
        private List<ZifmiaChannel> _channels = null;

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

        public static void SetEngine(DB client, EngineWrapper engine, ref Int64 engineId, ref int engineLength)
        {
            ZifmiaDatabase database = new ZifmiaDatabase();

            BinaryFormatter serializer = new BinaryFormatter();
            MemoryStream stream = new MemoryStream();
            serializer.Serialize(stream, engine);
            byte[] engineStream = stream.ToArray();

            SetEngine(engineStream, ref engineId, ref engineLength);
        }

        public static void SetEngine(byte[] engineStream, ref Int64 engineId, ref int engineLength)
        {
            ZifmiaEngine newEngine = new ZifmiaEngine(engineStream);
            engineId = newEngine.Id;
            engineLength = newEngine.Data.Length;

            newEngine.Save();
        }

        public byte[] GetEngine(DB client)
        {
            if (this.EngineId <= 0)
            {
                return null;
            }

            ZifmiaEngine engine = (from ZifmiaEngine e in client where e.Id == this.EngineId select e).First<ZifmiaEngine>();

            return engine.Data;
        }
    }
}
