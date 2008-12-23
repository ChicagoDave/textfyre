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

namespace Textfyre.UI
{
    public class StoryHandle
    {
        public class ParseInputArgs
        {
            public string Input;
            public string TranscriptText;
            public bool ContinueWithInput;

        }

        public virtual ParseInputArgs ParseInput(ParseInputArgs args)
        {
            return args;
        }

        public void ShowManual()
        {
            Current.Game.TextfyreBook.Manual.Show();
        }

        public void HideManual()
        {
            Current.Game.TextfyreBook.Manual.Hide();
        }
    }
}
