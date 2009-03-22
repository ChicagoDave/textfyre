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
using System.Xml.Linq;
using System.Linq;

namespace Textfyre.UI.Controls
{
    public partial class Art : UserControl
    {
        private UIElement _currentElement = null;
        private UIElement _pastElement = null;

        public enum ArtAlign
        {
            Center,
            Left,
            Right
        }
        
        public enum ArtTypes
        {
            PNG,
            XAML
        }
        
        public Art()
        {
            InitializeComponent();
        }

        public ArtTypes ArtType;
        public ArtAlign Align;

        private string _id = String.Empty;
        public string ID
        {
            set
            {
                _id = value;
                Init();
            }
        }

        public static double[] WidthAndHeight(string artID)
        {
            double[] size = { 0, 0 };
            
            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            var arts = (from a in x.Descendants("Art") where a.Attribute("ID").Value == artID select a);

            if (arts.Count() != 1)
                return size;

            var art = arts.Single();

            if (AttributeExists(art, "Width"))
            {
                double width = Double.Parse(art.Attribute("Width").Value);
                size[0] = width;
            }

            if (AttributeExists(art, "Height"))
            {
                double height = Double.Parse(art.Attribute("Height").Value);
                size[1] = height;
            }

            if (AttributeExists(art, "Margin"))
            {
                string[] margin = art.Attribute("Margin").Value.Split(',');
                if (margin.Length == 4)
                {
                    //left top right bottom;
                    size[0] = size[0] + double.Parse(margin[0]) + double.Parse(margin[2]);
                    size[1] = size[1] + double.Parse(margin[1]) + double.Parse(margin[3]);                    
                }
            }

            return size;
        }

        private void Init()
        {
            if (_id.Length == 0)
            {
                LayoutRoot.Children.Clear();
                return;
            }

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            var arts = (from a in x.Descendants("Art") where a.Attribute("ID").Value == _id select a);

            if (arts.Count() != 1)
                return;

            var art = arts.Single();

            if (AttributeExists(art, "Width"))
            {
                double width = Double.Parse(art.Attribute("Width").Value);
                this.Width = width;
            }

            if (AttributeExists(art, "Height"))
            {
                double height = Double.Parse(art.Attribute("Height").Value);
                this.Height = height;
            }

            if (AttributeExists( art, "Margin"))
            {
                string[] margin = art.Attribute("Margin").Value.Split(',');
                if (margin.Length == 4)
                {
                    this.Margin = new Thickness(Double.Parse(margin[0]), Double.Parse(margin[1]), Double.Parse(margin[2]), Double.Parse(margin[3]));
                }
            }

            if (AttributeExists(art, "Align"))
            {
                string align = art.Attribute("Align").Value;
                Align = (ArtAlign)System.Enum.Parse(typeof(ArtAlign), align, true);
            }

            string path = art.Attribute("Path").Value.Trim();

            if (path.Length == 0)
                return;

            if (path.EndsWith(".png") || path.EndsWith(".jpg"))
            {
                ArtType = ArtTypes.PNG;
                Image image = new Image();
                image.Source = Current.Application.GetImageBitmap(path);
                image.Stretch = Stretch.Fill;
                RegisterArt(image);
            }
            else if (path.EndsWith(".xaml"))
            {
                ArtType = ArtTypes.XAML;
                UserControl userControl = Current.Application.GetImageXaml(path) as UserControl;
                RegisterArt(userControl);
            }
        }

        private static bool AttributeExists(XElement ele, string attName)
        {
            foreach (XAttribute xatt in ele.Attributes())
            {
                if (xatt.Name == attName)
                    return true;
            }

            return false;
        }

        private void RegisterArt(UIElement uie)
        {
            _pastElement = _currentElement;
            _currentElement = uie;
            LayoutRoot.Children.Add(_currentElement);

            // Fadeout
            if (_pastElement != null)
            {
                _currentElement.Opacity = 0d;

                Storyboard fo = new Storyboard();
                fo.Completed += new EventHandler(fo_Completed);
                DoubleAnimation da = new DoubleAnimation();
                da.Duration = new Duration(TimeSpan.FromSeconds(1));
                da.From = 1d;
                da.To = 0d;
                fo.Children.Add(da);
                Storyboard.SetTarget(da, _pastElement);
                Storyboard.SetTargetProperty(da, new PropertyPath("UIElement.Opacity"));
                fo.Begin();

                Storyboard fi = new Storyboard();
                DoubleAnimation dai = new DoubleAnimation();
                dai.Duration = new Duration(TimeSpan.FromSeconds(1));
                dai.From = 0d;
                dai.To = 1d;
                fi.Children.Add(dai);
                Storyboard.SetTarget(dai, _currentElement);
                Storyboard.SetTargetProperty(dai, new PropertyPath("UIElement.Opacity"));
                fi.Begin();

            
            }
        }

        void fo_Completed(object sender, EventArgs e)
        {
            if (_pastElement != null)
            {
                LayoutRoot.Children.Remove(_pastElement);
                _pastElement = null;
            }
        }
    }
}
