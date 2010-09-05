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
	public class CachedPage
	{
		public WriteableBitmap Bitmap { get; set; }
		public Rect[] ParagraphBounds { get; set; }
	}
}