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
using Textfyre.VM;

namespace Cjc.SilverFyre
{
	public class StoryPage : PageBase
	{
		public override bool HasInput { get { return !HasCommand; } }
		public override bool HasCommand { get { return StoryHistoryItem.HasCommand; } }

		public StoryPage( StoryHistoryItem storyHistoryItem )
			: base( storyHistoryItem, OutputChannel.Main )
		{
		}
	}
}