using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Linq;
using System.Linq;
using System.Text.RegularExpressions;

namespace Textfyre.UI.Entities
{
    public class WordDefOLD
    {
        public string Word;
        public Point PointBegin;
        public Point PointEnd;
        public Run Run;

        public static System.Collections.Generic.Dictionary<string, string> WordDefs;

        public static string Key(string word)
        {
            return word.Trim().ToLower().Replace(" ", "_");
        }

        /// <summary>
        /// Parse an entire text for WordDefs and return a new text to replace the old one.
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static string ParseTextForWordDefs(string text)
        {

            if (WordDefs == null)
            {
                InitWordDefs();
            }

            foreach (string word in WordDefs.Keys)
            {
                string match = @"\b" + word + @"\b[,.:;]|\b" + word + @"\b";
                text = Regex.Replace(text, match, @"<WordDef>$&</WordDef>", RegexOptions.IgnoreCase);
            }

            return text;
        }

        private static void InitWordDefs()
        {
            if (WordDefs != null)
                return;

            WordDefs = new System.Collections.Generic.Dictionary<string, string>();
            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/WordDefinition.xml"));

            var worddefs = from worddef in x.Descendants("WordDef") select worddef;

            foreach (var worddef in worddefs)
            {
                var words = from word in worddef.Descendants("Word") select word;
                foreach (var word in words)
                {
                    string wordVal = Key(word.Value);
                    string description = worddef.Element("Description").Value;
                    WordDefs.Add(wordVal, description);
                }
            }

        }

    }
}
