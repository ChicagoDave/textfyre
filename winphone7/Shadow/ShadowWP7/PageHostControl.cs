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
using Cjc.SilverFyre;

namespace ShadowWP7
{
	public class PageHostControl : ContentControl
	{
		public DataTemplate ImageTemplate { get; set; }
		public DataTemplate PrologueTemplate { get; set; }
		public DataTemplate CreditsTemplate { get; set; }
		public DataTemplate StoryTemplate { get; set; }
		public DataTemplate DeathTemplate { get; set; }

		public PageHostControl()
		{
			this.Loaded += delegate
			{
				ContentTemplate = GetDataTemplate( Content );
			};
		}

		private DataTemplate GetDataTemplate( object data )
		{
			if ( data is ImagePage ) return ImageTemplate;
			if ( data is ProloguePage ) return PrologueTemplate;
			if ( data is CreditsPage ) return CreditsTemplate;
			if ( data is DeathPage ) return DeathTemplate;

			return StoryTemplate;
		}
	}
}