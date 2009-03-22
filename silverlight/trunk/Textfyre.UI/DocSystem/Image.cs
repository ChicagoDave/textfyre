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

namespace Textfyre.UI.DocSystem
{
    public class Image
    {
        
        private string _imgUrl;
        /// <summary>
        /// Example: "Images/SpotArt/Crates.png"
        /// </summary>
        public string ImgUrl
        {
            get
            {
                return _imgUrl;
            }

            set
            {
                _imgUrl = value;
            }
        }

        private double _width;
        public double Width
        {
            get
            {
                return _width;
            }

            set
            {
                _width = value;
            }
        }
        
        private double _height;
        public double Height
        {
            get
            {
                return _height;
            }

            set
            {
                _height = value;
            }
        }

        private ImageAlign _imgAlign = ImageAlign.Right;
        public ImageAlign ImgAlign
        {
            get
            {
                return _imgAlign;
            }

            set
            {
                _imgAlign = value;
            }
        }

        public StackPanel AddImageContainer(Grid hostgrid, double maxWidthForText)
        {
            //hostgrid.Background = new SolidColorBrush(Colors.Yellow);

            //hostgrid.Width = maxWidthForText + _width;

            ColumnDefinition cd1 = new ColumnDefinition();
            ColumnDefinition cd2 = new ColumnDefinition();
            
            int imgGridColumn = 1;  // Right Align
            int spGridColumn = 0;   // Right Align
            if( _imgAlign == ImageAlign.Right )
            {
                cd1.Width = new GridLength(maxWidthForText);
                cd2.Width = new GridLength(_width);

                hostgrid.ColumnDefinitions.Add(cd1);
                hostgrid.ColumnDefinitions.Add(cd2);
            }
            else if (_imgAlign == ImageAlign.Left )
            {
                cd2.Width = new GridLength(maxWidthForText);
                cd1.Width = new GridLength(_width);

                hostgrid.ColumnDefinitions.Add(cd1);
                hostgrid.ColumnDefinitions.Add(cd2);
                imgGridColumn = 0;
                spGridColumn = 1;
            }
            
            RowDefinition rd1 = new RowDefinition();
            rd1.Height = GridLength.Auto;
            hostgrid.RowDefinitions.Add(rd1);

            StackPanel sp = new StackPanel();
            sp.Width = maxWidthForText;
            sp.SetValue(Grid.ColumnProperty, spGridColumn);
            sp.SetValue(Grid.RowProperty, 0);
            hostgrid.Children.Add(sp);

            System.Windows.Controls.Image img = new System.Windows.Controls.Image();
            img.Source = Current.Application.GetImageBitmap(_imgUrl);
            img.Width = _width;
            img.Height = _height;
            img.SetValue(Grid.ColumnProperty, imgGridColumn);
            img.SetValue(Grid.RowProperty, 0);
            img.Stretch = Stretch.Fill;
            img.VerticalAlignment = VerticalAlignment.Top;
            img.Margin = new Thickness(0, 0, 0, 0);
            hostgrid.Children.Add(img);

            return sp;
        }
    }
}
