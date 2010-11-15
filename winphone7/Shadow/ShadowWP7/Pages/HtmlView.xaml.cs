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
using System.Windows.Media.Imaging;

namespace ShadowWP7.Pages
{
	public partial class HtmlView : PhoneApplicationPage
    {
        public HtmlView()
        {
            InitializeComponent();
        }

        private void browser_Loaded(object sender, RoutedEventArgs e)
        {
			var page = ( DataContext as HtmlPage ).Page;

            browser.Base = "HTDocs";
            browser.Navigate( new Uri( page, UriKind.Relative ) );
        }

		private void browser_Navigated( object sender, System.Windows.Navigation.NavigationEventArgs e )
		{
/*			browser.Opacity = 1;

			var bitmap = new WriteableBitmap( (int)DesiredSize.Width, (int)DesiredSize.Height );
			bitmap.Render( browser, null );

			bitmap.Invalidate();

			image.Source = bitmap;

			browser.Opacity = 0;*/
		}
    }
}