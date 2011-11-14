using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaSessions
    {
        private List<ZifmiaSession> _sessions = null;

        public ZifmiaSessions() { }

        public ZifmiaSessions(List<ZifmiaSession> sessions)
        {
            _sessions = sessions;
        }


        public List<ZifmiaSession> Sessions
        {
            get
            {
                if (_sessions == null)
                    _sessions = new List<ZifmiaSession>();
                
                return _sessions;
            }
            set
            {
                _sessions = value;
            }
        }
    }
}
