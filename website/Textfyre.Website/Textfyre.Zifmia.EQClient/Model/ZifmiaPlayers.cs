using System;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaPlayerCollection
   {
        private List<ZifmiaPlayer> _zifmiaPlayers = null;


        public List<ZifmiaPlayer> ZifmiaPlayers
        {
            get
            {
                if (_zifmiaPlayers == null)
                    _zifmiaPlayers = new List<ZifmiaPlayer>();

                return _zifmiaPlayers;
            }
            set
            {
                _zifmiaPlayers = value;
            }
        }
    }
}