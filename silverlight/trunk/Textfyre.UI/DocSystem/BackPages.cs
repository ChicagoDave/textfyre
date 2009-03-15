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

        public void Do( SectionCollection sections )
        {
            _sections = sections;

            _sectionsIndex = 0;

            foreach (TextfyreBookPage page in _bookPages)
            {
                EmptyPage(page);
            }

            ProcessSections();
        }

        void ProcessSections()
        {
            _currentPage = GetNextPage();
            double height = 0;
            bool displaySection = false;    // Skip first page (which is shown on the story page)
            for (int i = _sections.Count-1; i >= 0; i--)
            {
                Section section = _sections[i];
                if (
                    section.SectionType == SectionType.PageBreak ||
                    ((height + section.Height) > (Settings.BookPageInnerInnerContentHeight))
                    )
                {
                    if (displaySection)
                    {
                        EndPage(_currentPage, height);
                        _currentPage = GetNextPage();
                    }
                    height = 0;
                    displaySection = true;
                }

                StackPanel sp = _currentPage.PageScrollViewer.Content as StackPanel;
                //sp.VerticalAlignment = VerticalAlignment.Bottom;

                height += section.Height;

                if (displaySection)
                    sp.Children.Insert(0, section.HostGrid);
                
            }
            EndPage(_currentPage, height);

        }

        private void EndPage(TextfyreBookPage page, double height)
        {
            double heightDiff = Settings.BookPageInnerInnerContentHeight - height;
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
            if (tocPage != null)
            {
                TextfyreBookPage p = Current.Game.TextfyreBook.CreatePageAtIndex("BackPage", tocPage.BookPageIndex);
                _bookPages.Add(p);
                p.HideHeaderFooter();

                StackPanel sp = new StackPanel();
                p.PageScrollViewer.Content = sp;

                return p;
            }

            return null;
        }
    }
}
