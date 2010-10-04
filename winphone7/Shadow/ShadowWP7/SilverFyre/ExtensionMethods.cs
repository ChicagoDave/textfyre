using System;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Data;
using System.Windows.Controls;
using System.Windows.Threading;
using System.Threading;

namespace Cjc.SilverFyre
{
	public static class ExtensionMethods
	{
		private static Regex isXml = new Regex( @"<([^>]+)>(.*?</(\1)>|[^>]*/>)" );

		public static bool IsXml( this string content )
		{
			return isXml.IsMatch( content );
		}

		public static void Invoke( this Dispatcher dispatcher, Action action )
		{
			using ( var complete = new ManualResetEvent( false ) )
			{
				dispatcher.BeginInvoke( delegate
				{
					action();
					complete.Set();
				} );

				complete.WaitOne();
			}
		}
	}
}