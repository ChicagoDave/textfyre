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
using Textfyre.UI.Controls;

namespace Textfyre.UI.DocSystem
{
    public class StoryPage
    {
        private TextfyreBookPage _storyPage;
        private Controls.StoryScroller _storyScroller;
        //private ScrollViewer _scrollViewer;
        //private StackPanel _stackPanel;
        private int sectionPtr = 0;

        public void Reset()
        {
            sectionPtr = 0;
        }

        public class InputWantEventArgs : EventArgs
        {
            public string LeadText;

        }

        public event EventHandler<InputWantEventArgs> InputWant;

        public class TopicListWantEventArgs : EventArgs
        {
            public string Character;
            public FyreXmlElementTopicList TopicList;
        }

        public event EventHandler<TopicListWantEventArgs> TopicListWant;

        public StoryPage()
        {
        }

        public StackPanel HostStackPanel
        {
            get
            {
                return _storyScroller.ContentPanel; //_stackPanel;
            }
        }

        public void HostStackPanelAddHeight(double value)
        {
            _storyScroller.ContentHeight = _storyScroller.ContentHeight + value;
        }

        public void HostStackPanelSubstractHeight(double value)
        {
            _storyScroller.ContentHeight = _storyScroller.ContentHeight - value;

        }

        private double _lastScrollingHeight = 0;
        private SectionCollection _sections;
        private bool _processSections = true;
        public void Do(SectionCollection sections)
        {
            if (!_processSections)
                return;

            _sections = sections;

            if (_storyPage == null)
                GetStoryPage();

            bool cont = true;
            while (cont)
            {
                if (sectionPtr < sections.Count)
                {
                    Section section = sections[sectionPtr++];
                    if (section.ContentMode == ContentMode.Story)
                    {
                        //if (_lastScrollingHeight + section.Height + 20
                        //    > Settings.BookPageInnerContentHeight)
                        if (Current.Game.IsScrollLimitEnabled && _lastScrollingHeight + section.Height
                            > Settings.BookPageInnerContentHeight)
                        {
                            sectionPtr--;
                            _processSections = false;
                            _storyPage.ctrlMore.Show();
                            return;
                            
                        }

                        _lastScrollingHeight += section.Height;

                        switch (section.SectionType)
                        {
                            case SectionType.ArtOnly:
                            case SectionType.Content:
                                _storyScroller.AddSection(section);
                                //_stackPanel.Children.Add(section.HostGridScroll);
                                break;
                            case SectionType.Prompt:
                                if (InputWant != null)
                                {
                                    Current.Game.IsScrollLimitEnabled = true;
                                    _lastScrollingHeight = 0;
                                    InputWantEventArgs args = new InputWantEventArgs();
                                    args.LeadText = section.Text;
                                    InputWant(this, args);
                                    
                                }
                                //_input._tbLeadText.Text = section.Text;
                                //_input.AddInputToStackPanel(_stackPanel);
                                //_input.SetModeNormal();
                                //Current.Game.IsInputFocusActive = true;
                                //_input.SetFocus();
                                break;

                            case SectionType.TopicList:
                                if (TopicListWant != null)
                                {
                                    TopicListWantEventArgs args = new TopicListWantEventArgs();
                                    args.Character = section.Text;
                                    args.TopicList = (FyreXmlElementTopicList)section.Data;
                                    TopicListWant(this, args);
                                }
                                break;

                        }

                    }
                }
                else
                {
                    cont = false;
                }
            }

        }

        public void ResetLastScrollingHeight()
        {
            _lastScrollingHeight = 0;
        }

        private void GetStoryPage()
        {
            _storyPage = Current.Game.TextfyreBook.GetFirstPageWithPageID("Story");
            _storyPage.ctrlMore.Press += new EventHandler(ctrlMore_Press);
            _storyScroller = new Controls.StoryScroller();
            _storyPage.PageScrollViewerReplace = _storyScroller;

            //_scrollViewer = _storyPage.PageScrollViewer;
            //_scrollViewer.IsTabStop = false;
            //_scrollViewer.KeyDown += new KeyEventHandler(_scrollViewer_KeyDown);
            //_scrollViewer.KeyUp += new KeyEventHandler(_scrollViewer_KeyUp);
            //StackPanel sp = new StackPanel();
            //_scrollViewer.Content = sp;
            //_scrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
            //_stackPanel = sp;
            //_stackPanel.SizeChanged += new SizeChangedEventHandler(StackPanel_SizeChanged);
        }

        void ctrlMore_Press(object sender, EventArgs e)
        {
            _storyPage.ctrlMore.Hide();
            _processSections = true;
            _lastScrollingHeight = 0;
            Do(_sections);

        }

        //void _scrollViewer_KeyUp(object sender, KeyEventArgs e)
        //{
        //    switch (e.Key)
        //    {
        //        case Key.PageUp:
        //            break;
        //    }
        //}

        //void _scrollViewer_KeyDown(object sender, KeyEventArgs e)
        //{
        //    switch (e.Key)
        //    {
        //        case Key.PageUp:
        //            break;
        //    }
        //}


        //#region :: StackPanel & ScrollViewer Scroll ::
        //private void StackPanel_SizeChanged(object sender, SizeChangedEventArgs e)
        //{
        //    Size size = e.NewSize;
        //    if (size.Height > _scrollViewer.Height)
        //    {
        //        _wantedVerticalScrollOffset = size.Height - (ScrollViewer.Height - 8d);
        //        //ScrollViewer.ScrollToVerticalOffset(_wantedVerticalScrollOffset);
        //        AnimateScroll();
        //    }

        //    //RemovePastTextBlocks();
        //}
        //private double _wantedVerticalScrollOffset = 0;
        //private Storyboard _scrollStoryboard;
        //private void AnimateScroll()
        //{
        //    if (_wantedVerticalScrollOffset > ScrollViewer.VerticalOffset)
        //    {
        //        if (_scrollStoryboard == null)
        //        {
        //            _scrollStoryboard = new Storyboard();
        //            _scrollStoryboard.Completed += new EventHandler(_scrollStoryboard_Completed);
        //            _scrollStoryboard.Duration = TimeSpan.FromMilliseconds(100);
        //            _scrollStoryboard.Begin();
        //        }
        //    }
        //}

        //void _scrollStoryboard_Completed(object sender, EventArgs e)
        //{
        //    _scrollStoryboard.Stop();
        //    double newScrollPos = ScrollViewer.VerticalOffset + Settings.ScrollSpeed;
        //    if (newScrollPos > _wantedVerticalScrollOffset)
        //        newScrollPos = _wantedVerticalScrollOffset;

        //    ScrollViewer.ScrollToVerticalOffset(newScrollPos);

        //    if (_wantedVerticalScrollOffset > ScrollViewer.VerticalOffset)
        //    {
        //        _scrollStoryboard.Begin();
        //    }
        //    else
        //    {
        //        _scrollStoryboard = null;
        //    }
        //}
        //#region :: ScrollViewer ::
        //public ScrollViewer ScrollViewer
        //{
        //    get
        //    {
        //        return _scrollViewer;
        //    }
        //}
        //#endregion
        //#endregion

    }
}
