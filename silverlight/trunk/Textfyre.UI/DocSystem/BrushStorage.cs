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
using System.Collections.Generic;

namespace Textfyre.UI.DocSystem
{
    public class BrushStorage
    {
        Dictionary<string, Brush> _brushes;
        List<string> _brushList;
        
        private int _pointer = 0;

        public BrushStorage()
        {
            Init();
        }

        /// <summary>
        /// Returns the key to retrieve it again.
        /// </summary>
        /// <param name="brush"></param>
        /// <returns></returns>
        public string Add(Brush brush)
        {
            string key = GetKey(brush);

            // New Brush?
            if (_brushes.ContainsKey(key) == false)
            {
                if (brush is SolidColorBrush)
                {
                    Color c = (brush as SolidColorBrush).Color;
                    Color newC = new Color();
                    newC.A = c.A;
                    newC.R = c.R;
                    newC.G = c.G;
                    newC.B = c.B;
                    _brushes.Add(key, new SolidColorBrush(newC));
                }
                else
                    _brushes.Add(key, brush);
            }

            _brushList.Add(key);

            return key;
        }

        private string GetKey(Brush brush)
        {
            if (brush is SolidColorBrush)
            {
                Color c = (brush as SolidColorBrush).Color;

                return c.A + "_" + c.R + "_" + c.G + "_" + c.B;
            }

            return Guid.NewGuid().ToString();
        }

        public Brush GetBrush()
        {
            string key = _brushList[_pointer++];
            return GetBrush(key);
        }

        public Brush GetBrush(string key)
        {
            return GetBrush(key, null);
        }

        public Brush GetBrush(string key, Brush defaultBrush)
        {
            if (_brushes.ContainsKey(key))
                return _brushes[key];

            return defaultBrush;
        }


        public void Init()
        {
            _pointer = 0;
            Clear();
            _brushes = new Dictionary<string, Brush>();
            _brushList = new List<string>();
        }

        public void Clear()
        {
            if (_brushes != null)
                _brushes.Clear();
            _brushes = null;

            if (_brushList != null)
                _brushList.Clear();
            _brushList = null;
        }
    }
}
