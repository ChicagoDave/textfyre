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
using Microsoft.Phone.Controls;

namespace ShadowWP7.Pages
{
    public partial class IntroView1 : PhoneApplicationPage
    {
        public IntroView1()
        {
            InitializeComponent();

            DataContext = this;
        }

        private void webBrowser1_Loaded(object sender, RoutedEventArgs e)
        {
            webBrowser1.Base = "HTDocs";
            webBrowser1.Navigate(new Uri("intropage1.html", UriKind.Relative));
        }
    }
}