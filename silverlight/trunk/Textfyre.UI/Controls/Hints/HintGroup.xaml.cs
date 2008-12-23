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

namespace Textfyre.UI.Controls.Hints
{
    public partial class HintGroup : UserControl
    {
        public event EventHandler HintGroupOpen;
        
        private Hint _previousHint = null;
        private double _height = 0;
        private double _currentHeight = 0;
        private Storyboard _expandStoryboard;
        private int _hintsRevealed = 0;
        private List<string> _hintTexts;

        private State _state;

        private enum State
        {
            Closed,
            Opening,
            Open,
            Closing
        }

        public HintGroup()
        {
            InitializeComponent();
            _state = State.Closed;
            _hintTexts = new List<string>();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtTitle);
            TxtTitle.MouseLeftButtonUp += new MouseButtonEventHandler(TxtTitle_MouseLeftButtonUp);
        }

        public void Close()
        {
            if (_state == State.Open )
            {
                OpenCloseGroup();
            }
        }

        void TxtTitle_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            OpenCloseGroup();
        }

        void OpenCloseGroup()
        {
            if (_state == State.Closing || _state == State.Opening)
                return;

            if (_state == State.Closed)
            {
                if (HintGroupOpen != null)
                {
                    HintGroupOpen(this, new EventArgs());
                }

                CreateHints();
                _state = State.Opening;
            }
            else
            {
                _state = State.Closing;
            }

            _expandStoryboard = new Storyboard();
            _expandStoryboard.Completed += new EventHandler(_expandStoryboard_Completed);
            _expandStoryboard.Duration = new Duration(TimeSpan.FromMilliseconds(100));
            _expandStoryboard.Begin();
        }

        void _expandStoryboard_Completed(object sender, EventArgs e)
        {
            if (_state == State.Opening)
            {
                double newHeight = _currentHeight;
                if (newHeight < _height)
                    newHeight += 25;

                if (newHeight >= _height)
                {
                    newHeight = _height;
                }

                _currentHeight = newHeight;
                HintsPanel.Height = _currentHeight;

                if (newHeight < _height)
                    _expandStoryboard.Begin();
                else
                    _state = State.Open;
            }
            else if (_state == State.Closing)
            {
                double newHeight = _currentHeight;
                if (newHeight > 0)
                    newHeight -= 25;

                if (newHeight <= 0 )
                {
                    newHeight = 0;
                }

                _currentHeight = newHeight;
                HintsPanel.Height = _currentHeight;

                if (newHeight > 0)
                    _expandStoryboard.Begin();
                else
                {
                    _previousHint = null;
                    HintsPanel.Children.Clear();
                    _height = 0;
                    _state = State.Closed;
                }
            }
        }

        public string Question
        {
            set
            {
                TxtTitle.Text = value;
            }
        }

        public void AddHint(string hint)
        {
            _hintTexts.Add(hint);
        }

        void CreateHints()
        {
            foreach (string hintText in _hintTexts)
            {
                CreateHint(hintText);
            }
        }
        
        void CreateHint(string hint)
        {
            Hint hintControl = InitHint(hint);

            if (_previousHint == null)
            {
                hintControl.IsHintEnabled = true;
            }
            else
            {
                hintControl.IsHintEnabled = false;
                _previousHint.NextHint = hintControl;
            }

            _height += hintControl.HintTxt1.ActualHeight + 5;

            _previousHint = hintControl;
        }

        Hint InitHint(string hintText)
        {
            Hint hint = new Hint();
            hint.Text = hintText;
            hint.Click += new EventHandler(hint_Click);
            HintsPanel.Children.Add(hint);
            return hint;
        }

        void hint_Click(object sender, EventArgs e)
        {
            Hint hint = sender as Hint;
            hint.RevealHint();
        }
    }
}
