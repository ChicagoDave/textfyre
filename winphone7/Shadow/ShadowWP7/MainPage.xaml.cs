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
using Textfyre.VM;
using System.IO;
using System.Reflection;
using Cjc.SilverFyre;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Threading;
using Phone.Controls.Samples;

namespace ShadowWP7
{
    public partial class MainPage : PhoneApplicationPage, INotifyPropertyChanged
    {
		private EngineClient engine;
		private AutoResetEvent saveLoadItemSelected = new AutoResetEvent( false );
		private AutoResetEvent saveLoadCompleted = new AutoResetEvent( false );
		private AutoResetEvent saveLoadCancelled = new AutoResetEvent( false );

		private int? selectedCommandIndex = null;
		private double? targetVerticalOffset = null;
		private bool pinnedToEnd = false;

		private bool? isPanning;
		private double panOffset;

		private string baseUrl;
		private string storyUrl;
		private ManipulationHook hook = new ManipulationHook();

        // Constructor
        public MainPage()
        {
			History = new ObservableCollection<StoryHistoryItem>();

            InitializeComponent();

			engine = Load( "shadow-1.2.ulx" );

			engine.OutputReady += engine_OutputReady;

			StoryItemsHelper = new ItemsControlHelper( storyItems );
        }

		public string StoryTitle { get { return "The Shadow in the Cathedral"; } }
		public ObservableCollection<StoryHistoryItem> History { get; private set; }
		public StoryState CurrentState { get; private set; }
		public ItemsControlHelper StoryItemsHelper { get; private set; }

		void engine_OutputReady( object sender, OutputReadyEventArgs e )
		{
			if ( e.Package.Count > 0 )
			{
				Dispatcher.BeginInvoke( delegate
				{
					pleaseWait.Visibility = Visibility.Collapsed;
					pleaseWait.Opacity = 0;
					AddHistory( new StoryHistoryItem( null, e ) );
				} );
			}
		}

		private void ScrollToEnd()
		{
//			storyScroll.UpdateLayout();

//			if ( pinnedToEnd ) storyScroll.ScrollToVerticalOffset( double.MaxValue );
//			else targetVerticalOffset = storyScroll.ScrollableHeight;
		}

		private EngineClient Load( string filename )
		{
			using ( var story = Assembly.GetExecutingAssembly().GetManifestResourceStream( "ShadowWP7." + filename ) )
			{
				return new EngineClient( story );
			}
		}

		private void AddHistory( StoryHistoryItem item )
		{
//			pinnedToEnd = false;
			History.Add( item );

			if ( item.OutputArgs != null )
			{
				CurrentState = new StoryState( item.OutputArgs );
				RaisePropertyChanged( "CurrentState" );
			}

			ScrollTo( History.Count );
		}

		private Storyboard FindStoryboard( string name )
		{
			return (Storyboard)Resources[ name ];
		}

		private void OnParagraphLoaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );
		}

		private void OnCommand( object sender, RoutedEventArgs e )
		{
			History.Last().SetInput( commandBox.Text );
//			AddHistory( new StoryHistoryItem( commandBox.Text, null ) );

			FindStoryboard( "showPleaseWait" ).Begin();
			pleaseWait.Visibility = Visibility.Visible;

			if ( engine != null ) engine.SendLine( commandBox.Text );
			commandBox.Text = "";
		}

		private void OnCommandKeyDown( object sender, KeyEventArgs e )
		{
			switch ( e.Key )
			{
				case Key.Enter:
					{
						OnCommand( sender, null );
						break;
					}

				case Key.Up:
					{
						do
						{
							if ( !selectedCommandIndex.HasValue ) selectedCommandIndex = History.Count - 1;
							else if ( selectedCommandIndex >= 0 ) --selectedCommandIndex;
						}
						while ( selectedCommandIndex >= 0 && !History[ selectedCommandIndex.Value ].HasInput );

						commandBox.Text = ( selectedCommandIndex >= 0 )
							? History[ selectedCommandIndex.Value ].Input
							: "";

						e.Handled = true;
						break;
					}

				case Key.Down:
					{
						do
						{
							if ( !selectedCommandIndex.HasValue ) selectedCommandIndex = 0;
							else if ( selectedCommandIndex < History.Count ) ++selectedCommandIndex;
						}
						while ( selectedCommandIndex < History.Count && !History[ selectedCommandIndex.Value ].HasInput );

						commandBox.Text = ( selectedCommandIndex < History.Count )
							? History[ selectedCommandIndex.Value ].Input
							: "";

						e.Handled = true;
						break;
					}

				default:
					{
						selectedCommandIndex = null;
						if ( engine != null ) engine.SendKey( (char)( e.PlatformKeyCode ) );
						break;
					}
			}

			ScrollToEnd();
		}

		private void OnCommandKeyUp( object sender, KeyEventArgs e )
		{
			switch ( e.Key )
			{
				case Key.Enter:
					{
						this.Focus();
						break;
					}
			}
		}

		private void OnSaveLoadHidden( object sender, EventArgs e )
		{
//			saveLoadPopup.Visibility = Visibility.Collapsed;
		}

		private void OnLoadingHidden( object sender, EventArgs e )
		{
//			loading.Visibility = Visibility.Collapsed;
		}

		private void OnSaveLoadItemSelected( object sender, EventArgs e )
		{
//			saveLoadItemSelected.Set();
		}

		private void OnSaveLoadCancelled( object sender, EventArgs e )
		{
//			saveLoadCancelled.Set();
		}

		void OnManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			isPanning = null;

			if ( StoryItemsHelper.ScrollHost != null )
			{
				panOffset = StoryItemsHelper.ScrollHost.HorizontalOffset;
			}
//			hook.Hook( e.ManipulationContainer );
//			hook.HookDeltaHandler( 
		}

		void OnManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			var deltaX = e.CumulativeManipulation.Translation.X;
			var deltaY = e.CumulativeManipulation.Translation.Y;

			if ( !isPanning.HasValue && ( deltaX != 0 || deltaY != 0 ) )
			{
				isPanning = Math.Abs( deltaX ) > Math.Abs( deltaY );
			}

			if ( isPanning.GetValueOrDefault( false ) && StoryItemsHelper.ScrollHost != null )
			{
				StoryItemsHelper.ScrollHost.ScrollToHorizontalOffset( panOffset - ( e.CumulativeManipulation.Translation.X / 480 ) );

				e.Handled = true;
			}
		}

		void OnManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			if ( e.TotalManipulation.Translation.X != 0 && isPanning.GetValueOrDefault( false ) )
			{
				ScrollTo( (int)( panOffset + ( e.TotalManipulation.Translation.X < 0 ? 1 : -1 ) ) );
			}
		}

		private void ScrollTo( int page )
		{
			var scrollHost = StoryItemsHelper.ScrollHost;

			if ( scrollHost != null )
			{
				var mediator = FindName( "scrollMediator" ) as ScrollViewerOffsetMediator;
				mediator.ScrollViewer = StoryItemsHelper.ScrollHost;

				var storyboard = FindStoryboard( "scrollPage" );
				var animation = storyboard.Children.First() as DoubleAnimation;

				animation.From = scrollHost.HorizontalOffset;
				animation.To = page;

				storyboard.Begin();
			}
		}

		private VirtualizingStackPanel StoryStackPanel
		{
			get
			{
				if ( storyItems.Items.Count > 0 )
				{
					var container = storyItems.ItemContainerGenerator.ContainerFromIndex( 0 );

					if ( container != null ) return VisualTreeHelper.GetParent( container ) as VirtualizingStackPanel;
				}

				return null;
			}
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion
	}
}