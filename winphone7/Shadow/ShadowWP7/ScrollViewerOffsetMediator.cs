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

namespace ShadowWP7
{
	/// <summary>
	/// Mediator that forwards Offset property changes on to a ScrollViewer
	/// instance to enable the animation of Horizontal/VerticalOffset.
	/// </summary>
	public class ScrollViewerOffsetMediator : FrameworkElement
	{
		/// <summary>
		/// ScrollViewer instance to forward Offset changes on to.
		/// </summary>
		public ScrollViewer ScrollViewer
		{
			get { return (ScrollViewer)GetValue( ScrollViewerProperty ); }
			set { SetValue( ScrollViewerProperty, value ); }
		}

		public static readonly DependencyProperty ScrollViewerProperty =
			DependencyProperty.Register(
				"ScrollViewer",
				typeof( ScrollViewer ),
				typeof( ScrollViewerOffsetMediator ),
				new PropertyMetadata( OnScrollViewerChanged ) );

		private static void OnScrollViewerChanged( DependencyObject o, DependencyPropertyChangedEventArgs e )
		{
			var mediator = (ScrollViewerOffsetMediator)o;
			var scrollViewer = (ScrollViewer)( e.NewValue );

			if ( null != scrollViewer )
			{
				scrollViewer.ScrollToHorizontalOffset( mediator.HorizontalOffset );
				scrollViewer.ScrollToVerticalOffset( mediator.VerticalOffset );
			}
		}

		#region Horizontal

		/// <summary>
		/// HorizontalOffset property to forward to the ScrollViewer.
		/// </summary>
		public double HorizontalOffset
		{
			get { return (double)GetValue( HorizontalOffsetProperty ); }
			set { SetValue( HorizontalOffsetProperty, value ); }
		}

		public static readonly DependencyProperty HorizontalOffsetProperty =
			DependencyProperty.Register(
				"HorizontalOffset",
				typeof( double ),
				typeof( ScrollViewerOffsetMediator ),
				new PropertyMetadata( OnHorizontalOffsetChanged ) );

		public static void OnHorizontalOffsetChanged( DependencyObject o, DependencyPropertyChangedEventArgs e )
		{
			var mediator = (ScrollViewerOffsetMediator)o;

			if ( null != mediator.ScrollViewer )
			{
				mediator.ScrollViewer.ScrollToHorizontalOffset( (double)( e.NewValue ) );
			}
		}

		/// <summary>
		/// Multiplier for ScrollableWidth property to forward to the ScrollViewer.
		/// </summary>
		/// <remarks>
		/// 0.0 means "scrolled to top"; 1.0 means "scrolled to bottom".
		/// </remarks>
		public double ScrollableWidthMultiplier
		{
			get { return (double)GetValue( ScrollableWidthMultiplierProperty ); }
			set { SetValue( ScrollableWidthMultiplierProperty, value ); }
		}

		public static readonly DependencyProperty ScrollableWidthMultiplierProperty =
			DependencyProperty.Register(
				"ScrollableWidthMultiplier",
				typeof( double ),
				typeof( ScrollViewerOffsetMediator ),
				new PropertyMetadata( OnScrollableWidthMultiplierChanged ) );

		public static void OnScrollableWidthMultiplierChanged( DependencyObject o, DependencyPropertyChangedEventArgs e )
		{
			var mediator = (ScrollViewerOffsetMediator)o;
			var scrollViewer = mediator.ScrollViewer;

			if ( null != scrollViewer )
			{
				scrollViewer.ScrollToHorizontalOffset( (double)( e.NewValue ) * scrollViewer.ScrollableWidth );
			}
		}

		#endregion

		#region Vertical

		/// <summary>
		/// VerticalOffset property to forward to the ScrollViewer.
		/// </summary>
		public double VerticalOffset
		{
			get { return (double)GetValue( VerticalOffsetProperty ); }
			set { SetValue( VerticalOffsetProperty, value ); }
		}

		public static readonly DependencyProperty VerticalOffsetProperty =
			DependencyProperty.Register(
				"VerticalOffset",
				typeof( double ),
				typeof( ScrollViewerOffsetMediator ),
				new PropertyMetadata( OnVerticalOffsetChanged ) );

		public static void OnVerticalOffsetChanged( DependencyObject o, DependencyPropertyChangedEventArgs e )
		{
			var mediator = (ScrollViewerOffsetMediator)o;

			if ( null != mediator.ScrollViewer )
			{
				mediator.ScrollViewer.ScrollToVerticalOffset( (double)( e.NewValue ) );
			}
		}

		/// <summary>
		/// Multiplier for ScrollableHeight property to forward to the ScrollViewer.
		/// </summary>
		/// <remarks>
		/// 0.0 means "scrolled to top"; 1.0 means "scrolled to bottom".
		/// </remarks>
		public double ScrollableHeightMultiplier
		{
			get { return (double)GetValue( ScrollableHeightMultiplierProperty ); }
			set { SetValue( ScrollableHeightMultiplierProperty, value ); }
		}

		public static readonly DependencyProperty ScrollableHeightMultiplierProperty =
			DependencyProperty.Register(
				"ScrollableHeightMultiplier",
				typeof( double ),
				typeof( ScrollViewerOffsetMediator ),
				new PropertyMetadata( OnScrollableHeightMultiplierChanged ) );

		public static void OnScrollableHeightMultiplierChanged( DependencyObject o, DependencyPropertyChangedEventArgs e )
		{
			var mediator = (ScrollViewerOffsetMediator)o;
			var scrollViewer = mediator.ScrollViewer;

			if ( null != scrollViewer )
			{
				scrollViewer.ScrollToVerticalOffset( (double)( e.NewValue ) * scrollViewer.ScrollableHeight );
			}
		}

		#endregion
	}
}