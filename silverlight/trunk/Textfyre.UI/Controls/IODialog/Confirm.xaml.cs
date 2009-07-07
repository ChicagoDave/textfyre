using System;
using System.Windows;
using System.Windows.Controls;

namespace Textfyre.UI.Controls.IODialog
{
    public partial class Confirm : UserControl
    {
        public class ConfirmAnswerEventArgs : EventArgs
        {
            public bool IsAnswerOK;
        }

        public event EventHandler<ConfirmAnswerEventArgs> ConfirmAnswer;

        public Confirm()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtMessage);
            TxtMessage.FontSize = 20d;
        }



        public string Title
        {
            get
            {
                return (string)GetValue(TitleProperty);
            }
            set
            {
                SetValue(TitleProperty, value);
                DialogTitle.Text = value;
            }
        }
        public static readonly DependencyProperty TitleProperty = DependencyProperty.Register("Title", typeof(string), typeof(Confirm), new PropertyMetadata(""));

        public string Message
        {
            get
            {
                return (string)GetValue(MessageProperty);
            }
            set
            {
                SetValue(MessageProperty, value);
                TxtMessage.Text = value;
            }
        }
        public static readonly DependencyProperty MessageProperty = DependencyProperty.Register("Message", typeof(string), typeof(Confirm), new PropertyMetadata(""));

        public string CancelText
        {
            get
            {
                return (string)GetValue(CancelTextProperty);
            }
            set
            {
                SetValue(CancelTextProperty, value);
                BtnCancel.Content = value;

                if (value.Length == 0)
                    BtnCancel.Visibility = Visibility.Collapsed;
                else
                    BtnCancel.Visibility = Visibility.Visible;
            }
        }
        public static readonly DependencyProperty CancelTextProperty = DependencyProperty.Register("CancelText", typeof(string), typeof(Confirm), new PropertyMetadata(""));

        public string OKText
        {
            get
            {
                return (string)GetValue(OKTextProperty);
            }
            set
            {
                SetValue(OKTextProperty, value);
                BtnOK.Content = value;
            }
        }
        public static readonly DependencyProperty OKTextProperty = DependencyProperty.Register("OKText", typeof(string), typeof(Confirm), new PropertyMetadata(""));


        public void Show()
        {
            Current.Game.IsInputFocusActive = false;
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            Current.Game.IsInputFocusActive = true;
            this.Visibility = Visibility.Collapsed;
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            Hide();
            OnConfirmAnswer(true);
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Hide();
            OnConfirmAnswer(false);
        }

        private void OnConfirmAnswer(bool isAnswerOK )
        {
            if (ConfirmAnswer != null)
            {
                ConfirmAnswerEventArgs args = new ConfirmAnswerEventArgs();
                args.IsAnswerOK = isAnswerOK;
                ConfirmAnswer(this, args);
            }
        }
        
    }
}
