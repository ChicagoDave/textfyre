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
using System.Collections.Generic;

namespace Cjc.SilverFyre
{
	public class StoryState : DependencyObject
	{
		public StoryState( OutputReadyEventArgs outputArgs )
		{
			if ( outputArgs.Package.ContainsKey( OutputChannel.Location ) ) Location = outputArgs.Package[ OutputChannel.Location ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Score ) ) Score = outputArgs.Package[ OutputChannel.Score ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Time ) ) Time = outputArgs.Package[ OutputChannel.Time ].Trim();
			if ( outputArgs.Package.ContainsKey( OutputChannel.Prompt ) ) Prompt = outputArgs.Package[ OutputChannel.Prompt ].Trim();
			else Prompt = ">";
		}

		public static readonly DependencyProperty CommandTextProperty = DependencyProperty.Register(
			"CommandText",
			typeof( string ),
			typeof( StoryState ),
			null );

		public string CommandText
		{
			get { return (string)GetValue( CommandTextProperty ); }
			set { SetValue( CommandTextProperty, value ); }
		}

		public string Location { get; private set; }
		public string Score { get; private set; }
		public string Time { get; private set; }
		public string Prompt { get; private set; }

		public void AppendCommand( string command )
		{
			var current = CommandText;

			current = ( current != null ) ? current.Trim() : "";

			CommandText = current + ( current.Length > 0 ? " " : "" ) + command;
		}

		public IDictionary<string, string[]> Commands
		{
			get
			{
				// TODO: These will eventually be provided through a channel
				return new Dictionary<string, string[]>
					{
						{ "A", new[] { "Again", "Ask" } },
						{ "B", new[] { "Buy" } },
						{ "C", new[] { "Climb" } },
						{ "D", new[] { "Down", "Drop" } },
						{ "E", new[] { "East", "Examine" } },
						{ "G", new[] { "Get", "Give", "Again", "Go" } },
						{ "H", new[] { "Help", "Hide", "Hint" } },
						{ "I", new[] { "Inventory", "In" } },
						{ "J", new[] { "Jump" } },
						{ "K", new[] { "Kill", "Kick" } },
						{ "L", new[] { "Listen", "Lick", "Lock", "Look", "Lift" } },
						{ "N", new[] { "North", "Northeast", "Northwest" } },
						{ "O", new[] { "Out", "Open" } },
						{ "P", new[] { "Press", "Pull", "Push", "Pick Up", "Put" } },
						{ "Q", new[] { "Quit" } },
						{ "R", new[] { "Restore", "Restart" } },
						{ "S", new[] { "South", "Southeast", "Southwest", "Set", "Say", "Save", "Sell", "Sleep", "Screw", "Show" } },
						{ "T", new[] { "Take", "Turn", "Turn On", "Turn Off", "Twist", "Tie", "Tell" } },
						{ "U", new[] { "Up", "Undo", "Unscrew", "Unlock" } },
						{ "W", new[] { "West", "Wait", "Wind" } },
						{ "X", new[] { "Xyzzy", "Examine" } },
						{ "Z", new[] { "Sleep" } }
					};
			}
		}
	}
}