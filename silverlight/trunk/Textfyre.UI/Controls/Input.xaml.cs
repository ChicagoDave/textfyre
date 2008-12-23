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
    public partial class Input : UserControl
    {
        private List<string> _history = new List<string>();
        private int _historyPos;
        
        public class InputEventArgs : EventArgs
        {
            public string TextEntered;
        }
        public event EventHandler<InputEventArgs> InputEntered;

        public event EventHandler AnyKeyPress;
        private bool _isWaitForKeyMode = false;
        private bool _isSingleCharMode = false;
        private Storyboard _inputFocusStoryboard;


        private Entities.DocumentColumn _column = null;
        public void AddInputToColumn(Entities.DocumentColumn column)
        {
            column.Add(this);
            _column = column;
            _tbInput.Width = column.Width - 20d;
            column.PageHeightReset();
        }
        public void RemoveInputFromColumn()
        {
            if (_column != null)
                _column.Remove(this);

            _column = null;
        }

        public bool IsInputVisible
        {
            get
            {
                if (_column == null)
                    return false;

                return (_column.TextfyreBookPage.BookPageIndex == Current.Game.LeftPageIndex ||
                    _column.TextfyreBookPage.BookPageIndex == Current.Game.RightPageIndex);
            }
        }

        public void SetModeStallScroll()
        {
            _isWaitForKeyMode = true;
            _tbLeadText.Text = "";
            _tbInput.Text = "<more>";
            _tbLeadText.Text = String.Empty;
            _gridColumn0.Width = new GridLength(0);
        }

        public void SetModeKeyPress()
        {
            _isWaitForKeyMode = false;
            _isSingleCharMode = true;
            _tbInput.Text = String.Empty;
            _tbInput.IsReadOnly = false;
            _tbInput.IsTabStop = true;
            _tbInput.Focus();
            _tbLeadText.Text = "";
            _tbInput.Text = "Please press SPACE to continue.";
            _gridColumn0.Width = new GridLength(_tbLeadText.ActualWidth);
        }

        public void SetModeNormal()
        {
            _isWaitForKeyMode = false;
            _isSingleCharMode = false;
            _tbInput.Text = String.Empty;
            _tbInput.IsReadOnly = false;
            _tbInput.IsTabStop = true;
            _tbInput.Focus();
            _tbLeadText.Text = ">";
            _tbInput.Text = "";
            _gridColumn0.Width = new GridLength(_tbLeadText.ActualWidth);
        }
        
        public Input()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Input_Loaded);
            _tbInput.LostFocus += new RoutedEventHandler(_tbInput_LostFocus);

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Input, this._tbLeadText);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Input, this._tbInput);
        }

        private void _tbInput_LostFocus(object sender, RoutedEventArgs e)
        {
            if (_column != null )
            {
                SetFocus();
            }
        }

        void _sb_Completed(object sender, EventArgs e)
        {
            if (_tbInput != FocusManager.GetFocusedElement())
            {
                SetFocus();
            }
        }

        public void SetFocus()
        {
            if (Current.Game.IsInputFocusActive == false)
                return;

            if (Master.DebugText.Length == 100)
                Master.DebugText = String.Empty;

            _tbInput.Visibility = Visibility.Visible;
            _tbInput.IsTabStop = true;
            this._tbInput.Focus();

            if (_inputFocusStoryboard == null)
            {
                _inputFocusStoryboard = new Storyboard();
                _inputFocusStoryboard.Duration = TimeSpan.FromMilliseconds(10);
                _inputFocusStoryboard.Completed += new EventHandler(_sb_Completed);
            }

            if (_inputFocusStoryboard.GetCurrentState() != ClockState.Active)
            {
                _inputFocusStoryboard.Begin();
            }
        }

        void Input_Loaded(object sender, RoutedEventArgs e)
        {
            _tbInput.KeyDown += new KeyEventHandler(_tbInput_KeyDown);
        }

        #region :: EnableInput ::
        private bool _enableInput = true;
        public bool EnableInput
        {
            get
            {
                return _enableInput;
            }

            set
            {
                _enableInput = value;
            }
        }
        #endregion

        void _tbInput_KeyDown(object sender, KeyEventArgs e)
        {
            if (!_enableInput)
            {
                e.Handled = true;
                return;
            }

            // Handle up/down
            if (e.Key == Key.Up)
            {   // Go back in history list
                if (_historyPos < 1)
                    _historyPos = 1;

                if (_historyPos > 0 && _history.Count > 0 )
                {
                    _historyPos--;
                    _tbInput.Text = _history[_historyPos];
                }
                else
                {
                    _tbInput.Text = String.Empty;
                }

                e.Handled = true;
                return;
            }

            if (e.Key == Key.Down)
            {   // Move forward in history list
                _historyPos++; 
                if (_historyPos >= 0 && _historyPos < _history.Count)
                {
                    _tbInput.Text = _history[_historyPos];

                }
                else
                {
                    _tbInput.Text = String.Empty;
                }

                if (_historyPos > _history.Count)
                    _historyPos = _history.Count;
                
                e.Handled = true;
                return;
            }

            if (_isWaitForKeyMode)
            {
                e.Handled = true;
                if (AnyKeyPress != null)
                {
                    AnyKeyPress(this, new EventArgs());
                }
            }
            else
            {
                if (e.Key == Key.Enter || _isSingleCharMode)
                {
                    e.Handled = true;
                    if (InputEntered != null)
                    {
                        AddToHistory(_tbInput.Text);
                        InputEventArgs args = new InputEventArgs();

                        if (_isSingleCharMode)
                            args.TextEntered = KeyToSingleCharInput(e.Key);
                        else
                            args.TextEntered = _tbInput.Text;

                        InputEntered(this, args);
                    }       
                }
            }
        }

        // convert a Key to a single-character string for use with the InputEntered event
        private static string KeyToSingleCharInput(Key key)
        {
            string name = key.ToString();

            if (name.Length == 1)
                return name;
            else
                return " ";
        }

        private void AddToHistory(string input)
        {
            _history.Add(input);
            _historyPos = _history.Count;
        }
    }
}
