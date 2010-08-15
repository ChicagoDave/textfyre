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

namespace ShadowWP7
{
	public partial class CommandInput : UserControl
	{
		public delegate void CommandHandler( object sender, CommandEventArgs e );

		public event CommandHandler Command;
		public event KeyEventHandler CommandKeyDown;
		public event KeyEventHandler CommandKeyUp;

		public static readonly DependencyProperty CommandTextProperty = DependencyProperty.Register(
			"CommandText",
			typeof( string ),
			typeof( CommandInput ),
			null );

		public string CommandText
		{
			get { return (string)GetValue( CommandTextProperty ); }
			set { SetValue( CommandTextProperty, value ); }
		}

		public CommandInput()
		{
			InitializeComponent();
		}

		private void OnCommand( object sender, RoutedEventArgs e )
		{
			if ( Command != null ) Command( this, new CommandEventArgs( inputBox.Text ) );
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

		private void HyperlinkButton_Click( object sender, RoutedEventArgs e )
		{
			var button = sender as HyperlinkButton;

			AddCommand( (string)button.Tag );
		}

		private void AddCommand( string command )
		{
			var current = virtualInputBox.Text.Trim();

			virtualInputBox.Text = current + ( current.Length > 0 ? " " : "" ) + command;

			virtualInputScroll.Measure( virtualInputScroll.RenderSize );
			virtualInputScroll.ScrollToHorizontalOffset( virtualInputScroll.ScrollableWidth );
		}

		private void Button_Click( object sender, RoutedEventArgs e )
		{
		}

		private void firstLetter_SelectionChanged( object sender, SelectionChangedEventArgs e )
		{
			keyScroll.Measure( keyScroll.RenderSize );
			keyScroll.ScrollTo( Resources, "scrollPage", keyScroll.VerticalOffset, keyScroll.ScrollableHeight );
		}

		private void commandButtons_SelectionChanged( object sender, SelectionChangedEventArgs e )
		{
			if ( e.AddedItems.Count > 0 )
			{
				AddCommand( (string)e.AddedItems[ 0 ] );

				keyScroll.Measure( keyScroll.RenderSize );
				keyScroll.ScrollTo( Resources, "scrollPage", keyScroll.VerticalOffset, 0 );
			}
		}
	}
}