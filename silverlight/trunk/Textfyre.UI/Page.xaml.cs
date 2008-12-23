using System;
using System.IO;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Documents;
using System.Windows.Data;
using System.Windows.Markup;
using System.Collections.Generic;
using System.IO.IsolatedStorage;
using Textfyre.VM;
using System.Windows.Media;

namespace Textfyre.UI
{
    public partial class Page : UserControl
    {
        public Page()
        {
            InitializeComponent();
            Settings.Init();
            this.Background = Helpers.Color.SolidColorBrush(Settings.BackgroundColor);
            LayoutRoot.Background = Helpers.Color.SolidColorBrush(Settings.BackgroundColor);
            Application.Current.Host.Content.Resized += new EventHandler(Content_Resized);
            Resize();
        }

        void Content_Resized(object sender, EventArgs e)
        {
            Resize();
        }

        private void Resize()
        {
            double currentWidth = Application.Current.Host.Content.ActualWidth;
            double currentHeight = Application.Current.Host.Content.ActualHeight;

            this.Width = currentWidth;
            this.Height = currentHeight;
            LayoutRoot.Width = currentWidth;
            LayoutRoot.Height = currentHeight;

            MasterPage.Resize();

        }

        public void LoadStory(byte[] memorystream, string gameFileName)
        {
            LoadStory(memorystream, gameFileName, new StoryHandle());
        }

        public void LoadStory(byte[] memorystream, string gameFileName, StoryHandle storyHandle)
        {
            Current.Game.StoryHandle = storyHandle;
            MasterPage.LoadStory(memorystream, gameFileName);
        }
    }
}
