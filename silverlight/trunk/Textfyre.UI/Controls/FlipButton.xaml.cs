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
    public partial class FlipButton : UserControl
    {
        public FlipButton()
        {
            InitializeComponent();
            FlipBtn.FontType = Textfyre.UI.Current.Font.FontType.MainItalic;
            FlipBtn.FontSize = 12d;
            FlipBtn.ForegroundColor = Color.FromArgb(255, 192, 161, 119);
        }

        private bool _isEvenPage;
        public bool IsEvenPage
        {
            get
            {
                return _isEvenPage;
            }

            set
            {
                _isEvenPage = value;
                FlipBtn.ButtonText.Text = value ? ">" : "<";
            }
        }

        private bool _isVisible = true;
        public bool IsVisible
        {
            get
            {
                return _isVisible;
            }
            set
            {
                _isVisible = value;
                ShowHide();
            }
        }

        private bool _isEnabled = true;
        public new bool IsEnabled
        {
            get
            {
                return _isEnabled;
            }
            set
            {
                _isEnabled = value;
                ShowHide();
            }
        }

        private void ShowHide()
        {
            if (_isEnabled == false)
            {
                FlipBtn.Visibility = Visibility.Collapsed;
                return;
            }

            FlipBtn.Visibility = _isVisible ? Visibility.Visible : Visibility.Collapsed;
        }

    }
}
