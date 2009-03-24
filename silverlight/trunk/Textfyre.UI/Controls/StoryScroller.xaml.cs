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
        
        public StoryScroller()
        {
            InitializeComponent();
            Init();
        }

        public double ContentHeight
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
            //_contentHeight += section.Height;
            ContentPanel.Children.Add(section.HostGridScroll);
        }

        private void Init()
        {
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
            _contentHeight = e.NewSize.Height;

            if (AmountToScroll > 0)
            {
                AnimateScroll();
            }
            //RemovePastTextBlocks();

            //Size size = e.NewSize;
            //if (size.Height > _contentHeight)
            //{
            //    _wantedVerticalScrollOffset = size.Height - (_contentHeight - 8d);
            //    //ScrollViewer.ScrollToVerticalOffset(_wantedVerticalScrollOffset);
            //    AnimateScroll();
            //}

            //RemovePastTextBlocks();

        }
        private Storyboard _scrollStoryboard;
        private void AnimateScroll()
        {
            if (AmountToScroll > 0)
            {
                if (_scrollStoryboard == null )
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


    }
}
