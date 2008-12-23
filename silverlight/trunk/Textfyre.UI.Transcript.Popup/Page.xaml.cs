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

namespace Textfyre.UI.Transcript.Popup
{
    public partial class Page : UserControl
    {
        public Page()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }

        void Page_Loaded(object sender, RoutedEventArgs e)
        {
            string transcript = Textfyre.UI.Transcript.Lib.IO.Get();
            Textfyre.UI.Transcript.Lib.IO.Delete();
            System.Windows.Browser.HtmlPage.Window.Invoke("transferText", transcript);
        }
    }
}
