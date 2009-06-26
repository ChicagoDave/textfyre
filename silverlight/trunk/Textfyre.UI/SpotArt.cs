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

        public static void Init()
        {
            _dic = new System.Collections.Generic.Dictionary<string, string>();

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            var arts = from art in x.Descendants("Art") select art;
            foreach (var art in arts)
            {
                if (art.Attribute("TextMatch") != null)
                {
                    string id = art.Attribute("ID").Value;
                    string text = art.Attribute("TextMatch").Value;
                    _dic.Add(id, text);
                }
            }
        }

        public static string InsertSpotArt( string text )
        {
            if (_dic == null)
                return text;

            foreach (string key in _dic.Keys)
            {
                text = text.Replace(_dic[key], @"<Art ID=""" + key + @""" />" + _dic[key]);
            }

            return text;
        }
    }
}
