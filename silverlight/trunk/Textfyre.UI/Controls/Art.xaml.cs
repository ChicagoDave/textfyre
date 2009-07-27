using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Xml.Linq;
using System.ComponentModel;

namespace Textfyre.UI.Controls {
    public partial class Art : UserControl {
        public ArtTypes ArtType;
        public ArtAlign Align;

        private string _id = String.Empty;
        private UIElement _currentElement = null;
        private UIElement _pastElement = null;
        private bool _fadeArt = true;

        public bool FadeArt {
            get {
                return _fadeArt;
            }
            set {
                _fadeArt = value;
            }
        }

        public enum ArtAlign {
            Center,
            Left,
            Right
        }

        public enum ArtTypes {
            PNG,
            XAML
        }

        public Art() {
            InitializeComponent();
        }


        //public static readonly DependencyProperty IDProperty =
        //DependencyProperty.Register( "ID", typeof(string), typeof(Art), null);
        ////public bool IsSpinning
        ////{
        ////    get { return (bool)GetValue(IsSpinningProperty); }
        ////    set { SetValue(IsSpinningProperty, value); }
        ////}

        public string ID
        {

            get
            {
                return (string)GetValue(IDProperty);
            }
            set
            {
                SetValue(IDProperty, value);
                _id = value;
                Init();
            }
        }
        public static readonly DependencyProperty IDProperty = DependencyProperty.Register("ID", typeof(string), typeof(Art), new PropertyMetadata(""));


        public static double[] WidthAndHeight(string artID) {
            double[] size = { 0, 0 };

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            var arts = (from a in x.Descendants("Art") where a.Attribute("ID").Value == artID select a);

            if (arts.Count() != 1)
                return size;

            var art = arts.Single();

            if (AttributeExists(art, "Width")) {
                double width = Double.Parse(art.Attribute("Width").Value);
                size[0] = width;
            }

            if (AttributeExists(art, "Height")) {
                double height = Double.Parse(art.Attribute("Height").Value);
                size[1] = height;
            }

            if (AttributeExists(art, "Margin")) {
                string[] margin = art.Attribute("Margin").Value.Split(',');
                if (margin.Length == 4) {
                    //left top right bottom;
                    size[0] = size[0] + double.Parse(margin[0]) + double.Parse(margin[2]);
                    size[1] = size[1] + double.Parse(margin[1]) + double.Parse(margin[3]);
                }
            }

            return size;
        }

        private void Init() {
            if (_id.Length == 0) {
                LayoutRoot.Children.Clear();
                return;
            }

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Arts.xml"));

            string[] ids = _id.Split(',');
            if (ids.Length == 0)
                return;
            var arts = (from a in x.Descendants("Art") where a.Attribute("ID").Value == ids[0].Trim() select a);
            if (arts.Count() < 1) {
                bool found = false;
                for (int i = 1; i < ids.Length; i++) {
                    arts = (from a in x.Descendants("Art") where a.Attribute("ID").Value == ids[i].Trim() select a);


                    if (arts.Count() > 0) {
                        found = true;
                        break;
                    }
                }

                if (!found)
                    return;

            }

            var art = arts.Single();

            if (AttributeExists(art, "Width")) {
                double width = Double.Parse(art.Attribute("Width").Value);
                this.Width = width;
            }

            if (AttributeExists(art, "Height")) {
                double height = Double.Parse(art.Attribute("Height").Value);
                this.Height = height;
            }

            if (AttributeExists(art, "Margin")) {
                string[] margin = art.Attribute("Margin").Value.Split(',');
                if (margin.Length == 4) {
                    this.Margin = new Thickness(Double.Parse(margin[0]), Double.Parse(margin[1]), Double.Parse(margin[2]), Double.Parse(margin[3]));
                }
            }

            if (AttributeExists(art, "Align")) {
                string align = art.Attribute("Align").Value;
                Align = (ArtAlign)System.Enum.Parse(typeof(ArtAlign), align, true);
            }

            if (AttributeExists(art, "Fade")) {
                string fade = art.Attribute("Fade").Value;
                FadeArt = Boolean.Parse(fade);
            }

            string path = String.Empty;
            if (AttributeExists(art, "Path")) {
                path = art.Attribute("Path").Value.Trim();
            }

            if (path.Length != 0) {

                if (path.EndsWith(".png") || path.EndsWith(".jpg")) {
                    ArtType = ArtTypes.PNG;
                    Image image = new Image();
                    image.Source = Current.Application.GetImageBitmap(path);
                    image.Stretch = Stretch.Fill;
                    RegisterArt(image);
                } else if (path.EndsWith(".xaml")) {
                    ArtType = ArtTypes.XAML;
                    UserControl userControl = Current.Application.GetImageXaml(path) as UserControl;
                    RegisterArt(userControl);
                }

                return;
            }

            if (AttributeExists(art, "LinkUrl") && AttributeExists(art, "LinkText")) {
                string linkUrl = art.Attribute("LinkUrl").Value.Trim();
                string linkText = art.Attribute("LinkText").Value.Trim();
                HyperlinkButton hlb = new HyperlinkButton();
                hlb.Content = linkText;
                hlb.NavigateUri = new Uri(linkUrl, UriKind.Absolute);
                hlb.MouseEnter += new MouseEventHandler(hlb_MouseEnter);
                hlb.MouseLeave += new MouseEventHandler(hlb_MouseLeave);

                switch (Align) {
                    case ArtAlign.Center:
                        hlb.HorizontalContentAlignment = HorizontalAlignment.Center;
                        break;
                    case ArtAlign.Left:
                        hlb.HorizontalContentAlignment = HorizontalAlignment.Left;
                        break;
                    case ArtAlign.Right:
                        hlb.HorizontalContentAlignment = HorizontalAlignment.Right;
                        break;
                }

                Align = ArtAlign.Center;

                RegisterArt(hlb);
            }

        }

        private void hlb_MouseLeave(object sender, MouseEventArgs e) {
            Current.Game.IsInputFocusActive = true;
        }

        private void hlb_MouseEnter(object sender, MouseEventArgs e) {
            Current.Game.IsInputFocusActive = false;
        }

        private static bool AttributeExists(XElement ele, string attName) {
            foreach (XAttribute xatt in ele.Attributes()) {
                if (xatt.Name == attName)
                    return true;
            }

            return false;
        }

        private void RegisterArt(UIElement uie) {
            _pastElement = _currentElement;
            _currentElement = uie;
            LayoutRoot.Children.Add(_currentElement);

            if (_fadeArt == false) {
                RemovePastElement();
                return;
            }

            // Fadeout
            if (_pastElement != null && _pastElement != _currentElement) {
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

        private void fo_Completed(object sender, EventArgs e) {
            RemovePastElement();
        }

        private void RemovePastElement() {
            if (_pastElement != null) {
                LayoutRoot.Children.Remove(_pastElement);
                _pastElement = null;
            }
        }
    }
}
