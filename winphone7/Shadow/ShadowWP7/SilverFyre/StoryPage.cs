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
	public class StoryPage : PageBase
	{
		private static bool showInformation = true;

		public override bool HasInput { get { return !HasCommand; } }
		public override bool HasCommand { get { return StoryHistoryItem.HasCommand; } }

		public StoryPage( StoryHistoryItem storyHistoryItem )
			: base( storyHistoryItem, Channels.MAIN )
		{
			if ( showInformation )
			{
				Information = "You can swipe left or right to change page, or tap to move to the next page. Swipe left on the last page for the menu.";
				showInformation = false;
			}
		}
	}
}