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

namespace Textfyre.UI.Controls.SpeechBubble
{
    public partial class Bubble : UserControl
    {
        public Bubble()
        {
            InitializeComponent();
        }

        public void Hide()
        {
           this.Visibility = Visibility.Collapsed;
        }

        public void Show( string word, double mouseX, double mouseY)
        {
            BubbleText.Text = String.Empty;
            BubbleText.Inlines.Clear();

            Run body = new Run();
            body.Text = DocSystem.WordDef.GetDescription(word);//Entities.WordDef.WordDefs[Entities.WordDef.Key(word)];
            BubbleText.Inlines.Add(body);

            double height = BubbleText.ActualHeight + 20d;
            BubbleRect.Height = height;
            BubbleText.Height = height;

            if (mouseY > 150)
            {
                PathScale.ScaleY = 1;
                BubblePoint.Margin = new Thickness(36, height - 3.54, 0, 0);
                this.Margin = new Thickness(mouseX - 38, mouseY - (height + 24), 0, 0);
            }
            else
            {
                PathScale.ScaleY = -1;
                BubblePoint.Margin = new Thickness(36, 3.54, 0, 0);
                this.Margin = new Thickness(mouseX - 38, mouseY + 24, 0, 0);
            }

            this.Visibility = Visibility.Visible;
        }
    }
}
