using System;
using System.ComponentModel;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Animation;
using Cjc.SilverFyre;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using ShadowWP7.Helpers;
using ShadowWP7.SavedGames;
using Textfyre.VM;
using System.Windows.Controls;
using ShadowWP7.Controls;

namespace ShadowWP7
{
    public partial class MainPage : PhoneApplicationPage, INotifyPropertyChanged
    {
		private const string slotSetting = "Slot";

		private IsolatedStorageSettings settings;
		private IsolatedStorageFile storageFile;
		private SavedGameSlot savedGameSlot;
		private StoryCache storyCache;
		private string lastCommand;

		private EngineClient engine;
		private bool engineRunning;
		private bool awaitingKey;
		private bool awaitingLine;

		private bool waitingForLoad;
		private bool waitingForSave;
		private AutoResetEvent saveCompleted = new AutoResetEvent( false );
		private AutoResetEvent loadCompleted = new AutoResetEvent( false );

		private Point lastManipulation;

		private static readonly string[] saveLoadResponses = new[]
			{
				"<Paragraph>Ok.</Paragraph>",
				"<Paragraph>Save failed.</Paragraph>",
				"<Paragraph>Restore failed.</Paragraph>"
			};

        // Constructor
        public MainPage()
        {
			DataContext = this;

            InitializeComponent();

			settings = IsolatedStorageSettings.ApplicationSettings;
			storageFile = IsolatedStorageFile.GetUserStoreForApplication();

            //HTDocs.MoveFiles(storageFile);

			var savedGameSlots = storageFile.GetSavedGameSlots().ToDictionary( s => s.Slot, s => s );

			var slot = settings.Contains( slotSetting )
				? Convert.ToInt32( settings[ slotSetting ] )
				: savedGameSlots.Where( s => s.Value != null ).Select( s => s.Key ).FirstOrDefault();

			savedGameSlot = savedGameSlots[ slot ];
			storyCache = new StoryCache( savedGameSlot, storageFile );

			engine = LoadEngine( "shadow-1.2.ulx" );

			if ( savedGameSlot.Game != null && savedGameSlot.HasGameFile( storageFile ) )
			{
				waitingForLoad = true;
				engine.SendLine( "RESTORE" );
			}
			else storyCache.DeleteProgress();

			settings[ slotSetting ] = slot;

			StartEngine();
		}

		public void SaveGame()
		{
			if ( engine != null && savedGameSlot != null )
			{
				waitingForSave = true;
				engine.SendLine( "SAVE" );
				saveCompleted.WaitOne();
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
			var page = pager.CurrentPage;

			if ( page > 0 )
			{
				pager.CurrentPage --;
				e.Cancel = true;
			}
			else base.OnBackKeyPress( e );
		}

		void engine_OutputReady( object sender, OutputReadyEventArgs e )
		{
			if ( e.Package.Count > 0 )
			{
				awaitingLine = false;
				awaitingKey = false;

				if ( waitingForLoad || waitingForSave )
				{
					if ( ( e.Package.ContainsKey( OutputChannel.Main ) && saveLoadResponses.Contains( e.Package[ OutputChannel.Main ] ) )
						|| e.Package.ContainsKey( OutputChannel.Death ) )
					{
						waitingForLoad = waitingForSave = false;
					}
				}
				else
				{
					Dispatcher.BeginInvoke( delegate { ApplicationBar.IsVisible = false; } );

					var nextPage = ( storyCache.LastPage ?? 0 ) + 1;

					storyCache.SaveProgress( lastCommand, new StoryHistoryItem( null, e ) );

					pager.PurgeCache( nextPage );
					pager.LoadPage( pager.CurrentPage );
					pager.CurrentPage = nextPage;
				}
			}
		}

		void engine_AwaitingLine( object sender, EventArgs e )
		{
			awaitingLine = true;
			awaitingKey = false;
		}

		void engine_AwaitingKey( object sender, EventArgs e )
		{
			awaitingKey = true;
			awaitingLine = false;
		}

		private void ScrollToEnd()
		{
		}

		private EngineClient LoadEngine( string filename )
		{
			using ( var story = Assembly.GetExecutingAssembly().GetManifestResourceStream( "ShadowWP7." + filename ) )
			{
				return new EngineClient( story );
			}
		}

		private Storyboard FindStoryboard( string name )
		{
			return (Storyboard)Resources[ name ];
		}

		private void OnCommand( object sender, CommandEventArgs e )
		{
			lastCommand = e.Command;

			if ( engine != null ) engine.SendLine( e.Command );
		}

		private void OnCommandKeyDown( object sender, KeyEventArgs e )
		{
			var pageView = sender as Pages.StoryPageView;

			switch ( e.Key )
			{
				case Key.Up:
					{/*
						do
						{
							if ( !selectedCommandIndex.HasValue ) selectedCommandIndex = History.Count - 1;
							else if ( selectedCommandIndex >= 0 ) --selectedCommandIndex;
						}
						while ( selectedCommandIndex >= 0 && !History[ selectedCommandIndex.Value ].HasCommand );

						CurrentStoryPage.CommandText = ( selectedCommandIndex >= 0 )
							? History[ selectedCommandIndex.Value ].Command
							: "";

						e.Handled = true;*/
						break;
					}

				case Key.Down:
					{/*
						do
						{
							if ( !selectedCommandIndex.HasValue ) selectedCommandIndex = 0;
							else if ( selectedCommandIndex < History.Count ) ++selectedCommandIndex;
						}
						while ( selectedCommandIndex < History.Count && !History[ selectedCommandIndex.Value ].HasCommand );

						CurrentStoryPage.CommandText = ( selectedCommandIndex < History.Count )
							? History[ selectedCommandIndex.Value ].Command
							: "";

						e.Handled = true;*/
						break;
					}

				default:
					{
//						selectedCommandIndex = null;

						if ( engine != null && e.Key != Key.Unknown )
						{
							lastCommand = "";

							engine.SendKey( (char)( e.PlatformKeyCode ) );

							if ( awaitingKey )
							{
								this.Focus();
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

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion

		private void pager_PageRequest( object sender, Controls.PageRequestEventArgs e )
		{
			if ( storyCache != null )
			{
				var outsideBounds = 0;
				e.DataContext = storyCache.GetPage( e.Index, out outsideBounds );

				if ( e.DataContext == null && storyCache.CurrentHistoryItem != null )
				{
					switch ( outsideBounds )
					{
						case 1: e.DataContext = new Pages.MenuPage(); break;
						case 2: e.DataContext = new Pages.Intro3(); break;
						//case 3: e.DataContext = new Pages.Intro2(); break;
					}
				}
			}
		}

		private void load_Click( object sender, EventArgs e )
		{
			SetSaveLoadEnabled( false );

//			SaveGame();
			savedGames.Invalidate();			

			FindStoryboard( "showSavedGames" ).Begin();
		}

		private void save_Click( object sender, EventArgs e )
		{
			SetSaveLoadEnabled( false );

			SaveGame();

			SetSaveLoadEnabled( true );
		}

		private void savedGames_Selected( object sender, SavedGamesView.SavedGameEventArgs e )
		{
			savedGameSlot = e.SavedGameSlot;

			if ( savedGameSlot != null )
			{
				pager.Clear();

				storyCache = new StoryCache( savedGameSlot, storageFile );

				if ( savedGameSlot.Game != null && savedGameSlot.HasGameFile( storageFile ) )
				{
					waitingForLoad = true;
					engine.SendLine( "RESTORE" );
				}
				else
				{
					StopEngine();

					storyCache.DeleteProgress();

					engine = LoadEngine( "shadow-1.2.ulx" );
					StartEngine();
				}

				settings[ slotSetting ] = e.SavedGameSlot.Slot;

				FindStoryboard( "hideSavedGames" ).Begin();

				SetSaveLoadEnabled( true );
				pager.InvalidateArrange();
			}
		}

		private void cancel_Click( object sender, EventArgs e )
		{
			FindStoryboard( "hideSavedGames" ).Begin();

			SetSaveLoadEnabled( true );
		}

		private void SetSaveLoadEnabled( bool enabled )
		{
			foreach ( var b in ApplicationBar.Buttons.OfType<ApplicationBarIconButton>() )
			{
				b.IsEnabled = ( b.IconUri.OriginalString.Contains( "save" ) || b.IconUri.OriginalString.Contains( "folder" ) )
					? enabled
					: !enabled;
			}
		}

		private void savedGames_VisibilityChanged( object sender, EventArgs e )
		{
			savedGames.IsHitTestVisible = savedGames.Opacity > 0;
		}

		private void pager_ManipulationStarted( object sender, ManipulationStartedEventArgs e )
		{
			lastManipulation = new Point();
		}

		private void pager_ManipulationCompleted( object sender, ManipulationCompletedEventArgs e )
		{
			lastManipulation = e.TotalManipulation.Translation;
		}

		private void pager_MouseLeftButtonUp( object sender, MouseButtonEventArgs e )
		{
			if ( lastManipulation.X == 0 && lastManipulation.Y == 0
				&& !( FocusManager.GetFocusedElement() is TextBox )
				&& e.OriginalSource is Image /* Page content image; TODO: Improve this :) */ )
			{
				int outsideBounds;

				if ( !ApplicationBar.IsVisible
					&& storyCache != null
					&& storyCache.GetPage( pager.CurrentPage + 1, out outsideBounds ) != null )
				{
					pager.CurrentPage++;
				}
				else
				{
					ApplicationBar.IsVisible = !ApplicationBar.IsVisible;
				}
			}
		}
	}
}