using System.Runtime.Serialization;

namespace Zifmia.Model
{
    public class ZifmiaLoginViewModel : IZifmiaViewModel
    {
        public virtual string AuthKey { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string FullName { get; set; }
        public virtual string EmailAddress { get; set; }
        public virtual string Nickname { get; set; }
        public virtual ZifmiaStatus Status { get; set; }
        public virtual string Message { get; set; }
    }
}
