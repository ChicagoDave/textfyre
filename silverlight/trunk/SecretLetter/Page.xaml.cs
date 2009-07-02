using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace SecretLetter
{
    public partial class Page : UserControl
    {
        public Page()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }

        void Page_Loaded(object sender, RoutedEventArgs e)
        {

            Textfyre.UI.Current.Application.GameAssembly = System.Reflection.Assembly.GetExecutingAssembly();


            switch (Textfyre.UI.Current.Application.Platform)
            {
                case Textfyre.UI.Current.Platform.Windows:
                    SetGoudyFonts();
                    break;
                default:
                    SetStandardFonts();
                    break;
            }

            StoryPage.LoadStory(GameFiles.GameFile.sl_v1_05e, "sl_v1_05e", new StoryHandle());
        }


        private void SetGoudyFonts()
        {
            Textfyre.UI.Current.Font.FontDefinition fd =
new Textfyre.UI.Current.Font.FontDefinition(
"GOUDR.TTF|GoudyRetrospectiveSSK|14");
            Textfyre.UI.Current.Font.Main = fd;

            Textfyre.UI.Current.Font.FontDefinition hfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "GOUDOSSC.TTF|GoudyOSSCapsSSK|17");
            Textfyre.UI.Current.Font.Headline = hfd;

            Textfyre.UI.Current.Font.FontDefinition Italicfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "GOUDRI.TTF|GoudyRetrospectiveSSK|14");
            Textfyre.UI.Current.Font.MainItalic = Italicfd;

            Textfyre.UI.Current.Font.FontDefinition headerfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                "GOUDYMER.TTF|Goudy Mediaeval|16");
            Textfyre.UI.Current.Font.Header = headerfd;

            Textfyre.UI.Current.Font.FontDefinition footerfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "GOUDOSSC.TTF|GoudyOSSCapsSSK|12");
            Textfyre.UI.Current.Font.Footer = footerfd;

            Textfyre.UI.Current.Font.FontDefinition inputfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "GOUDRI.TTF|GoudyRetrospectiveSSK|17");
            Textfyre.UI.Current.Font.Input = inputfd;
        }

        private void SetStandardFonts()
        {
            Textfyre.UI.Current.Font.FontDefinition fd =
    new Textfyre.UI.Current.Font.FontDefinition("Georgia", 14);
            Color color = new Color();
            color.A = 255;
            color.R = 51;
            color.G = 51;
            color.B = 51;
            fd.Color = new SolidColorBrush(color);
            Textfyre.UI.Current.Font.Main = fd;

            Textfyre.UI.Current.Font.FontDefinition hfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "|Georgia|17");
            Textfyre.UI.Current.Font.Headline = hfd;

            Textfyre.UI.Current.Font.FontDefinition italicfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "|Georgia|16");
            italicfd.Color = new SolidColorBrush(color);
            italicfd.FontStyle = FontStyles.Italic;
            Textfyre.UI.Current.Font.MainItalic = italicfd;

            Textfyre.UI.Current.Font.FontDefinition headerfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                "|Georgia|14");
            Textfyre.UI.Current.Font.Header = headerfd;

            Textfyre.UI.Current.Font.FontDefinition footerfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "|Georgia|12");
            Textfyre.UI.Current.Font.Footer = footerfd;

            Textfyre.UI.Current.Font.FontDefinition inputfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "|Georgia|16");
            Textfyre.UI.Current.Font.Input = inputfd;
        }
    }
}
