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

namespace Shadow
{
    public class StoryHandle : Textfyre.UI.StoryHandle
    {
        public override ParseInputArgs ParseInput(ParseInputArgs args)
        {
            string input = args.Input.Trim().ToLower();
            switch (input)
            {
                case "restart":
                    args.ContinueWithInput = false;
                    this.RestartGame();
                    break;
                case "quit":
                    args.ContinueWithInput = false;
                    this.QuitGame();
                    break;
                case "help":
                    args.ContinueWithInput = false;
                    this.ShowManual();
                    break;
                case "hint":
                case "hints":
                    args.ContinueWithInput = false;
                    this.ShowHints();
                    break;
            }

            return base.ParseInput(args);
        }

        public override bool TocSelect(TocArgs args)
        {
            if (args.TocItem == Textfyre.UI.Controls.TableOfContent.Action.Map)
            {   
                args.GoDirectly = true;
                args.GoToItem = true;

                args.IsItemHandled = true;
            }

            return base.TocSelect(args);
        }
    }
}
