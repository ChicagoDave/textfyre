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
    public class ArtRegister
    {
        public string ArtID;
        public double Width;
        public double Height; 

        public StackPanel AddArtContainer(Grid hostgrid, double maxWidthForText)
        {
            Controls.Art art = new Textfyre.UI.Controls.Art();
            art.ID = ArtID;

            if (art.Align == Textfyre.UI.Controls.Art.ArtAlign.Center)
            {
                //art.VerticalAlignment = VerticalAlignment.Top;
                //art.HorizontalAlignment = HorizontalAlignment.Center;
                hostgrid.Children.Add(art);
                return null;
            }

            ColumnDefinition cd1 = new ColumnDefinition();
            ColumnDefinition cd2 = new ColumnDefinition();

            int imgGridColumn = 1;  // Right Align
            int spGridColumn = 0;   // Right Align
            if (art.Align == Textfyre.UI.Controls.Art.ArtAlign.Right)
            {
                cd1.Width = new GridLength(maxWidthForText);
                cd2.Width = new GridLength(Width);

                hostgrid.ColumnDefinitions.Add(cd1);
                hostgrid.ColumnDefinitions.Add(cd2);
            }
            else if (art.Align == Textfyre.UI.Controls.Art.ArtAlign.Left)
            {
                cd2.Width = new GridLength(maxWidthForText);
                cd1.Width = new GridLength(Width);

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

            art.SetValue(Grid.ColumnProperty, imgGridColumn);
            art.SetValue(Grid.RowProperty, 0);
            art.VerticalAlignment = VerticalAlignment.Top;
            hostgrid.Children.Add(art);

            return sp;
        }

    }
}
