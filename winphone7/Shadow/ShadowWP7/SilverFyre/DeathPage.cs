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
	public class DeathPage : PageBase
	{
		public override bool HasInput { get { return true; } }

		public DeathPage( StoryHistoryItem storyHistoryItem )
			: base( storyHistoryItem, Channels.DEATH )
		{
		}
	}
}