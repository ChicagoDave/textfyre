using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Xml.Linq;

namespace Textfyre.UI.Controls.Manual
{
    public partial class ManualControl : UserControl
    {
        public string ID;

        private double _width = Settings.BookPageWidth - 80d;
        private string _mainTitle = String.Empty;
        private string _text = string.Empty;
        private Stack<string> _titles = new Stack<string>();

        public ManualControl()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(ManualControl_Loaded);
        }

        private void ManualControl_Loaded(object sender, RoutedEventArgs e)
        {
            this.Width = Settings.BookPageWidth;
            this.Height = Settings.BookPageHeight;
            this.Margin = new Thickness( Settings.BookPageWidth + Settings.BookPageOffsetLeft, Settings.BookPageOffsetTop, 0, 0 );
            this.BookPageColorizer.Background = Textfyre.UI.UserSettings.PageBackgroundBrush;
        }

        public void Show()
        {
            _titles.Clear();
            var rootmenu = RootMenu();

            _mainTitle = rootmenu.Attribute("title").Value;

            ContentStack.Width = _width;

            Title.Text = _mainTitle;
            Title.TextWrapping = TextWrapping.Wrap;
            Title.TextAlignment = TextAlignment.Center;
            Title.Width = _width;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, Title);
            Title.FontSize = 24d;
            Title.Margin = new Thickness(0, 0, 0, 20);

            ClearTopics();
            ShowItems(rootmenu);
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            this.Visibility = Visibility.Collapsed;
        }

        private XElement RootMenu()
        {
            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Manual.xml"));

            var rootmenu = (from menu in x.Descendants("menu") select menu).First();

            return rootmenu;
        }

        private void ShowItems(XElement menu)
        {            
            var items = (from item in menu.Elements() select item);
            DisplayLinks(items, true);

            Title.Text = menu.Attribute("title").Value;
        }

        private void DisplayLinks(IEnumerable<XElement> items, bool showClose)
        {
            foreach (var item in items)
            {
                var tags = (from tag in item.Elements() select tag);

                if (tags.Count() > 0)
                {
                    TextBlock tb = new TextBlock();
                    tb.TextAlignment = TextAlignment.Center;
                    tb.Width = _width;
                    tb.Text = item.Attribute("title").Value;
                    tb.Cursor = Cursors.Hand;
                    tb.MouseLeftButtonUp += new MouseButtonEventHandler(tb_MouseLeftButtonUp);
                    Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, tb);
                    tb.Margin = new Thickness(0, 0, 0, 10);
                    Topics.Children.Add(tb);
                }
            }

            if (showClose)
            {
                StackPanel sp = new StackPanel();
                sp.Orientation = Orientation.Horizontal;
                sp.HorizontalAlignment = HorizontalAlignment.Center;
                sp.Children.Add(ExitTextBlock());
                sp.Margin = new Thickness(0, 10, 0, 0);
                Topics.Children.Add(sp);
            }
        }

        private void DisplayContent(string title)
        {
            _titles.Push(title);

            Title.Text = title;

            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Manual.xml"));
            var selectedItem = (from item in x.Descendants("item") where item.Attribute("title").Value == title select item);
            var menus = (from menu in selectedItem.Elements("menu") select menu);
            if (menus.Count() > 0)
            {
                var items = (from item in menus.First().Elements("item") select item);
                DisplayLinks(items, false);
            }

            var paragraphs = (from paragraph in selectedItem.Elements("paragraph") select paragraph);


            foreach (var paragraph in paragraphs)
            {
                TextBlock tb = new TextBlock();
                tb.TextWrapping = TextWrapping.Wrap;
                tb.HorizontalAlignment = HorizontalAlignment.Left;
                tb.TextAlignment = TextAlignment.Left;
                Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, tb);
                Topics.Children.Add(tb);
                InsertText(tb, paragraph.Value);

            }

            StackPanel sp = new StackPanel();
            sp.Margin = new Thickness(0, 10, 0, 0);
            sp.Orientation = Orientation.Horizontal;
            sp.HorizontalAlignment = HorizontalAlignment.Center;
            
            TextBlock tbClose = new TextBlock();
            tbClose.TextWrapping = TextWrapping.Wrap;
            tbClose.HorizontalAlignment = HorizontalAlignment.Left;
            tbClose.TextAlignment = TextAlignment.Left;
            tbClose.Text = "[BACK]    ";
            tbClose.Cursor = Cursors.Hand;
            tbClose.MouseLeftButtonUp += new MouseButtonEventHandler(tbClose_MouseLeftButtonUp);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer, tbClose);
            sp.Children.Add(tbClose);


            TextBlock tbTOC = new TextBlock();
            tbTOC.TextWrapping = TextWrapping.Wrap;
            tbTOC.HorizontalAlignment = HorizontalAlignment.Left;
            tbTOC.TextAlignment = TextAlignment.Left;
            tbTOC.Text = "[INDEX]    ";
            tbTOC.Cursor = Cursors.Hand;
            tbTOC.MouseLeftButtonUp += new MouseButtonEventHandler(tbTOC_MouseLeftButtonUp);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer, tbTOC);
            sp.Children.Add(tbTOC);

            sp.Children.Add(ExitTextBlock());

            Topics.Children.Add(sp);
        }

        private void InsertText( TextBlock tb, string text )
        {
            //Regex re = new Regex(@"\[/?\w+\s+[^\]]*\]|\w+[^\]\[]*");
            Regex re = new Regex(@"\[\w+[^\]]*\]|\w+[^\]\[]*");
            MatchCollection matches = re.Matches(text);

            Run run = new Run();
            System.Text.StringBuilder sb = new System.Text.StringBuilder(String.Empty);
            foreach (Match match in matches)
            {
                string val = match.Value;
                string vallow = val.ToLower();
                switch (vallow)
                {
                    case "[italic type]":
                        run.Text = sb.Length == 0 ? sb.ToString() : sb.ToString() + " ";
                        tb.Inlines.Add(run);
                        run = new Run();
                        run.FontStyle = FontStyles.Italic;
                        sb = new System.Text.StringBuilder(String.Empty);
                        break;

                    case "[roman type]":
                        run.Text = sb.Length == 0 ? sb.ToString() : sb.ToString() + " ";
                        tb.Inlines.Add(run);
                        run = new Run();
                        sb = new System.Text.StringBuilder(String.Empty);
                        break;

                    case "[indent]":
                        sb.Append("    ");
                        break;
                    case "[linebreak]":
                        sb.Append(System.Environment.NewLine);
                        break;
                    default:
                        sb.Append(val);
                        break;
                }                      
            }
            run.Text = sb.ToString() + System.Environment.NewLine;
            tb.Inlines.Add(run);
        }

        private TextBlock ExitTextBlock()
        {
            TextBlock tbExit = new TextBlock();
            tbExit.TextWrapping = TextWrapping.Wrap;
            tbExit.HorizontalAlignment = HorizontalAlignment.Center;
            tbExit.TextAlignment = TextAlignment.Left;
            tbExit.Text = "[CLOSE]";
            tbExit.MouseLeftButtonUp += new MouseButtonEventHandler(tbExit_MouseLeftButtonUp);
            tbExit.Cursor = Cursors.Hand;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer, tbExit);

            return tbExit;
        }

        private void tbExit_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            Hide();
        }

        private void tb_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ClearTopics();

            TextBlock tbsender = sender as TextBlock;
            string text = tbsender.Text;
            DisplayContent(text);

        }

        private void tbClose_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ClearTopics();

            if (_titles.Count >= 2)
            {
                string title = _titles.Pop();
                title = _titles.Pop();

                DisplayContent(title);
            }
            else
            {
                _titles.Clear();
                ShowItems(RootMenu());
            }
        }


        private void tbTOC_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            _titles.Clear();
            ClearTopics();
            Title.Text = _mainTitle;
            ShowItems(RootMenu());
        }

        private void ClearTopics()
        {
            ManualScroller.ScrollToVerticalOffset(-999999);
            Topics.Children.Clear();
        }
    }
}
