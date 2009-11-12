using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Text;

namespace FyreWinClient {
    public class Utility {
        private static Dictionary<string, string> _words;
        private static List<string> _wordList;

        public Utility() {
        }

        public static string GetHtmlHints(string xmlHints) {

            _words = new Dictionary<string, string>();
            _wordList = new List<string>() { "a", "b", "c", "d", "e", "al", "er", "ar", "un", "ye", "ore", "bar", "doh", "huh", "mod", "rar", "dud", "que", "ford", "bird", "lore", "cone", "down", "door", "boot", "tart", "lock", "book", "sold", "drag", "sort", "west", "vine", "junk", "henry", "essay", "charm", "frump", "noses", "toast", "heart", "condo", "dinky", "until", "dogma", "church", "single", "doable", "timely", "collar", "dragon", "tanker", "jungle", "awaits", "scaled", "listen", "follow", "merger", "acclaim", "bastile", "biddies", "biotron", "castles", "dabbing", "eatable", "fetches", "flyless", "goofily", "hassled", "ignored", "inquire", "kinglet", "mangler", "aardvark", "abductor", "bellboys", "capering", "deepness", "diplomat", "eyebolts", "guzzlers", "impasses", "lakeport", "oblivion", "retraces", "amputates", "amarettos", "anchorman", "compounds", "dementing", "envelopes", "entranced", "grounders", "laminator", "narration", "paramount", "pinfolded", "satirical", "subleased", "stockpile", "zucchinis", "whirlwind", "acclimated", "actuations", "aftertimes", "arrogances", "beekeepers", "calculator", "chittering", "deadpanned", "eggbeaters", "flavorless", "hostelling", "incubating", "manifolded", "noncaloric", "parrakeets", "ruthlessly", "sandstorms", "toothbrush", "astrologies", "authorities", "boondoggles", "concordance", "decolonized", "disenchants", "financially", "greenhouses", "interlinked", "microcosmic", "pennyworths", "rentability", "sustenances", "workmanlike", "advantageous", "beachcombing", "charbroilers", "determinator", "extraneously", "homesteaders", "magistrature", "nonoperative", "overthrowing", "provocations", "breechloaders", "computational", "dissimulation", "fortuneteller", "honorableness", "indispensable", "microcultural" };

            foreach (string word in _wordList) {
                _words.Add(word, "");
            }

            Hints hints = new Hints();

            if (xmlHints == "") {
                xmlHints = Properties.Resource.hints;
            }

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xmlHints);

            hints.Title = doc.SelectSingleNode("//hints").Attributes["title"].Value;

            XmlNodeList topics = doc.SelectNodes("//topic");

            foreach (XmlNode topic in topics) {
                HintTopic newTopic = new HintTopic();
                newTopic.Title = topic.Attributes["title"].Value;

                XmlNodeList hintList = topic.SelectNodes("hint");

                foreach (XmlNode hint in hintList) {
                    newTopic.Hints.Add(hint.InnerText);
                }

                hints.Topics.Add(newTopic);
            }

        //<li onclick="toggleQuestion(t1);">What do I do?
        //    <ol id="t1" style="display:block;">
        //        <li><span onclick="javascript:showHint(h11,s11)" id="h11" style="display:block;">foo bore dogman yellow.</span><span id="s11" style="display:none;">You hear voices nearby.</span></li>
        //        <li><span onclick="javascript:showHint(h12,s12)" id="h12" style="display:block;">junker al hen dogman.</span><span id="s12" style="display:none;">Listen to the voices.</span></li>
        //        <li><span onclick="javascript:showHint(h13,s13)" id="h13" style="display:block;">foo jeez al not i danger henry.</span><span id="s13" style="display:none;">You need to get a better angle.</span></li>
        //        <li><span onclick="javascript:showHint(h14,s14)" id="h14" style="display:block;">angler enter monkey?</span><span id="s14" style="display:none;">Notice those crates?</span></li>
        //        <li><span onclick="javascript:showHint(h15,s15)" id="h15" style="display:block;">slump or hen monkey al not al hen more.</span><span id="s15" style="display:none;">Climb up the crates to get to the roof.</span></li>
        //    </ol>
        //</li>

            StringBuilder content = new StringBuilder();

            content.Append("<ol>");
            content.Append(hints.Title);

            int t = 0;

            foreach (HintTopic ht in hints.Topics) {
                t++;
                content.Append(String.Format("<li onclick=\"toggleQuestion(t{0});\">{1}", t, ht.Title));
                content.Append(String.Format("<ol id=\"t{0}\" style=\"display:block;\">",t));

                for (int h = 0; h < ht.Hints.Count; h++) {
                    content.Append(String.Format("<li><span onclick=\"javascript:showHint(h{0}{1},s{0}{1})\" id=\"h{0}{1}\" style=\"display:block\">{2}</span><span id=\"s{0}{1}\" style=\"display:none;\">{3}</span></li>", t, h + 1,getMungedHint(ht.Hints[h]),ht.Hints[h]));
                }

                content.Append("</ol></li>");
            }

            return content.ToString();
        }

        private static string getMungedHint(string hint) {

            StringBuilder munged = new StringBuilder();

            string[] hintWords = hint.Replace(",","").Replace("!","").Replace(".","").Replace("?","").Split(new char[] { ' ' });

            foreach (string word in hintWords) {
                bool foundWord = false;
                for (int d = 0; d < _words.Count; d++) {
                    string checkWord = _words.Values.ToList<string>()[d];
                    if (checkWord == word) {
                        munged.Append(_words.Keys.ToList<string>()[d]);
                        munged.Append(" ");
                        foundWord = true;
                        break;
                    }
                }

                if (!foundWord) {
                    for (int d = 0; d < _words.Count; d++) {
                        string checkWord = _words.Values.ToList<string>()[d];
                        if (checkWord == "") {
                            string checkKey = _words.Keys.ToList<string>()[d];
                            if (checkKey.Length == word.Length) {
                                _words[checkKey] = word;
                                munged.Append(checkKey);
                                munged.Append(" ");
                                break;
                            }
                        }
                    }
                }
            }

            string html = Properties.Resource.hintTemplate;
            html = html.Replace("#content#", munged.ToString());

            return html;
        }

    }
}
