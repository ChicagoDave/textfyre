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

		private string baseUrl;
		private string storyUrl;

        // Constructor
        public MainPage()
        {
			History = new ObservableCollection<StoryHistoryItem>();

            InitializeComponent();

			engine = Load( "Lowell's Paradise.ulx" );

			engine.OutputReady += engine_OutputReady;
        }

		public string StoryTitle { get { return "Lowell's Paradise"; } }
		public ObservableCollection<StoryHistoryItem> History { get; private set; }
		public StoryState CurrentState { get; private set; }

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
/*			AddHistory( new StoryHistoryItem( commandBox.Text, null ) );

			FindStoryboard( "showPleaseWait" ).Begin();
			pleaseWait.Visibility = Visibility.Visible;

			if ( engine != null ) engine.SendLine( commandBox.Text );
			commandBox.Text = "";*/
		}

		private void OnCommandKey( object sender, KeyEventArgs e )
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

/*						commandBox.Text = ( selectedCommandIndex >= 0 )
							? History[ selectedCommandIndex.Value ].Input
							: "";
						*/
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

/*						commandBox.Text = ( selectedCommandIndex < History.Count )
							? History[ selectedCommandIndex.Value ].Input
							: "";*/

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

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion
	}
}