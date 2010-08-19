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
	public class CreditsPage : PageBase
	{
		public CreditsPage( StoryHistoryItem storyHistoryItem )
			: base( storyHistoryItem, OutputChannel.Credits )
		{
		}
	}
}