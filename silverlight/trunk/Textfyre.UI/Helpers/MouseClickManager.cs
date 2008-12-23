using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Threading;

namespace Textfyre.UI.Helpers
{
    public class MouseClickManager
    {
        public event MouseButtonEventHandler Click;
        public event MouseButtonEventHandler DoubleClick;

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="MouseClickManager"/> is clicked.
        /// </summary>
        /// <value><c>true</c> if clicked; otherwise, <c>false</c>.</value>
        private bool Clicked { get; set; }
 
        /// <summary>
        /// Gets or sets the control.
        /// </summary>
        /// <value>The control.</value>
        public Control Control { get; set; }

        /// <summary>
        /// Gets or sets the timeout.
        /// </summary>
        /// <value>The timeout.</value>
        public int Timeout { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="MouseClickManager"/> class.
        /// </summary>
        /// <param name="control">The control.</param>
        public MouseClickManager(Control control, int timeout)
        {
            this.Clicked = false;
            this.Control = control;
            this.Timeout = timeout;
        }

        /// <summary>
        /// Handles the click.
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.Windows.Input.MouseButtonEventArgs"/> instance containing the event data.</param>
        public void HandleClick(object sender, MouseButtonEventArgs e)
        {
            lock(this)
            {
                if (this.Clicked)
                {
                    this.Clicked = false;
                    OnDoubleClick(sender, e);
                }
                else
                {
                    this.Clicked = true;
                    ParameterizedThreadStart threadStart = new ParameterizedThreadStart(ResetThread);
                    Thread thread = new Thread(threadStart);
                    thread.Start(e);
                }
            }
        }

        /// <summary>
        /// Resets the thread.
        /// </summary>
        /// <param name="state">The state.</param>
        private void ResetThread(object state)
        {
            Thread.Sleep(this.Timeout);

            lock (this)
            {
                if (this.Clicked)
                {
                    this.Clicked = false;
                    OnClick(this, (MouseButtonEventArgs)state);
                }
            }
        }

        /// <summary>
        /// Called when [click].
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.Windows.Input.MouseButtonEventArgs"/> instance containing the event data.</param>
        private void OnClick(object sender, MouseButtonEventArgs e)
        {
            MouseButtonEventHandler handler = Click;

            if (handler != null)
                this.Control.Dispatcher.BeginInvoke(handler, sender, e);
        }

        /// <summary>
        /// Called when [double click].
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.Windows.Input.MouseButtonEventArgs"/> instance containing the event data.</param>
        private void OnDoubleClick(object sender, MouseButtonEventArgs e)
        {
            MouseButtonEventHandler handler = DoubleClick;

            if (handler != null)
                handler(sender, e);
        }
    }
}
