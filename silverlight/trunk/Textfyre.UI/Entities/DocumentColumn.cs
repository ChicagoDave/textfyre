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
using System.Collections.Generic;

namespace Textfyre.UI.Entities
{
    public class DocumentColumn
    {        
        private Controls.TextfyreBookPage _page;
        public Controls.TextfyreBookPage TextfyreBookPage
        {
            get
            {
                return _page;
            }
        }

        private Entities.DocumentColumnBehaviour _columnBehaviour;
        public Entities.DocumentColumnBehaviour ColumnBehaviour
        {
            get
            {
                return _columnBehaviour;
            }
            set
            {
                _columnBehaviour = value;
            }
        }


        #region :: Constructor ::
        public DocumentColumn( Controls.TextfyreBookPage page, Entities.DocumentColumnBehaviour columnBehaviour )
        {
            _page = page;
            _columnBehaviour = columnBehaviour;
            
            _scrollViewer = page.PageScrollViewer;
            _scrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;

            _width = _scrollViewer.Width - 35d; 
            _height = _scrollViewer.Height - 35d; // 18d;

            _stackPanel = new StackPanel();
            _stackPanel.HorizontalAlignment = HorizontalAlignment.Left;
            _stackPanel.Width = Width;
            _stackPanel.SizeChanged += new SizeChangedEventHandler(StackPanel_SizeChanged);
            _scrollViewer.Content = _stackPanel;

        }
        #endregion

        public double ContentHeight
        {
            get
            {
                double height = 0;
                foreach (UIElement uie in _stackPanel.Children)
                {
                    if (uie is TextBlock)
                    {
                        height += (uie as TextBlock).ActualHeight;
                    }

                }

                return height;
            }
        }

        public double ContentHeightExcludeLast
        {
            get
            {
                double height = 0;
                double lastheight = 0;
                foreach (UIElement uie in _stackPanel.Children)
                {
                    if (uie is TextBlock)
                    {
                        double actheight = (uie as TextBlock).ActualHeight;
                        height += actheight;
                        lastheight = actheight;
                    }

                }

                return height- lastheight;
            }
        }


        #region :: IsEmpty ::
        public bool IsEmpty
        {
            get
            {
                return _page.IsEmpty;
            }
        }
        #endregion

        #region :: ScrollViewer ::
        private ScrollViewer _scrollViewer;
        public ScrollViewer ScrollViewer
        {
            get
            {
                return _scrollViewer;
            }
        }
        #endregion

        #region :: Add & Remove ::
        public void Add(UIElement uiElement)
        {
            //Border b = new Border();
            //b.BorderBrush = new SolidColorBrush(Colors.Magenta);
            //b.BorderThickness = new Thickness(2);
            //b.Child = uiElement;
            //_stackPanel.Children.Add(b);
            _stackPanel.Children.Add(uiElement);
        }

        public void Remove(UIElement uiElement)
        {
            _stackPanel.Children.Remove(uiElement);
        }
        #endregion

        #region :: StackPanel & ScrollViewer Scroll ::
        private StackPanel _stackPanel;
        private void StackPanel_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            Size size = e.NewSize;
            if (size.Height > _scrollViewer.Height)
            {
                _wantedVerticalScrollOffset = size.Height - (ScrollViewer.Height - 8d);
                //ScrollViewer.ScrollToVerticalOffset(_wantedVerticalScrollOffset);
                AnimateScroll();
            }
        }
        private double _wantedVerticalScrollOffset = 0;
        private Storyboard _scrollStoryboard;
        private void AnimateScroll()
        {
            if (_wantedVerticalScrollOffset > ScrollViewer.VerticalOffset)
            {
                if (_scrollStoryboard == null)
                {
                    _scrollStoryboard = new Storyboard();
                    _scrollStoryboard.Completed += new EventHandler(_scrollStoryboard_Completed);
                    _scrollStoryboard.Duration = TimeSpan.FromMilliseconds(100);
                    _scrollStoryboard.Begin();
                }
            }
        }

        void _scrollStoryboard_Completed(object sender, EventArgs e)
        {
            _scrollStoryboard.Stop();
            double newScrollPos = ScrollViewer.VerticalOffset + Settings.ScrollSpeed;
            if (newScrollPos > _wantedVerticalScrollOffset)
                newScrollPos = _wantedVerticalScrollOffset;

            ScrollViewer.ScrollToVerticalOffset(newScrollPos);

            if (_wantedVerticalScrollOffset > ScrollViewer.VerticalOffset)
            {
                _scrollStoryboard.Begin();
            }
            else
            {
                _scrollStoryboard = null;
            }
        }
        #endregion

        #region :: Width & Height ::
        private double _width;
        public double Width
        {
            get
            {
                return _width;
            }
        }

        private double _height;
        public double Height
        {
            get
            {
                return _height;
            }
        }
        #endregion

        #region :: PageHeight ::
        public void PageHeightInc(double height)
        {
            _pageHeightSinceLastInput += height;
            _pageHeightTotal += height;
        }
        public void PageHeightReset()
        {
            _pageHeightSinceLastInput = 0d;
        }
        #endregion

        #region :: PageHeightSinceLastInput ::
        private double _pageHeightSinceLastInput = 0d;
        public double PageHeightSinceLastInput
        {
            get
            {
                return _pageHeightSinceLastInput;
            }
        }
        #endregion

        #region :: PageHeightTotal ::
        private double _pageHeightTotal = 0d;
        public double PageHeightTotal
        {
            get
            {
                return _pageHeightTotal;
            }
        }
        #endregion
    }
}
