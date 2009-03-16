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

        public void Load( DocSystem.FyreXmlElementTopicList topics)
        {
            // clear the existing topics...
            TopicList.Children.Clear();

            TextBlock headline = new TextBlock();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, headline);
            headline.Text = "- " + topics.Data + " -";
            headline.Margin = new Thickness(0, 0, 0, 20);
            headline.HorizontalAlignment = HorizontalAlignment.Center;
            TopicList.Children.Add(headline);

            foreach (DocSystem.Topic topic in topics.Topics)
            {
                AddButton(topic);
            }
        }

        private void AddButton(DocSystem.Topic topic)
        {
            //Button newButton = new Button();
            //newButton.Style = App.Current.Resources["TopicButtonStyle"] as Style;

            TextButton newButton = new TextButton();
            newButton.FontType = Textfyre.UI.Current.Font.FontType.MainItalic;

            //newButton.Content = topic.Text;
            newButton.Text = topic.Text;
            newButton.DataContext = topic;
            newButton.Margin = new Thickness(0, 0, 0, 10);
            newButton.Width = 200;
            //newButton.Click += new RoutedEventHandler(newButton_Click);
            newButton.Click += new EventHandler(newButton_Click);
            
            //newButton.Cursor = Cursors.Hand;
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

        //void newButton_Click(object sender, RoutedEventArgs e)
        //{
        //    Current.Application.IsInputFocusActive = true;
        //    if (TopicChosen != null)
        //    {
        //        Button clickedButton = (Button)sender;
        //        TopicEventArgs args = new TopicEventArgs();
        //        args.Topic = (Entities.Topic)clickedButton.DataContext;
        //        TopicChosen(this, args);
        //    }
        //}

	}
}