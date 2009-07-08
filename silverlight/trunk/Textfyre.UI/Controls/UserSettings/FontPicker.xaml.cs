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
    public partial class FontPicker : UserControl
    {
        public FontPicker()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(FontPicker_Loaded);
            BtnColor.Click += new EventHandler(BtnColor_Click);

            CBFontFamily.SelectionChanged += new SelectionChangedEventHandler(SelectionChanged);
            CBFontSize.SelectionChanged += new SelectionChangedEventHandler(SelectionChanged);
            CBFontStyle.SelectionChanged += new SelectionChangedEventHandler(SelectionChanged);
               
        }

        void SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if( _isFontDefSet )     
                UserSettingsForm.OnUpdatePreview(this);
        }

        void BtnColor_Click(object sender, EventArgs e)
        {
            UserSettingsForm.ColorPicker.Show(BtnColor);
        }

        public string FontTitle
        { 
            get
            {
                return (string)GetValue(FontTitleProperty); 
            } 
            set
            {
                TBFontTitle.Text = value;
                SetValue(FontTitleProperty, value); 
            } 
        }
        public static readonly DependencyProperty FontTitleProperty = DependencyProperty.Register("FontTitle", typeof(string), typeof(FontPicker), new PropertyMetadata(""));

        void FontPicker_Loaded(object sender, RoutedEventArgs e)
        {
            Populate();
        }

        public Textfyre.UI.UserSettings.FontDef GetFontDef()
        {
            Textfyre.UI.UserSettings.AvailFontDef afd = ((CBFontFamily.SelectedItem) as ComboBoxItem).Tag as Textfyre.UI.UserSettings.AvailFontDef;
            
            Textfyre.UI.UserSettings.FontDef fd = new Textfyre.UI.UserSettings.FontDef();
            fd.Source = afd.Source;
            fd.FontFamily = afd.FontFamily;
            fd.Size = double.Parse(((CBFontSize.SelectedItem) as ComboBoxItem).Tag as string);

            string style = ((CBFontStyle.SelectedItem) as ComboBoxItem).Tag as string;
            if (style.Contains("B"))
                fd.IsBold = true;
            if (style.Contains("I"))
                fd.IsItalic = true;

            fd.Color = (BtnColor.SelectedBrush as SolidColorBrush).Color.ToString();

            return fd;
        }

        private bool _isFontDefSet = false;
        public void SetFontDef(Textfyre.UI.UserSettings.FontDef fd)
        {
            int i = 0;
            foreach (ComboBoxItem item in CBFontFamily.Items)
            {
                Textfyre.UI.UserSettings.AvailFontDef afd = item.Tag as Textfyre.UI.UserSettings.AvailFontDef;

                if (afd.FontFamily == fd.FontFamily)
                {
                    CBFontFamily.SelectedIndex = i;
                    
                    break;
                }
                
                i++;
            }

            i = 0;
            foreach (ComboBoxItem item in CBFontSize.Items)
            {
                string afd = item.Tag as string;

                if (afd == fd.Size.ToString())
                {
                    CBFontSize.SelectedIndex = i;

                    break;
                }

                i++;
            }

            if (!fd.IsBold && !fd.IsItalic)
                CBFontStyle.SelectedIndex = 0;
            else if (fd.IsItalic && fd.IsBold)
                CBFontStyle.SelectedIndex = 3;
            else if (fd.IsBold)
                CBFontStyle.SelectedIndex = 1;
            else CBFontStyle.SelectedIndex = 2;

            BtnColor.SelectedBrush = Helpers.Color.SolidColorBrush(fd.Color);

            _isFontDefSet = true;

        }

        private bool _isPopulated = false;
        private void Populate()
        {
            if (_isPopulated)
                return;

            _isPopulated = true;

            Textfyre.UI.UserSettings.InitAvailableFontDefs();

            foreach (Textfyre.UI.UserSettings.AvailFontDef fd in Textfyre.UI.UserSettings.AvailableFontDefs)
            {
                CBFontFamily.Items.Add( FontItem(fd.Title, fd) );
            }

            for (int i = 7; i < 25; i++)
            {
                CBFontSize.Items.Add( FontItem( i.ToString(), i.ToString()));
            }

            CBFontStyle.Items.Add( FontItem( "Normal", "Normal" ));
            CBFontStyle.Items.Add(FontItem("Bold", "B"));
            CBFontStyle.Items.Add(FontItem("Italic", "I"));
            CBFontStyle.Items.Add(FontItem("Bold and Italic", "BI"));

        }

        private ComboBoxItem FontItem(string text, object value)
        {
            ComboBoxItem item = new ComboBoxItem();
            item.Content = text;
            item.Tag = value;
            return item;
        }
    }
}
