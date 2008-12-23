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

namespace Textfyre.UI.Controls
{
    public partial class More : UserControl
    {
        private bool _isShown = false;

        public event EventHandler Press;

        public More()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(More_Loaded);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, TBMore);
            TBMore.FontSize = 14;
            TBMore.Margin = new Thickness(5, 1, 0, 2);
        }

        private void More_Loaded(object sender, RoutedEventArgs e)
        {
            TBMore.Text = "<More>";
            Keyboard.KeyPress += new EventHandler<KeyEventArgs>(Keyboard_KeyPress);
        }

        private void Keyboard_KeyPress(object sender, KeyEventArgs e)
        {
            if (_isShown)
            {
                if (Press != null)
                {
                    Press(this, new EventArgs());
                }
            }
        }

        public void Show()
        {
            _isShown = true;
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            _isShown = false;
            this.Visibility = Visibility.Collapsed;
        }

    }
}
