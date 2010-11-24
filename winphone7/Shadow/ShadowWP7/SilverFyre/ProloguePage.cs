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
using FyreVM;

namespace Cjc.SilverFyre
{
	public class ProloguePage : PageBase
	{
		private static bool showInformation = true;

		public ProloguePage( StoryHistoryItem storyHistoryItem )
			: base( storyHistoryItem, Channels.PROLOGUE )
		{
			if ( showInformation )
			{
				Information = "You can tap the screen to move to the next page.";
				showInformation = false;
			}
		}
	}
}