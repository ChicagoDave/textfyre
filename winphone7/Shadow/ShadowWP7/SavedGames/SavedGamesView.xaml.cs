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
using System.IO.IsolatedStorage;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace ShadowWP7.SavedGames
{
	public partial class SavedGamesView : UserControl, INotifyPropertyChanged
	{
		public class SavedGameEventArgs : EventArgs
		{
			public SavedGameSlot SavedGameSlot { get; private set; }

			public SavedGameEventArgs( SavedGameSlot savedGameSlot )
			{
				this.SavedGameSlot = savedGameSlot;
			}
		}

		public event EventHandler<SavedGameEventArgs> Selected;

		private IsolatedStorageFile storageFile = IsolatedStorageFile.GetUserStoreForApplication();
		private const int maxSlots = 10;

		public SavedGamesView()
		{
			InitializeComponent();

			slots.DataContext = this;
		}

		public ObservableCollection<SavedGameSlot> Slots
		{
			get { return storageFile.GetSavedGameSlots(); }
		}

		private void ListBox_SelectionChanged( object sender, SelectionChangedEventArgs e )
		{
			if ( Selected != null )
			{
				var item = (SavedGameSlot)slots.SelectedItem;

				Selected( this, new SavedGameEventArgs( item ) );
			}
		}

		public void Invalidate()
		{
			RaisePropertyChanged( "Slots" );		}

		public event PropertyChangedEventHandler PropertyChanged;

		public void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}
	}
}