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
        public UserSettingsForm()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;

            string fontFamily = Storage.Settings.Get("FontFamily");

            if (fontFamily.Length == 0)
                fontFamily = "Default";

            DdlFont.Items.Add(new TextBlock().Text = "Default");

            if( Current.Application.Platform == Textfyre.UI.Current.Platform.Windows )
                DdlFont.Items.Add(new TextBlock().Text = "Georgia");

            DdlFont.Items.Add(new TextBlock().Text = "Times New Roman");
            
        }

        public void Show()
        {
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
