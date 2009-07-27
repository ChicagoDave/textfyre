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
using System.Xml.Linq;
using System.Linq;

namespace Textfyre.UI {
    public static class UserSettings {
        public class AvailFontDef {
            public string Title = String.Empty;
            public string Source = String.Empty;
            public string FontFamily = String.Empty;
        }

        public class FontDef {
            public string Source = String.Empty;
            public string FontFamily = String.Empty;
            public double Size = 0;
            public string Color = String.Empty;
            public bool IsBold = false;
            public bool IsItalic = false;

            public FontDef() {

            }

            public FontDef(string font, double size, string color, bool isItalic) {
                FontFamily = font;
                Size = size;
                Color = color;
                IsItalic = isItalic;
            }

            public FontDef(string def) {

                if (def.Length != 0) {
                    try {
                        string[] bits = def.Split('|');
                        Source = bits[0];
                        FontFamily = bits[1];
                        Size = double.Parse(bits[2]);
                        Color = bits[3];
                        IsBold = (bits[4] == "1");
                        IsItalic = (bits[5] == "1");
                    } catch {
                    }
                }

            }

            public string GetSettingsFormat() {
                return
                    Source + "|" + FontFamily + "|" + Size.ToString() + "|" + Color + "|" + (IsBold ? "1" : "0") + "|" + (IsItalic ? "1" : "0");
            }
        }

        public static List<AvailFontDef> AvailableFontDefs = new List<AvailFontDef>();
        public static void InitAvailableFontDefs() {
            if (AvailableFontDefs.Count > 0)
                return;

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Fonts.xml"));

            var fonts = from font in x.Descendants("Font") select font;

            foreach (var font in fonts) {
                bool iswinonly = AttributeExists(font, "IsWinOnly") ? bool.Parse(font.Attribute("IsWinOnly").Value) : false;

                if (!iswinonly || (iswinonly && Current.Application.Platform == Textfyre.UI.Current.Platform.Windows)) {

                    AvailFontDef fd = new AvailFontDef();
                    fd.Title = AttributeExists(font, "Title") ? font.Attribute("Title").Value : "";
                    fd.Source = AttributeExists(font, "Source") ? font.Attribute("Source").Value : "";
                    fd.FontFamily = AttributeExists(font, "FontFamily") ? font.Attribute("FontFamily").Value : "";
                    AvailableFontDefs.Add(fd);
                }
            }
        }
        private static bool AttributeExists(XElement ele, string attName) {
            foreach (XAttribute xatt in ele.Attributes()) {
                if (xatt.Name == attName)
                    return true;
            }

            return false;
        }

        #region :: FontHeadline ::
        public static FontDef FontHeadline {
            get {
                return new FontDef(Storage.Settings.Get("FontHeadline"));
            }
            set {
                Storage.Settings.Set("FontHeadline", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontText ::
        public static FontDef FontText {
            get {
                return new FontDef(Storage.Settings.Get("FontText"));
            }
            set {
                Storage.Settings.Set("FontText", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontInput ::
        public static FontDef FontInput {
            get {
                return new FontDef(Storage.Settings.Get("FontInput"));
            }
            set {
                Storage.Settings.Set("FontInput", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontHeader ::
        public static FontDef FontHeader {
            get {
                return new FontDef(Storage.Settings.Get("FontHeader"));
            }
            set {
                Storage.Settings.Set("FontHeader", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontFooter ::
        public static FontDef FontFooter {
            get {
                return new FontDef(Storage.Settings.Get("FontFooter"));
            }
            set {
                Storage.Settings.Set("FontFooter", value.GetSettingsFormat());
            }
        }
        #endregion

        #region :: FontConversation ::
        public static FontDef FontConversation {
            get {
                return new FontDef(Storage.Settings.Get("FontConversation"));
            }
            set {
                Storage.Settings.Set("FontConversation", value.GetSettingsFormat());
            }
        }
        #endregion

        private static SolidColorBrush _pageBackgroundBrush;
        public static SolidColorBrush PageBackgroundBrush {
            get {
                if (_pageBackgroundBrush == null) {
                    _pageBackgroundBrush = Helpers.Color.SolidColorBrush(PageBackgroundColor);
                }

                return _pageBackgroundBrush;
            }
        }
        public static string PageBackgroundColor {
            get {
                return Storage.Settings.Get("PageBgColor");
            }

            set {
                Storage.Settings.Set("PageBgColor", value);
            }
        }

        public static Textfyre.UI.Current.Font.FontDefinition FromFontDef(FontDef fd) {
            Textfyre.UI.Current.Font.FontDefinition rfd;

            if (fd.Source.Length == 0)
                rfd = new Textfyre.UI.Current.Font.FontDefinition(fd.FontFamily, fd.Size);
            else
                rfd = new Textfyre.UI.Current.Font.FontDefinition(
                    fd.Source + "|" + fd.FontFamily + "|" + fd.Size.ToString());

            rfd.Color = Helpers.Color.SolidColorBrush(fd.Color);

            if (fd.IsItalic) {
                rfd.FontStyle = FontStyles.Italic;
            }

            if (fd.IsBold) {
                rfd.FontWeight = FontWeights.Bold;
            }

            return rfd;

        }

        public static void SetFonts() {
            Textfyre.UI.Current.Font.Headline = FromFontDef(FontHeadline);
            Textfyre.UI.Current.Font.Main = FromFontDef(FontText);
            Textfyre.UI.Current.Font.FontDefinition fd = FromFontDef(FontText);
            fd.FontStyle = FontStyles.Italic;
            Textfyre.UI.Current.Font.MainItalic = fd;
            Textfyre.UI.Current.Font.Input = FromFontDef(FontInput);
            Textfyre.UI.Current.Font.Header = FromFontDef(FontHeader);
            Textfyre.UI.Current.Font.Footer = FromFontDef(FontFooter);
            Textfyre.UI.Current.Font.Conversation = FromFontDef(FontConversation);
        }

    }
}
