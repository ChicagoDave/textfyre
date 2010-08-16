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
		private DispatcherTimer timer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds( 500 ) };

		public StoryPageView()
		{
			InitializeComponent();

			timer.Tick += OnTimerTick;
		}

		private void OnParagraphLoaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );
		}

		private void OnParagraphUnloaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Remove( inline );
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
			if ( hoverTextBlock != null )
			{
				selectedTextBlock = hoverTextBlock;
				hoverTextBlock = null;

				MoveSelectedWord( new Point() );

				selectedWord.Text = selectedTextBlock.Text;
				selectedWord.FontWeight = selectedTextBlock.FontWeight;
				selectedWord.FontStyle = selectedTextBlock.FontStyle;
				selectedWordBorder.Visibility = Visibility.Visible;
			}
		}

		private void storyPanel_ManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			if ( hoverTextBlock != null )
			{
				timer.Stop();
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
			selectedWordBorder.Visibility = Visibility.Collapsed;

			if ( selectedTextBlock != null && e.FinalVelocities.LinearVelocity.Y > 0 )
			{
				StoryInteraction( e.ManipulationContainer, new CommandEventArgs( selectedTextBlock.Text ) );
				e.Handled = true;
			}

			hoverTextBlock = selectedTextBlock = null;
		}

		private void MoveSelectedWord( Point offset )
		{
			var position = selectedTextBlock.TransformToVisual( LayoutRoot ).Transform( new Point() );

			selectedWordBorder.RenderTransform = new TranslateTransform
			{
				X = position.X - selectedWordBorder.Padding.Left,
				Y = position.Y - selectedWordBorder.Padding.Top + Math.Max( offset.Y, 0 )
			};
		}
	}
}