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
            set
            {
                DialogTitle.Text = value;
            }
        }

        public string Message
        {
            set
            {
                TxtMessage.Text = value;
            }
        }

        public string CancelText
        {
            set
            {
                BtnCancel.Content = value;

                if (value.Length == 0)
                    BtnCancel.Visibility = Visibility.Collapsed;
                else
                    BtnCancel.Visibility = Visibility.Visible;

            }
        }

        public string OKText
        {
            set
            {
                BtnOK.Content = value;
            }
        }

        public void Show()
        {
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
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
