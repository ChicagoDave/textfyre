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
using System.Windows.Data;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Cjc.SilverFyre
{
	public class InlineParagraphConverter : DependencyObject, IValueConverter
	{
		private static Regex wordRegex = new Regex( @"(?<word>\w*)(?<other>\W*)", RegexOptions.Compiled );
		private static Brush wordBrush = new SolidColorBrush( Colors.Cyan );

		#region IValueConverter Members

		private TextBlock MakeTextBlock( Paragraph paragraph )
		{
			var textBlock = new TextBlock();

			foreach ( var i in paragraph.Inlines ) textBlock.Inlines.Add( i );

			return textBlock;
		}

		public object Convert( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			var paragraphs = value as IEnumerable<Paragraph>;

			return ( paragraphs != null )
				? paragraphs.Where( p => p.Inlines != null ).Select( p => MakeTextBlock( p ) ).ToArray()
				: null;
		}

		public object ConvertBack( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}
