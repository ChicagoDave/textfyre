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
        private ScrollViewer _scrollViewer;
        private StackPanel _stackPanel;
        private int sectionPtr = 0;

        public class InputWantEventArgs : EventArgs
        {
            public string LeadText;

        }

        public event EventHandler<InputWantEventArgs> InputWant;

        public StoryPage()
        {
        }

        public StackPanel HostStackPanel
        {
            get
            {
                return _stackPanel;
            }
        }

        public void Do(SectionCollection sections)
        {
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
                        switch (section.SectionType)
                        {
                            case SectionType.Content:
                                _stackPanel.Children.Add(section.HostGridScroll);
                                break;
                            case SectionType.Prompt:
                                if (InputWant != null)
                                {
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
                        }
                        
                    }
                }
                else
                {
                    cont = false;
                }
            }

        }

        private void GetStoryPage()
        {
            _storyPage = Current.Game.TextfyreBook.GetFirstPageWithPageID("Story");
            _scrollViewer = _storyPage.PageScrollViewer;
            StackPanel sp = new StackPanel();
            _scrollViewer.Content = sp;
            _scrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
            _stackPanel = sp;
            _stackPanel.SizeChanged += new SizeChangedEventHandler(StackPanel_SizeChanged);
        }


        #region :: StackPanel & ScrollViewer Scroll ::
        private void StackPanel_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            Size size = e.NewSize;
            if (size.Height > _scrollViewer.Height)
            {
                _wantedVerticalScrollOffset = size.Height - (ScrollViewer.Height - 8d);
                //ScrollViewer.ScrollToVerticalOffset(_wantedVerticalScrollOffset);
                AnimateScroll();
            }

            //RemovePastTextBlocks();
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
        #region :: ScrollViewer ::
        public ScrollViewer ScrollViewer
        {
            get
            {
                return _scrollViewer;
            }
        }
        #endregion
        #endregion

    }
}
