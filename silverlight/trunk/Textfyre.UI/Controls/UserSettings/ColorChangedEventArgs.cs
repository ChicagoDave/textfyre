using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.Controls.UserSettings
{
    public class ColorChangedEventArgs : RoutedEventArgs
    {
        internal ColorChangedEventArgs(Color selectedColor)
        {
            this.SelectedColor = selectedColor;
        }

        public Color SelectedColor
        {
            get;
            private set;
        }
    }
}
