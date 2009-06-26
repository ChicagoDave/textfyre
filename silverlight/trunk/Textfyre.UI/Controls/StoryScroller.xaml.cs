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

namespace Textfyre.UI.Controls
{
    public partial class StoryScroller : UserControl
    {
        private double _viewportHeight = 0;
        private double _contentHeight = 0;
        private double _contentYOffset = 0;

        private bool _skipSizeChange = false;

        public StoryScroller()
        {
            InitializeComponent();
            Init();
        }

        private double ContentHeight
        {
            get
            {
                return _contentHeight;
            }

            set
            {
                _contentHeight = value;
            }
        }


        public void AddSection(DocSystem.Section section)
        {
            ContentHeight += section.Height;
            
            if (ContentHeight > 0)
            {
                _skipSizeChange = true;
                RemovePastTextBlocks();
            }
            _skipSizeChange = false;
            ContentPanel.Children.Add(section.HostGridScroll);
        }

        private void Init()
        {
            ContentHeight = 0;
            _viewportHeight = Settings.BookPageInnerContentHeight;

            LayoutRoot.Width = Settings.BookPageInnerContentWidth;
            ContentPanel.Width = Settings.BookPageInnerContentWidth;
            ContentViewPort.Rect = new Rect(0, 0, Settings.BookPageInnerContentWidth, Settings.BookPageInnerContentHeight);
            this.Width = Settings.BookPageInnerContentWidth;
            this.Height = Settings.BookPageInnerContentHeight;
            this.Margin = new Thickness(Settings.BookPageInnerContentOffsetLeft, Settings.BookPageInnerContentOffsetTop, 0, 0);
            ContentPanel.SizeChanged += new SizeChangedEventHandler(ContentPanel_SizeChanged);
        }

        private void ContentPanel_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            if (_skipSizeChange)
                return;
            
            _contentHeight = e.NewSize.Height;

            if (AmountToScroll > 0)
            {
                AnimateScroll();
            }
        }
        private Storyboard _scrollStoryboard;
        private void AnimateScroll()
        {
            if (AmountToScroll > 0)
            {
                if (Current.Game.IsScrollLimitEnabled == false)
                {
                    YOffset = YOffset - AmountToScroll;
                }
                else
                if (_scrollStoryboard == null )
                {
                    _scrollStoryboard = new Storyboard();
                    _scrollStoryboard.Completed += new EventHandler(_scrollStoryboard_Completed);
                    _scrollStoryboard.Duration = TimeSpan.FromMilliseconds(50);
                    _scrollStoryboard.Begin();
                }
            }
        }

        void _scrollStoryboard_Completed(object sender, EventArgs e)
        {
            _scrollStoryboard.Stop();
            double newScrollPos = Settings.ScrollSpeed; //AmountToScroll + Settings.ScrollSpeed;
            
            if (newScrollPos > AmountToScroll)
                newScrollPos = AmountToScroll;

            YOffset = YOffset - newScrollPos;


            if (AmountToScroll > 0 )
            {
                _scrollStoryboard.Begin();
            }
            else
            {
                _scrollStoryboard = null;
            }
        }

        private double YOffset
        {
            get
            {
                return _contentYOffset;
            }

            set
            {
                _contentYOffset = value;
                CorrectYOffset();
                Canvas.SetTop(ContentPanel, _contentYOffset);
            }
        }

        private double AmountToScroll
        {
            get
            {
                CorrectYOffset();

                return _contentYOffset - _viewportHeight + _contentHeight;
            }
        }

        private void CorrectYOffset()
        {
            // Correct values
            if ((_contentYOffset * -1d) + _viewportHeight > _contentHeight)
            {
                _contentYOffset = _viewportHeight - _contentHeight;
            }

            if (_contentYOffset > 0d)
                _contentYOffset = 0d;
        }


        private void RemovePastTextBlocks()
        {
            double contentHeight = ContentHeight;
            //TextBlock prevTextBlock = null;
            Grid prevGrid = null;
            double height = 0;
            double heightRemoved = 0;
            double prevHeight = 0;
            List<UIElement> uieToRemove = new List<UIElement>();
            foreach (UIElement uie in ContentPanel.Children)
            {
                if (prevGrid != null && (contentHeight - height) > (Settings.BookPageInnerContentHeight * 2))
                {
                    uieToRemove.Add(prevGrid);
                    heightRemoved += prevHeight;
                }

                prevGrid = null;

                if (uie is Grid)
                {
                    Grid g = uie as Grid;

                    if (g != null && g.Children.Count > 0 )
                    {
                        if (g.Children[0] is TextBlock)
                        {
                            prevGrid = g;
                            prevHeight = (g.Children[0] as TextBlock).ActualHeight;
                            height += prevHeight;
                        }
                        else if (g.Children[0] is StackPanel)
                        {
                            prevGrid = g;
                            prevHeight = (g.Children[0] as StackPanel).ActualHeight;
                            height += prevHeight;
                        }
                    }
                }
                else
                if (uie is Rectangle)
                {
                    height += (uie as Rectangle).Height;
                }
            }

            foreach (UIElement uie in uieToRemove)
            {
                ContentPanel.Children.Remove(uie);
            }

            if (heightRemoved > 0)
            {
                Rectangle rect;
                if (ContentPanel.Children.Count > 0 && ContentPanel.Children[0] is Rectangle)
                {
                    rect = ContentPanel.Children[0] as Rectangle;
                }
                else
                {
                    rect = new Rectangle();
                    //rect.Stroke = new SolidColorBrush(Colors.Black);
                    rect.StrokeThickness = 1d;
                    //rect.Fill = new SolidColorBrush(Colors.Red);
                    rect.Width=100;
                    rect.Height = 0;
                    ContentPanel.Children.Insert(0, rect);
                }

                rect.Height += heightRemoved;
            }

        }


    }
}
