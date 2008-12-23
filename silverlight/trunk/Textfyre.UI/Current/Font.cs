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
using System.IO;
using System.Reflection;
using System.Windows.Resources;

namespace Textfyre.UI.Current
{
    public static class Font
    {        
        public enum FontType
        {
            Headline,
            Main,
            MainItalic,
            Header,
            Footer,
            Input
        }
        
        public class FontDefinition
        {
            public string FontSourcePath;
            public string FontFamilyName;
            public double FontSize;
            //private string _fontPath = "TextfyreApp.Resources.Fonts.";

            public FontSource FontSource
            {
                get
                {
                    if (FontSourcePath.Length > 0)
                    {
                        Stream fontStream = Current.Application.GameAssembly.GetManifestResourceStream(Current.Application.EntryPointAssemblyName + ".Fonts." + FontSourcePath);

                        return new FontSource(fontStream);
                    }

                    return null;
                }
            }


            public FontFamily FontFamily
            {
                get
                {
                    return new FontFamily(FontFamilyName);
                }
            }

            public FontDefinition()
            {
            }

            public FontDefinition(string fontdef)
            {
                SetDef(fontdef);
            }

            public string GetDef()
            {
                return FontSourcePath + "|" + FontFamilyName + "|" + FontSize.ToString();
            }

            public void SetDef(string fontdef)
            {
                try {
                    string[] defParts = fontdef.Split('|');
                    FontSourcePath = defParts[0];
                    FontFamilyName = defParts[1];
                    FontSize = System.Convert.ToDouble(defParts[2]);
                } catch {
                    MessageBox.Show("Error splitting fontdef - {" + fontdef + "}");
                }
            }

            public void Apply(TextBlock textBlock)
            {
                if (FontSourcePath.Length > 0)
                {
                    textBlock.FontSource = FontSource;
                }

                textBlock.FontFamily = FontFamily;
                textBlock.FontSize = FontSize;
            }
            public void Apply(TextBox textBox)
            {
                if (FontSourcePath.Length > 0)
                {
                    textBox.FontSource = FontSource;
                }

                textBox.FontFamily = FontFamily;
                textBox.FontSize = FontSize;
            }
        }


        #region :: Header ::
        private static FontDefinition _header;
        public static FontDefinition Header
        {
            get
            {
                if (_header == null)
                {
                    _header = new FontDefinition(Storage.Settings.Get("HeaderFontDef"));
                }

                return _header;
            }

            set
            {
                _header = value;
                Storage.Settings.Set("HeaderFontDef", _header.GetDef());
            }
        }
        #endregion

        #region :: Footer ::
        private static FontDefinition _footer;
        public static FontDefinition Footer
        {
            get
            {
                if (_footer == null)
                {
                    _footer = new FontDefinition(Storage.Settings.Get("FooterFontDef"));
                }

                return _footer;
            }

            set
            {
                _footer = value;
                Storage.Settings.Set("FooterFontDef", _footer.GetDef());
            }
        }
        #endregion

        #region :: Headline ::
        private static FontDefinition _headline;
        public static FontDefinition Headline
        {
            get
            {
                if (_headline == null)
                {
                    _headline = new FontDefinition(Storage.Settings.Get("HeadlineFontDef"));
                }

                return _headline;
            }

            set
            {
                _headline = value;
                Storage.Settings.Set("HeadlineFontDef", _headline.GetDef());
            }
        }
        #endregion


        #region :: Main ::
        private static FontDefinition _main;
        public static FontDefinition Main
        {
            get
            {
                if (_main == null)
                {
                    _main = new FontDefinition(Storage.Settings.Get("MainFontDef"));
                }

                return _main;
            }

            set
            {
                _main = value;
                Storage.Settings.Set("MainFontDef", _main.GetDef());
            }
        }
        #endregion

        #region :: MainItalic ::
        private static FontDefinition _mainItalic;
        public static FontDefinition MainItalic
        {
            get
            {
                if (_mainItalic == null)
                {
                    _mainItalic = new FontDefinition(Storage.Settings.Get("MainItalicFontDef"));
                }

                return _mainItalic;
            }

            set
            {
                _mainItalic = value;
                Storage.Settings.Set("MainItalicFontDef", _mainItalic.GetDef());
            }
        }
        #endregion

        #region :: Input ::
        private static FontDefinition _input;
        public static FontDefinition Input
        {
            get
            {
                if (_input == null)
                {
                    _input = new FontDefinition(Storage.Settings.Get("InputFontDef"));
                }

                return _input;
            }

            set
            {
                _input = value;
                Storage.Settings.Set("InputFontDef", _input.GetDef());
            }
        }
        #endregion

        #region :: ApplyFont ::
        public static void ApplyFont( FontType fontType, TextBlock textBlock )
        {
            GetFontDef(fontType).Apply(textBlock);
        }
        public static void ApplyFont(FontType fontType, TextBox textBox)
        {
            GetFontDef(fontType).Apply(textBox);
        }
        private static FontDefinition GetFontDef(FontType fontType)
        {
            FontDefinition fd = null;
            switch (fontType)
            {
                case FontType.Main:
                    fd = Main;
                    break;
                case FontType.Headline:
                    fd = Headline;
                    break;
                case FontType.MainItalic:
                    fd = MainItalic;
                    break;
                case FontType.Header:
                    fd = Header;
                    break;
                case FontType.Footer:
                    fd = Footer;
                    break;
                case FontType.Input:
                    fd = Input;
                    break;
            }

            return fd;
        }
        #endregion


    }
}
