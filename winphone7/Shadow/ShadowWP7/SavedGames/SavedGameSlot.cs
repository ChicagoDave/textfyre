using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ShadowWP7.SavedGames
{
	public class SavedGameSlot : DependencyObject
	{
		public static readonly DependencyProperty SlotProperty = DependencyProperty.Register(
			"Slot",
			typeof( int ),
			typeof( SavedGameSlot ),
			null );

		public int Slot
		{
			get { return (int)GetValue( SlotProperty ); }
			set { SetValue( SlotProperty, value ); }
		}

		public static readonly DependencyProperty GameProperty = DependencyProperty.Register(
			"Game",
			typeof( SavedGameSummary ),
			typeof( SavedGameSlot ),
			new PropertyMetadata( OnGameChanged ) );

		public SavedGameSummary Game
		{
			get { try { return (SavedGameSummary)GetValue( GameProperty ); } catch ( Exception ex ) { throw; } }
			set { try { SetValue( GameProperty, value ); } catch ( Exception ex ) { throw; } }
		}

		public string SlotName { get; set; }
		public string ProgressFile { get; private set; }
		public string GameFile { get { return "Game"; } }

		public SavedGameSlot Refresh()
		{
			if ( Game != null )
			{
				ProgressFile = Game.ProgressFile;
			}

			return this;
		}

		private static void OnGameChanged( DependencyObject obj, DependencyPropertyChangedEventArgs args )
		{
		}
	}
}