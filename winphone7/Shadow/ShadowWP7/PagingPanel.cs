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
using System.Collections.ObjectModel;

namespace ShadowWP7
{
	public class PagingPanel : VirtualizingStackPanel
	{
		public PagingPanel()
		{
		}

		protected override Size MeasureOverride( Size availableSize )
		{
			return availableSize;
		}

		protected override Size ArrangeOverride( Size finalSize )
		{
//			Chil
			Clip = new RectangleGeometry { Rect = new Rect( new Point(), finalSize ) };

			return finalSize;
		}
	}
}