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

namespace SecretLetter
{
    public class StoryHandle : Textfyre.UI.StoryHandle
    {
        public override bool TocSelect(TocArgs args)
        {
            if (args.TocItem == Textfyre.UI.Controls.TableOfContent.Action.StartNewGame)
            {
                //args.LeftPageContent = new Controls.MapLeft();                
                //args.RightPageContent = new Controls.MapRight();
                args.LeftPageControlsAdd(new Controls.MapLeft());
                args.RightPageControlsAdd(new Controls.MapRight());

            }

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
