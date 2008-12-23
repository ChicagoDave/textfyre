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
    public partial class Hint : UserControl
    {
        public Hint NextHint;
        
        public event EventHandler Click;

        public Hint()
        {
            InitializeComponent(); 
            InitTxtBlocks();
            LayoutRoot.MouseLeftButtonUp += new MouseButtonEventHandler(LayoutRoot_MouseLeftButtonUp);
            LayoutRoot.MouseEnter += new MouseEventHandler(LayoutRoot_MouseEnter);
            LayoutRoot.MouseLeave += new MouseEventHandler(LayoutRoot_MouseLeave);
        }

        void InitTxtBlocks()
        {
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt1);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt2);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt3);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt4);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt5);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.MainItalic, HintTxt6);

            HintTxt1.FontSize = 11;
            HintTxt2.FontSize = 11;
            HintTxt3.FontSize = 11;
            HintTxt4.FontSize = 11;
            HintTxt5.FontSize = 11;
            HintTxt6.FontSize = 11;

            SetCursor(false);
        }

        void SetCursor(bool isHand)
        {

            HintTxt1.Cursor = isHand ? Cursors.Hand : null;
            HintTxt2.Cursor = isHand ? Cursors.Hand : null;
            HintTxt3.Cursor = isHand ? Cursors.Hand : null;
            HintTxt4.Cursor = isHand ? Cursors.Hand : null;
            HintTxt5.Cursor = isHand ? Cursors.Hand : null;
            HintTxt6.Cursor = isHand ? Cursors.Hand : null;
        }

        void LayoutRoot_MouseLeave(object sender, MouseEventArgs e)
        {
            Current.Game.IsInputFocusActive = true;
        }

        void LayoutRoot_MouseEnter(object sender, MouseEventArgs e)
        {
            Current.Game.IsInputFocusActive = false;
        }

        void LayoutRoot_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (IsHintEnabled && Click != null)
            {
                Click(this, new EventArgs());
            }
        }

        public void RevealHint()
        {
            if (RevealStoryboard.GetCurrentState() != ClockState.Active)
            {
                RevealStoryboard.Begin();
            }
            

            if(NextHint != null )
                NextHint.IsHintEnabled = true;
        }

        private bool _isHintEnabled = true;
        public bool IsHintEnabled
        {
            get
            {
                return _isHintEnabled;
            }

            set
            {
                _isHintEnabled = value;

                if (value)
                {
                    if (EnableStoryboard.GetCurrentState() != ClockState.Active)
                        EnableStoryboard.Begin();
                    SetCursor(true);

                }
                else
                {
                        if (DisableStoryboard.GetCurrentState() != ClockState.Active)
                            DisableStoryboard.Begin();
                        SetCursor(false);
                        
                }

            }

        }

        public string Text
        {
            set
            {
                HintTxt1.Text = value;
                HintTxt2.Text = value;
                HintTxt3.Text = value;
                HintTxt4.Text = value;
                HintTxt5.Text = value;
                HintTxt6.Text = value;
            }

            get
            {
                return HintTxt1.Text;
            }
        }
    }
}
