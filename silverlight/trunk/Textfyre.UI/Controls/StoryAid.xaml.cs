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
    public partial class StoryAid : UserControl
    {
        public event EventHandler<Topic.TopicEventArgs> TopicChosen;
        
        public StoryAid()
        {
            InitializeComponent();
            TopicControl.TopicChosen += new EventHandler<Topic.TopicEventArgs>(TopicControl_TopicChosen);
            this.Width = Settings.BookPageInnerInnerContentWidth;
        }

        void TopicControl_TopicChosen(object sender, Topic.TopicEventArgs e)
        {
            TopicControl.Visibility = Visibility.Collapsed;
            if (TopicChosen != null)
            {
                TopicChosen(this, e);
            }
        }

        public string PageArtID
        {
            set
            {
                PageArt.ID = value;
            }
        }

        public void AddHints(string channelData)
        {
            HintControl.AddHints(channelData);
        }

        public void ShowHints()
        {
            PageArt.Visibility = Visibility.Collapsed;
            TopicControl.Visibility = Visibility.Collapsed;
            HintControl.Visibility = Visibility.Visible;
            Current.Game.IsInputFocusActive = true;
            Current.Game.TextfyreBook.TextfyreDocument.InputFocus();
        }

        public void HideHints()
        {
            PageArt.Visibility = Visibility.Visible;
            TopicControl.Visibility = Visibility.Collapsed;
            HintControl.Visibility = Visibility.Collapsed;
            Current.Game.IsInputFocusActive = true;
            Current.Game.TextfyreBook.TextfyreDocument.InputFocus();
        }

        public void ShowTopics(DocSystem.FyreXmlElementTopicList topics)
        {
            if (topics.Topics.Count > 0)
            {
                TopicControl.Load(topics);
                PageArt.Visibility = Visibility.Collapsed;
                TopicControl.Visibility = Visibility.Visible;
                HintControl.Visibility = Visibility.Collapsed;
            }
            else
            {
                HideTopics();
            }
        }

        private void HideTopics()
        {
            PageArt.Visibility = Visibility.Visible;
            TopicControl.Visibility = Visibility.Collapsed;
            HintControl.Visibility = Visibility.Collapsed;
        }
    }
}
