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

namespace ShadowWP7.Pages
{
	public enum MenuItem { Introduction, Help, Hints, Settings, About };

	public class MenuEventArgs : EventArgs
	{
		public MenuItem SelectedItem { get; private set; }

		public MenuEventArgs( MenuItem selectedItem )
		{
			this.SelectedItem = selectedItem;
		}
	}

	public partial class MenuView : PhoneApplicationPage
	{
		public event EventHandler<MenuEventArgs> Selected;

		public MenuView()
		{
			InitializeComponent();

			DataContext = this;
		}

		private void Introduction_Click( object sender, MouseButtonEventArgs e )
		{
			RaiseSelected( MenuItem.Introduction );
		}

		private void Help_Click( object sender, MouseButtonEventArgs e )
		{
			RaiseSelected( MenuItem.Help );
		}

		private void Hints_Click( object sender, MouseButtonEventArgs e )
		{
			RaiseSelected( MenuItem.Hints );
		}

		private void Settings_Click( object sender, MouseButtonEventArgs e )
		{
			RaiseSelected( MenuItem.Settings );
		}

		private void About_Click( object sender, MouseButtonEventArgs e )
		{
			RaiseSelected( MenuItem.About );
		}

		private void RaiseSelected( MenuItem selectedItem )
		{
			if ( Selected != null ) Selected( this, new MenuEventArgs( selectedItem ) );
		}
	}
}