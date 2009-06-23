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

        #region :: RestartGame ::
        public void RestartGame()
        {
            Current.Game.TextfyreBook.RestartGameInit();
        }
        #endregion

        #region :: QuitGame ::
        public void QuitGame()
        {
            Current.Game.TextfyreBook.QuitGameInit();
        }
        #endregion

        #region :: Manual ::
        public void ShowManual()
        {
            Current.Game.TextfyreBook.Manual.Show();
        }

        public void HideManual()
        {
            Current.Game.TextfyreBook.Manual.Hide();
        }
        #endregion

        #region :: Hints ::
        public void ShowHints()
        {
            Current.Game.TextfyreBook.TextfyreDocument.StoryAid.ShowHints();
        }
        #endregion

        #region :: GoToMiscPages ::
        public void GoToMiscPages()
        {
            Current.Game.TextfyreBook.GoTo("MiscPageLeft");
        }
        #endregion

        #region :: Toc Select ::
        public class TocArgs
        {
            public Textfyre.UI.Controls.TableOfContent.Action TocItem;
            public Textfyre.UI.Controls.TextfyreBookPage LeftPage;
            public Textfyre.UI.Controls.TextfyreBookPage RightPage;
            public bool GoToItem;
            public bool GoDirectly;
            public bool IsItemHandled;

            public object LeftPageContent
            {
                set
                {
                    LeftPage.PageScrollViewer.Content = value;
                }
            }

            public object RightPageContent
            {
                set
                {
                    RightPage.PageScrollViewer.Content = value;
                }
            }

            public void RightPageControlsAdd(UIElement uielement)
            {
                RightPage.LayoutRoot.Children.Add(uielement);
            }

            public void LeftPageControlsAdd(UIElement uielement)
            {
                LeftPage.LayoutRoot.Children.Add(uielement);
            }
        }

        /// <summary>
        /// Return true if handled.
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        public virtual bool TocSelect(TocArgs args)
        {
            if (args.GoToItem && args.GoDirectly)
            {
                Current.Game.TextfyreBook.GoTo("MiscPageLeft");
            }
            else if (args.GoToItem && args.GoDirectly == false)
            {
                Current.Game.TextfyreBook.FlipTo("MiscPageLeft");
            }

            return args.IsItemHandled;
        }
        #endregion
    }
}
