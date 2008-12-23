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
    public partial class BookCover : UserControl
    {
        public event EventHandler BookOpen;
        
        public BookCover()
        {
            InitializeComponent();


            HideBook.Fill = Helpers.Color.SolidColorBrush(Settings.BackgroundColor);

            this.FlipCoverStoryboard.Completed += new EventHandler(FlipCoverStoryboard_Completed);
            Current.Game.StoryReady += new EventHandler(Application_StoryReady);

            PageSide.Source = Current.Application.GetImageBitmap("Images/BookPagesSideWide.png");
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, LoadingText);

        }

        void Application_StoryReady(object sender, EventArgs e)
        {
            LoadingText.Text = "Click To Begin...";
            if (Settings.AutoOpenBookCover)
                OpenBook();
            else
                AddClickHandlers();
        }

        private void AddClickHandlers()
        {
            BookCoverImage.MouseLeftButtonUp+=new MouseButtonEventHandler(BookCoverImage_MouseLeftButtonUp);
            LoadingText.MouseLeftButtonUp += new MouseButtonEventHandler(BookCoverImage_MouseLeftButtonUp);

            BookCoverImage.Cursor = Cursors.Hand;
            LoadingText.Cursor = Cursors.Hand;

        }

        private void FlipCoverStoryboard_Completed(object sender, EventArgs e)
        {
            this.Visibility = Visibility.Collapsed;
            if (BookOpen != null)
            {
                BookOpen(this, new EventArgs());
            }
        }

        private void BookCoverImage_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            OpenBook();
        }

        private void OpenBook()
        {
            LoadingText.Visibility = Visibility.Collapsed;

            if (this.FlipCoverStoryboard.GetCurrentState() != ClockState.Active)
                this.FlipCoverStoryboard.Begin();

        }

    }
}
