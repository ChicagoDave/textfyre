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
using System.Collections.Generic;

namespace Textfyre.UI.DocSystem
{
    public class BackPages
    {
        private List<TextfyreBookPage> _bookPages = new List<TextfyreBookPage>();
        private TextfyreBookPage _currentPage;
        private int _bookPagesIndex = 0;

        private int _sectionsIndex = 0;
        private SectionCollection _sections;

        private StackPanel _stackPanel;

        private bool _hasInit = false;
        void FlipBook_OnPageTurned(int leftPageIndex, int rightPageIndex)
        {
            int i = leftPageIndex;
        }

        public void Do( SectionCollection sections )
        {
            if (!_hasInit)
            {
                _hasInit = true;
                Current.Game.TextfyreBook.FlipBook.OnPageTurned += new Textfyre.UI.Controls.FlipBook.PageTurnedEventHandler(FlipBook_OnPageTurned);
            }

            _sections = sections;

            _sectionsIndex = 0;

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
            int numberOfBackPages = 0;
            bool prologueBegin = false;
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
                        //if (numberOfBackPages >= 2)
                        //    break;
                    }
                    height = 0;
                    displaySection = true;
                }

                StackPanel sp = _currentPage.PageScrollViewer.Content as StackPanel;
                sp.VerticalAlignment = VerticalAlignment.Top;

                height += section.Height;

                if (displaySection)
                    sp.Children.Insert(0, section.HostGrid);                

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
