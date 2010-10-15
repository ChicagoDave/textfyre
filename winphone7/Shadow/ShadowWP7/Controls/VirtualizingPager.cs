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
using System.Collections.Generic;
using System.ComponentModel;

namespace ShadowWP7.Controls
{
	public class PageRequestEventArgs : EventArgs
	{
		public int Index { get; private set; }
		public object DataContext { get; set; }

		public PageRequestEventArgs( int index )
		{
			this.Index = index;
		}
	}

	public class VirtualizingPager : Panel
	{
		public event EventHandler<PageRequestEventArgs> PageRequest;

		private const int cacheSize = 5;

		private int currentPage = 1;
		private double startOffset = 0;
		private bool cancelScroll;
		private bool? isScrolling;
		private UIElement hookedElement;
		private Storyboard scrollStoryboard = new Storyboard();
		private DoubleAnimation scrollTimeline = new DoubleAnimation();

		private List<int> cachedPageIndexes = new List<int>();
		private Dictionary<int, FrameworkElement> cachedPages = new Dictionary<int, FrameworkElement>();
		private Dictionary<Type, DataTemplate> templates = new Dictionary<Type, DataTemplate>();

		public VirtualizingPager()
		{
			ManipulationStarted += OnManipulationStarted;
			ManipulationDelta += OnManipulationDelta;
			ManipulationCompleted += OnManipulationCompleted;
			Unloaded += VirtualizingPager_Unloaded;

//			Background = new SolidColorBrush( Colors.Yellow );

			scrollTimeline = new DoubleAnimation
			{
				Duration = new Duration( TimeSpan.FromMilliseconds( 250 ) ),
				EasingFunction = new SineEase
				{
					EasingMode = EasingMode.EaseOut
				}
			};

			Storyboard.SetTarget( scrollTimeline, this );
			Storyboard.SetTargetProperty( scrollTimeline, new PropertyPath( VirtualizingPager.ScrollOffsetProperty ) );

			scrollStoryboard.Children.Add( scrollTimeline );
			scrollStoryboard.Completed += scrollStoryboard_Completed;
		}

		void scrollStoryboard_Completed( object sender, EventArgs e )
		{
			var pages = (int)Math.Floor( ScrollOffset );

			if ( pages != 0 )
			{
				currentPage -= pages;
				ScrollOffset -= pages;
				startOffset -= pages;
			}
		}

		public int CurrentPage
		{
			get { return currentPage; }

			set
			{
				Dispatcher.BeginInvoke( delegate
				{
					if ( value != currentPage )
					{
						scrollTimeline.To = currentPage - value;
						scrollStoryboard.Begin();
					}
					else InvalidateArrange();
				} );
			}
		}

		private void pageRequestWorker_DoWork( object sender, DoWorkEventArgs e )
		{
			// Get page and cache it...
			var index = (int)e.Argument;
			var request = new PageRequestEventArgs( index );
			PageRequest( this, request );

			if ( request.DataContext != null )
			{
				Dispatcher.BeginInvoke( delegate
				{
					var page = new ContentControl();
					page.DataContext = request.DataContext;
					page.Content = request.DataContext;
					page.ContentTemplate = FindTemplate( request.DataContext );
					page.HorizontalContentAlignment = HorizontalAlignment.Stretch;
					page.VerticalContentAlignment = VerticalAlignment.Stretch;

					var removed = new List<FrameworkElement>();
					var isNew = true;

					lock ( cachedPages )
					{
						FrameworkElement previous;

						if ( cachedPages.TryGetValue( index, out previous ) && previous != null && Children.Contains( previous ) )
						{
							removed.Add( previous );
							isNew = false;
						}

						cachedPages[ index ] = page;

						// Clear old cached pages
						while ( cachedPageIndexes.Count > cacheSize )
						{
							var firstIndex = cachedPageIndexes[ 0 ];
							var cachedPage = cachedPages[ firstIndex ];

							if ( cachedPage != null && Children.Contains( cachedPage ) ) removed.Add( cachedPage );

							cachedPages.Remove( firstIndex );
							cachedPageIndexes.RemoveAt( 0 );
						}
					}

					Children.Add( page );
					foreach ( var remove in removed ) Children.Remove( remove );

					if ( isNew )
					{
						page.Opacity = 0;
						ShowPage( page );
					}

					InvalidateArrange();
				} );
			}
			else
			{
				lock ( cachedPages )
				{
					cachedPages.Remove( index );
					cachedPageIndexes.Remove( index );
				}
			}
		}

		private void ShowPage( FrameworkElement page )
		{
			if ( page.Opacity < 1 )
			{
				var storyboard = new Storyboard();

				var timeline = new DoubleAnimation
				{
					To = 1,
					Duration = new Duration( TimeSpan.FromMilliseconds( 250 ) )
				};

				Storyboard.SetTarget( timeline, page );
				Storyboard.SetTargetProperty( timeline, new PropertyPath( ContentControl.OpacityProperty ) );

				storyboard.Children.Add( timeline );
				storyboard.Begin();
			}
		}

		private void OnManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			isScrolling = null;
			startOffset = ScrollOffset;

			if ( sender != e.OriginalSource ) HookManipulationSource( e.OriginalSource as UIElement );// VisualTreeHelper.GetParent( (DependencyObject)e.OriginalSource ) as UIElement );
		}

		private void OnManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			if ( !isScrolling.HasValue ) isScrolling = Math.Abs( e.DeltaManipulation.Translation.X ) > Math.Abs( e.DeltaManipulation.Translation.Y );

			if ( isScrolling ?? false )
			{
				ScrollOffset = startOffset + ( e.CumulativeManipulation.Translation.X / RenderSize.Width );

				cancelScroll = ( ScrollOffset < 0 && e.DeltaManipulation.Translation.X > 0 )
					|| ( ScrollOffset > 0 && e.DeltaManipulation.Translation.X < 0 )
					|| GetNextPageContent() == null;
			}
		}

		private void OnManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			scrollTimeline.To = cancelScroll
				? 0
				: ( ScrollOffset < 0 ) ? -1 : ( ScrollOffset > 0 ) ? 1 : 0;

			scrollStoryboard.Begin();
			UnhookManipulationSource();
		}

		private void HookManipulationSource( UIElement source )
		{
			UnhookManipulationSource();

			if ( source != null )
			{
				System.Diagnostics.Debug.WriteLine( "Hooked manipulation source ({0})", source.GetType().Name );

				hookedElement = source;
				hookedElement.ManipulationDelta += OnManipulationDelta;
				hookedElement.ManipulationCompleted += OnManipulationCompleted;
			}
		}

		private void UnhookManipulationSource()
		{
			if ( hookedElement != null )
			{
				System.Diagnostics.Debug.WriteLine( "Unhooked manipulation source ({0})", hookedElement.GetType().Name );

				hookedElement.ManipulationCompleted -= OnManipulationCompleted;
				hookedElement.ManipulationDelta -= OnManipulationDelta;
				hookedElement = null;
			}
		}

		void VirtualizingPager_Unloaded( object sender, RoutedEventArgs e )
		{
			lock ( cachedPages )
			{
				foreach ( var page in cachedPages.Values ) Children.Remove( page );

				cachedPages.Clear();
				cachedPageIndexes.Clear();
			}
		}

		public static readonly DependencyProperty ScrollOffsetProperty = DependencyProperty.Register(
			"ScrollOffset",
			typeof( double ),
			typeof( VirtualizingPager ),
			new PropertyMetadata( 0d, OnScrollPositionChanged ) );

		public double ScrollOffset
		{
			get { return (double)GetValue( ScrollOffsetProperty ); }
			set { SetValue( ScrollOffsetProperty, value ); }
		}

		private static void OnScrollPositionChanged( DependencyObject obj, DependencyPropertyChangedEventArgs args )
		{
			( obj as VirtualizingPager ).OnScrollPositionChanged( args );
		}

		private void OnScrollPositionChanged( DependencyPropertyChangedEventArgs args )
		{
			InvalidateArrange();
		}

		private FrameworkElement GetCurrentPageContent()
		{
			return GetPage( currentPage );
		}

		private int? GetNextPage()
		{
			return ( ScrollOffset < 0 )
				? currentPage + 1
				: ( ScrollOffset > 0 ) ? currentPage - 1 : (int?)null;
		}

		private FrameworkElement GetNextPageContent()
		{
			var nextPage = GetNextPage();

			return nextPage.HasValue ? GetPage( nextPage.Value ) : null;
		}

		protected override Size MeasureOverride( Size availableSize )
		{
			var currentPageContent = GetCurrentPageContent();
			var nextPageContent = GetNextPageContent();

			if ( currentPageContent != null ) currentPageContent.Measure( availableSize );
			if ( nextPageContent != null ) nextPageContent.Measure( availableSize );

			return base.MeasureOverride( availableSize );
		}

		protected override Size ArrangeOverride( Size finalSize )
		{
			SetVisibility();

			var currentPageContent = GetCurrentPageContent();
			var nextPageContent = GetNextPageContent();
			var scrollPosition = ScrollOffset * RenderSize.Width;

			if ( currentPageContent != null ) currentPageContent.Arrange( new Rect( scrollPosition, 0, finalSize.Width, finalSize.Height ) );

			if ( nextPageContent != null )
			{
				if ( scrollPosition < 0 ) nextPageContent.Arrange( new Rect( finalSize.Width + scrollPosition, 0, finalSize.Width, finalSize.Height ) );
				else nextPageContent.Arrange( new Rect( -finalSize.Width + scrollPosition, 0, finalSize.Width, finalSize.Height ) );
			}

			return base.ArrangeOverride( finalSize );
		}

		private FrameworkElement GetPage( int index )
		{
			lock ( cachedPages )
			{
				if ( cachedPages.ContainsKey( index ) )
				{
					System.Diagnostics.Debug.WriteLine( string.Format( "Retrieving cached page {0}{1} (Current {2})",
						index, cachedPages[ index ] != null ? " (Loaded)" : null, currentPage ) );

					cachedPageIndexes.Remove( index );
					cachedPageIndexes.Add( index );

					return cachedPages[ index ];
				}
				else if ( PageRequest != null )
				{
					System.Diagnostics.Debug.WriteLine( "Requesting page " + index );

					cachedPages[ index ] = null;
					cachedPageIndexes.Add( index );

					LoadPage( index );
				}
			}

			return null;
		}

		public void LoadPage( int index )
		{
			var worker = new BackgroundWorker();
			worker.DoWork += pageRequestWorker_DoWork;

			worker.RunWorkerAsync( index );
		}

		private void SetVisibility()
		{
			var visible = new[] { currentPage, GetNextPage() };

			lock ( cachedPages )
			{
				foreach ( var page in cachedPages.Where( cp => cp.Value != null ) )
				{
					var visibility = visible.Contains( page.Key ) ? Visibility.Visible : Visibility.Collapsed;

					if ( page.Value.Visibility != visibility ) page.Value.Visibility = visibility;
				}
			}
		}

		private DataTemplate FindTemplate( object item )
		{
			if ( item == null ) return null;

			var type = item.GetType();

			DataTemplate template;

			if ( templates.TryGetValue( type, out template ) ) return template;

			var name = type.Name;

			for ( var container = this as FrameworkElement; container != null; container = VisualTreeHelper.GetParent( container ) as FrameworkElement )
			{
				if ( ( template = container.Resources[ name ] as DataTemplate ) != null ) return templates[ type ] = template;
			}

			return null;
		}

		public void Clear()
		{
			currentPage = 1;
			startOffset = 0;
			cancelScroll = false;
			isScrolling = null;

			Children.Clear();

			lock ( cachedPages )
			{
				cachedPages.Clear();
				cachedPageIndexes.Clear();
			}
		}
	}
}