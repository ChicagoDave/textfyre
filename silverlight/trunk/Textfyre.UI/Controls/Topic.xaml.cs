using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace Textfyre.UI.Controls
{
    /// <summary>
    /// This control will dynamically take the conversation topic list and create a list of buttons. The text
    /// from each topic will be the content of the buttons and the numerical response will be placed in the DataContent.
    /// </summary>
	public partial class Topic : UserControl
	{
        public class TopicEventArgs : EventArgs
        {
            public DocSystem.Topic Topic;
        }
        public event EventHandler<TopicEventArgs> TopicChosen;

        public Topic()
		{
			// Required to initialize variables
			InitializeComponent();
            this.Loaded += new RoutedEventHandler(Topic_Loaded);
		}

        void Topic_Loaded(object sender, RoutedEventArgs e)
        {
        }

        public void Load(DocSystem.FyreXmlElementTopicList topics)
        {
            // clear the existing topics...
            TopicList.Children.Clear();

            ArtHolder.Children.Clear();
            Controls.Art art = new Art();
            art.HorizontalAlignment = HorizontalAlignment.Right;
            art.VerticalAlignment = VerticalAlignment.Center;
            art.ID = "CameoArt_" + topics.Data.Replace(" ","");
            ArtHolder.Children.Add(art);

            //TextBlock headline = new TextBlock();
            //Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, headline);
            //headline.Text = "- " + topics.Data + " -";
            //headline.Margin = new Thickness(0, 0, 0, 20);
            //headline.HorizontalAlignment = HorizontalAlignment.Center;
            //TopicList.Children.Add(headline);

            foreach (DocSystem.Topic topic in topics.Topics)
            {
                AddButton(topic);
            }
        }

        private void AddButton(DocSystem.Topic topic)
        {
            TextButton newButton = new TextButton();
            newButton.FontType = Textfyre.UI.Current.Font.FontType.Conversation;

            string chapter = Textfyre.UI.Current.Game.Chapter;
            if (chapter.Contains("6") || chapter.Contains("7") || chapter.Contains("8") || chapter.Contains("9") || chapter.Contains("10") || chapter.Contains("11"))
                newButton.Text = string.Concat("Jacqueline says, ", topic.Text);
            else
                newButton.Text = string.Concat("Jack says, ", topic.Text);
            newButton.DataContext = topic;
            newButton.Margin = new Thickness(0, 0, 0, 10);
            newButton.Width = 280;
            newButton.HorizontalAlignment = HorizontalAlignment.Left;
            newButton.HorizontalContentAlignment = HorizontalAlignment.Left;
            newButton.ButtonText.HorizontalAlignment = HorizontalAlignment.Left;
            newButton.Width = 140;
            newButton.Click += new EventHandler(newButton_Click);
            
            newButton.MouseEnter += new MouseEventHandler(newButton_MouseEnter);
            newButton.MouseLeave += new MouseEventHandler(newButton_MouseLeave);
            TopicList.Children.Add(newButton);
        }

        void newButton_Click(object sender, EventArgs e)
        {
            Current.Game.IsInputFocusActive = true;
            if (TopicChosen != null)
            {
                TextButton clickedButton = (TextButton)sender;
                TopicEventArgs args = new TopicEventArgs();
                args.Topic = (DocSystem.Topic)clickedButton.DataContext;
                TopicChosen(this, args);
            }
        }

        void newButton_MouseLeave(object sender, MouseEventArgs e)
        {
            Current.Game.IsInputFocusActive = true;
        }

        void newButton_MouseEnter(object sender, MouseEventArgs e)
        {
            Current.Game.IsInputFocusActive = false;
        }

	}
}