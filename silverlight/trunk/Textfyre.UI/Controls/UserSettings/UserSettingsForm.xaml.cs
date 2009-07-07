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
            ColorPickerPopup.Close += new EventHandler(ColorPickerPopup_Close);
            ColorPickerPopup.ColorSelected += new ColorPicker.ColorSelectedHandler(ColorPickerPopup_ColorSelected);
            
        }

        void ColorPickerPopup_ColorSelected(Color c)
        {

        }

        void ColorPickerPopup_Close(object sender, EventArgs e)
        {
            ColorPickerPopup.Visibility = Visibility.Collapsed;
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
