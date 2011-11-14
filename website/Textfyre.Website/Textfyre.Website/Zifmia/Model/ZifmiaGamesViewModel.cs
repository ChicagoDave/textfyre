using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Zifmia.Model
{
    
    public class ZifmiaGamesViewModel : IZifmiaViewModel
    {
        private List<ZifmiaGameViewModel> _games = null;

        public virtual List<ZifmiaGameViewModel> Games
        {
            get
            {
                if (_games == null) _games = new List<ZifmiaGameViewModel>();
                return _games;
            }
            set
            {
                _games = value;
            }
        }

        public virtual ZifmiaStatus Status { get; set; }
        public virtual string Message { get; set; }
    }
}
