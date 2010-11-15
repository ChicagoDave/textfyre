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
using ShadowWP7.Pages;

namespace ShadowWP7.HTDocs
{
	public enum HtmlPageGroup { Intro, About };

	public class HtmlPages
	{
		public static string[] Introduction { get; private set; }
		public static string[] About { get; private set; }

		static HtmlPages()
		{
			Introduction = new[]
			{
				"intropage1.html",
				"intropage2.html",
				"intropage3.html",
				"intropage4.html",
				"intropage5.html"
			};

			About = new[]
			{
				"about.html"
			};
		}

		public static string GetPage( HtmlPageGroup group, int index )
		{
			switch ( group )
			{
				case HtmlPageGroup.Intro: return GetPage( Introduction, index );
				case HtmlPageGroup.About: return GetPage( About, index );
				default: return null;
			}
		}

		private static string GetPage( string[] pages, int index )
		{
			return ( index >= 0 && index < pages.Length ) ? pages[ index ] : null;
		}
	}
}