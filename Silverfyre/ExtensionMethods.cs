using System;
using System.Text.RegularExpressions;

namespace Cjc.SilverFyre
{
	public static class ExtensionMethods
	{
		private static Regex isXml = new Regex( @"<([^>]+)>(.*?</(\1)>|[^>]*/>)" );

		public static bool IsXml( this string content )
		{
			return isXml.IsMatch( content );
		}
	}
}