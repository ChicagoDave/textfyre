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
    public partial class Wait : UserControl
    {
        public Wait()
        {
            InitializeComponent();
            this.Visibility = Visibility.Collapsed;
        }

        private Storyboard _storyboard;
        private Storyboard _storyboardSplitTime;
        private bool _isShowState = false;

        public void Show()
        {
            
            _isShowState = true;

            this.Visibility = Visibility.Collapsed;

            InitWaitText();
            DestroyStoryboard();
            
            if (_storyboard == null)
            {
                _storyboard = new Storyboard();
                _storyboard.Duration = TimeSpan.FromSeconds(2);
                _storyboard.Completed += new EventHandler(_storyboard_Completed);
                _storyboard.Begin();
            }

        }

        private void DestroyStoryboard()
        {
            if (_storyboard != null)
            {
                _storyboard.Stop();
                _storyboard = null;
            }
            IndicatorStoryboard.Stop();
        }

        void _storyboard_Completed(object sender, EventArgs e)
        {
            DestroyStoryboard();

            if (_isShowState)
            {
                this.Visibility = Visibility.Visible;
                IndicatorStoryboard.Begin();
                StartSplitTime();
            }
            else
            {
                this.Visibility = Visibility.Collapsed;
                IndicatorStoryboard.Stop();
            }
        }

        #region :: SplitTime Messages ::
        private string[] _waitMessages;

        private void StartSplitTime()
        {
            if (_storyboardSplitTime == null)
            {
                _storyboardSplitTime = new Storyboard();
                _storyboardSplitTime.Duration = TimeSpan.FromSeconds(20);
                _storyboardSplitTime.Completed += new EventHandler(_storyboard_CompletedSplitTime);
            }
            _storyboardSplitTime.Stop();
            _storyboardSplitTime.Begin();
        }
        private void StopSplitTime()
        {
            _storyboardSplitTime.Stop();
        }
        private int _waitMessagesIdx;
        void _storyboard_CompletedSplitTime(object sender, EventArgs e)
        {
            _waitMessagesIdx++;
            if (_waitMessagesIdx >= _waitMessages.Length)
                _waitMessagesIdx = 0;

            WaitText.Text = _waitMessages[_waitMessagesIdx];

            if (_isShowState)
                StartSplitTime();
        }
        private void InitWaitText()
        {
            if (_waitMessages == null)
            {
                string[] msgs = Settings.WaitMessages.Split('|');
                _waitMessages = msgs;
            }
           
            _waitMessagesIdx = 0;
            WaitText.Text = _waitMessages[0];
        }
        #endregion

        public void Hide()
        {

            _isShowState = false;

            this.Visibility = Visibility.Collapsed;
        }
    }
}
