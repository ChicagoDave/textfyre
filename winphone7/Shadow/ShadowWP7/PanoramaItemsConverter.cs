using System;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Cjc.SilverFyre;
using System.Collections.Generic;

namespace ShadowWP7
{
	public class PanoramaItemsConverter : DependencyObject, IValueConverter
	{
		public readonly DependencyProperty ItemTemplateProperty = DependencyProperty.Register(
			"ItemTemplate",
			typeof( DataTemplate ),
			typeof( PanoramaItemsConverter ),
			null );

		public DataTemplate ItemTemplate
		{
			get { return (DataTemplate)GetValue( ItemTemplateProperty ); }
			set { SetValue( ItemTemplateProperty, value ); }
		}

		#region IValueConverter Members

		public object Convert( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			var items = value as IEnumerable<StoryHistoryItem>;
			var panoramaItems = ( from i in items
								  select new PanoramaItem
								  {
									  AutoSnap = true,
									  Header = i.State.Location,
									  Content = i,
									  ContentTemplate = ItemTemplate
								  } ).ToArray();

			return panoramaItems;
		}

		public object ConvertBack( object value, Type targetType, object parameter, System.Globalization.CultureInfo culture )
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}
