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
using Textfyre.UI.Controls.FlipBook;

namespace Textfyre.UI.Controls
{
    public partial class TextfyreBook : UserControl, IDataProvider
    {
        private List<TextfyreBookPage> _pages;

        private DocSystem.Document _document = new Textfyre.UI.DocSystem.Document();

      
        //private Entities.Document _document;
        public Controls.TableOfContent _toc;

        #region :: PageCount ::
        public int PageCount
        {
            get
            {
                return _pages.Count;
            }
        }
        #endregion

        #region :: Public Properties ::
        public DocSystem.Document TextfyreDocument
        {
            get
            {
                return _document;
            }
        }

        //public Entities.Document TextfyreDocument
        //{
        //    get
        //    {
        //        return _document;
        //    }
        //}

        public void SetLocationAndChapter()
        {
            string location = Current.Game.Location;
            string chapter = Current.Game.Chapter;

            foreach (TextfyreBookPage page in _pages)
            {
                Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header,
                        page.LocationChannel);

                page.LocationChannel.Text = page.BookPageIndex % 2 == 0 ? chapter : location; 
            }
        }

        public void SetTime(string time)
        {
            foreach (TextfyreBookPage page in _pages)
            {
                //page.TimeChannel.Text = time;
                page.SetTime(time);
            }

        }
        #endregion

        public TextfyreBook()
        {
            InitializeComponent();

            this.Width = Settings.BookWidth;
            LayoutRoot.Width = Settings.BookWidth;

            BookPagesGrid.Width = Settings.BookPageWidth * 2;
            BookPagesGrid.Height = Settings.BookPageHeight;
            BookPagesGrid.Margin = new Thickness(Settings.BookPageOffsetLeft, Settings.BookPageOffsetTop, 0, 0);

            Current.Game.TextfyreBook = this;
            this.ConfirmQuitDialog.ConfirmAnswer += new EventHandler<Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs>(ConfirmQuitDialog_ConfirmAnswer);
            this.ConfirmSaveBeforeRestartDialog.ConfirmAnswer += new EventHandler<Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs>(ConfirmSaveBeforeRestartDialog_ConfirmAnswer);

            this.SaveGameDialog.DeleteRequest += new EventHandler<Textfyre.UI.Controls.IODialog.FileEventArgs>(FileGameDialog_DeleteRequest);
            this.RestoreGameDialog.DeleteRequest += new EventHandler<Textfyre.UI.Controls.IODialog.FileEventArgs>(FileGameDialog_DeleteRequest);
            this.ConfirmDeleteFileDialog.ConfirmAnswer += new EventHandler<Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs>(ConfirmDeleteFileDialog_ConfirmAnswer);

            if (_pages == null)
            {
                _pages = new List<TextfyreBookPage>();
            }

            FlipBook.OnPageTurned += new PageTurnedEventHandler(FlipBook_OnPageTurned);
            
            AddFrontPage();
			AddHelperPages();
			AddCreditsPage();
			AddTableOfContentsPage();
			//for (int i = 0; i < 500; i++)
               // AddFrontPage();
            AddStoryPage();
            AddStoryAidPage();
            
            //AddColumnPage("Prologue", Textfyre.UI.Entities.DocumentColumnBehaviour.Flip);

            this.Loaded += new RoutedEventHandler(TextfyreBook_Loaded);
            
        }

        void ConfirmDeleteFileDialog_ConfirmAnswer(object sender, Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs e)
        {
            if (_saveFileToDelete != null && e.IsAnswerOK)
            {
                _saveFileToDelete.Delete();
                SaveGameDialog.Refresh();
                RestoreGameDialog.Refresh();

            }

            _saveFileToDelete = null;
        }

        private Entities.SaveFile _saveFileToDelete = null;
        void FileGameDialog_DeleteRequest(object sender, Textfyre.UI.Controls.IODialog.FileEventArgs e)
        {
            _saveFileToDelete = e.SaveFile;
            this.ConfirmDeleteFileDialog.Message = "Are you sure you want to delete " + e.SaveFile.Title + "?";
            this.ConfirmDeleteFileDialog.Show();
        }

        void ConfirmQuitDialog_ConfirmAnswer(object sender, Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs e)
        {
            // TODO:
        }

        void TextfyreBook_Loaded(object sender, RoutedEventArgs e)
        {
            FlipBook.SetData(this);
            Current.Game.LeftPageIndex = -1;
            Current.Game.RightPageIndex = 0;
            
            FlipBook.CurrentSheetIndex = 0;

            if (Settings.LogEnabled == false)
            {
                Current.Game.MaxPageIndex = 3;
                Current.Game.TextfyreBook.FlipForward();
                return;
            }
        }

        public void SetCreditsText(string creditText)
        {
            if (CreditsText != null)
                CreditsText.Text = creditText;
        }

        private TextBlock CreditsText;
        private void AddCreditsPage()
        {
            //<TextBlock x:Name="CreditsText" />
            CreditsText = new TextBlock();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, CreditsText);
            CreditsText.FontSize = 14d;
            CreditsText.Width = 300d;
            //CreditsText.Height = 180d;
            CreditsText.HorizontalAlignment = HorizontalAlignment.Left;
            CreditsText.VerticalAlignment = VerticalAlignment.Bottom;
            CreditsText.Margin = new Thickness(20, 0, 0, 0);

            TextfyreBookPage p = CreatePage("Credits");
            p.HideHeader();
            p.HideFooter();
            p.ctrlFlipButton.IsEnabled = false;
            p.PageScrollViewer.Content = CreditsText;
            p.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            p.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
        }

		private void AddHelperPages()
		{
			TextfyreBookPage p1 = CreatePage("MiscPageLeft");
			p1.HideHeader();
			p1.HideFooter();
			p1.ctrlFlipButton.IsEnabled = false;
			p1.PageScrollViewer.Content = "";
			p1.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
			p1.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;

			TextfyreBookPage p2 = CreatePage("MiscPageRight");
			p2.HideHeader();
			p2.HideFooter();
			p2.ctrlFlipButton.IsEnabled = false;
			p2.PageScrollViewer.Content = "";
			p2.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
			p2.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
		}


        private void AddFrontPage()
        {
            TextfyreBookPage p = CreatePage( "FrontPage" );

            p.HideHeader();
            p.HideFooter();
            p.ctrlFlipButton.IsEnabled = false;

            Art art = new Art();
            art.ID = "TitlePage";
            
            p.PageScrollViewer.Content = art;
            p.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            p.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
            
        }

        private void AddTableOfContentsPage()
        {
            TextfyreBookPage p = CreatePage( "TOC" );
            p.HideHeader();
            p.HideFooter();
            p.ctrlFlipButton.IsEnabled = false;


            _toc = new TableOfContent();
            _toc.TableOfContentAction += new EventHandler<TableOfContent.TableOfContentActionEventArgs>(_toc_TableOfContentAction);
            _toc.HorizontalAlignment = HorizontalAlignment.Left;
            _toc.VerticalAlignment = VerticalAlignment.Top;
            p.HorizontalContentAlignment = HorizontalAlignment.Left;
            p.VerticalContentAlignment = VerticalAlignment.Top;
            p.PageScrollViewer.HorizontalAlignment = HorizontalAlignment.Left;
            p.PageScrollViewer.HorizontalContentAlignment = HorizontalAlignment.Left;
            p.PageScrollViewer.VerticalAlignment = VerticalAlignment.Top;
            p.PageScrollViewer.VerticalContentAlignment = VerticalAlignment.Top;
            p.PageScrollViewer.Content = _toc;
            p.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            p.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
        }

        private void _toc_TableOfContentAction(object sender, TableOfContent.TableOfContentActionEventArgs e)
        {
            switch (e.Action)
            {
                case TableOfContent.Action.Introduction:
                    Manual.Show();
                    break;

                case TableOfContent.Action.StartNewGame:
                    Current.Game.GameMode = GameModes.Restart;
                    if (Current.Game.IsStoryChanged)
                    {
                        ConfirmSaveBeforeRestartDialog.Show();
                    }
                    else
                    {
                        RestartGame();
                    }
                    break;

                case TableOfContent.Action.ContinueGame:
                    FlipTo("Story");
                    break;

                case TableOfContent.Action.SaveGame:
                    _document.Input("save");
                    break;

                case TableOfContent.Action.RestoreGame:
                    _document.Input("restore");
                    break;

                case TableOfContent.Action.Quit:
                    Current.Game.TextfyreBook.ConfirmQuitDialog.Show();
                    break;

                case TableOfContent.Action.Transcript:
                    Current.Game.TextfyreBook.TranscriptDialog.Show();
                    break;

                case TableOfContent.Action.Map:
                    Current.Game.TextfyreBook.Map.Show();
                    break;

                case TableOfContent.Action.Hints:
                    Current.Game.TextfyreBook.TextfyreDocument.StoryAid.ShowHints();
                    FlipTo("Story");
                    break;
            }
        }

        private void RemoveStoryPages()
        {
            foreach (TextfyreBookPage page in _pages)
            {
				if (page.PageID != "MiscPageLeft" && page.PageID != "MiscPageRight" && page.PageID != "TOC" && page.PageID != "FrontPage" && page.PageID != "")
                {
                    _pages.Remove(page);
                    RemoveStoryPages();
                    return;
                }
            }
        }

        public void RestartGame()
        {
            if (Current.Game.IsStoryRunning)
            {
                Current.Game.GameMode = GameModes.Restart;
                _document.Input("restart");
                FlipTo("Story");
            }
            else
            {
                Current.Game.GameMode = GameModes.Story;
                Current.Game.MaxPageIndex = 999999;
                Current.Game.IsStoryRunning = true;
                this._toc.Refresh();
                FlipTo("BackPage");
                BookmarkTOC.Visibility = Visibility.Visible;
                //BookmarkLoad.Visibility = Visibility.Visible;
                //BookmarkSave.Visibility = Visibility.Visible;
            }
        }
        void ConfirmSaveBeforeRestartDialog_ConfirmAnswer(object sender, Textfyre.UI.Controls.IODialog.Confirm.ConfirmAnswerEventArgs e)
        {
            ConfirmSaveBeforeRestartDialog.Hide();
            if (e.IsAnswerOK)
            {
                _document.Input("save");
            }
            else
            {
                RestartGame();
            }
        }


        public void AddPageArtPage(string artID)
        {
            TextfyreBookPage p = CreatePage("PageArt");
            Controls.Art art = new Art();
            art.ID = artID;
            p.PageScrollViewer.Content = art;
            p.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            p.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;

        }

        public void AddStoryAidPage()
        {
            TextfyreBookPage p = CreatePage( "StoryAid" );
            p.ctrlFlipButton.IsEnabled = false;

            p.HideFooter();

            Controls.StoryAid sa = new StoryAid();

            p.PageScrollViewer.Content = sa;
            p.PageScrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            p.PageScrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
            _document.AddStoryAidPage(p);

        }


        private void AddEmptyPage()
        {
            TextfyreBookPage p = CreatePage( "" );
            p.HideHeader();
            p.HideFooter();
            p.ctrlFlipButton.IsEnabled = false;


        }

        List<StackPanel> testBlocks = new List<StackPanel>();
        private void AddEmptyPage2()
        {
            TextfyreBookPage p = CreatePage("");
            p.HideHeader();
            p.HideFooter();

            string text = @"
Interactive fiction, often abbreviated IF, describes software simulating environments in which players use text commands to control characters and influence the environment. Works in this form can be understood as literary narratives and as computer games. In common usage, the word refers to text adventures, a type of adventure game with text-based input and output. The term is sometimes used to encompass the entirety of the medium, but is also sometimes used to distinguish games produced by the interactive fiction community from those created by games companies. It can also be used to distinguish the more modern style of such works, focusing on narrative and not necessarily falling into the adventure game genre at all, from the more traditional focus on puzzles. More expansive definitions of interactive fiction may refer to all adventure games, including wholly graphical adventures such as Myst.

As a commercial product, interactive fiction reached its peak in popularity in the 1980s, as a dominant software product marketed for home computers. Because their text-only nature sidestepped the problem of writing for the widely divergent graphics architectures of the day, interactive fiction games were easily ported across all the popular platforms, even those such as CP/M not known for gaming or strong graphics capabilities. Today, interactive fiction no longer appears to be commercially viable, but a steady stream of new works is produced by an online interactive fiction community, using freely available development systems. Most of these games can be downloaded for free from the Interactive Fiction Archive (see external links).


";
            TextBlock tb = new TextBlock();
            tb.Text = text;
            tb.TextWrapping = TextWrapping.Wrap;
            StackPanel sp = new StackPanel();
            sp.Children.Add(tb);
            testBlocks.Add(sp);
            p.PageScrollViewer.Content = tb;
            
            p.ctrlFlipButton.IsEnabled = false;


        }

        public void AddStoryPage()
        {
            TextfyreBookPage p = CreatePage("Story");
        }

        public void AddColumnPage( string pageID, Entities.DocumentColumnBehaviour columnBehaviour)
        {            
            //TextfyreBookPage p = CreatePage( pageID );

            //if (pageID == "Prologue")
            //{
            //    p.HideHeaderFooter();
            //}
            
            //_document.AddDocumentColumn(p, columnBehaviour);
        }


        #region :: CreatePage ::
        public TextfyreBookPage CreatePage( string pageID )
        {
            TextfyreBookPage p = new TextfyreBookPage( pageID, _pages.Count + 1);
            _pages.Add(p);
            AddClickFlip(p);
            SetLocationAndChapter();
            return p;

        }

        public TextfyreBookPage CreatePageAtIndex(string pageID, int index)
        {
            int currentIdx = Controls.FlipBook.UCBook.CurrentUCBook.CurrentSheetIndex;
            TextfyreBookPage p = new TextfyreBookPage(pageID, _pages.Count + 1);
            _pages.Insert(index, p);
            CorrectBookPageIndex();
            AddClickFlip(p);
            SetLocationAndChapter();

            if (currentIdx >= index)
            {
                Controls.FlipBook.UCBook.CurrentUCBook.CurrentSheetIndex = currentIdx + 1;
                //Current.Game.TextfyreBook.FlipBook.RefreshSheetsContent();
            }
            Current.Game.TextfyreBook.FlipBook.RefreshSheetsContent();
            return p;

        }
        public TextfyreBookPage GetFirstPageWithPageID(string pageID)
        {
            foreach (TextfyreBookPage page in _pages)
            {
                if (page.PageID == pageID)
                    return page;
            }

            return null;
        }
        public TextfyreBookPage GetLastPageWithPageID(string pageID)
        {
            TextfyreBookPage resultPage = null;
            foreach (TextfyreBookPage page in _pages)
            {
                if (page.PageID == pageID)
                    resultPage = page;
            }

            return resultPage;
        }
        #endregion :: CreatePage ::

        private void AddClickFlip(TextfyreBookPage ele)
        {
            ele.DoubleClick += new EventHandler<MouseButtonEventArgs>(ele_DoubleClick);

            //if (_pages.Count % 2 == 0)
            //{
            //    //ele.DoubleClick += new EventHandler<MouseButtonEventArgs>(ele_DoubleClick);
            //    ele.IsEvenPage = false;
            //}
            //else
            //{
            //    //ele.DoubleClick+=new EventHandler<MouseButtonEventArgs>(ele_DoubleClick2);
            //    ele.IsEvenPage = true;
            //}

        }

        private void ele_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            TextfyreBookPage ele = sender as TextfyreBookPage;
            if( ele.BookPageIndex % 2 == 0 ) 
                FlipBook.AnimateToPreviousPage(100);
            else
                FlipBook.AnimateToNextPage(100);
        }

        private void ele_DoubleClick2(object sender, MouseButtonEventArgs e)
        {
            FlipBook.AnimateToNextPage(100);
        }

        private int _animatingToPageIndex = -1;
        private void AnimateToPageIndex(int index)
        {
            int leftIdx = Current.Game.LeftPageIndex;
            int rightIdx = Current.Game.RightPageIndex;

             _animatingToPageIndex = index;
             if ( _animatingToPageIndex>=leftIdx && _animatingToPageIndex<=rightIdx)
                 _animatingToPageIndex = -1;
             else if (_animatingToPageIndex > rightIdx)
             {
                 FlipBook.AnimateToNextPage(100);    // Was 200
             }
             else
             {
                 FlipBook.AnimateToPreviousPage(100);    // Was 200
             }
        }

        void FlipBook_OnPageTurned(int leftPageIndex, int rightPageIndex)
        {
            Current.Game.LeftPageIndex = leftPageIndex;
            Current.Game.RightPageIndex = rightPageIndex;

            //Page.DebugText = Current.Application.LeftPageIndex + " - " + Current.Application.RightPageIndex;

            _document.IsInputEnable = _document.IsInputVisible;

            if (_animatingToPageIndex != -1)
            {
                AnimateToPageIndex(_animatingToPageIndex);
            }
        }

        #region IDataProvider Members

        public object GetItem(int index)
        {
            return _pages[index];
        }

        public int GetCount()
        {
            return _pages.Count;
        }
        #endregion

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FlipForward();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FlipBack();

        }

        #region :: Flip Methods ::
        public void FlipBack()
        {
            FlipBook.AnimateToPreviousPage(500);
        }

        public void FlipForward()
        {
            FlipBook.AnimateToNextPage(500);
        }

        public void FlipTo(string pageID)
        {
            int index = -1;
            int i = 0;
            foreach (TextfyreBookPage page in _pages)
            {
                if (page.PageID == pageID)
                {
                    index = page.BookPageIndex;
                    break;
                }
                i++;
            }

            if (index > -1)
                FlipTo(index);

        }

        private void CorrectBookPageIndex()
        {
            int i = 1;
            foreach (TextfyreBookPage page in _pages)
            {
                page.BookPageIndex = i;
                page.IsEvenPage = ((i-1) % 2 == 0);
                i++;
            }
        }

        public void FlipTo(int pageIndex)
        {
            AnimateToPageIndex(pageIndex);
        }

        public void GoTo(string pageID)
        {
            int index = -1;
            int i = 0;
            foreach (TextfyreBookPage page in _pages)
            {
                if (page.PageID == pageID)
                {
                    index = page.BookPageIndex;
                    break;
                }
                i++;
            }

            if (index > 0)
                FlipBook.CurrentSheetIndex = i-1;

        }

        #endregion

        #region :: Bookmarks ::
        private void BookmarkTOC_Click(object sender, EventArgs e)
        {
            GoTo("TOC");
        }

        private void BookmarkLoad_Click(object sender, EventArgs e)
        {
            _document.Input("restore");
        }

        private void BookmarkSave_Click(object sender, EventArgs e)
        {
            _document.Input("save");
        }
        #endregion

    }
}
