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
using System.Windows.Media.Imaging;

namespace ShadowWP7
{
	public class TileBorder : ContentControl
	{
		private Grid grid;
		private ImageBrush backgroundBrush;
		private BitmapImage bitmapImage;
		private WriteableBitmap bitmap;

		public TileBorder()
		{
			CacheMode = new BitmapCache();
			backgroundBrush = new ImageBrush { Stretch = Stretch.Uniform };
		}

		public static readonly DependencyProperty BrushProperty = DependencyProperty.Register(
			"Brush",
			typeof( ImageBrush ),
			typeof( TileBorder ),
			new PropertyMetadata( OnImageBrushChanged ) );

		public ImageBrush ImageBrush
		{
			get { return (ImageBrush)GetValue( BrushProperty ); }
			set { SetValue( BrushProperty, value ); }
		}

		private static void OnImageBrushChanged( DependencyObject source, DependencyPropertyChangedEventArgs args )
		{
			( source as TileBorder ).OnImageBrushChanged( args );
		}

		private void OnImageBrushChanged( DependencyPropertyChangedEventArgs args )
		{
			Background = args.NewValue as ImageBrush;
			InvalidateMeasure();
		}

		protected override void OnContentChanged( object oldContent, object newContent )
		{
			if ( newContent != null && newContent != grid )
			{
				grid = new Grid();
				grid.Background = backgroundBrush;
				grid.Children.Add( (UIElement)newContent );

				Content = grid;

				InvalidateMeasure();
			}

			base.OnContentChanged( oldContent, Content );
		}

		protected override Size MeasureOverride( Size availableSize )
		{
			var size = base.MeasureOverride( availableSize );

			ResizeBackground( (int)size.Width, (int)size.Height );

			return size;
		}

		protected void ResizeBackground( int width, int height )
		{
			var bitmapImage = ImageBrush.ImageSource as BitmapImage;

			if ( width > 0 && height > 0 && bitmapImage != null && bitmapImage.PixelWidth > 0
				&& ( bitmap == null || width > bitmap.PixelWidth || height > bitmap.PixelHeight ) )
			{
				bitmap = new WriteableBitmap( width, height );

				var image = new Image { Source = bitmapImage };

				for ( var y = 0; y < bitmap.PixelHeight; y += bitmapImage.PixelHeight )
				{
					for ( var x = 0; x < bitmap.PixelWidth; x += bitmapImage.PixelWidth )
					{
						bitmap.Render( image, new TranslateTransform { X = x, Y = y } );
					}
				}

				bitmap.Invalidate();
				backgroundBrush.ImageSource = bitmap;
				Background = null;
			}
		}
	}
}