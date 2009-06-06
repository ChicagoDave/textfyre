using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FyreWords {
    public class WordDefinition {
        private string _primaryWord;
        private List<string> _wordList = new List<string>();
        private string _definition;

        public WordDefinition() {
        }

        public string PrimaryWord {
            get {
                return _primaryWord;
            }
            set {
                _primaryWord = value;
            }
        }

        public List<string> WordList {
            get {
                return _wordList;
            }
            set {
                _wordList = value;
            }
        }

        public string Definition {
            get {
                return _definition;
            }
            set {
                _definition = value;
            }
        }
    }
}
