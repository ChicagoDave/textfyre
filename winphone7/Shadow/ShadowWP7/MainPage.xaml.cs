using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Xml.Linq;
using Cjc.SilverFyre;
using Microsoft.Phone.Controls;
using ShadowWP7.SavedGames;
using Textfyre.VM;

namespace ShadowWP7
{
    public partial class MainPage : PhoneApplicationPage, INotifyPropertyChanged
    {
		private EngineClient engine;
		private AutoResetEvent saveLoadItemSelected = new AutoResetEvent( false );
		private AutoResetEvent saveCompleted = new AutoResetEvent( false );
		private AutoResetEvent loadCompleted = new AutoResetEvent( false );
		private AutoResetEvent saveLoadCancelled = new AutoResetEvent( false );

		private IsolatedStorageFile storageFile = IsolatedStorageFile.GetUserStoreForApplication();
		private bool waitingForLoad = false;

		private ManualResetEvent gameLoaded = new ManualResetEvent( false );
		private bool engineRunning = false;
		private bool engineWaitingForKey = false;

		private int? selectedCommandIndex = null;
		private double? targetVerticalOffset = null;
		private bool pinnedToEnd = false;

		private UIElement hookedElement;
		private bool? isPanning;
		private double panOffset;
		private bool panCancelled;
		private bool scrollCancelled;
		private int lastScrolledPage;

		private SavedGameSlot savedGameSlot;

		private string baseUrl;
		private string storyUrl;

		public string StoryTitle { get { return "The Shadow in the Cathedral"; } }
		public ObservableCollection<StoryHistoryItem> History { get; private set; }
		public ObservableCollection<object> Pages { get; private set; }
		public StoryState CurrentState { get; private set; }
		public ItemsControlHelper StoryItemsHelper { get; private set; }
		public double PageWidth { get; private set; }

        // Constructor
        public MainPage()
        {
			DataContext = this;
			History = new ObservableCollection<StoryHistoryItem>();
			Pages = new ObservableCollection<object>();

            InitializeComponent();

			Pages.Add( new ImagePage( new BitmapImage( new Uri( "Images/shadow-wp7.jpg", UriKind.Relative ) ) ) );
			Pages.Add( new SavedGamesPage() );

			StoryItemsHelper = new ItemsControlHelper( storyItems );

			Loaded += delegate { ScrollTo( 1 ); };
//			Application.Current.Host.Settings.EnableCacheVisualization = true;
//			Application.Current.Host.Settings.EnableRedrawRegions = true;
		}

		private void SavedGamesView_Selected( object sender, SavedGames.SavedGamesView.SavedGameEventArgs e )
		{
			ShowPleaseWait();

			var selected = e.SavedGameSlot;

			if ( selected.Game == null ) selected.Game = new SavedGameSummary( "Loading...", "0", "0" );

			LoadGame( selected );
		}

		private void LoadGame( SavedGameSlot savedGameSlot )
		{
			if ( savedGameSlot != null ) SaveGame();
			if ( engine != null ) StopEngine();

			History.Clear();

			engine = LoadEngine( "shadow-1.2.ulx" );
			StartEngine();

			this.savedGameSlot = savedGameSlot;

			if ( savedGameSlot != null )
			{
				if ( savedGameSlot.HasProgressFile( storageFile ) )
				{
					using ( var stream = new MemoryStream() )
					{
						using ( var loadStream = savedGameSlot.LoadProgress( storageFile ) )
						{
							if ( loadStream != null ) Streams.CopyStream( loadStream, stream );
						}

						var buffer = stream.ToArray();

						if ( buffer.Length > 0 )
						{
							var xml = XElement.Parse( Encoding.UTF8.GetString( buffer, 0, buffer.Length ) );

							AddHistory( StoryHistoryItem.FromXml( xml ), true );
						}
					}
				}

				if ( savedGameSlot.HasGameFile( storageFile ) )
				{
					waitingForLoad = true;

					engine.SendLine( "RESTORE" );
					loadCompleted.WaitOne();
				}
			}
		}

		public void SaveGame( bool saveEngineState = true )
		{
			if ( engine != null && savedGameSlot != null )
			{
				var title = CurrentState.Location;
				var time = CurrentState.Time;
				var score = CurrentState.Score;
				var content = History.Last().ToXml();

				using ( var stream = new MemoryStream( Encoding.UTF8.GetBytes( content.ToString() ) ) )
				{
					savedGameSlot.SaveProgress( storageFile, title, time, score, stream );
				}

				if ( saveEngineState )
				{
					engine.SendLine( "SAVE" );
					saveCompleted.WaitOne();
				}
			}
		}

		private void StartEngine()
		{
			if ( !engineRunning )
			{
				engineRunning = true;

				engine.OutputReady += engine_OutputReady;
				engine.LoadRequested += engine_LoadRequested;
				engine.SaveRequested += engine_SaveRequested;
				engine.AwaitingLine += engine_AwaitingLine;
				engine.AwaitingKey += engine_AwaitingKey;

				engine.Start();
			}
		}

		public void StopEngine()
		{
			if ( engineRunning )
			{
				engineRunning = false;

				engine.Stop();

				engine.OutputReady -= engine_OutputReady;
				engine.LoadRequested -= engine_LoadRequested;
				engine.SaveRequested -= engine_SaveRequested;
				engine.AwaitingLine -= engine_AwaitingLine;
				engine.AwaitingKey -= engine_AwaitingKey;

				Dispatcher.BeginInvoke( delegate
				{
					while ( Pages.Count > 2 ) Pages.RemoveAt( 2 );
					History.Clear();
				} );
			}
		}

		void engine_LoadRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( savedGameSlot != null )
			{
				var stream = new NotifyingStream( savedGameSlot.GetLoadGameStream( storageFile ) );
				stream.Closed += delegate { loadCompleted.Set(); };

				e.Stream = stream;
			}
		}

		void engine_SaveRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( savedGameSlot != null )
			{
				var stream = new NotifyingStream( savedGameSlot.GetSaveGameStream( storageFile ) );
				stream.Closed += delegate { saveCompleted.Set(); };

				e.Stream = stream;
			}
		}

		protected override void OnBackKeyPress( CancelEventArgs e )
		{
			var page = CurrentStoryPageIndex;

			if ( page > 0 )
			{
				ScrollTo( page - 1 );
				e.Cancel = true;
			}
			else base.OnBackKeyPress( e );
		}

		void engine_OutputReady( object sender, OutputReadyEventArgs e )
		{
			if ( e.Package.Count > 0 )
			{
				if ( waitingForLoad )
				{
					if ( e.Package.ContainsKey( OutputChannel.Main ) && e.Package[ OutputChannel.Main ] == "<Paragraph>Ok.</Paragraph>" )
					{
						waitingForLoad = false;
					}
				}
				else
				{
					Dispatcher.BeginInvoke( delegate
					{
						HidePleaseWait();
						AddHistory( new StoryHistoryItem( null, e ), true );
					} );
				}
			}
		}

		void engine_AwaitingLine( object sender, EventArgs e )
		{
			engineWaitingForKey = false;
			HidePleaseWait();
		}

		void engine_AwaitingKey( object sender, EventArgs e )
		{
			engineWaitingForKey = true;
			HidePleaseWait();
		}

		private void ScrollToEnd()
		{
//			storyScroll.UpdateLayout();

//			if ( pinnedToEnd ) storyScroll.ScrollToVerticalOffset( double.MaxValue );
//			else targetVerticalOffset = storyScroll.ScrollableHeight;
		}

		private EngineClient LoadEngine( string filename )
		{
			using ( var story = Assembly.GetExecutingAssembly().GetManifestResourceStream( "ShadowWP7." + filename ) )
			{
				return new EngineClient( story );
			}
		}

		private void AddHistory( StoryHistoryItem item, bool scrollToEnd = true )
		{
			History.Add( item );

			int? nextPage = lastScrolledPage < 1 ? 0 : (int?)null;

			if ( item.OutputArgs != null )
			{
				CurrentState = item.State;

				if ( item.OutputArgs.Package.ContainsKey( OutputChannel.Prologue ) )
				{
					Pages.Add( new ProloguePage( item ) );
					if ( !nextPage.HasValue ) nextPage = Pages.Count - 1;
				}

				if ( item.OutputArgs.Package.ContainsKey( OutputChannel.Credits ) )
				{
					Pages.Add( new CreditsPage( item ) );
					if ( !nextPage.HasValue ) nextPage = Pages.Count - 1;
				}

				if ( item.OutputArgs.Package.ContainsKey( OutputChannel.Death ) )
				{
					Pages.Add( new DeathPage( item ) );
					if ( !nextPage.HasValue ) nextPage = Pages.Count - 1;
				}

				if ( item.OutputArgs.Package.ContainsKey( OutputChannel.Main ) )
				{
					Pages.Add( new StoryPage( item ) );
				}

				RaisePropertyChanged( "CurrentState" );
			}

			SaveGame( false );

			if ( scrollToEnd ) Dispatcher.BeginInvoke( delegate { ScrollTo( nextPage.GetValueOrDefault( Pages.Count - 1 ) ); } );
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

		private void OnCommand( object sender, CommandEventArgs e )
		{
			History.Last().SetCommand( e.Command );

			ShowPleaseWait();

			if ( engine != null ) engine.SendLine( e.Command );
		}

		private void OnCommandKeyDown( object sender, KeyEventArgs e )
		{
			var pageView = sender as StoryPageView;

			switch ( e.Key )
			{
				case Key.Up:
					{
						do
						{
							if ( !selectedCommandIndex.HasValue ) selectedCommandIndex = History.Count - 1;
							else if ( selectedCommandIndex >= 0 ) --selectedCommandIndex;
						}
						while ( selectedCommandIndex >= 0 && !History[ selectedCommandIndex.Value ].HasCommand );

						CurrentStoryPage.CommandText = ( selectedCommandIndex >= 0 )
							? History[ selectedCommandIndex.Value ].Command
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
						while ( selectedCommandIndex < History.Count && !History[ selectedCommandIndex.Value ].HasCommand );

						CurrentStoryPage.CommandText = ( selectedCommandIndex < History.Count )
							? History[ selectedCommandIndex.Value ].Command
							: "";

						e.Handled = true;
						break;
					}

				default:
					{
						selectedCommandIndex = null;

						if ( engine != null && e.Key != Key.Unknown )
						{
							engine.SendKey( (char)( e.PlatformKeyCode ) );

							if ( engineWaitingForKey )
							{
								this.Focus();
								ShowPleaseWait();
							}
						}

						break;
					}
			}

			ScrollToEnd();
		}

		private void OnCommandKeyUp( object sender, KeyEventArgs e )
		{
			if ( e.Key == Key.Enter || e.PlatformKeyCode == 10 ) this.Focus();
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
				panOffset = Math.Round( StoryItemsHelper.ScrollHost.HorizontalOffset );
			}

			if ( sender != e.OriginalSource ) HookManipulationSource( e.OriginalSource as UIElement );// VisualTreeHelper.GetParent( (DependencyObject)e.OriginalSource ) as UIElement );
		}

		void OnManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			if ( e.ManipulationContainer is ScrollViewer )
			{
				var deltaX = e.CumulativeManipulation.Translation.X;
				var deltaY = e.CumulativeManipulation.Translation.Y;

				if ( !isPanning.HasValue && ( deltaX != 0 || deltaY != 0 ) )
				{
					isPanning = Math.Abs( deltaX ) > Math.Abs( deltaY );
				}

				if ( isPanning.HasValue )
				{
					if ( isPanning.Value && StoryItemsHelper.ScrollHost != null )
					{
						panCancelled = ( e.CumulativeManipulation.Translation.X > 0 && e.DeltaManipulation.Translation.X < 0 )
							|| ( e.CumulativeManipulation.Translation.X < 0 && e.DeltaManipulation.Translation.X > 0 );

						StoryItemsHelper.ScrollHost.ScrollToHorizontalOffset( panOffset - ( e.CumulativeManipulation.Translation.X / RenderSize.Width ) );
						e.Handled = true;
					}
					else if ( !isPanning.Value )
					{
						UnhookManipulationSource();

						scrollCancelled = ( e.CumulativeManipulation.Translation.Y > 0 && e.DeltaManipulation.Translation.Y < 0 )
							|| ( e.CumulativeManipulation.Translation.Y < 0 && e.DeltaManipulation.Translation.Y > 0 );
					}
				}
			}
		}

		void OnManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			System.Diagnostics.Debug.WriteLine( "OnManipulationCompleted from {0}", e.OriginalSource.GetType().Name );

			var offset = StoryItemsHelper.ScrollHost.HorizontalOffset;

			if ( ( e.TotalManipulation.Translation.X != 0 && isPanning.GetValueOrDefault( false ) ) || offset != (int)offset )
			{
				var targetOffset = panCancelled
					? panOffset
					: ( e.TotalManipulation.Translation.X > 0 ) ? Math.Floor( offset ) : Math.Ceiling( offset );

				ScrollTo( (int)Math.Round( targetOffset ) );

				e.Handled = true;
			}

			UnhookManipulationSource();
/*			else if ( e.TotalManipulation.Translation.Y != 0 && !scrollCancelled )
			{
				var element = sender as FrameworkElement;
				var scrollViewer = element.FindName( "pageScroll" ) as ScrollViewer;
				var commandInput = scrollViewer.FindName( "commandInput" ) as CommandInput;

				if ( e.TotalManipulation.Translation.Y < 0
					&& scrollViewer.VerticalOffset >= scrollViewer.ScrollableHeight - commandInput.DesiredSize.Height )
				{
					ScrollHelper.ScrollTo( scrollViewer, Resources, "scrollPage", scrollViewer.VerticalOffset, scrollViewer.ScrollableHeight );
				}
				else if ( e.TotalManipulation.Translation.Y > 0
					&& scrollViewer.VerticalOffset >= scrollViewer.ScrollableHeight - commandInput.DesiredSize.Height )
				{
					ScrollHelper.ScrollTo( scrollViewer, Resources, "scrollPage", scrollViewer.VerticalOffset, scrollViewer.ScrollableHeight - commandInput.DesiredSize.Height );
				}
			}*/
		}

		private void HookManipulationSource( UIElement source )
		{
			UnhookManipulationSource();

//			while ( source != null && !( source is ScrollViewer ) ) source = VisualTreeHelper.GetParent( source ) as UIElement;

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

		private void ShowPleaseWait()
		{
			Dispatcher.BeginInvoke( delegate
			{
				pleaseWait.IsHitTestVisible = true;
				FindStoryboard( "showPleaseWait" ).Begin();
			} );
		}

		private void HidePleaseWait()
		{
			Dispatcher.BeginInvoke( delegate
			{
				pleaseWait.IsHitTestVisible = false;
				FindStoryboard( "hidePleaseWait" ).Begin();
			} );
		}

		private void ScrollTo( int page )
		{
			var scrollHost = StoryItemsHelper.ScrollHost;

			if ( scrollHost != null )
			{
				System.Diagnostics.Debug.WriteLine( string.Format( "Scrolling from {0} to {1}", scrollHost.HorizontalOffset, page ) );
				ScrollHelper.ScrollTo( scrollHost, Resources, "scrollStory", scrollHost.HorizontalOffset, page );
			}

			lastScrolledPage = page;
		}

		private void scrollStory_Completed( object sender, EventArgs e )
		{
		}

		private PageBase CurrentStoryPage
		{
			get { return storyItems.Items[ CurrentStoryPageIndex ] as PageBase; }
		}

		private int CurrentStoryPageIndex
		{
			get
			{
				var scrollHost = StoryItemsHelper.ScrollHost;

				return ( scrollHost != null ) ? (int)scrollHost.HorizontalOffset : 0;
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

		void OnPageManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			OnManipulationStarted( sender, e );
		}

		void OnPageManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			OnManipulationDelta( sender, e );
		}

		void OnPageManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			OnManipulationCompleted( sender, e );

			if ( !isPanning.GetValueOrDefault( false ) )
			{
				var element = sender as FrameworkElement;
				var page = element.DataContext as PageBase;

				if ( page.HasInput )
				{
					var container = storyItems.ItemContainerGenerator.ContainerFromIndex( CurrentStoryPageIndex );
					var scrollViewer = element.FindName( "pageScroll" ) as ScrollViewer;
					var commandInput = scrollViewer.FindName( "commandInput" ) as CommandInput;

					if ( e.TotalManipulation.Translation.Y < 0
						&& scrollViewer.VerticalOffset >= scrollViewer.ScrollableHeight - commandInput.DesiredSize.Height )
					{
						ScrollHelper.ScrollTo( scrollViewer, Resources, "scrollPage", scrollViewer.VerticalOffset, scrollViewer.ScrollableHeight );
					}
				}
			}
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion

		private void pageScroll_SizeChanged( object sender, SizeChangedEventArgs e )
		{
/*			var container = sender as ScrollViewer;
			var storyPageView = container.FindName(  sender. VisualTreeHelper.GetChild( panel, 0 ) as StoryPageView;
			var commandInput = VisualTreeHelper.GetChild( panel, 1 ) as CommandInput;

			storyPageView.MinHeight = e.NewSize.Height - commandInput.DesiredSize.Height;*/
		}

		private void OnStoryInteraction( object sender, CommandEventArgs e )
		{
			if ( CurrentStoryPage.State == CurrentState ) CurrentState.AppendCommand( e.Command );
		}

		private void CommandInput_SizeChanged( object sender, SizeChangedEventArgs e )
		{
/*			var commandInput = sender as CommandInput;
			var scrollViewer = commandInput.FindName( "pageScroll" ) as ScrollViewer;

			if ( scrollViewer.VerticalOffset == scrollViewer.ScrollableHeight - ( e.NewSize.Height - e.PreviousSize.Height ) )
			{
				scrollViewer.ScrollToVerticalOffset( scrollViewer.ScrollableHeight );
			}*/
		}

		private void storyItemsPanel_CleanUpVirtualizedItemEvent( object sender, CleanUpVirtualizedItemEventArgs e )
		{

		}

		private void self_OrientationChanged( object sender, OrientationChangedEventArgs e )
		{
		}

		private void LayoutRoot_SizeChanged( object sender, SizeChangedEventArgs e )
		{
			var helper = StoryItemsHelper;
			var itemsHost = helper.ItemsHost;

			if ( itemsHost != null )
			{
				foreach ( var child in itemsHost.Children.OfType<FrameworkElement>() )
				{
					child.Width = storyItems.DesiredSize.Width;
				}
			}

			Dispatcher.BeginInvoke( delegate
			{
				StoryItemsHelper.ScrollHost.ScrollToHorizontalOffset( lastScrolledPage );
			} );
		}
	}
}