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
    public class TextFormat
    {
        public enum Formats
        {
            None,
            Normal,
            Headline
        }

        public enum AlignType
        {
            Left,
            Center,
            Right
        }

        #region :: IsEqual ::
        public bool IsEqual(TextFormat tf)
        {
            if (tf.Format != this.Format)
                return false;

            if (tf.Align != this.Align)
                return false;

            if (tf.IsBold != this.IsBold)
                return false;

            if (tf.IsItalic != this.IsItalic)
                return false;

            return true;
        }
        #endregion

        #region :: Format ::
        private Formats _format = Formats.None;
        public Formats Format
        {
            get
            {
                return _format;
            }
            set
            {
                _format = value;
            }
        }
        #endregion

        #region :: Align ::
        private AlignType _align = AlignType.Left;
        public AlignType Align
        {
            get
            {
                return _align;
            }
            set
            {
                _align = value;
            }
        }
        #endregion


        #region :: Bold ::
        private int _bold;
        public bool IsBold
        { 
            get
            {
                return _bold > 0 ;
            }

            set
            {
                if (value)
                    _bold++;
                else
                {
                    _bold--;

                    if (_bold < 0)
                        _bold = 0;
                }
            }
        }
        #endregion

        #region :: Italic ::
        private int _italic;
        public bool IsItalic
        { 
            get
            {
                return _italic > 0;
            }

            set
            {
                if (value)
                    _italic++;
                else
                {
                    _italic--;

                    if (_italic < 0)
                        _italic = 0;
                }
            }
        }
        #endregion
    }
}
