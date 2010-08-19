using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Cjc.SilverFyre;
using System.Windows.Data;
using System.ComponentModel;

namespace ShadowWP7
{
	public partial class CommandInput : UserControl
	{
		public delegate void CommandHandler( object sender, CommandEventArgs e );

		public event CommandHandler Command;
		public event KeyEventHandler CommandKeyDown;
		public event KeyEventHandler CommandKeyUp;

		public CommandInput()
		{
			InitializeComponent();

			this.Loaded += delegate { ( DataContext as PageBase ).State.PropertyChanged += OnCommandTextChanged; };
			this.Unloaded += delegate { ( DataContext as PageBase ).State.PropertyChanged -= OnCommandTextChanged; };
		}

		private void OnCommandTextChanged( object sender, PropertyChangedEventArgs e )
		{
			virtualInputScroll.Measure( virtualInputScroll.RenderSize );
			virtualInputScroll.ScrollToHorizontalOffset( virtualInputScroll.ScrollableWidth );
		}

		private void OnCommand( object sender, RoutedEventArgs e )
		{
			if ( Command != null ) Command( this, new CommandEventArgs( virtualInputBox.Text /*?? inputBox.Text*/ ) );
		}

		private void OnCommandKeyDown( object sender, KeyEventArgs e )
		{
			if ( e.Key == Key.Enter && !string.IsNullOrEmpty( inputBox.Text.Trim() ) )
			{
				OnCommand( sender, null );
				inputBox.Text = "";
			}
			else if ( CommandKeyDown != null ) CommandKeyDown( sender, e );
		}

		private void OnCommandKeyUp( object sender, KeyEventArgs e )
		{
			if ( CommandKeyUp != null ) CommandKeyUp( sender, e );
		}

		public void SetCommand( string command )
		{
			inputBox.Text = command;
		}

		private void AppendCommand( string command )
		{
			( DataContext as PageBase ).State.AppendCommand( command );
		}

		private void Button_Click( object sender, RoutedEventArgs e )
		{
		}

		private void firstLetter_SelectionChanged( object sender, SelectionChangedEventArgs e )
		{
			VisualStateManager.GoToState( commandButtons, "Visible", true );
		}

		private void commandButtons_SelectionChanged( object sender, SelectionChangedEventArgs e )
		{
			if ( e.AddedItems.Count > 0 )
			{
				AppendCommand( (string)e.AddedItems[ 0 ] );

				commandButtons.SelectedItem = null;
				firstLetter.SelectedItem = null;

				VisualStateManager.GoToState( commandButtons, "Hidden", true );
			}
		}

		private void goButton_Click( object sender, RoutedEventArgs e )
		{
			OnCommand( sender, null );
			inputBox.Text = "";
		}

		private void backspaceButton_Click( object sender, RoutedEventArgs e )
		{
			( DataContext as PageBase ).State.DeleteCommand();
		}
	}
}