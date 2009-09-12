using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO.IsolatedStorage;
using System.ComponentModel;
using System.Windows.Data;
using System.IO;

namespace Cjc.SilverGlulxe
{
	public partial class SaveLoadPopup : UserControl, IDependencyRelay, INotifyPropertyChanged
	{
		public event EventHandler ItemSelected;
		public event EventHandler Cancelled;

		public static readonly DependencyProperty TitleProperty = DependencyRelay.RegisterProperty(
			"Title",
			typeof( string ),
			typeof( SaveLoadPopup ) );

		public string Title
		{
			get { return (String)GetValue( TitleProperty ); }
			set { SetValue( TitleProperty, value ); }
		}

		public static readonly DependencyProperty ButtonCaptionProperty = DependencyRelay.RegisterProperty(
			"ButtonCaption",
			typeof( string ),
			typeof( SaveLoadPopup ) );

		public string ButtonCaption
		{
			get { return (String)GetValue( ButtonCaptionProperty ); }
			set { SetValue( ButtonCaptionProperty, value ); }
		}

		public SaveLoadPopup()
		{
			InitializeComponent();

			title.SetBinding( TextBlock.TextProperty, new Binding( "Title" ) { Source = this } );
			gameSaves.SetBinding( ListBox.ItemsSourceProperty, new Binding( "GameSaves" ) { Source = this } );
			button.SetBinding( Button.ContentProperty, new Binding( "ButtonCaption" ) { Source = this } );
		}

		public void Refresh()
		{
			RaisePropertyChanged( "GameSaves" );
			saveName.Focus();
		}

		public struct SaveInfo
		{
			public string Name;
			public string Description;
			public byte[] Content;
		}

		private const string saveFolder = "Saves";

		private IsolatedStorageFile Store
		{
			get { return IsolatedStorageFile.GetUserStoreForApplication(); }
		}

		public IEnumerable<string> GameSaves
		{
			get
			{
				return Store.DirectoryExists( saveFolder )
					? Store.GetFileNames( System.IO.Path.Combine( saveFolder, "*" ) )
					: new string[ 0 ];
			}
		}

		private void OnClick( object sender, RoutedEventArgs e )
		{
			if ( saveName.Text.Trim().Length > 0 && ItemSelected != null ) ItemSelected( this, EventArgs.Empty );
		}

		private void OnCancel( object sender, RoutedEventArgs e )
		{
			if ( Cancelled != null ) Cancelled( this, EventArgs.Empty );
		}

		private void OnFileSelected( object sender, SelectionChangedEventArgs e )
		{
			saveName.Text = ( e.AddedItems.Count > 0 ) ? e.AddedItems[ 0 ].ToString() : "";
		}

		public string SaveFileName { get { return saveName.Text; } }

		public IsolatedStorageFileStream GetSaveFile( string name, bool canCreate )
		{
			if ( string.IsNullOrEmpty( name ) ) return null;
			if ( !canCreate && !SaveFileExists( name ) ) return null;
			if ( !Store.DirectoryExists( saveFolder ) ) Store.CreateDirectory( saveFolder );

			return Store.OpenFile( System.IO.Path.Combine( saveFolder, name ), FileMode.OpenOrCreate );
		}

		public bool SaveFileExists( string name )
		{
			return Store.DirectoryExists( saveFolder )
				&& Store.FileExists( System.IO.Path.Combine( saveFolder, name ) );
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion

		#region IDependencyRelay Members

		public void OnDependencyPropertyChanged( string name, DependencyPropertyChangedEventArgs args )
		{
			RaisePropertyChanged( name );
		}

		#endregion

		private void OnKeyDown( object sender, KeyEventArgs e )
		{
			switch ( e.Key )
			{
				case Key.Enter:
					{
						OnClick( sender, null );
						break;
					}

				case Key.Escape:
					{
						OnCancel( sender, null );
						e.Handled = true;
						break;
					}

				case Key.Up:
				case Key.Down:
					{
						gameSaves.Focus();
						break;
					}
			}
		}
	}
}