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
using Cjc.SilverFyre;
using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace ShadowWP7
{
	public partial class StoryPageView : UserControl
	{
		public event EventHandler<CommandEventArgs> StoryInteraction;

		private TextBlock hoverTextBlock;
		private TextBlock selectedTextBlock;
		private DispatcherTimer timer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds( 250 ) };

		private static Dictionary<PageBase, CachedPage> cachedPages = new Dictionary<PageBase, CachedPage>();
		private static List<PageBase> recentPages = new List<PageBase>();

		public StoryPageView()
		{
			InitializeComponent();

			timer.Tick += OnTimerTick;
/*
			Loaded += delegate
			{
				var page = DataContext as PageBase;

				if ( page != null && page.Paragraphs != null )
				{
					foreach ( var p in page.Paragraphs.Where( p => p.TextBlock != null ) )
					{
						p.AddToCollection( paragraphs.Items );
					}
				}
			};

			Unloaded += delegate
			{
				var page = DataContext as PageBase;

				if ( page != null && page.Paragraphs != null )
				{
					foreach ( var p in page.Paragraphs.Where( p => p.TextBlock != null ) )
					{
						p.RemoveFromCollection();
					}
				}
			};*/
		}

		protected override Size MeasureOverride( Size availableSize )
		{
			var size = base.MeasureOverride( availableSize );

			return size;
		}

		protected override Size ArrangeOverride( Size finalSize )
		{
			var page = DataContext as PageBase;

			if ( page != null )
			{
				var cachedPage = ( cachedPages.ContainsKey( page ) && cachedPages[ page ].Bitmap.PixelWidth == finalSize.Width )
					? cachedPages[ page ]
					: cachedPages[ page ] = CreateCachedPage( page, finalSize.Width );

				if ( contentImage.Source != cachedPage.Bitmap )
				{
					contentImage.Source = cachedPage.Bitmap;

					var index = recentPages.IndexOf( page );

					if ( index != 0 )
					{
						if ( index > 0 ) recentPages.RemoveAt( index );
						recentPages.Insert( 0, page );
					}

					while ( recentPages.Count > 10 ) recentPages.RemoveAt( recentPages.Count - 1 );
				}
			}

			return base.ArrangeOverride( finalSize );
		}

		private CachedPage CreateCachedPage( PageBase page, double width )
		{
			System.Diagnostics.Debug.WriteLine( "Caching page" );

			var textStyle = Application.Current.Resources[ "historyText" ] as Style;
			var stackPanel = new StackPanel();

			foreach ( var paragraph in page.Paragraphs )
			{
				var textBlock = new TextBlock();
				textBlock.Style = textStyle;

				foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );

				stackPanel.Children.Add( textBlock );
			}

			var border = stackPanel;

			border.Measure( new Size( width, double.PositiveInfinity ) );
			border.Arrange( new Rect( new Point(), new Size( width, border.DesiredSize.Height ) ) );

			var bitmap = new WriteableBitmap( (int)border.ActualWidth, (int)border.ActualHeight );
			bitmap.Render( border, null );

			bitmap.Invalidate();

			foreach ( var textBlock in stackPanel.Children.OfType<TextBlock>() )
			{
				textBlock.Inlines.Clear();
			}

			return new CachedPage { Bitmap = bitmap };
		}

		private void OnParagraphLoaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			if ( paragraph != null && paragraph.Inlines != null )
			{
				foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );
			}
		}

		private void OnParagraphUnloaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;

			textBlock.Inlines.Clear();
		}

		void OnManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			e.Handled = false;
		}

		private void storyPanel_ManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			var textBlock = e.ManipulationContainer as TextBlock;

			if ( textBlock != null && (string)textBlock.Tag == "Word" && StoryInteraction != null )
			{
				hoverTextBlock = textBlock;
				selectedTextBlock = null;
				timer.Start();
			}
		}

		private void OnTimerTick( object sender, EventArgs e )
		{
			timer.Stop();

			if ( hoverTextBlock != null )
			{
				selectedTextBlock = hoverTextBlock;
				hoverTextBlock = null;

				MoveSelectedWord( new Point() );

				selectedWordTooltip.Content = selectedTextBlock.Text;
				selectedWordTooltip.FontWeight = selectedTextBlock.FontWeight;
				selectedWordTooltip.FontStyle = selectedTextBlock.FontStyle;

				ShowSelectedWord();
			}
		}

		private void storyPanel_ManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			if ( hoverTextBlock != null )
			{
				timer.Stop();
				HideSelectedWord();
				hoverTextBlock = selectedTextBlock = null;
			}
			else if ( selectedTextBlock != null )
			{
				MoveSelectedWord( e.CumulativeManipulation.Translation );
				e.Handled = true;
			}
		}

		private void storyPanel_ManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			timer.Stop();
			HideSelectedWord();

			if ( selectedTextBlock != null && e.FinalVelocities.LinearVelocity.Y > 0 )
			{
				StoryInteraction( e.ManipulationContainer, new CommandEventArgs( selectedTextBlock.Text ) );
				e.Handled = true;
			}

			hoverTextBlock = selectedTextBlock = null;
		}

		private void MoveSelectedWord( Point offset )
		{
/*			var position = selectedTextBlock.TransformToVisual( LayoutRoot ).Transform( new Point() );
			var padding = 10;
			var pagePadding = 10;
			var yOffset = ( position.Y - padding - 50 < 0 ) ? 40 : -40;

			selectedWordTransform.X = Math.Min( Math.Max( position.X - padding, pagePadding ), LayoutRoot.RenderSize.Width - pagePadding - selectedWordTooltip.RenderSize.Width );
			selectedWordTransform.Y = Math.Min( Math.Max( position.Y - padding + Math.Max( offset.Y, 0 ) + yOffset, pagePadding ), LayoutRoot.RenderSize.Height - pagePadding - selectedWordTooltip.RenderSize.Height );*/
		}

		private void ShowSelectedWord()
		{
			var result = VisualStateManager.GoToState( selectedWordTooltip, "Pressed", true );
		}

		private void HideSelectedWord()
		{
			var result = VisualStateManager.GoToState( selectedWordTooltip, "Normal", true );
		}
	}
}