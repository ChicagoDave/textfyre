using System;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO.IsolatedStorage;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace ShadowWP7.SavedGames
{
	public static class SavedGamesExtensions
	{
		private static Regex saveSlotName = new Regex( "^SaveSlot_(?<index>.*?)$", RegexOptions.Compiled );
		private static Regex saveFileName = new Regex( "^(?<index>.*?)_(?<title>.*?)_(?<turn>[0-9]*?)_(?<step>[0-9]*?)_(?<score>[0-9]*?)_(?<created>.*?)$", RegexOptions.Compiled );
		private const int maxSlots = 10;

		public static ObservableCollection<SavedGameSlot> GetSavedGameSlots( this IsolatedStorageFile file )
		{
			var games = GetSavedGames( file ).ToDictionary( g => g.Key, g => g.Value );
			var slots = new ObservableCollection<SavedGameSlot>();

			foreach ( var s in Enumerable.Range( 1, maxSlots ) )
			{
				var game = games.ContainsKey( s ) ? games[ s ] : null;
				var slotName = GetSlotName( s );

				slots.Add( new SavedGameSlot { SlotName = slotName, Slot = s, Game = game }.Refresh() );
			}

			return slots;
		}

		private static string GetSlotName( int slot )
		{
			return string.Format( "SaveSlot_{0:d2}", slot );
		}

		private static IEnumerable<KeyValuePair<int, SavedGameSummary>> GetSavedGames( IsolatedStorageFile file )
		{
			foreach ( var directory in file.GetDirectoryNames( "SaveSlot_*" ).OrderBy( f => f ) )
			{
				var saveSlot = saveSlotName.Match( directory );
				var progressFile = file.GetFileNames( System.IO.Path.Combine( directory, "*.*" ) ).FirstOrDefault( f => f.StartsWith( "Current_" ));

				if ( progressFile != null )
				{
					var progress = saveFileName.Match( progressFile );
					var slot = int.Parse( saveSlot.Groups[ "index" ].Value );

					yield return new KeyValuePair<int, SavedGameSummary>( slot, new SavedGameSummary( progressFile ) );
				}
			}
		}
	}
/*
	public class SavedGameSlots : INotifyPropertyChanged
	{
		public IDictionary<int, SavedGameSummary> Slots { get; set; }

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion
	}*/
}