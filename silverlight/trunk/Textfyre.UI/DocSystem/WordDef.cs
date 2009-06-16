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

namespace Textfyre.UI.DocSystem
{
    public class WordDef
    {
        public string ID;
        public Point PointBegin;
        public Point PointEnd;
        public Run Run;

        public static System.Collections.Generic.Dictionary<string, string> WordDefIDs;

        public static string GetDescription( string id )
        {
            if( WordDefIDs.ContainsKey(id) )
            {
                return WordDefIDs[id];
            }

            return String.Empty;
        }

        public static string Key(string word)
        {
            return word.Trim().ToLower().Replace(" ", " ");
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

            foreach (WD wd in WordDefs)
            {
                string word = wd.Word;
                string id = wd.ID;
                string match = @"(\b" + word + @"\b[,.:;]|\b" + word + @"\b)(?!')(?!-)";
                text = Regex.Replace(text, match, @"<WordDef ID=""" + id + @""">$&</WordDef>", RegexOptions.IgnoreCase);
            
            }

            return text;
        }

        private class WD
        {
            public string Word;
            public string ID;
        }

        private static System.Collections.Generic.List<WD> WordDefs;
        private static void InitWordDefs()
        {
            if (WordDefs != null)
                return;

            //System.Collections.Generic.Dictionary<string, string> wordDefsTmp = new System.Collections.Generic.Dictionary<string, string>();
            WordDefs = new System.Collections.Generic.List<WD>();
            WordDefIDs = new System.Collections.Generic.Dictionary<string, string>();

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/WordDefinition.xml"));

            var worddefs = from worddef in x.Descendants("WordDef") select worddef;

            int id = 0;
            foreach (var worddef in worddefs)
            {
                string description = worddef.Element("Description").Value;
                WordDefIDs.Add(id.ToString(), description);
                
                var words = from word in worddef.Descendants("Word") select word;
                foreach (var word in words)
                {
                    string wordVal = Key(word.Value);
                    WD wd = new WD();
                    wd.Word = wordVal;
                    wd.ID = id.ToString();

                    WordDefs.Add(wd);
                }

                id++;
            }

            WordDefs.Sort(
                delegate(
                WD wd1, WD wd2) { return wd2.Word.Length.CompareTo(wd1.Word.Length); }
                );


            //// Sort List to get longest words first.
            //var items = from k in wordDefsTmp.Keys
            //            orderby k.Length descending
            //            select k;


            //foreach (string key in wordDefsTmp.Keys)
            //{
            //    WordDefs.Add(key, wordDefsTmp[key]);
            //}

        }

    }
}
