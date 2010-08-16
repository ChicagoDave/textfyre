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
	public class InlineWordConverter : DependencyObject, IValueConverter
	{
		public static readonly DependencyProperty WordStyleProperty = DependencyProperty.Register(
			"WordStyle",
			typeof( Style ),
			typeof( InlineWordConverter ),
			null );

		public Style WordStyle
		{
			get { return (Style)GetValue( WordStyleProperty ); }
			set { SetValue( WordStyleProperty, value ); }
		}

		public static readonly DependencyProperty PunctuationStyleProperty = DependencyProperty.Register(
			"PunctuationStyle",
			typeof( Style ),
			typeof( InlineWordConverter ),
			null );

		public Style PunctuationStyle
		{
			get { return (Style)GetValue( PunctuationStyleProperty ); }
			set { SetValue( PunctuationStyleProperty, value ); }
		}

		private static Regex wordRegex = new Regex( @"(?<word>\w*)(?<other>\W*)", RegexOptions.Compiled );
		private static Brush wordBrush = new SolidColorBrush( Colors.Cyan );

		#region IValueConverter Members
/*
		private TextBlock MakeTextBlock( Inline source, string text )
		{
			var run = source;

			if ( run != null )
			{
				var isWord = text != null && ( text.Length > 1 || ( text.Length == 1 && !punctuation.Contains( text.First() ) ) );

				var textBlock = new TextBlock();
				textBlock.Inlines.Add( 
		}*/

		private IEnumerable<FrameworkElement> MakeTextBlocks( IEnumerable<Inline> inlines )
		{
			TextBlock textBlock = null;

			foreach ( var inline in inlines )
			{
				var run = inline as Run;

				if ( run == null )
				{
					if ( textBlock == null ) textBlock = new TextBlock();
					textBlock.Inlines.Add( inline );
				}
				else
				{
					if ( textBlock != null )
					{
						yield return new ContentControl { Content = textBlock };
						textBlock = null;
					}

					foreach ( var match in wordRegex.Matches( run.Text ).Cast<Match>() )
					{
						yield return new TextBlock { Text = match.Groups[ "word" ].Value, Style = WordStyle, FontWeight = inline.FontWeight, FontStyle = inline.FontStyle, Tag = "Word" };
						yield return new TextBlock { Text = match.Groups[ "other" ].Value, Style = PunctuationStyle, FontWeight = inline.FontWeight, FontStyle = inline.FontStyle };
					}
				}
			}
		}

		public object Convert( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			return MakeTextBlocks( value as IEnumerable<Inline> );
		}

		public object ConvertBack( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}
