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
using Microsoft.Phone.Controls;
using Cjc.SilverFyre;

namespace ShadowWP7
{
	public partial class StoryPage : UserControl
	{
		public StoryPage()
		{
			InitializeComponent();
		}

		public static readonly DependencyProperty StoryProperty = DependencyProperty.Register(
			"Story",
			typeof( StoryHistoryItem ),
			typeof( StoryPage ),
			null );

		public StoryHistoryItem Story
		{
			get { return (StoryHistoryItem)GetValue( StoryProperty ); }
			set { SetValue( StoryProperty, value ); }
		}

		private void OnParagraphLoaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Add( inline );
		}

		private void OnParagraphUnloaded( object sender, RoutedEventArgs e )
		{
			var textBlock = sender as TextBlock;
			var paragraph = textBlock.DataContext as Paragraph;

			foreach ( var inline in paragraph.Inlines ) textBlock.Inlines.Remove( inline );
		}

		void OnManipulationDelta( object sender, ManipulationDeltaEventArgs e )
		{
			e.Handled = false;
			//			throw new NotImplementedException();
		}
	}
}