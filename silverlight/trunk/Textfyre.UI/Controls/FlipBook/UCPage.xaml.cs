using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Diagnostics;
using System.Text;

namespace Textfyre.UI.Controls.FlipBook
{
    public partial class UCPage : UserControl
    {
        private static MouseEventArgs _lastMouseEventArgs = null;
        
        public UCPage()
        {
            InitializeComponent();
        }

        public ContentControl Page0
        {
            get { return page0; }
        }
        public ContentControl Page1
        {
            get { return page1; }
        }
        public ContentControl Page2
        {
            get { return page2; }
        }

        private const int animationDuration = 200;  // Was 500

        private void OnLoaded(object sender, RoutedEventArgs args)
        {
            ApplyParameters(new PageParameters(this.RenderSize));
        }

        void anim_Completed(object sender, EventArgs e)
        {
            ApplyParameters(new PageParameters(this.RenderSize));

            if (Status == PageStatus.TurnAnimation)
            {
                Status = PageStatus.None;
                if (PageTurned != null)
                    PageTurned(this, new RoutedEventArgs());


                if( FlipBook.UCBook.CurrentUCBook.CurrentSheetIndex > 0 )
                    OnMouseMove(this, _lastMouseEventArgs);

            }
            else
                Status = PageStatus.None;
        }

        void anim_CurrentTimeInvalidated(object sender, EventArgs e)
        {
            CornerPointRefreshed();
        }

        private void CornerPointRefreshed()
        {
            PageParameters? parameters = ComputePage(this, CornerPoint, origin);
            _cornerPoint = CornerPoint;
            if (parameters != null)
                ApplyParameters(parameters.Value);
        }

        internal CornerOrigin origin = CornerOrigin.BottomRight;
        private double gripSize = Settings.PageGripSize;
        private PageStatus _status = PageStatus.None;
        internal Action<PageStatus> SetStatus = null;
        internal Func<PageStatus> GetStatus = null;

        public PageStatus Status
        {
            private get 
            {
                if (GetStatus != null)
                    return GetStatus();
                else
                    return _status;
            }
            set 
            { 
                if (SetStatus != null)
                    SetStatus(value);
                else
                    _status = value; 
                gridShadow.Visibility = value == PageStatus.None ? Visibility.Collapsed : Visibility.Visible;
                canvasReflection.Visibility = value == PageStatus.None ? Visibility.Collapsed : Visibility.Visible;
            }
        }

        private Point _cornerPoint;
        
        private Point CornerPoint
        {
            get { return (Point) GetValue(UCPage.CornerPointProperty); }
            set { SetValue(UCPage.CornerPointProperty, value); }
        }

        private void ApplyParameters(PageParameters parameters)
        {
            pageReflection.Opacity = parameters.Page0ShadowOpacity;

            rectangleRotate.Angle = parameters.Page1RotateAngle; 
            rectangleRotate.CenterX = parameters.Page1RotateCenterX; 
            rectangleRotate.CenterY = parameters.Page1RotateCenterY; 
            rectangleTranslate.X = parameters.Page1TranslateX; 
            rectangleTranslate.Y = parameters.Page1TranslateY;

            //PathGeometry clippingFigure = null;
            //if (rectangleVisible.Clip == null)
            //{
            //    clippingFigure = new PathGeometry();
            //    clippingFigure.Figures = new PathFigureCollection();
            //    clippingFigure.Figures.Add(new PathFigure { IsClosed = true });
            //}
            //else
            //    clippingFigure = rectangleVisible.Clip as PathGeometry;

            clippingFigure.Figures.Clear();
            clippingFigure.Figures.Add(parameters.Page1ClippingFigure);

            //RectangleGeometry rg = (RectangleGeometry) clippingPage0.Geometry1;
            //rg.Rect = new Rect(parameters.RenderSize);
            //PathGeometry pg = (PathGeometry) clippingPage0.Geometry2;
            //pg.Figures.Clear();
            //pg.Figures.Add(parameters.Page2ClippingFigure);

            //SL 2 patch to replace WPF CombinedGeometry that does not exist:

            var clippingPage0 = gridPage0.Clip as PathGeometry;
            if (clippingPage0 == null)
            {
                clippingPage0 = new PathGeometry();
                clippingPage0.Figures = new PathFigureCollection();
                gridPage0.Clip = clippingPage0;
            }

            var pg = clippingPage0 as PathGeometry;
            pg.Figures.Clear();
            
            var pf = new PathFigure();
            pf.IsClosed = true;
            pf.Segments = new PathSegmentCollection();
            var clip = parameters.Page2ClippingFigure;
            if (clip.Segments.Count == 2)
                switch (origin)
                {
                    case CornerOrigin.TopRight:
                        SilverlightParamFix(pf, clip);
                        break;
                    case CornerOrigin.TopLeft:
                        PathFigureSwapX(clip);
                        SilverlightParamFix(pf, clip);
                        PathFigureSwapX(pf);
                        break;
                    case CornerOrigin.BottomRight:
                        PathFigureSwapY(clip);
                        SilverlightParamFix(pf, clip);
                        PathFigureSwapY(pf);
                        break;
                    case CornerOrigin.BottomLeft:
                        PathFigureSwapX(clip);
                        PathFigureSwapY(clip);
                        SilverlightParamFix(pf, clip);
                        PathFigureSwapX(pf);
                        PathFigureSwapY(pf);
                        break;
                }
            else
            {
                gridPage0.Clip = null;
            }
            pg.Figures.Add(pf);
            
            pageReflection.StartPoint = parameters.Page1ReflectionStartPoint;
            pageReflection.EndPoint = parameters.Page1ReflectionEndPoint;
            
            pageShadow.StartPoint = parameters.Page0ShadowStartPoint;
            pageShadow.EndPoint = parameters.Page0ShadowEndPoint;
        }

        private void PathFigureSwapX(PathFigure source)
        {
            source.StartPoint = new Point(ActualWidth - source.StartPoint.X, source.StartPoint.Y);
            foreach (var s in source.Segments.OfType<LineSegment>())
                s.Point = new Point(ActualWidth - s.Point.X, s.Point.Y);
        }

        private void PathFigureSwapY(PathFigure source)
        {
            source.StartPoint = new Point(source.StartPoint.X, ActualHeight - source.StartPoint.Y);
            foreach (var s in source.Segments.OfType<LineSegment>())
                s.Point = new Point(s.Point.X, ActualHeight - s.Point.Y);
        }

        private void SilverlightParamFix(PathFigure pf, PathFigure clip)
        {
            pf.StartPoint = new Point(0, 0);
            var l0 = clip.Segments[0] as LineSegment;
            if (clip.StartPoint.Y == 0)
            {
                pf.Segments.Add(new LineSegment { Point = l0.Point });
                var l1 = clip.Segments[1] as LineSegment;

                if ((l1.Point.Y >= 0) && (l1.Point.Y <= this.ActualHeight))
                {
                    pf.Segments.Add(new LineSegment { Point = l1.Point });
                    pf.Segments.Add(new LineSegment { Point = new Point(ActualWidth, ActualHeight) });
                }
                else
                {
                    var x1 = ActualHeight * (l1.Point.X - l0.Point.X) / l1.Point.Y + l0.Point.X;
                    pf.Segments.Add(new LineSegment { Point = new Point(x1, ActualHeight) });
                }
            }
            else
            {
                var l1 = clip.Segments[1] as LineSegment;

                pf.Segments.Add(new LineSegment { Point = l1.Point });

                pf.Segments.Add(new LineSegment { Point = l0.Point });
                pf.Segments.Add(new LineSegment { Point = new Point(ActualWidth, ActualHeight) });
            }
            pf.Segments.Add(new LineSegment { Point = new Point(0, ActualHeight) });
        }

        #region :: CornerGuideAnimation ::
        private UIElement _cornerGuideAnimationUIElement = null;
        private double _cornerGuideCnt = 0;
        private double _cornerGuideDir = 0.50d;
        private Storyboard _cornerGuideStoryboard = null;
        public void CornerGuideAnimation(UIElement uie)
        {
            if (_cornerGuideStoryboard != null)
                return;
            
            if (IsNextPageAStoryPage == false)
                return;

            _cornerGuideAnimationUIElement = uie;

            if (Current.Game.CanPageFlipForward == false)
                return;

            if ((Status == PageStatus.DropAnimation) || (Status == PageStatus.TurnAnimation))
                return;

            if (_cornerGuideStoryboard == null)
            {
                _cornerGuideStoryboard = new Storyboard();
                _cornerGuideStoryboard.Completed += new EventHandler(_cornerGuideStoryboard_Completed);
                _cornerGuideStoryboard.Duration = TimeSpan.FromMilliseconds(100);
            }

            if( _cornerGuideStoryboard.GetCurrentState() != ClockState.Active )
                _cornerGuideStoryboard.Begin();

        }

        void _cornerGuideStoryboard_Completed(object sender, EventArgs e)
        {
            if (_cornerGuideAnimationUIElement == null)
            {
                return;
            }

            if (IsNextPageAStoryPage == false)
            {
                _cornerGuideAnimationUIElement = null;
                return;
            }

            Point p = new Point(0, 0);
            CornerOrigin corner = CornerOrigin.BottomRight;
            if (IsBottomRightCornerEnabled)
            {
                corner = CornerOrigin.BottomRight;
                Rect rect = new Rect(_cornerGuideAnimationUIElement.RenderSize.Width - gripSize, _cornerGuideAnimationUIElement.RenderSize.Height - gripSize, gripSize, gripSize);

                p = new Point(rect.Left + 10 + _cornerGuideCnt, rect.Top + 10 + _cornerGuideCnt);
                _cornerGuideCnt += _cornerGuideDir;
                if (_cornerGuideCnt > 10)
                    _cornerGuideDir = -0.50d;
                if (_cornerGuideCnt < 0)
                    _cornerGuideDir = 0.50d;
            }
            //else if (IsBottomLeftCornerEnabled)
            //{
            //    corner = CornerOrigin.BottomLeft;
            //    Rect rect = new Rect(0, _cornerGuideAnimationUIElement.RenderSize.Height - gripSize, gripSize, gripSize);

            //    p = new Point(rect.Right - 10 + _cornerGuideCnt, rect.Top + 10 + _cornerGuideCnt);
            //    //_cornerGuideCnt -= _cornerGuideDir;
            //    //if (_cornerGuideCnt > 10)
            //    //    _cornerGuideDir = -0.50d;
            //    //if (_cornerGuideCnt < 0)
            //    //    _cornerGuideDir = 0.50d;
            //}

            if (p.X != 0 && p.Y != 0)
            {
                double pageHeight = this.ActualHeight;
                if (p.Y >= pageHeight - 2 && p.Y <= pageHeight + 1)
                    p.Y = pageHeight + 2;
                
                //Status = PageStatus.;
                PageParameters? parameters = ComputePage(_cornerGuideAnimationUIElement, p, corner);
                _cornerPoint = p;
                if (parameters != null)
                    ApplyParameters(parameters.Value);
            }
            _cornerGuideStoryboard.Begin();
        }

        private bool IsNextPageAStoryPage
        {
            get
            {
                if (this.page1 == null || this.page1.Content == null || this.page1.Content is Textfyre.UI.Controls.TextfyreBookPage == false)
                    return false;

                string pageID = (this.page1.Content as Textfyre.UI.Controls.TextfyreBookPage).PageID;
                if (pageID != "Story")
                    return false;

                return true;
            }
        }

        #endregion

        private void OnMouseMove(object sender, MouseEventArgs args)
        {
            if (args == null)
                return;
            
            _lastMouseEventArgs = args;

            if ((Status == PageStatus.DropAnimation) || (Status == PageStatus.TurnAnimation))
                return;

            UIElement source = sender as UIElement;
            Point p = args.GetPosition(source);

            // Correct (by skipping) odd behaviour when calculating 
            // those Y points.
            double pageHeight = this.ActualHeight;
            if (p.Y >= pageHeight - 2 && p.Y <= pageHeight+1)
                p.Y = pageHeight+2;

            if (!IsMouseCaptured) //(!(sender as UIElement).IsMouseCaptured)
            {
                CornerOrigin? tmp = GetCorner(source, p);

                if( tmp.HasValue )
                {
                    if (tmp.Value == CornerOrigin.BottomRight || tmp.Value == CornerOrigin.TopRight)
                    {
                        if (Current.Game.CanPageFlipForward == false)
                            return;
                    }
                }

                if (tmp.HasValue)
                {
                    origin = tmp.Value;
                    this.Cursor = Cursors.Hand;
                }
                else
                {
                    this.Cursor = null;

                    if (Status == PageStatus.DraggingWithoutCapture)
                    {
                        DropPage(ComputeAnimationDuration(source, p, origin));
                    }
                    CornerGuideAnimation(source);
                    return;
                }
                Status = PageStatus.DraggingWithoutCapture;
            }

            _cornerGuideAnimationUIElement = null;
            PageParameters? parameters = ComputePage(source, p, origin);
            _cornerPoint = p;
            if (parameters != null)
                ApplyParameters(parameters.Value);
        }

        public void InitPage(CornerOrigin origin)
        {
            Point p = new Point(0, 0);
            
            switch (origin)
            {
                case CornerOrigin.BottomLeft :
                    p = new Point(0, ActualHeight);
                    break;
                case CornerOrigin.BottomRight:
                    p = new Point(ActualWidth, ActualHeight);
                    break;
                case CornerOrigin.TopLeft:
                    p = new Point(0, 0);
                    break;
                case CornerOrigin.TopRight:
                    p = new Point(ActualWidth, 0);
                    break;
            }
            CornerPoint = p;
            CornerPointRefreshed();
        }

        private static int ComputeAnimationDuration(UIElement source, Point p, CornerOrigin origin) 
        {
            double ratio = ComputeProgressRatio(source, p, origin);

            return Convert.ToInt32(animationDuration * (ratio / 2 + 0.5));
        }

        private static double ComputeProgressRatio(UIElement source, Point p, CornerOrigin origin) 
        {
            if ((origin == CornerOrigin.BottomLeft) || (origin == CornerOrigin.TopLeft))
                return p.X / source.RenderSize.Width;
            else
                return (source.RenderSize.Width - p.X) / source.RenderSize.Width;
        }

        private void OnMouseDoubleClick(object sender, MouseButtonEventArgs args)
        {
        }

        private CornerOrigin? GetCorner(UIElement source, Point position) 
        {
            CornerOrigin? result = null;

            Rect topLeftRectangle = new Rect(0, 0, gripSize, gripSize);
            Rect topRightRectangle = new Rect(source.RenderSize.Width - gripSize, 0, gripSize, gripSize);
            Rect bottomLeftRectangle = new Rect(0, source.RenderSize.Height - gripSize, gripSize, gripSize);
            Rect bottomRightRectangle = new Rect(source.RenderSize.Width - gripSize, source.RenderSize.Height - gripSize, gripSize, gripSize);

            if (IsTopLeftCornerEnabled && topLeftRectangle.Contains(position))
                result = CornerOrigin.TopLeft;
            else if (IsTopRightCornerEnabled && topRightRectangle.Contains(position))
                result = CornerOrigin.TopRight;
            else if (IsBottomLeftCornerEnabled && bottomLeftRectangle.Contains(position))
                result = CornerOrigin.BottomLeft;
            else if (IsBottomRightCornerEnabled && bottomRightRectangle.Contains(position))
                result = CornerOrigin.BottomRight;

            return result;
        }

        public bool IsMouseCaptured = false;

        private void MyCaptureMouse()
        {
            this.CaptureMouse();
            IsMouseCaptured = true;
        }

        private void MyReleaseMouseCapture()
        {
            this.ReleaseMouseCapture();
            IsMouseCaptured = false;
        }

        private void OnMouseDown(object sender, MouseButtonEventArgs args)
        {
            if ((Status == PageStatus.DropAnimation) || (Status == PageStatus.TurnAnimation))
                return;

            UIElement source = sender as UIElement;
            Point p = args.GetPosition(source);
            
            CornerOrigin? tmp = GetCorner(source, p);

            if (tmp.HasValue)
            {
                if (tmp.Value == CornerOrigin.BottomRight || tmp.Value == CornerOrigin.TopRight)
                {
                    if (Current.Game.CanPageFlipForward == false)
                        return;
                } 
                
                origin = tmp.Value;
                this.MyCaptureMouse();
            }
            else
                return;

            Status = PageStatus.Dragging;
        }
        private void OnMouseUp(object sender, MouseButtonEventArgs args)
        {
            if (this.IsMouseCaptured)
            {
                Status = PageStatus.None;

                UIElement source = sender as UIElement;
                Point p = args.GetPosition(source);
                CornerOrigin? gripZone = GetCorner(source, p);

                if (gripZone.HasValue)
                {
                    if (gripZone.Value == CornerOrigin.BottomRight || gripZone.Value == CornerOrigin.TopRight)
                    {
                        if (Current.Game.CanPageFlipForward == false)
                            return;
                    }
                }

                if (gripZone.HasValue || IsOnNextPage(args.GetPosition(this), this, origin))
                    TurnPage(animationDuration);
                else 
                    DropPage(ComputeAnimationDuration(source, p, origin));

                this.MyReleaseMouseCapture();
            }
        }

        private void OnMouseLeave(object sender, MouseEventArgs args) 
        {
            if (Status == PageStatus.DraggingWithoutCapture)
            {
                //DropPage(ComputeAnimationDuration(source, p));
                DropPage(animationDuration);
            }
        }
        private Point OriginToPoint(UIElement source, CornerOrigin origin) 
        {
            switch (origin)
            {
                case CornerOrigin.BottomLeft:
                    return new Point(0, source.RenderSize.Height);
                case CornerOrigin.BottomRight:
                    return new Point(source.RenderSize.Width, source.RenderSize.Height);
                case CornerOrigin.TopRight:
                    return new Point(source.RenderSize.Width, 0);
                default:
                    return new Point(0, 0);
            }
        }
        private Point OriginToOppositePoint(UIElement source, CornerOrigin origin) 
        {
            switch (origin)
            {
                case CornerOrigin.BottomLeft:
                    return new Point(source.RenderSize.Width * 2, source.RenderSize.Height);
                case CornerOrigin.BottomRight:
                    return new Point(-source.RenderSize.Width, source.RenderSize.Height);
                case CornerOrigin.TopRight:
                    return new Point(-source.RenderSize.Width, 0);
                default:
                    return new Point(source.RenderSize.Width * 2, 0);
            }
        }
        private bool IsOnNextPage(Point p, UIElement source, CornerOrigin origin) 
        {
            switch (origin)
            {
                case CornerOrigin.BottomLeft:
                case CornerOrigin.TopLeft:
                    return p.X > source.RenderSize.Width;
                default:
                    return p.X < 0;
            }
        }

        private void DropPage(int duration) 
        {
            Status = PageStatus.DropAnimation;

            UIElement source = this as UIElement;
            CornerPoint = _cornerPoint;

            //this.BeginAnimation(UCPage.CornerPointProperty, null);

            //PointAnimation anim =
            //    new PointAnimation()
            //    {
            //        To = OriginToPoint(this, origin),
            //        Duration = new Duration(TimeSpan.FromMilliseconds(duration))
            //    };
            //anim.AccelerationRatio = 0.6;
            //anim.CurrentTimeInvalidated += new EventHandler(anim_CurrentTimeInvalidated);
            
            //anim.Completed += new EventHandler(anim_Completed);

            //var sb = new Storyboard();
            //sb.Duration = anim.Duration;
            //sb.Children.Add(anim);
            //Storyboard.SetTarget(anim, this);
            //Storyboard.SetTargetProperty(anim, "CornerPoint");

            //(this.Parent as FrameworkElement).Resources.Add(sb);
            //this.Resources.Add(sb);
            //sb.Completed += new EventHandler(anim_Completed);
            //sb.Begin();

            //this.BeginAnimation(UCPage.CornerPointProperty, anim);

            var anim = new TimerAnimation<Point>(this, UCPage.CornerPointProperty,
                OriginToPoint(this, origin), new Duration(TimeSpan.FromMilliseconds(duration)),
                    (from, to, percent) => new Point { X = from.X + (to.X - from.X) * percent, Y = from.Y + (to.Y - from.Y) * percent });
            anim.Completed += new EventHandler(anim_Completed);
            anim.Begin();
        }

        public void TurnPage() 
        {
            TurnPage(animationDuration);
        }

        private void TurnPage(int duration)
        {
            Status = PageStatus.TurnAnimation;

            UIElement source = this as UIElement;
            CornerPoint = _cornerPoint;

            //this.BeginAnimation(UCPage.CornerPointProperty, null);
            //PointAnimation anim = 
            //    new PointAnimation(
            //        OriginToOppositePoint(this, origin),
            //        new Duration(TimeSpan.FromMilliseconds(duration)));
            //anim.AccelerationRatio = 0.6;

            //anim.CurrentTimeInvalidated +=new EventHandler(anim_CurrentTimeInvalidated);
            //anim.Completed += new EventHandler(anim_Completed);
            //this.BeginAnimation(UCPage.CornerPointProperty, anim);
            var anim = new TimerAnimation<Point>(this, UCPage.CornerPointProperty,
                OriginToOppositePoint(this, origin), new Duration(TimeSpan.FromMilliseconds(duration)),
                    (from, to, percent) => new Point { X = from.X + (to.X - from.X) * percent, Y = from.Y + (to.Y - from.Y) * percent });
            anim.Completed += new EventHandler(anim_Completed);
            anim.Begin();
        }

        public void AutoTurnPage(CornerOrigin fromCorner, int duration)
        {
            if( fromCorner == CornerOrigin.BottomRight || fromCorner == CornerOrigin.TopRight )
            {
                if ( Current.Game.CanPageFlipForward == false )
                        return;
            }

            if (Status != PageStatus.None)
                return;

            Status = PageStatus.TurnAnimation;

            UIElement source = this as UIElement;

            Point startPoint = OriginToPoint(this, fromCorner);
            Point endPoint = OriginToOppositePoint(this, fromCorner);

            origin = fromCorner;
            CornerPoint = startPoint;

            //BezierSegment bs =
            //    new BezierSegment { Point1 = startPoint, Point2 = new Point(endPoint.X + (startPoint.X - endPoint.X) / 3, 250), Point3 = endPoint };

            //PathGeometry path = new PathGeometry();
            //PathFigure figure = new PathFigure();
            //figure.StartPoint = startPoint;
            //figure.Segments.Add(bs);
            //figure.IsClosed = false;
            //path.Figures.Add(figure);

            //PointAnimationUsingPath anim =
            //    new PointAnimationUsingPath();
            //anim.PathGeometry = path;
            //anim.Duration = new Duration(TimeSpan.FromMilliseconds(duration));
            //anim.AccelerationRatio = 0.6;

            //anim.CurrentTimeInvalidated += new EventHandler(anim_CurrentTimeInvalidated);
            var anim = new TimerAnimation<Point>(this, UCPage.CornerPointProperty,
                endPoint, new Duration(TimeSpan.FromMilliseconds(duration)),
                (from, to, percent) => ComputeAutoAnimationPoints(from, to, percent));
            anim.Completed += new EventHandler(anim_Completed);
            anim.Begin();
        }

        private Point ComputeAutoAnimationPoints(Point from, Point to, double percent)
        {
            double c = ActualHeight / 4;
            double d = ActualWidth;
            double a = -c / (d * d);
            double x = from.X + (to.X - from.X) * percent;
            double f = 0;
            if ((origin == CornerOrigin.BottomLeft) || (origin == CornerOrigin.TopLeft))
                f = a * (x - d) * (x - d) + c;
            else
                f = a * x * x + c;
            return new Point(x, from.Y - f);
        }

        public bool IsTopLeftCornerEnabled 
        {
            get { return (bool) GetValue(UCPage.IsTopLeftCornerEnabledProperty) ; }
            set { SetValue(UCPage.IsTopLeftCornerEnabledProperty, value); }
        }

        public bool IsTopRightCornerEnabled 
        {
            get { return (bool)GetValue(UCPage.IsTopRightCornerEnabledProperty); }
            set { SetValue(UCPage.IsTopRightCornerEnabledProperty, value); }
        }
        public bool IsBottomLeftCornerEnabled 
        {
            get { return (bool)GetValue(UCPage.IsBottomLeftCornerEnabledProperty); }
            set { SetValue(UCPage.IsBottomLeftCornerEnabledProperty, value); }
        }
        public bool IsBottomRightCornerEnabled 
        {
            get { return (bool)GetValue(UCPage.IsBottomRightCornerEnabledProperty); }
            set { SetValue(UCPage.IsBottomRightCornerEnabledProperty, value); }
        }

        public static DependencyProperty CornerPointProperty;
        public static DependencyProperty IsTopLeftCornerEnabledProperty;
        public static DependencyProperty IsTopRightCornerEnabledProperty;
        public static DependencyProperty IsBottomLeftCornerEnabledProperty;
        public static DependencyProperty IsBottomRightCornerEnabledProperty;
        
        //public static readonly RoutedEvent PageTurnedEvent;

        public event RoutedEventHandler PageTurned;
        //{
        //    add
        //    {
        //        base.AddHandler(PageTurnedEvent, value);
        //    }
        //    remove
        //    {
        //        base.RemoveHandler(PageTurnedEvent, value);
        //    }
        //}

        static UCPage()
        {
            //PageTurnedEvent = EventManager.RegisterRoutedEvent("PageTurned", RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(UCPage));
            CornerPointProperty = DependencyProperty.Register("CornerPoint", typeof(Point), typeof(UCPage), new PropertyMetadata(new PropertyChangedCallback(OnCornerPointChanged)));
            IsTopLeftCornerEnabledProperty = DependencyProperty.Register("IsTopLeftCornerEnabled", typeof(bool), typeof(UCPage), null); //new PropertyMetadata(true));
            IsTopRightCornerEnabledProperty = DependencyProperty.Register("IsTopRightCornerEnabled", typeof(bool), typeof(UCPage), null); //new PropertyMetadata(true));
            IsBottomLeftCornerEnabledProperty = DependencyProperty.Register("IsBottomLeftCornerEnabled", typeof(bool), typeof(UCPage), null); //new PropertyMetadata(true));
            IsBottomRightCornerEnabledProperty = DependencyProperty.Register("IsBottomRightCornerEnabled", typeof(bool), typeof(UCPage), null); //new PropertyMetadata(true));
            
        }
        static void OnCornerPointChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            (d as UCPage).OnCornerPointChanged(e);
        }
        internal void OnCornerPointChanged(DependencyPropertyChangedEventArgs e)
        {
            if ((Status == PageStatus.DropAnimation) || (Status == PageStatus.TurnAnimation))
                anim_CurrentTimeInvalidated(this, new EventArgs());
        }


    }

    public class TimerAnimation<T>
    {
        public TimerAnimation(DependencyObject source, DependencyProperty property, T to, Duration duration, ComputeCurrentValueHandler<T> computeCurrentValue)
        {
            this.source = source;
            this.property = property;
            this.from = (T) source.GetValue(property);
            this.to = to;
            this.duration = duration;
            this.ComputeCurrentValue = computeCurrentValue;
        }
        
        private T from;
        private T to;
        private DateTime startTime;
        private Duration duration;
        private DependencyObject source;
        private DependencyProperty property;

        private DispatcherTimer timer;

        public void Begin()
        {
            timer = new DispatcherTimer();
            startTime = DateTime.Now;
            timer.Interval = TimeSpan.FromMilliseconds(10);
            timer.Tick += new EventHandler(timer_Tick);
            timer.Start();
        }

        void timer_Tick(object sender, EventArgs e)
        {
            var now = DateTime.Now;
            double elapsed = now.Subtract(startTime).TotalMilliseconds;
            if (elapsed > duration.TimeSpan.TotalMilliseconds)
            {
                //Ensure last value is reached
                source.SetValue(property, to);

                DoCompleted();
                timer.Stop();
            }
            else
            {
                var newValue = ComputeCurrentValue(from, to, (double) elapsed / duration.TimeSpan.TotalMilliseconds); // (elapsed * (to - from)) / duration.TimeSpan.Milliseconds;
                System.Diagnostics.Debug.WriteLine(newValue.ToString());
                source.SetValue(property, newValue);
                DoCurrentTimeInvalidated(newValue);
            }
        }

        private void DoCurrentTimeInvalidated(T newValue)
        {
            if (CurrentTimeInvalidated != null)
                CurrentTimeInvalidated(newValue);
        }

        private void DoCompleted()
        {
            if (Completed != null)
                Completed(this, new RoutedEventArgs());
        }

        public EventHandler Completed;
        public Action<T> CurrentTimeInvalidated;
        private ComputeCurrentValueHandler<T> ComputeCurrentValue;
    }
    public delegate T ComputeCurrentValueHandler<T>(T from, T to, double percent);
}
