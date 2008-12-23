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
    public partial class TextfyreBookPage : UserControl
    {
        private Helpers.MouseClickManager _mouseClickManager;

        public string PageID;
        public int BookPageIndex;

        public TextfyreBookPage( string pageID, int bookPageIndex )
        {
            PageID = pageID;
            BookPageIndex = bookPageIndex; 

            InitializeComponent();

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header,
                this.LocationChannel);

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer,
                this.TimeChannel);

            if (_mouseClickManager == null)
            {
                _mouseClickManager = new Textfyre.UI.Helpers.MouseClickManager(this, 300);
                _mouseClickManager.Click += new MouseButtonEventHandler(_mouseClickManager_Click);
                _mouseClickManager.DoubleClick += new MouseButtonEventHandler(_mouseClickManager_DoubleClick);
                this.MouseLeftButtonUp += new MouseButtonEventHandler(TextfyreBookPage_MouseLeftButtonUp);
            }

            this.Width = Settings.BookPageWidth;
            this.Height = Settings.BookPageHeight;
            this.LayoutRoot.Width = Settings.BookPageWidth;
            this.LayoutRoot.Height = Settings.BookPageHeight;

            //ctrlFlipButton.FlipBtn.Click += new EventHandler(FlipBtn_Click);
        }

        public void HideHeaderFooter()
        {
            this.LocationChannel.Visibility = Visibility.Collapsed;
            this.TimeChannel.Visibility = Visibility.Collapsed;
        }

        void FlipBtn_Click(object sender, EventArgs e)
        {
            if (_isEvenPage)
            {
                Current.Game.TextfyreBook.FlipForward();
            }
            else
            {
                Current.Game.TextfyreBook.FlipBack();
            }
        }

        public bool IsEmpty
        {
            get
            {
                object o = this.PageScrollViewer.Content;

                if( o == null )
                    return true;

                if (o is StackPanel)
                {
                    if ((o as StackPanel).Children.Count == 0)
                        return true;
                }

                return false;
            }
        }

        private bool _isEvenPage;
        public bool IsEvenPage
        {
            set
            {
                _isEvenPage = value;

                if (value)
                {
                    BookPage1.Visibility = Visibility.Collapsed;
                    BookPage2.Visibility = Visibility.Visible;
                    ctrlMore.HorizontalAlignment = HorizontalAlignment.Right;
                    ctrlMore.VerticalAlignment = VerticalAlignment.Bottom;
                    ctrlMore.Margin = new Thickness(0, 0, 30, 40);

                    ctrlFlipButton.HorizontalAlignment = HorizontalAlignment.Right;
                    ctrlFlipButton.VerticalAlignment = VerticalAlignment.Bottom;
                    ctrlFlipButton.Margin = new Thickness(0, 0, 20, 15);
                    ctrlFlipButton.IsEvenPage = true;
                
                }
                else
                {
                    BookPage1.Visibility = Visibility.Visible;
                    BookPage2.Visibility = Visibility.Collapsed;
                    ctrlMore.HorizontalAlignment = HorizontalAlignment.Left;
                    ctrlMore.VerticalAlignment = VerticalAlignment.Bottom;
                    ctrlMore.Margin = new Thickness(20, 0, 0, 40);

                    ctrlFlipButton.HorizontalAlignment = HorizontalAlignment.Left;
                    ctrlFlipButton.VerticalAlignment = VerticalAlignment.Bottom;
                    ctrlFlipButton.Margin = new Thickness(10, 0, 0, 15);
                    ctrlFlipButton.IsEvenPage = false;



                }

            }
        }

        protected override Size ArrangeOverride(Size finalSize)
        {
            //if (_isEvenPage)
            //{
            //    if (BookPageIndex >= Current.Game.TextfyreBook.PageCount - 1)
            //    {
            //        ctrlFlipButton.IsVisible = false;
            //    }
            //    else
            //    {
            //        ctrlFlipButton.IsVisible = true;
            //    }
            //}
            //else
            //{
            //    if (BookPageIndex == 0)
            //        ctrlFlipButton.IsVisible = false;
            //}

            return base.ArrangeOverride(finalSize);
        }

        void TextfyreBookPage_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (_mouseClickManager != null)
                _mouseClickManager.HandleClick(sender, e);
        }

        public event EventHandler<MouseButtonEventArgs> Click;
        public event EventHandler<MouseButtonEventArgs> DoubleClick;

        private void _mouseClickManager_Click(object sender, MouseButtonEventArgs e)
        {
            if (Click != null)
                Click(this, e);
        }

        private void _mouseClickManager_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (DoubleClick != null)
                DoubleClick(this, e);
        }

    }
}
