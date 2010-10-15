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
		public int Slot { get; set; }
		public SavedGameSummary Game { get; set; }

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
	}
}