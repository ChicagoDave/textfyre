using System;
using System.Collections.Generic;
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
using System.Xml.Linq;
using System.Xml;
using System.ComponentModel;

namespace Cjc.SilverFyre
{
	public class StoryHistoryItem : INotifyPropertyChanged
	{
		public StoryHistoryItem( string command, OutputReadyEventArgs output )
		{
			this.Command = command;
			this.OutputArgs = output;
			this.State = ( output != null ) ? new StoryState( output ) : null;
		}

		public bool HasCommand { get { return Command != null; } }

		public StoryState State { get; private set; }
		public string Command { get; private set; }
		public OutputReadyEventArgs OutputArgs { get; private set; }

		public void SetCommand( string command )
		{
			this.Command = command;
			RaisePropertyChanged( "Command" );
			RaisePropertyChanged( "HasCommand" );
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion
	}
}