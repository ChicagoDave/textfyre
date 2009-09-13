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
using System.ComponentModel;

namespace Cjc.SilverFyre
{
	/// <summary>
	/// IDependencyRelay interface
	/// </summary>
	public interface IDependencyRelay
	{
		void OnDependencyPropertyChanged( string name, DependencyPropertyChangedEventArgs args );
	}

	/// <summary>
	/// DependencyRelay class
	/// </summary>
	public class DependencyRelay : FrameworkElement, IDependencyRelay, INotifyPropertyChanged
	{
		/// <summary>
		/// Registers a new DependencyProperty.
		/// </summary>
		/// <param name="name">The name.</param>
		/// <param name="propertyType">Type of the property.</param>
		/// <param name="ownerType">Type of the owner.</param>
		/// <returns></returns>
		public static DependencyProperty RegisterProperty( string name, Type propertyType, Type ownerType )
		{
			return DependencyProperty.Register(
				name,
				propertyType,
				ownerType,
				new PropertyMetadata( MakeHandler( name ) ) );
		}

		/// <summary>
		/// Registers a new DependencyProperty.
		/// </summary>
		/// <param name="name">The name.</param>
		/// <param name="propertyType">Type of the property.</param>
		/// <param name="ownerType">Type of the owner.</param>
		/// <param name="defaultValue">The default value.</param>
		/// <returns></returns>
		public static DependencyProperty RegisterProperty( string name, Type propertyType, Type ownerType, object defaultValue )
		{
			return DependencyProperty.Register(
				name,
				propertyType,
				ownerType,
				new PropertyMetadata( defaultValue, MakeHandler( name ) ) );
		}

		/// <summary>
		/// Makes a PropertyChangedCallback handler.
		/// </summary>
		/// <param name="name">The name.</param>
		/// <returns></returns>
		private static PropertyChangedCallback MakeHandler( string name )
		{
			return delegate( DependencyObject obj, DependencyPropertyChangedEventArgs args )
			{
				( obj as IDependencyRelay ).OnDependencyPropertyChanged( name, args );
			};
		}

		/// <summary>
		/// Called when a DependencyProperty has changed.
		/// </summary>
		/// <param name="name">The name.</param>
		/// <param name="args">The <see cref="System.Windows.DependencyPropertyChangedEventArgs"/> instance containing the event data.</param>
		protected virtual void OnDependencyPropertyChanged( string name, DependencyPropertyChangedEventArgs args )
		{
			OnPropertyChanged( name );
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		/// <summary>
		/// Raises the PropertyChanged event.
		/// </summary>
		/// <param name="propertyName">Name of the property.</param>
		protected void OnPropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion

		#region IDependencyRelay Members

		/// <summary>
		/// Called when a DependencyProperty has changed.
		/// </summary>
		/// <param name="name">The name.</param>
		/// <param name="args">The <see cref="System.Windows.DependencyPropertyChangedEventArgs"/> instance containing the event data.</param>
		void IDependencyRelay.OnDependencyPropertyChanged( string name, DependencyPropertyChangedEventArgs args )
		{
			OnDependencyPropertyChanged( name, args );
		}

		#endregion
	}
}