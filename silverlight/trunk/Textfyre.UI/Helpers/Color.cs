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

namespace Textfyre.UI.Helpers
{
    public static class Color
    {
        /// <summary>
        /// Input should be "#FFFFFFFF" or "#FFFFFF".
        /// </summary>
        /// <param name="hexFormat"></param>
        /// <returns></returns>
        public static SolidColorBrush SolidColorBrush(string hexColor)
        {
            string hex = hexColor;

            if (hex.Length == 0)
                hex = "#FF000000";

            if (hex.StartsWith("#") == false)
                hex = "#" + hex;

            if (hex.Length == 7)
                hex = "#FF" + hex.Substring(1, 6);

            if (hex.Length != 9)
                throw new Exception("hexColor was not provided in the correct format");

            if (_solidColorBrushes.ContainsKey(hex))
                return _solidColorBrushes[hex];

            string a = hex.Substring(1, 2);
            string r = hex.Substring(3, 2);
            string g = hex.Substring(5, 2);
            string b = hex.Substring(7, 2);

            System.Windows.Media.Color col
                = System.Windows.Media.Color.FromArgb(
                (byte)System.Convert.ToInt32(a, 16),
                (byte)System.Convert.ToInt32(r, 16),
                (byte)System.Convert.ToInt32(g, 16),
                (byte)System.Convert.ToInt32(b, 16));

            SolidColorBrush scBrush = new SolidColorBrush(col);
            _solidColorBrushes.Add(hex, scBrush);
            return scBrush;

        }
        private static System.Collections.Generic.Dictionary<string, SolidColorBrush>
            _solidColorBrushes = new System.Collections.Generic.Dictionary<string, SolidColorBrush>();
    }
}
