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
            this.FPHeadline.SetFont(Textfyre.UI.UserSettings.FontHeadline);
            this.FPText.SetFont(Textfyre.UI.UserSettings.FontText);
            this.FPInput.SetFont(Textfyre.UI.UserSettings.FontInput);
            this.FPHeader.SetFont(Textfyre.UI.UserSettings.FontHeader);
            this.FPFooter.SetFont(Textfyre.UI.UserSettings.FontFooter); 
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
    }
}
