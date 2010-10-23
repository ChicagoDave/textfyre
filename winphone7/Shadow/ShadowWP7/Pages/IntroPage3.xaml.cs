using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO;
using ShadowWP7.Controls;

namespace ShadowWP7.Pages
{
	public partial class IntroPage3 : UserControl
	{
		public IntroPage3()
		{
			// Required to initialize variables
			InitializeComponent();

        }

        private void introweb1_Loaded(object sender, RoutedEventArgs e)
        {
            introweb1.Base = "HTDocs";
            introweb1.Navigate(new Uri("intropage1.html", UriKind.Relative));
        }
	}
}