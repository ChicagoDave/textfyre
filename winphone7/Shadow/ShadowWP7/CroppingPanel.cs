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
using System.Windows.Media.Imaging;

namespace ShadowWP7
{
	public class CroppingPanel : Panel
	{
		public CroppingPanel()
		{
			CacheMode = new BitmapCache();
		}

		protected override Size MeasureOverride( Size availableSize )
		{
			foreach ( var c in Children ) c.Measure( availableSize );

			return new Size( 0, 0 );
		}

		protected override Size ArrangeOverride( Size finalSize )
		{
			foreach ( var c in Children ) c.Arrange( new Rect( new Point(), finalSize ) );

			return finalSize;
		}
	}
}