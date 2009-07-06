using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Xml.Linq;

namespace Textfyre.UI.Controls.Hints
{
    public partial class HintPage : UserControl
    {
        public HintPage()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(HintPage_Loaded);
        }

        void HintPage_Loaded(object sender, RoutedEventArgs e)
        {
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, TxtTitle);
        }

        private List<HintGroup> _hintGroups;
        public void AddHints(string channelData)
        {
            _hintGroups = new List<HintGroup>();
            HintsPanel.Children.Clear();
            

            XDocument xDoc = XDocument.Parse(channelData);
            var allHints = from hs in xDoc.Descendants("hints") select hs;
            foreach( var allHint in allHints )
            {
                TxtTitle.Text = allHint.Attribute("title").Value;

                var topics = from tps in xDoc.Descendants("topic") select tps;
                foreach (var topic in topics)
                {
                    HintGroup hintGroup = new HintGroup();
                    hintGroup.HintGroupOpen += new EventHandler(hintGroup_HintGroupOpen);
                    hintGroup.Question = topic.Attribute("title").Value;
                    HintsPanel.Children.Add(hintGroup);
                    _hintGroups.Add(hintGroup);

                    var hints = from hint in topic.Descendants("hint") select hint;
                    foreach (var hint in hints)
                    {
                        hintGroup.AddHint(hint.Value);
                    }
                }
            }
        }

        void hintGroup_HintGroupOpen(object sender, EventArgs e)
        {
            foreach (HintGroup hg in _hintGroups)
            {
                hg.Close();
            }
        }

        private void BtnClose_Click(object sender, EventArgs e)
        {
            Current.Game.TextfyreBook.TextfyreDocument.StoryAid.HideHints();
        }

    }
}
