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