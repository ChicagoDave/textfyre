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
using System.Collections.ObjectModel;

namespace ShadowWP7
{
	public partial class StoryPageView : UserControl
	{
		public event EventHandler<CommandEventArgs> StoryInteraction;
		public event EventHandler<CommandEventArgs> CommandEntered;
		public event EventHandler<KeyEventArgs> KeyDown;
		public event EventHandler<KeyEventArgs> KeyUp;

//		private TextBlock hoverTextBlock;
//		private TextBlock selectedTextBlock;
//		private DispatcherTimer timer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds( 250 ) };

		private static Dictionary<PageBase, CachedPage> cachedPages = new Dictionary<PageBase, CachedPage>();
		private static List<PageBase> recentPages = new List<PageBase>();
		private string partialWord;
		private int partialWordIndex;
		private bool focusCommand;

		public StoryPageView()
		{
			Words = new ObservableCollection<string>();

			InitializeComponent();
		}

		public ObservableCollection<string> Words { get; private set; }

		protected override Size ArrangeOverride( Size finalSize )
		{
			var page = DataContext as PageBase;

			if ( page != null )
			{
				var cachedPage = ( cachedPages.ContainsKey( page ) && cachedPages[ page ].Bitmap.PixelWidth == finalSize.Width )
					? cachedPages[ page ]
					: cachedPages[ page ] = CreateCachedPage( page, finalSize );

				if ( contentImage.Source != cachedPage.Bitmap )
				{
					contentImage.Source = cachedPage.Bitmap;

					var index = recentPages.IndexOf( page );

					if ( index != 0 )
					{
						if ( index > 0 ) recentPages.RemoveAt( index );
						recentPages.Insert( 0, page );
					}

					while ( recentPages.Count > 5 )
					{
						var lastIndex = recentPages.Count - 1;

						cachedPages.Remove( recentPages[ lastIndex ] );
						recentPages.RemoveAt( lastIndex );
					}
				}
			}

			footer.Background = Background;

			return base.ArrangeOverride( finalSize );
		}

		private CachedPage CreateCachedPage( PageBase page, Size size )
		{
			System.Diagnostics.Debug.WriteLine( "Caching page" );

			var textStyle = Application.Current.Resources[ "historyText" ] as Style;
			var stackPanel = new StackPanel();

			stackPanel.Background = Background;

			foreach ( var paragraph in page.Paragraphs )
			{
				var textBlock = new TextBlock();
				textBlock.Style = textStyle;

				foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );

				stackPanel.Children.Add( textBlock );
			}

			if ( page.Command != null )
			{
				var textBlock = new TextBlock();
				textBlock.Style = Application.Current.Resources[ "historyCommandText" ] as Style;
				textBlock.Text = page.Command;
				textBlock.Margin = new Thickness( 10 );

				stackPanel.Children.Add( textBlock );
			}

			var border = stackPanel;

			border.Measure( new Size( size.Width, double.PositiveInfinity ) );
			border.Arrange( new Rect( new Point(), new Size( size.Width, border.DesiredSize.Height ) ) );

			var actualHeight = (int)Math.Max( border.ActualHeight, size.Height - ( page.HasInput ? 149 : 0 ) );
			var bitmap = new WriteableBitmap( (int)border.ActualWidth, actualHeight );

			border.Arrange( new Rect( new Point(), new Size( size.Width, actualHeight ) ) );

			bitmap.Render( border, null );

			bitmap.Invalidate();

			foreach ( var textBlock in stackPanel.Children.OfType<TextBlock>() )
			{
				textBlock.Inlines.Clear();
			}

			return new CachedPage { Bitmap = bitmap };
		}

		private void commandInput_TextChanged( object sender, TextChangedEventArgs e )
		{
			var lastSpaceIndex = ( commandInput.SelectionStart > 0 )
				? commandInput.Text.LastIndexOf( ' ', commandInput.SelectionStart - 1 )
				: -1;

			partialWordIndex = lastSpaceIndex >= 0 ? lastSpaceIndex + 1 : 0;

			var nextSpaceIndex = commandInput.Text.IndexOf( ' ', partialWordIndex );

			partialWord = ( nextSpaceIndex >= 0 )
				? commandInput.Text.Substring( partialWordIndex, nextSpaceIndex - partialWordIndex )
				: commandInput.Text.Substring( partialWordIndex );

			Words.Clear();

			if ( partialWord.Length > 0 )
			{
				var words = from g in ( DataContext as PageBase ).State.Commands.Values
							from w in g
							let index = w.StartsWith( partialWord, StringComparison.InvariantCultureIgnoreCase )
								? 0
								: w.IndexOf( partialWord, StringComparison.InvariantCultureIgnoreCase ) >= 0 ? 1 : 2
							where index < 2
							orderby index, w
							select w;

				var isLower = char.IsLower( partialWord.FirstOrDefault() );

				foreach ( var w in words ) Words.Add( isLower ? w.ToLower() : w.ToUpper() );
			}

			suggestionArea.InvalidateMeasure();
			ScrollHelper.ScrollTo( pageScroll, Resources, "scrollPage", pageScroll.VerticalOffset, pageScroll.ExtentHeight );
		}

		private void suggestedWord_Click( object sender, RoutedEventArgs e )
		{
/*			commandInput.Focus();

			Dispatcher.BeginInvoke( delegate
			{
				var selectionStart = commandInput.SelectionStart;
				var word = (string)( ( sender as Button ).Content );

				commandInput.Select( partialWordIndex, partialWord.Length + 1 );
				commandInput.SelectedText = word + " ";
				commandInput.SelectionStart = selectionStart + word.Length + 1;
			} );*/
		}

		private void suggestion_ManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			focusCommand = true;
//			e.Handled = true;
		}

		private void suggestion_ManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			if ( e.TotalManipulation.Translation.X == 0 && e.TotalManipulation.Translation.Y == 0 )
			{
				Dispatcher.BeginInvoke( delegate
				{
					var selectionStart = commandInput.SelectionStart;
					var word = (string)( ( sender as TextBlock ).Text );

					commandInput.Select( partialWordIndex, partialWord.Length + 1 );
					commandInput.SelectedText = word + " ";
					commandInput.SelectionStart = selectionStart + word.Length + 1;
				} );

				e.Handled = true;
			}
		}

		private void commandInput_GotFocus( object sender, RoutedEventArgs e )
		{

		}

		private void commandInput_LostFocus( object sender, RoutedEventArgs e )
		{
			if ( focusCommand )
			{
				commandInput.Focus();
				focusCommand = false;
			}
		}

		private void suggestionArea_ManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			e.Handled = true;
		}

		private void suggestionArea_ManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			e.Handled = true;
		}

		private void suggestionArea_ManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			e.Handled = true;
		}

		private void commandButton_Click( object sender, RoutedEventArgs e )
		{
			if ( CommandEntered != null )
			{
				CommandEntered( this, new CommandEventArgs( commandInput.Text.Trim() ) );
			}
		}

		private void commandInput_KeyDown( object sender, KeyEventArgs e )
		{
			if ( KeyDown != null ) KeyDown( this, e );
		}

		private void commandInput_KeyUp( object sender, KeyEventArgs e )
		{
			if ( e.Key == Key.Enter || e.PlatformKeyCode == 10 ) commandButton_Click( sender, e );

			if ( KeyUp != null ) KeyUp( this, e );
		}

/*
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
/*		}

		private void ShowSelectedWord()
		{
			var result = VisualStateManager.GoToState( selectedWordTooltip, "Pressed", true );
		}

		private void HideSelectedWord()
		{
			var result = VisualStateManager.GoToState( selectedWordTooltip, "Normal", true );
		}*/
	}
}