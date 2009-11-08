using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Threading;
using System.Windows;
using System.Windows.Browser;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using Textfyre.VM;
using System.Net;
using System.Xml;
using System.Xml.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Cjc.SilverFyre
{
	public partial class Page : UserControl, INotifyPropertyChanged
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

		public Page()
		{
			baseUrl = App.Current.Host.Source.AbsoluteUri;
			baseUrl = baseUrl.Substring( 0, baseUrl.IndexOf( "/ClientBin" ) );

			InitializeComponent();

			History = new ObservableCollection<StoryHistoryItem>();
			story.ItemsSource = History;

			LayoutRoot.SetBinding( Grid.DataContextProperty, new Binding( "CurrentState" ) { Source = this } );

			story.SizeChanged += delegate
			{
				ScrollToEnd();
			};

			scaleSlider.ValueChanged += delegate
			{
				layoutTransform.Transform = new ScaleTransform { ScaleX = scaleSlider.Value, ScaleY = scaleSlider.Value };
			};

			storyUrl = GetStoryUrl();

			AsyncLoader.Load(
				storyUrl.Contains( ':' ) ? string.Format( "Server.ashx?u={0}", storyUrl ) : storyUrl,
				OnLoaded );

			new MouseWheelHelper( storyScroll ).Moved += delegate( object sender, MouseWheelEventArgs e )
			{
				pinnedToEnd = false;
				targetVerticalOffset = Math.Max( 0,
					Math.Min( storyScroll.ScrollableHeight, storyScroll.VerticalOffset - ( e.Delta * storyScroll.ViewportHeight * 0.2 ) ) );
				e.Handled = true;
			};

			CompositionTarget.Rendering += delegate
			{
				if ( targetVerticalOffset.HasValue )
				{
					var scrollDiff = targetVerticalOffset.Value - storyScroll.VerticalOffset;

					if ( Math.Abs( scrollDiff ) > 0.9 )
					{
						storyScroll.ScrollToVerticalOffset( storyScroll.VerticalOffset + ( scrollDiff * 0.2 ) );
					}
					else
					{
						storyScroll.ScrollToVerticalOffset( targetVerticalOffset.Value );

						pinnedToEnd = ( targetVerticalOffset.Value == storyScroll.ScrollableHeight );
						targetVerticalOffset = null;
					}
				}
			};

			Loaded += delegate
			{
				commandBox.UpdateLayout();
				commandBox.Focus();
			};

			FindStoryboard( "showLoading" ).Begin();
		}

		private string GetStoryUrl()
		{
			if ( App.Current.Resources.Contains( "story" ) ) return Uri.EscapeUriString( App.Current.Resources[ "story" ].ToString() );
			if ( HtmlPage.Document.QueryString.ContainsKey( "s" ) ) return Uri.EscapeUriString( HtmlPage.Document.QueryString[ "s" ] );

            return "sh-v1.0de.ulx";
		}

		public ObservableCollection<StoryHistoryItem> History { get; private set; }

		public StoryState CurrentState { get; private set; }

		private void ScrollToEnd()
		{
			storyScroll.UpdateLayout();

			if ( pinnedToEnd ) storyScroll.ScrollToVerticalOffset( double.MaxValue );
			else targetVerticalOffset = storyScroll.ScrollableHeight;
		}

		private void OnLoaded( Stream stream )
		{
			engine = new EngineClient( stream );

			engine.OutputReady += new OutputReadyEventHandler( engine_OutputReady );
			engine.LoadRequested += new SaveRestoreEventHandler( engine_LoadRequested );
			engine.SaveRequested += new SaveRestoreEventHandler( engine_SaveRequested );

			FindStoryboard( "hideLoading" ).Begin();
			FindStoryboard( "showPleaseWait" ).Begin();
		}

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

		void engine_LoadRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( ShowSaveLoad( "Load" ) )
			{
				var loadComplete = new AutoResetEvent( false );

				Dispatcher.BeginInvoke( delegate
				{
					try
					{
						var name = saveLoadPopup.SaveFileName;

						if ( saveLoadPopup.SaveFileExists( name ) )
						{
							var stream = saveLoadPopup.GetSaveFile( name, false );
							var buffer = new byte[ stream.Length ];
							stream.Read( buffer, 0, buffer.Length );
							e.Stream = new MemoryStream( buffer );
						}
					}
					catch
					{
						// Ignore errors for now
					}
					finally
					{
						loadComplete.Set();
					}
				} );

				loadComplete.WaitOne();
			}

			HideSaveLoad();
		}

		void engine_SaveRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( ShowSaveLoad( "Save" ) )
			{
				var stream = new DeferredMemoryStream();
				var saveComplete = new AutoResetEvent( false );

				stream.Closed += delegate
				{
					Dispatcher.BeginInvoke( delegate
					{
						try
						{
							saveLoadPopup.GetSaveFile( saveLoadPopup.SaveFileName, true ).Write( stream.GetBuffer(), 0, (int)stream.Length );
						}
						catch
						{
							// Ignore errors for now
						}
						finally
						{
							HideSaveLoad();
						}
					} );
				};

				e.Stream = stream;
			}
			else HideSaveLoad();
		}

		private bool ShowSaveLoad( string actionName )
		{
			// Show dialog
			Dispatcher.BeginInvoke( delegate
			{
				saveLoadPopup.Title = actionName + " Game";
				saveLoadPopup.ButtonCaption = actionName;
				saveLoadPopup.Visibility = Visibility.Visible;
				saveLoadPopup.Refresh();

				FindStoryboard( "showSaveLoad" ).Begin();
			} );

			// Wait for selection or cancel
			var handles = new[] { saveLoadItemSelected, saveLoadCancelled };

			return ( WaitHandle.WaitAny( handles ) == 0 );
		}

		private void HideSaveLoad()
		{
			// Hide dialog
			Dispatcher.BeginInvoke( delegate
			{
				FindStoryboard( "hideSaveLoad" ).Begin();
				commandBox.Focus();
			} );
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
			AddHistory( new StoryHistoryItem( commandBox.Text, null ) );

			FindStoryboard( "showPleaseWait" ).Begin();
			pleaseWait.Visibility = Visibility.Visible;

			if ( engine != null ) engine.SendLine( commandBox.Text );
			commandBox.Text = "";
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
						break;
					}
			}

			ScrollToEnd();
		}

		private void AddHistory( StoryHistoryItem item )
		{
			pinnedToEnd = false;
			History.Add( item );

			if ( item.OutputArgs != null )
			{
				CurrentState = new StoryState( item.OutputArgs );
				RaisePropertyChanged( "CurrentState" );
			}
		}

		private void OnSaveLoadHidden( object sender, EventArgs e )
		{
			saveLoadPopup.Visibility = Visibility.Collapsed;
		}

		private void OnLoadingHidden( object sender, EventArgs e )
		{
			loading.Visibility = Visibility.Collapsed;
		}

		private void OnSaveLoadItemSelected( object sender, EventArgs e )
		{
			saveLoadItemSelected.Set();
		}

		private void OnSaveLoadCancelled( object sender, EventArgs e )
		{
			saveLoadCancelled.Set();
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion

		private void Transcript( object sender, RoutedEventArgs e )
		{
			var transcript = History.ToArray();

			var request = HttpWebRequest.Create( new Uri( baseUrl + "/UploadTranscript.ashx", UriKind.Absolute ) );
			request.Method = "POST";

			request.BeginGetRequestStream( delegate( IAsyncResult requestResult )
			{
				try
				{
					using ( var stream = request.EndGetRequestStream( requestResult ) )
					{
						var settings = new XmlWriterSettings { Indent = true, IndentChars = "\t" };
						using ( var writer = XmlWriter.Create( stream, settings ) )
						{
//							writer.WriteProcessingInstruction( "xml-stylesheet", "type=\"text/xsl\" encoding=\"UTF-8\" href=\"Transcript.xslt\" version=\"1.0\"" );

							writer.WriteStartElement( "Transcript" );
							writer.WriteAttributeString( "storyUrl", Uri.UnescapeDataString( storyUrl ) );

							foreach ( var item in transcript )
							{
								if ( item.HasInput ) writer.WriteElementString( "Input", item.Input );

								if ( item.HasOutput )
								{
									writer.WriteStartElement( "Output" );

									foreach ( var channel in item.OutputArgs.Package )
									{
										writer.WriteStartElement( channel.Key.ToString() );

										if ( channel.Value.IsXml() ) writer.WriteRaw( StoryHistoryItem.EnsureXml( channel.Value ) );
										else writer.WriteString( channel.Value );

										writer.WriteEndElement();
									}

									writer.WriteEndElement();
								}
							}

							writer.WriteEndElement();
						}
					}

					request.BeginGetResponse( delegate( IAsyncResult responseResult )
					{
						try
						{
							var response = request.EndGetResponse( responseResult );
							var buffer = new byte[ response.ContentLength ];
							response.GetResponseStream().Read( buffer, 0, buffer.Length );

							Dispatcher.BeginInvoke( delegate
							{
								HtmlPage.Window.Navigate(
									new Uri( string.Format( "{0}/Transcript.aspx?k={1}",
										baseUrl,
										Encoding.UTF8.GetString( buffer, 0, buffer.Length ) ) ),
									"_blank" );
							} );
						}
						// TODO: Handle this...
						catch { }

					}, null );
				}
				// TODO: Handle this...
				catch { }

			}, null );
		}
	}
}