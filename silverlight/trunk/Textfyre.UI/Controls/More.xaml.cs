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
            TBMore.Margin = new Thickness(5, 3, 0, 0);
            //this.LostFocus += new RoutedEventHandler(More_LostFocus);
        }

        //void More_LostFocus(object sender, RoutedEventArgs e)
        //{
        //    this.Focus();
        //}


        private void More_Loaded(object sender, RoutedEventArgs e)
        {
            TBMore.Text = "<More>";
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

        private Storyboard _delaysb;
        public void Show()
        {
            if (_delaysb == null)
            {
                _delaysb = new Storyboard();
                _delaysb.Completed += new EventHandler(_delaysb_Completed);
                _delaysb.Duration = TimeSpan.FromSeconds(1);
            }

            if (_delaysb.GetCurrentState() != ClockState.Active)
            {
                _delaysb.Begin();
            }
            else
            {
                _delaysb.Stop();
                _delaysb.Begin();
            }

        }

        void _delaysb_Completed(object sender, EventArgs e)
        {
            Keyboard.KeyPress += new EventHandler<KeyEventArgs>(Keyboard_KeyPress);
            _isShown = true;
            this.Focus();
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            Keyboard.KeyPress -= new EventHandler<KeyEventArgs>(Keyboard_KeyPress);
            _isShown = false;
            this.Visibility = Visibility.Collapsed;
        }

    }
}
