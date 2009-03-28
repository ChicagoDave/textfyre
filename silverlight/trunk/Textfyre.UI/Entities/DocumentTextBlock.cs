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
using System.Collections.Generic;

namespace Textfyre.UI.Entities
{
    public class DocumentTextBlock
    {
        public List<Run> WordDefRuns = new List<Run>();

        public void ShowWordDefs()
        {
            Color wordDefColor = new Color();
            wordDefColor.A = 255;
            wordDefColor.R = 200;
            wordDefColor.G = 80;
            wordDefColor.B = 55; 
            foreach (Run run in WordDefRuns)
            {
                run.Foreground = new SolidColorBrush(wordDefColor);
            }
        }

        public void HideWordDefs()
        {
            Color wordDefColor = new Color();
            wordDefColor.A = 255;
            wordDefColor.R = 0;
            wordDefColor.G = 0;
            wordDefColor.B = 0;
            foreach (Run run in WordDefRuns)
            {
                run.Foreground = new SolidColorBrush(wordDefColor);
            }
        }

        private TextBlock _curTB;
        private Run _curTBRun;
        private TextBlock _curTBPre;
        private Run _curTBRunPre;
        private TextBlock _curTBLine;
        private Run _curTBRunLine;
        private Current.Font.FontType _curFontType = Textfyre.UI.Current.Font.FontType.Main;

        private int _bold = 0;
        private int _italic = 0;

        private bool _isWordDefMode = false;
        public bool IsWordDefMode
        {
            get
            {
                return _isWordDefMode;
            }
            set
            {
                _isWordDefMode = value;
            }
        }


        private double _curLineHeight = 0d;
        public class WordDefs : List<WordDefOLD>
        {
        }

        public Current.Font.FontType FontType
        {
            set
            {
                _curFontType = value;
            }
        }

        public TextBlock TextBlock
        {
            get
            {
                return _curTB;
            }
        }

        private double _wantedWidth;
        public void Create(double width)
        {
            _wantedWidth = width;

            InitTextBlock(ref _curTB);
            InitTextBlock(ref _curTBPre);
            CreateLine();

            WordDefs wds = new WordDefs();
            _curTB.Tag = wds;
            _curLineHeight = 0;

            _curTB.MouseMove += new MouseEventHandler(_curTB_MouseMove);
            _curTB.MouseLeave += new MouseEventHandler(_curTB_MouseLeave);
            _curTB.MouseLeftButtonUp += new MouseButtonEventHandler(_curTB_MouseLeftButtonUp);

        }

        private void CreateLine()
        {
            InitTextBlock( ref _curTBLine);
        }

        private int _textBlockCount = 0;
        private void InitTextBlock(ref TextBlock tb)
        {
            _textBlockCount++;
            
            tb = new TextBlock();
            tb.Text = String.Empty;
            tb.VerticalAlignment = VerticalAlignment.Top;
            tb.Width = _wantedWidth;
            tb.TextWrapping = TextWrapping.Wrap;
            tb.Opacity = 0.9d;
            FormatTextBlock(tb);
        }

        public void CreateRun()
        {
            InitRun(ref _curTBRun);
            _curTB.Inlines.Add(_curTBRun);
            InitRun(ref _curTBRunPre);
            _curTBPre.Inlines.Add(_curTBRunPre);
            CreateRunLine();
        }
        
        private void CreateRunLine()
        {
            InitRun(ref _curTBRunLine);
            _curTBLine.Inlines.Add(_curTBRunLine);
        }

        private void InitRun( ref Run run)
        {
            run = new Run();
            run.Text = String.Empty;
            FormatRun(run);
        }

        private void FormatRun(Run run)
        {
            if (_bold > 0) run.FontWeight = FontWeights.Bold;
            if (_italic > 0) run.FontStyle = FontStyles.Italic;
            if (IsWordDefMode)
            {
                WordDefRuns.Add(run);
            }
        }

        private Point MeassureWord(string word)
        {
            TextBlock tb = new TextBlock();
            Run rn = new Run();
            FormatTextBlock(tb);
            FormatRun(rn);
            tb.Inlines.Add(rn);
            rn.Text = word;
            return new Point(tb.ActualWidth, tb.ActualHeight);
        }

        private void FormatTextBlock(TextBlock tb)
        {
            Current.Font.ApplyFont(_curFontType, tb);

        }

        void _curTB_MouseLeave(object sender, MouseEventArgs e)
        {
            TextBlock tb = sender as TextBlock;
            tb.Cursor = null;
        }

        private string _activeWord = String.Empty;
        void _curTB_MouseMove(object sender, MouseEventArgs e)
        {
            TextBlock tb = sender as TextBlock;
            WordDefs wds = tb.Tag as WordDefs;

            Current.Game.TextfyreBook.WordDefBubble.Hide();
            Point pos = e.GetPosition(tb);
            string activeWord = String.Empty;
            foreach (WordDefOLD wd in wds)
            {
                if (pos.X >= wd.PointBegin.X && pos.Y >= wd.PointBegin.Y &&
                    pos.X <= wd.PointEnd.X && pos.Y <= wd.PointEnd.Y)
                {
                    tb.Cursor = Cursors.Hand;
                    activeWord = wd.Word;
                    break;
                }
                else
                {
                    tb.Cursor = null;
                }
            }
            _activeWord = activeWord;
        }

        private void _curTB_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (_activeWord.Length > 0 )
            {
                Point pos = e.GetPosition(Current.Game.TextfyreBook);
                Current.Game.TextfyreBook.WordDefBubble.Show(_activeWord, pos.X, pos.Y);
            }
        }


        public bool IsClear
        {
            get
            {
                return _curTB == null;
            }
        }

        public bool IsRunClear
        {
            get
            {
                return _curTBRun == null;
            }
        }


        public bool IsTextBlockEmpty
        {
            get
            {
                bool isAnyRunsFull = false;
                foreach (Run r in _curTB.Inlines)
                {
                    if (r.Text.Length > 0)
                        isAnyRunsFull = true;
                }

                return (_curTB.Text.Length == 0 && !isAnyRunsFull);
            }
        }

        public System.Windows.TextAlignment TextAlignment
        {
            set
            {
                _curTB.TextAlignment = value;
            }
        }

        public Thickness Margin
        {
            set
            {
                _curTB.Margin = value;
            }
        }

        //public void AddText(string text)
        //{
        //    _curTBRun.Text += text;
        //}

        /// <summary>
        /// Returns true if new line.
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        private string _word;
        public bool AddWordBegin(string word)
        {
            _word = word;

            if( Height == 0 )
                return false;

            string text = _curTBRunPre.Text;
            _curTBRunPre.Text += _word;

            bool newLine = Height != _curTBPre.ActualHeight;

            _curTBRunPre.Text = text;

            if (newLine)
            {
                CreateLine();
                CreateRunLine();
            }

            return newLine;

        }

        public void AddWordCommit()
        {
            _curTBRunPre.Text += _word;
            _curTBRun.Text += _word;
            _curTBRunLine.Text += _word;
        }

        public void DoWordDef(string word)
        {
            if (word.Length > 0 && word != " ")
            {
                if (IsWordDefMode)
                {
                    Point wordMeassure = MeassureWord(word);
                    double actHeight = _curTB.ActualHeight;
                    double actWidth = _curTBLine.ActualWidth;

                    WordDefOLD wd = new WordDefOLD();
                    wd.Word = word;
                    wd.Run = _curTBRun;
                    wd.PointBegin = new Point(System.Math.Max(0,(actWidth - wordMeassure.X)), System.Math.Max(0d, actHeight - wordMeassure.Y));
                    wd.PointEnd = new Point(actWidth, actHeight);
                    (_curTB.Tag as WordDefs).Add(wd);
                }
            }
        }

        public double Width
        {
            get
            {
                return _curTB.ActualWidth;
            }
        }


        public double Height
        {
            get
            {
                return _curTB.ActualHeight;
            }
        }

        public void Clear()
        {
            _curTB = null;
            _curTBLine = null;
            ClearRun();
        }

        public void ClearRun()
        {
            _curTBRun = null;
            _curTBRunLine = null;
        }

        public void BoldOn()
        {
            _bold++;
        }

        public void BoldOff()
        {
            _bold--;
        }

        public void ItalicOn()
        {
            _italic++;
        }

        public void ItalicOff()
        {
            _italic--;
        }
    }
}
