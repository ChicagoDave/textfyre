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
                    break;
                default:
                    break;
            }

            InitUserSettings();

            StoryPage.LoadStory(GameFiles.GameFile.sl_v1_06e, "sl_v1_06e", new StoryHandle());
        }

        private void InitUserSettings()
        {
            if (Textfyre.UI.UserSettings.FontHeadline.FontFamily.Length == 0)
            {
                Textfyre.UI.UserSettings.FontHeadline =
                    new Textfyre.UI.UserSettings.FontDef("Georgia", 17, "#FF000000", false);
            }

            if (Textfyre.UI.UserSettings.FontText.FontFamily.Length == 0)
            {
                Textfyre.UI.UserSettings.FontText =
                    new Textfyre.UI.UserSettings.FontDef("Georgia", 13, "#FF333333", false);
            }

            if (Textfyre.UI.UserSettings.FontInput.FontFamily.Length == 0)
            {
                Textfyre.UI.UserSettings.FontInput =
                    new Textfyre.UI.UserSettings.FontDef("Georgia", 16, "#FF000000", false);
            }

            if (Textfyre.UI.UserSettings.FontHeader.FontFamily.Length == 0)
            {
                Textfyre.UI.UserSettings.FontHeader =
                    new Textfyre.UI.UserSettings.FontDef("Georgia", 14, "#FF000000", false);
            }

            if (Textfyre.UI.UserSettings.FontFooter.FontFamily.Length == 0)
            {
                Textfyre.UI.UserSettings.FontFooter =
                    new Textfyre.UI.UserSettings.FontDef("Georgia", 12, "#FF000000", false);
            }

            Textfyre.UI.UserSettings.SetFonts();
        }
    }
}
