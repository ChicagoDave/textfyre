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
    public partial class ColorPickerButton : UserControl
    {
        public event EventHandler Click;

        public ColorPickerButton()
        {
            InitializeComponent();
            BtnColor.MouseLeftButtonUp+=new MouseButtonEventHandler(BtnColor_MouseLeftButtonUp);
        }

        private void BtnColor_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (Click != null)
                Click(this, new EventArgs());
        }

        public Brush SelectedBrush
        {
            get
            {
                return BtnColor.Fill;
            }
            set
            {
                BtnColor.Fill = value;
            }
        }
    }
}
