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

        private void Populate()
        {
            string[] fonts = Settings.AvailableFonts.Split('|');
            for (int i = 0; i < fonts.Length; i += 2)
            {
                CBFontFamily.Items.Add(FontItem(fonts[i], fonts[i+1]));
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

        private ComboBoxItem FontItem(string text, string value)
        {
            ComboBoxItem item = new ComboBoxItem();
            item.Content = text;
            item.Tag = value;
            return item;
        }
    }
}
