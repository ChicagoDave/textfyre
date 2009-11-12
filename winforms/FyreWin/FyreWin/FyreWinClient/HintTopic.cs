using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FyreWinClient {
    public class HintTopic {
        private string _title;
        private List<string> _hints = new List<string>();

        public string Title {
            get {
                return _title;
            }
            set {
                _title = value;
            }
        }

        public List<string> Hints {
            get {
                return _hints;
            }
            set {
                _hints = value;
            }
        }

    }
}
