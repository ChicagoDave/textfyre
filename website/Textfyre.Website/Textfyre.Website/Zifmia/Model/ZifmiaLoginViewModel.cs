using System.Runtime.Serialization;

namespace Zifmia.Model
{
    public class ZifmiaLoginViewModel : IZifmiaViewModel
    {
        public virtual string AuthKey { get; set; }
        public virtual string Nickname { get; set; }
        public virtual ZifmiaStatus Status { get; set; }
        public virtual string Message { get; set; }
    }
}
