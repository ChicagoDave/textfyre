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
            CBFontFamily.Items.Add(FontItem("Georgia", "Georgia"));
            CBFontFamily.Items.Add(FontItem("Arial", "Arial"));
            CBFontFamily.Items.Add(FontItem("Goudy (memory-heavy)", "Goudy"));
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
