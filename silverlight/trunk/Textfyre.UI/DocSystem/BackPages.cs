using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Shapes;
using Textfyre.UI.Controls;

namespace Textfyre.UI.DocSystem
{
    public class BackPages
    {
        private List<TextfyreBookPage> _bookPages = new List<TextfyreBookPage>();
        private TextfyreBookPage _currentPage;
        private SectionCollection _sections;
        
        private int _leftPageIndex = 0;
        private int _rightPageIndex = 0;
        private string _leftPageID = string.Empty;
        private string _rightPageID = string.Empty;
        private int _maxPages = 0;

        private bool _hasInit = false;
        void FlipBook_OnPageTurned(int leftPageIndex, int rightPageIndex)
        {
            string preLeftPageID = _leftPageID;

            _leftPageIndex = leftPageIndex;
            _rightPageIndex = rightPageIndex;

            _leftPageID = string.Empty;
            object currpage = Current.Game.TextfyreBook.GetItem(_leftPageIndex-1);
            if (currpage != null && currpage is Controls.TextfyreBookPage)
                _leftPageID = (currpage as Controls.TextfyreBookPage).PageID;

            _rightPageID = string.Empty;
            object currrpage = Current.Game.TextfyreBook.GetItem(_rightPageIndex-1);
            if (currrpage != null && currpage is Controls.TextfyreBookPage)
                _rightPageID = (currrpage as Controls.TextfyreBookPage).PageID;


            if ( _rightPageID != "Story" && preLeftPageID == "Story" && (_leftPageID == "BackPage" || _rightPageID=="TOC"))
            {
                Do(_sections);
            }
        }

        

        public void Do( SectionCollection sections )
        {
            string lpageid = _leftPageID;
            string rpageid = _rightPageID;

            _maxPages = _leftPageID == "Story" ? 2 : Settings.MaxBackPages;

            if (!_hasInit)
            {
                _hasInit = true;
                Current.Game.TextfyreBook.FlipBook.OnPageTurned += new Textfyre.UI.Controls.FlipBook.PageTurnedEventHandler(FlipBook_OnPageTurned);
            }

            _sections = sections;

            List<TextfyreBookPage> bookPages = _bookPages;
            _bookPages = new List<TextfyreBookPage>();
            foreach (TextfyreBookPage page in bookPages)
            {
                if (page.PageID == "BackPage")
                {
                    EmptyPage(page);
                    _bookPages.Add(page);
                }
            }

            ProcessSections();
        }

        private double _pageHeight = 0d;
        void ProcessSections()
        {
            _pageHeight = Settings.BookPageInnerInnerContentHeight - 10;

            _currentPage = GetNextPage();
            double height = 0;
            bool displaySection = false;    // Skip first page (which is shown on the story page)
            bool maxPagesReached = false;
            int numberOfBackPages = 0;
            for (int i = _sections.Count-1; i >= 0; i--)
            {
//                double maxPageHeight = displaySection ? Settings.BookPageInnerContentHeight :
//                    Settings.BookPageInnerContentHeight + 22;

                double maxPageHeight = displaySection ? _pageHeight : _pageHeight + 22;


                Section section = _sections[i];

                //if (prologueBegin == false && section.ContentMode == ContentMode.Prologue)
                //{
                //    // Make sure we always keep the prologue pages together.
                //    prologueBegin = true;
                //    if (numberOfBackPages % 2 == 1)
                //    {
                //        StackPanel sp2 = _currentPage.PageScrollViewer.Content as StackPanel;
                //        sp2.VerticalAlignment = VerticalAlignment.Center;

                //        TextBlock tb = new TextBlock();
                //        tb.Text = Settings.TextBetweenPrologueAndStory;
                //        tb.TextAlignment = TextAlignment.Center;
                //        tb.Margin = new Thickness(0, 0, 10, 0);
                //        Current.Font.Headline.Apply(tb);
                        
                //        Grid gd = new Grid();
                //        //gd.Height = 100;
                //        //gd.Width = Settings.BookPageInnerInnerContentWidth;
                        
                //        gd.Children.Add(tb);
                        
                //        sp2.Children.Insert(0, gd);

                //        _currentPage = GetNextPage();
                //        numberOfBackPages++;
                //        //if (numberOfBackPages >= 2)
                //        //    break;
                //    }
                //}

                if (
                    section.SectionType == SectionType.PageBreak ||
                    //((height + section.Height) > (Settings.BookPageInnerInnerContentHeight))
                    ((height + section.Height) > (maxPageHeight))
                    )
                {
                    if (displaySection)
                    {
                        EndPage(_currentPage, height);
                        _currentPage = GetNextPage();
                        numberOfBackPages++;
                        if (_maxPages > 0 && numberOfBackPages >= _maxPages)
                            maxPagesReached = true;
                    }
                    height = 0;
                    displaySection = true;
                }

                height += section.Height;

                StackPanel sp = _currentPage.PageScrollViewer.Content as StackPanel;
                if (!maxPagesReached)
                {
                    sp.VerticalAlignment = VerticalAlignment.Top;

                    if (displaySection)
                        sp.Children.Insert(0, section.HostGrid);
                }
                else
                {
                    if (sp.Children.Count == 0)
                        sp.Children.Add(new TextBlock());
                }
            }
            EndPage(_currentPage, height);

        }

        private void EndPage(TextfyreBookPage page, double height)
        {
            double heightDiff = _pageHeight - height;
            StackPanel sp = page.PageScrollViewer.Content as StackPanel;

            if (sp == null)
                return;

            if (sp.Children.Count > 0 && sp.Children[0] is Rectangle)
                return;

            if (heightDiff > 17)
            {
                Rectangle rect = new Rectangle();
                rect.Width = 100;
                rect.Height = heightDiff;
                //rect.Fill = new SolidColorBrush(Colors.Red);
                //rect.Stroke = new SolidColorBrush(Colors.Black);

                sp.Children.Insert(0, rect);
            }
        }

        private TextfyreBookPage GetNextPage()
        {
            TextfyreBookPage nextPage = null;
            foreach (TextfyreBookPage page in _bookPages)
            {
                if (page.IsEmpty)
                {
                    nextPage = page;
                    break;
                }
            }

            if( nextPage == null )
                nextPage = AddBackPageSet();

            return nextPage;
        }

        private void EmptyPage(TextfyreBookPage page)
        {
            StackPanel sp = page.PageScrollViewer.Content as StackPanel;
            if( sp != null )
            {
                while (sp.Children.Count > 0)
                {
                    sp.Children.RemoveAt(0);
                }
            }
        }

        private TextfyreBookPage AddBackPageSet()
        {
            Controls.FlipBook.UCPage pageleft = Current.Game.TextfyreBook.FlipBook.leftPage;
            Controls.FlipBook.UCPage pageright = Current.Game.TextfyreBook.FlipBook.rightPage;

            //Current.Game.TextfyreBook.FlipBook.

            TextfyreBookPage page = AddBackPage();
            AddBackPage();

            
            //Current.Game.TextfyreBook.FlipBook.RefreshSheetsContent();
            return page;
        }

        private TextfyreBookPage AddBackPage()
        {
            // Add page after TOC
            TextfyreBookPage tocPage = Current.Game.TextfyreBook.GetFirstPageWithPageID("TOC");
			//TextfyreBookPage tocPage = Current.Game.TextfyreBook.GetFirstPageWithPageID("MiscPageRight");
			if (tocPage != null)
            {
                TextfyreBookPage p = Current.Game.TextfyreBook.CreatePageAtIndex("BackPage", tocPage.BookPageIndex);
                _bookPages.Add(p);

                p.HideHeader();
                
                //p.HideFooter();


                StackPanel sp = new StackPanel();
                p.PageScrollViewer.Content = sp;

                return p;
            }

            return null;
        }
    }
}
