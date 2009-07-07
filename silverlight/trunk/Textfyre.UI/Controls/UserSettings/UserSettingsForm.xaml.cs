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

namespace Textfyre.UI.Controls.UserSettings
{
    public partial class UserSettingsForm : UserControl
    {
        public static ColorPicker ColorPicker;
        
        public UserSettingsForm()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(UserSettingsForm_Loaded);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
            ColorPicker = ColorPickerPopup;
        }

        void UserSettingsForm_Loaded(object sender, RoutedEventArgs e)
        {

        }

        public void Show()
        {
            this.FPHeadline.SetFontDef(Textfyre.UI.UserSettings.FontHeadline);
            this.FPText.SetFontDef(Textfyre.UI.UserSettings.FontText);
            this.FPInput.SetFontDef(Textfyre.UI.UserSettings.FontInput);
            this.FPHeader.SetFontDef(Textfyre.UI.UserSettings.FontHeader);
            this.FPFooter.SetFontDef(Textfyre.UI.UserSettings.FontFooter); 
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            this.Visibility = Visibility.Collapsed;
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            Hide();
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            Textfyre.UI.UserSettings.FontHeadline = this.FPHeadline.GetFontDef();
            Textfyre.UI.UserSettings.FontText = this.FPText.GetFontDef();
            Textfyre.UI.UserSettings.FontInput = this.FPInput.GetFontDef();
            Textfyre.UI.UserSettings.FontHeader = this.FPHeader.GetFontDef();
            Textfyre.UI.UserSettings.FontFooter = this.FPFooter.GetFontDef();

            Hide();
        }    
    }
}
