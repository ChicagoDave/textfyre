using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.DocSystem
{
    public class SectionTextBlock
    {

        public SectionTextBlock()
        {
        }

        private Grid _hostGrid = new Grid();
        private TextBlock _txtBlk = new TextBlock();
        private Run _run = new Run();
        private TextFormat _currentTextFormat = new TextFormat();
        private double _maxWidth;

        public Grid HostGrid
        {
            get
            {
                return _hostGrid;
            }
        }

        private StackPanel _stackPanel;
        public StackPanel StackPanel
        {
            set
            {
                _stackPanel = value;
            }

            get
            {
                return _stackPanel;
            }
        }

        public StackPanel AddImage(Image img, double maxWidth)
        {
            _stackPanel = img.AddImageContainer(_hostGrid, maxWidth);
            return _stackPanel;
        }

        public string AddText(string text, TextFormat tf, double maxWidth, StackPanel sp )
        {
            _stackPanel = sp;

            if (_stackPanel == null && _hostGrid.Children.Count == 0)
                _hostGrid.Children.Add(_txtBlk);

            _maxWidth = maxWidth;

            if (_stackPanel != null)
            {
                if( _stackPanel.Children.Contains( _txtBlk ) == false)
                    _stackPanel.Children.Add(_txtBlk);

                //_txtBlk = new TextBlock();
                _currentTextFormat = tf;
                CreateFormat();
            }
            else if (!tf.IsEqual(_currentTextFormat))
            {
                _currentTextFormat = tf;
                CreateFormat();
            }

            int pointer = 0;
            bool cont = true;
            string word = String.Empty;
            while (cont)
            {
                int nextSpace = text.IndexOf(' ', pointer);

                if (nextSpace > -1)
                {
                    // More words.
                    word = text.Substring(pointer, nextSpace - pointer + 1);

                    if (AddWord(word) == false)
                    {
                        string newText = text.Substring(pointer);
                        return newText;
                    }

                    pointer += word.Length;
                }
                else
                {   // One word.
                    word = text.Substring(pointer);
                    if (AddWord(word) == false)
                    {
                        return word;
                    }
                    cont = false;
                }

                if (pointer >= text.Length)
                    cont = false;
            }

            return string.Empty;
        }

        private bool AddWord(string word)
        {
            string runText = _run.Text;
            _run.Text += word;

            if( _txtBlk.ActualWidth > _maxWidth )
            {
                _run.Text = runText;
                return false;
            }

            return true;
        }

        private void CreateFormat()
        {
            if (_currentTextFormat.Format == TextFormat.Formats.Normal)
                Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, _txtBlk);
            else if( _currentTextFormat.Format == TextFormat.Formats.Headline )
                Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Headline, _txtBlk);

            _run = new Run();

            if (_currentTextFormat.IsBold)
                _run.FontWeight = FontWeights.Bold;

            if (_currentTextFormat.IsItalic)
                _run.FontStyle = FontStyles.Italic;

            _txtBlk.Inlines.Add(_run);
        }

        public bool IsEmpty
        {
            get
            {
                if (_stackPanel != null)
                    return false;
                
                return _txtBlk.Text.Length == 0;
            }
        }

        public string Text
        {
            get
            {
                return _txtBlk.Text;
            }
        }

        public double Height
        {
            get
            {
                return _txtBlk.ActualHeight;
            }
        }
    }
}
