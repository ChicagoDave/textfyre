using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace Textfyre.UI.Controls.Mapping
{
    public partial class Map : UserControl
    {
        private DragHand _dragHand;

        private Entities.MapLocationCollection _locations;
        private Entities.MapConnectionCollection _connections;

        public Map()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(DragDocument_Loaded);
            InitMap();
        }

        #region :: SetLocation ::
        public void SetLocation(string locationName)
        {
            Entities.MapLocation location = _locations.GetMapLocationByLocationName(locationName);
            if (location != null)
            {
                double x = location.MapLeft + (location.Width / 2);
                double y = location.MapTop + (location.Height / 2);

                SmoothScrollToOffset(x, y);
            }
        }
        private double _scrollEndX, _scrollCurrentX;
        private double _scrollEndY, _scrollCurrentY;
        private double _scrollDeltaX, _scrollDeltaY;
        internal void SmoothScrollToOffset(double x, double y)
		{
            _scrollCurrentX = _svContent.HorizontalOffset;
            _scrollCurrentY = _svContent.VerticalOffset;
            _scrollEndX = Math.Min(Math.Max(x - _svContent.ViewportWidth / 2, 0), _svContent.ExtentWidth);
            _scrollEndY = Math.Min(Math.Max(y - _svContent.ViewportHeight / 2, 0), _svContent.ExtentHeight);
            _scrollDeltaX = (_scrollEndX - _scrollCurrentX) / 20;
            _scrollDeltaY = (_scrollEndY - _scrollCurrentY) / 20;
			CompositionTarget.Rendering += this.ScrollViewport;
		}
		
		private void ScrollViewport(object sender, EventArgs e)
		{
            _scrollCurrentX += _scrollDeltaX;
            _scrollCurrentY += _scrollDeltaY;
            if ((_scrollCurrentX - _scrollEndX) * _scrollDeltaX + (_scrollCurrentY - _scrollEndY) * _scrollDeltaY > 0)
			{
                _svContent.ScrollToHorizontalOffset(_scrollEndX);
                _svContent.ScrollToVerticalOffset(_scrollEndY);
				CompositionTarget.Rendering -= this.ScrollViewport;
			}
			else
			{
                _svContent.ScrollToHorizontalOffset(_scrollCurrentX);
                _svContent.ScrollToVerticalOffset(_scrollCurrentY);
			}
		}
        #endregion

        private void InitMap()
        {
            if (_locations != null)
                return;

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Map.xml"));

            _locations = new Textfyre.UI.Entities.MapLocationCollection();
            _connections = new Textfyre.UI.Entities.MapConnectionCollection();

            var connections = from connection in x.Descendants("Connection") select connection;
            foreach (var connection in connections)
            {
                Entities.MapConnection mapCon = new Textfyre.UI.Entities.MapConnection(connection);
                _connections.Add(mapCon);
            }
            
            var locations = from location in x.Descendants("Location") select location;
            foreach (var location in locations)
            {
                Entities.MapLocation mapLoc = new Textfyre.UI.Entities.MapLocation(location, _connections);
                _locations.Add(mapLoc);
                _cvContent.Children.Add(mapLoc.UIControl);
                
            }
        }

        public void Show()
        {
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            this.Visibility = Visibility.Collapsed;
        }

        void DragDocument_Loaded(object sender, RoutedEventArgs e)
        {
            _dragHand = new DragHand();
            _dragHand.Visibility = Visibility.Collapsed;

            this._cvContent.Children.Add(_dragHand);
            this._cvContent.MouseMove += new MouseEventHandler(Document_MouseMove);

            this._cvContent.Cursor = Cursors.None;
            this._cvContent.MouseLeftButtonUp += new MouseButtonEventHandler(Document_MouseLeftButtonUp);
            this._cvContent.MouseLeftButtonDown += new MouseButtonEventHandler(Document_MouseLeftButtonDown);
            this._cvContent.MouseEnter += new MouseEventHandler(Document_MouseEnter);
            this._cvContent.MouseLeave += new MouseEventHandler(Document_MouseLeave);

            //RegisterMapElement(_rectRoom);
        }

        private void RegisterMapElement(UIElement uiElement)
        {
            uiElement.MouseEnter += new MouseEventHandler(MapElement_MouseEnter);
            uiElement.MouseLeave += new MouseEventHandler(MapElement_MouseLeave);
        }

        private void MapElement_MouseLeave(object sender, MouseEventArgs e)
        {
            _dragHand.Visibility = Visibility.Visible;
        }

        private void MapElement_MouseEnter(object sender, MouseEventArgs e)
        {
            _dragHand.Visibility = Visibility.Collapsed;
        }

        private bool _isDragging = false;
        private double _fixMouseX;
        private double _fixMouseY;
        private double _fixScrollVertical;
        private double _fixScrollHorizontal;

        private void Document_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (_isDragging == false)
            {
                //this._svContent.CaptureMouse();
                _isDragging = true;
                _fixMouseX = e.GetPosition(this._svContent).X;
                _fixMouseY = e.GetPosition(this._svContent).Y;
                _fixScrollHorizontal = _svContent.HorizontalOffset;
                _fixScrollVertical = _svContent.VerticalOffset;
                _dragHand.IsHandOpen = false;
            }
        }

        private void Document_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (_isDragging)
            {
                //this._svContent.ReleaseMouseCapture();
                _isDragging = false;
                _dragHand.IsHandOpen = true;
            }
        }

        private void Document_MouseLeave(object sender, MouseEventArgs e)
        {
            _dragHand.Visibility = Visibility.Collapsed;
        }

        private void Document_MouseEnter(object sender, MouseEventArgs e)
        {
            _dragHand.Visibility = Visibility.Visible;
        }

        private void Document_MouseMove(object sender, MouseEventArgs e)
        {
            Point mousePoint = e.GetPosition(this._svContent);

            double x = mousePoint.X;
            double y = mousePoint.Y;

            double xPlusOffset = x + this._svContent.HorizontalOffset;
            double yPlusOffset = y + this._svContent.VerticalOffset;

            _dragHand.Visibility = Visibility.Visible;
            _dragHand.SetValue(Canvas.LeftProperty, xPlusOffset);
            _dragHand.SetValue(Canvas.TopProperty, yPlusOffset);


            if (_isDragging)
            {
                // Reverse x - _fixMouseX if dragging the other way is wanted.
                // Same goes with y - _fixMouseY
                double deltaX = x - _fixMouseX;
                double deltaY = y - _fixMouseY;

                double newHorizontalOffset = _fixScrollHorizontal - deltaX;
                double newVerticalOffset = _fixScrollVertical - deltaY;

                if (newHorizontalOffset > _svContent.ScrollableWidth)
                    newHorizontalOffset = _svContent.ScrollableWidth;

                if (newVerticalOffset > _svContent.ScrollableHeight)
                    newVerticalOffset = _svContent.ScrollableHeight;


                _svContent.ScrollToHorizontalOffset(newHorizontalOffset);
                _svContent.ScrollToVerticalOffset(newVerticalOffset);
            }
            else
            {
                bool showArrow = false;
                IEnumerable<UIElement> elements = VisualTreeHelper.FindElementsInHostCoordinates(e.GetPosition(null),this);
                if (elements != null)
                {
                    _txtDebug.Text = elements.Count().ToString();

                    foreach (UIElement uiElement in elements)
                    {
                        if (uiElement is Rectangle)
                        {
                            
                            showArrow = true;
                        }
                    }
                }

                _dragHand.Visibility = showArrow ? Visibility.Collapsed : Visibility.Visible;
            }
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            Hide();
        }

    }
}
