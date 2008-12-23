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
    public partial class TextButton : UserControl
    {
        public event EventHandler Click;
        
        public TextButton()
        {
            InitializeComponent();
            ButtonText.MouseEnter += new MouseEventHandler(ButtonText_MouseEnter);
            ButtonText.MouseLeave += new MouseEventHandler(ButtonText_MouseLeave);
            ButtonText.MouseLeftButtonDown += new MouseButtonEventHandler(ButtonText_MouseLeftButtonDown);
            ButtonText.MouseLeftButtonUp += new MouseButtonEventHandler(ButtonText_MouseLeftButtonUp);
            FormatButton();
        }

        private bool _isButtonDown = false;
        private bool _isMouseOver = false;

        private void ButtonText_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (!_enabled)
                return;

            ButtonText.ReleaseMouseCapture();

            _isButtonDown = false;

            if (Normal.GetCurrentState() != ClockState.Active)
                Normal.Begin();

            if (Click != null && _isMouseOver )
            {
                Click(this, new EventArgs());
            }
        }

        private void ButtonText_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (!_enabled)
                return;

            ButtonText.CaptureMouse();

            _isButtonDown = true;

            if (Pressed.GetCurrentState() != ClockState.Active)
                Pressed.Begin();
        }

        private void ButtonText_MouseLeave(object sender, MouseEventArgs e)
        {
            if (!_enabled)
                return;

            _isMouseOver = false;

                if (Normal.GetCurrentState() != ClockState.Active)
                    Normal.Begin();
        }

        private void ButtonText_MouseEnter(object sender, MouseEventArgs e)
        {
            if (!_enabled)
                return;

            _isMouseOver = true;

            if (_isButtonDown)
            {
                if (Pressed.GetCurrentState() != ClockState.Active)
                    Pressed.Begin();
            }
            else
            {
                if (MouseOver.GetCurrentState() != ClockState.Active)
                    MouseOver.Begin();
            }
        }

        #region :: Enabled ::
        private bool _enabled = true;
        public bool Enabled
        {
            get
            {
                return _enabled;
            }
            set
            {
                _enabled = value;

                ButtonText.Cursor = _enabled ? Cursors.Hand : null;

                if (!_enabled)
                {
                    Color disableColor = new Color();
                    disableColor.A = 255;
                    disableColor.R = 200;
                    disableColor.G = 200;
                    disableColor.B = 200;
                    ButtonText.Foreground = new SolidColorBrush(disableColor);
                }
                else
                {
                    ButtonText.Foreground = new SolidColorBrush(Colors.Black);
                }
            }
        }
        #endregion

        public string Text
        {
            get
            {
                return ButtonText.Text;
            }

            set
            {
                ButtonText.Text = value;
                this.Width = ButtonText.ActualWidth + 10d;
                //this.Height = ButtonText.ActualHeight + 10d;
            }
        }

        private Current.Font.FontType _fontType = Textfyre.UI.Current.Font.FontType.Headline;
        public Current.Font.FontType FontType
        {
            set
            {
                _fontType = value;
                FormatButton();
            }
        }

        public new double FontSize
        {
            set
            {
                ButtonText.FontSize = value;
            }
        }

        public Color ForegroundColor
        {
            set
            {
                ButtonText.Foreground = new SolidColorBrush(value);
                this.NormalColor.Value = value;
            }
        }

        private void FormatButton()
        {
            Current.Font.ApplyFont(_fontType, ButtonText);

        }
    }
}
