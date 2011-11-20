using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaSessionsViewModel : IZifmiaViewModel
    {
        private List<ZifmiaSessionViewModel> _sessions = null;

        public ZifmiaSessionsViewModel() { }

        public ZifmiaSessionsViewModel(ZifmiaSessions sessions)
        {
            this.Sessions = new List<ZifmiaSessionViewModel>();

            foreach (ZifmiaSession session in sessions.Sessions)
            {
                this.Sessions.Add(new ZifmiaSessionViewModel(session));
            }
        }

        public List<ZifmiaSessionViewModel> Sessions
        {
            get
            {
                if (_sessions == null) _sessions = new List<ZifmiaSessionViewModel>();
                return _sessions;
            }
            set
            {
                _sessions = value;
            }
        }

        public virtual ZifmiaStatus Status { get; set; }
        public virtual string Message { get; set; }
    }
}
