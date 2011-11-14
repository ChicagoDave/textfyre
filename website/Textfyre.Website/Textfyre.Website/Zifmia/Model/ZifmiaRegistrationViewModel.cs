using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Zifmia.Model
{
    
    public class ZifmiaRegistrationViewModel : IZifmiaViewModel
    {
        public virtual ZifmiaRegistrationStatus RegistrationStatus { get; set; }
        public virtual ZifmiaStatus Status { get; set; }
        public virtual string Message { get; set; }
    }
}
