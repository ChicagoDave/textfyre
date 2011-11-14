using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Zifmia.Model
{
    public interface IZifmiaViewModel
    {
        string Message { get; set; }
        ZifmiaStatus Status { get; set; }
    }
}
