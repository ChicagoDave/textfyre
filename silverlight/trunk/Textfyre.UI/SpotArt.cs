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
using System.Xml.Linq;
using System.Linq;

namespace Textfyre.UI
{
    public static class SpotArt
    {
        private static System.Collections.Generic.Dictionary<string, string> _dic;
        private static System.Collections.Generic.Dictionary<string, bool> _dicShowText;

        public static void Init()
        {
            _dic = new System.Collections.Generic.Dictionary<string, string>();
            _dicShowText = new System.Collections.Generic.Dictionary<string, bool>();

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            var arts = from art in x.Descendants("Art") select art;
            foreach (var art in arts)
            {
                if (art.Attribute("TextMatch") != null)
                {
                    string id = art.Attribute("ID").Value;
                    string text = art.Attribute("TextMatch").Value;
                    _dic.Add(id, text);

                    bool showText = true;
                    if (art.Attribute("ShowText") != null)
                        showText = bool.Parse(art.Attribute("ShowText").Value);

                    _dicShowText.Add(id, showText);
                }
            }
        }

        public static string InsertSpotArt( string text )
        {
            if (_dic == null)
                return text;

            foreach (string key in _dic.Keys)
            {
                if( _dicShowText[key] )
                    text = text.Replace(_dic[key], @"<Art ID=""" + key + @""" />" + _dic[key]);
                else
                    text = text.Replace(_dic[key], @"<Art ID=""" + key + @""" />");

            }

            return text;
        }
    }
}
