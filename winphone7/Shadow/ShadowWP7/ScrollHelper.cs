using System;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ShadowWP7
{
	public static class ScrollHelper
	{
		public static void ScrollTo( this ScrollViewer scrollViewer, ResourceDictionary resources, string storyboardName, double from, double to )
		{
			var storyboard = (Storyboard)resources[ storyboardName ];
			var animation = storyboard.Children.First() as DoubleAnimation;
			var mediator = resources[ (string)animation.GetValue( Storyboard.TargetNameProperty ) ] as ScrollViewerOffsetMediator;
			mediator.ScrollViewer = scrollViewer;

			animation.From = from;
			animation.To = to;

			storyboard.Begin();
		}
	}
}
