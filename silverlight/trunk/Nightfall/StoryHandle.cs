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

namespace Nightfall
{
    public class StoryHandle : Textfyre.UI.StoryHandle
    {
        public override ParseInputArgs ParseInput(ParseInputArgs args)
        {
            string input = args.Input.Trim().ToLower();
            switch (input)
            {
                case "about":
                case "help":
                case "hint":
                case "hints":
                    args.ContinueWithInput = false;
                    this.ShowManual();
                    break;
            }
            
            return base.ParseInput(args);
        }

    }
}
