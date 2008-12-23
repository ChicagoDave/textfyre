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

namespace Textfyre.UI.Controls.Mapping
{
    public partial class DragHand : UserControl
    {
        public DragHand()
        {
            InitializeComponent();
        }

        private bool _isHandOpen = false;
        public bool IsHandOpen
        {
            get
            {
                return _isHandOpen;
            }

            set
            {
                _isHandOpen = value;

                this.HandOpen.Visibility = value ? Visibility.Visible : Visibility.Collapsed;
                this.HandClose.Visibility = value ? Visibility.Collapsed : Visibility.Visible;
            }
        }
    }
}
