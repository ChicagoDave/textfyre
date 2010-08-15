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
using System.Windows.Media.Imaging;

namespace ShadowWP7
{
	public partial class StoryPageView : UserControl
	{
		private Image backgroundSource;

		public StoryPageView()
		{
			InitializeComponent();

/*			pageContent.LayoutUpdated += delegate
			{
				ResizeBackground( (int)pageContent.DesiredSize.Width, (int)pageContent.DesiredSize.Height);
			};*/
		}

		public static readonly DependencyProperty StoryPageProperty = DependencyProperty.Register(
			"StoryPage",
			typeof( PageBase ),
			typeof( StoryPageView ),
			null );

		public PageBase StoryPage
		{
			get { return (PageBase)GetValue( StoryPageProperty ); }
			set { SetValue( StoryPageProperty, value ); }
		}

		/*
		protected override Size ArrangeOverride( Size finalSize )
		{
			var size =base.ArrangeOverride( finalSize );

			ResizeBackground( (int)LayoutRoot.ActualWidth, (int)LayoutRoot.ActualHeight );

			return size;
		}*/

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
		}
	}
}