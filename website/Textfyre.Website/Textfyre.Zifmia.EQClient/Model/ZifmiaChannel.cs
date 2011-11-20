using System.Runtime.Serialization;

using Eloquera.Client;

namespace Zifmia.Model
{
    
    public class ZifmiaChannel
    {
        public ZifmiaChannel() { }

        public ZifmiaChannel(string name, string content)
        {
            this.Name = name;
            this.Content = content;
        }

        [ID]
        internal long UID;
        public string Name { get; set; }
        public string Content { get; set; }

        public long Id
        {
            get
            {
                return this.UID;
            }
        }
    }
}