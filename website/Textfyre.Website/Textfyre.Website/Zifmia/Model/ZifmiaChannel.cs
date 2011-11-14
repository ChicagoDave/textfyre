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

        [Index]

        public string Name { get; set; }

        public string Content { get; set; }
    }
}