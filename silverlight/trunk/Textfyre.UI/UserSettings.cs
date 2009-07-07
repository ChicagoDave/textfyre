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

namespace Textfyre.UI
{
    public static class UserSettings
    {
        public class FontDef
        {
            public string FontFamily;
            public double Size;
            public string Color;
            public bool IsBold;
            public bool IsItalic;

            public FontDef(string def)
            {
                string[] bits = def.Split('|');
                FontFamily = bits[0];
                Size = double.Parse(bits[1]);
                Color = bits[2];
                IsBold = bool.Parse(bits[3]);
                IsItalic = bool.Parse(bits[4]);
            }

            public string GetSettingsFormat()
            {
                return
                    FontFamily + "|" + Size.ToString() + "|" + Color + "|" + (IsBold ? "1" : "0") + "|" + (IsItalic ? "1" : "0");
            }
        }
        
        #region :: FontHeadline ::
        public static FontDef FontHeadline
        {
            get
            {
                return new FontDef(Storage.Settings.Get("FontHeadline"));
            }
            set
            {
                Storage.Settings.Set("FontHeadline", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontText ::
        public static FontDef FontText
        {
            get
            {
                return new FontDef(Storage.Settings.Get("FontText"));
            }
            set
            {
                Storage.Settings.Set("FontText", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontInput ::
        public static FontDef FontInput
        {
            get
            {
                return new FontDef(Storage.Settings.Get("FontInput"));
            }
            set
            {
                Storage.Settings.Set("FontInput", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontHeader ::
        public static FontDef FontHeader
        {
            get
            {
                return new FontDef(Storage.Settings.Get("FontHeader"));
            }
            set
            {
                Storage.Settings.Set("FontHeader", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontFooter ::
        public static FontDef FontFooter
        {
            get
            {
                return  new FontDef(Storage.Settings.Get("FontFooter"));
            }
            set
            {
                Storage.Settings.Set("FontFooter", value.GetSettingsFormat());
            }
        }
        #endregion

    }
}
