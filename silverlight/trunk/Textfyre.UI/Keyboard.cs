using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI
{
    public static class Keyboard
    {

        public static event EventHandler<KeyEventArgs> KeyPress;
        public static event EventHandler<KeyEventArgs> KeyUp;
        public static event EventHandler<KeyEventArgs> KeyDown;

        private static UIElement _masterElement;

        public static void Init(UIElement masterElement)
        {
            _masterElement = masterElement;
            masterElement.KeyDown += new KeyEventHandler(masterElement_KeyDown);
            masterElement.KeyUp += new KeyEventHandler(masterElement_KeyUp);

        }

        static void masterElement_KeyDown(object sender, KeyEventArgs e)
        {
            if (KeyDown != null)
            {
                KeyDown(_masterElement, e);
            }
        }

        private static void masterElement_KeyUp(object sender, KeyEventArgs e)
        {
            if (KeyUp != null)
            {
                KeyUp(_masterElement, e);
            }

            if (KeyPress != null)
            {
                KeyPress(_masterElement, e);
            }
        }
    }
}
