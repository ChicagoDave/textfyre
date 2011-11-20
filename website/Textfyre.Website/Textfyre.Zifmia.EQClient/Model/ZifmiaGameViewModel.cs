using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Linq;
using System.Text;

namespace Zifmia.Model
{
    
    public class ZifmiaGameViewModel
    {
        public long Id { get; set; }
        public string Key { get; set; }
        public string Title { get; set; }
        public string Name { get; set; }
        public DateTime Installed { get; set; }
    }
}
