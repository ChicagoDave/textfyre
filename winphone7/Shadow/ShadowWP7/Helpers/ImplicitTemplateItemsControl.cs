using System;
using System.Collections.Generic;
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

namespace ShadowWP7
{
	public class ImplicitTemplateItemsControl : ItemsControl
	{
		public static readonly DependencyProperty ItemContainerStyleProperty = DependencyProperty.Register(
			"ItemContainerStyle",
			typeof( Style ),
			typeof( ImplicitTemplateItemsControl ),
			null );

		public Style ItemContainerStyle
		{
			get { return (Style)GetValue( ItemContainerStyleProperty ); }
			set { SetValue( ItemContainerStyleProperty, value ); }
		}

		private Dictionary<Type, DataTemplate> templates = new Dictionary<Type, DataTemplate>();

		protected override void PrepareContainerForItemOverride( DependencyObject element, object item )
		{
			var template = FindTemplate( item );
			var presenter = element as ContentPresenter;

			if ( template != null && presenter.ContentTemplate != template )
			{
				if ( ItemContainerStyle != null ) presenter.Style = ItemContainerStyle;

				presenter.ContentTemplate = template;
			}

			if ( presenter.Content != item ) presenter.Content = item;
		}

		private DataTemplate FindTemplate( object item )
		{
			if ( item == null ) return null;

			var type = item.GetType();

			DataTemplate template;

			if ( templates.TryGetValue( type, out template ) ) return template;

			var name = type.Name;

			for ( var container = this as FrameworkElement; container != null; container = VisualTreeHelper.GetParent( container ) as FrameworkElement )
			{
				if ( ( template = container.Resources[ name ] as DataTemplate ) != null ) return templates[ type ] = template;
			}

			return null;
		}
	}
}