using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FyreWinClient {
    public class Hints {
        private string _title;
        private List<HintTopic> _topics = new List<HintTopic>();

        public string Title {
            get {
                return _title;
            }
            set {
                _title = value;
            }
        }

        public List<HintTopic> Topics {
            get {
                return _topics;
            }
            set {
                _topics = value;
            }
        }
    }
}
