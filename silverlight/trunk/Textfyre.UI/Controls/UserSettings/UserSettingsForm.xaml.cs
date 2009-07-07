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

        public static event EventHandler UpdatePreview;

        public static void OnUpdatePreview(object sender)
        {
            if (UpdatePreview != null)
            {
                UpdatePreview(sender, new EventArgs());
            }
        }

        public UserSettingsForm()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(UserSettingsForm_Loaded);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
            ColorPicker = ColorPickerPopup;
            CpbBgColor.Click += new EventHandler(CpbBgColor_Click);
            UpdatePreview += new EventHandler(UserSettingsForm_UpdatePreview);
        }

        void UserSettingsForm_UpdatePreview(object sender, EventArgs e)
        {
            DoUpdatePreview();
        }

        private void DoUpdatePreview()
        {
            FPPreview.PageColorizer.Background = CpbBgColor.SelectedBrush;
            
            Current.Font.FontDefinition fdHeadline = Textfyre.UI.UserSettings.FromFontDef(FPHeadline.GetFontDef());
            fdHeadline.Apply(FPPreview.TbHeadline);

            Current.Font.FontDefinition fdText = Textfyre.UI.UserSettings.FromFontDef(FPText.GetFontDef());
            fdText.Apply(FPPreview.TbText);

            Current.Font.FontDefinition fdInput = Textfyre.UI.UserSettings.FromFontDef(FPInput.GetFontDef());
            fdInput.Apply(FPPreview.TbInput);

            Current.Font.FontDefinition fdHeader = Textfyre.UI.UserSettings.FromFontDef(FPHeader.GetFontDef());
            fdHeader.Apply(FPPreview.TbHeader);

            Current.Font.FontDefinition fdFooter = Textfyre.UI.UserSettings.FromFontDef(FPFooter.GetFontDef());
            fdFooter.Apply(FPPreview.TbFooter);

        }

        void CpbBgColor_Click(object sender, EventArgs e)
        {
            ColorPicker.Show(CpbBgColor);
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
            this.CpbBgColor.SelectedBrush = Helpers.Color.SolidColorBrush(Textfyre.UI.UserSettings.PageBackgroundColor);
            DoUpdatePreview();
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

            Textfyre.UI.UserSettings.PageBackgroundColor = (this.CpbBgColor.SelectedBrush as SolidColorBrush).Color.ToString();

            Hide();
            System.Windows.Browser.HtmlPage.Window.Invoke("resetStory");
        }    
    }
}
