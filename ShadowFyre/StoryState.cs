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
using Textfyre.VM;

namespace Textfyre.ShadowFyre
{
	public class StoryState
	{
		public StoryState( OutputReadyEventArgs outputArgs )
		{
			if ( outputArgs.Package.ContainsKey( OutputChannel.Location ) ) Location = outputArgs.Package[ OutputChannel.Location ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Score ) ) Score = outputArgs.Package[ OutputChannel.Score ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Time ) ) Time = outputArgs.Package[ OutputChannel.Time ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Prompt ) ) Prompt = outputArgs.Package[ OutputChannel.Prompt ].Trim();
			else Prompt = ">";
		}

		public string Location { get; private set; }
		public string Score { get; private set; }
		public string Time { get; private set; }
		public string Prompt { get; private set; }
	}
}