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

namespace Textfyre.UI.Entities
{
    public class GameState
    {
        public GameState()
        {

        }

        public void ActivateGameState()
        {
            Current.Game.IsScrollLimitEnabled = false;
            Current.Game.TextfyreBook.RemoveBackPages();
            Current.Game.TextfyreBook.ClearStoryPage();
            
            Current.Game.TextfyreBook.TextfyreDocument.ClearAll();
            Current.Game.TextfyreBook.TextfyreDocument.AddFyreXml(FyreXml);
        }

        #region :: FyreXml ::
        private System.Text.StringBuilder _fyreXml = new System.Text.StringBuilder("");
        public string FyreXml
        {
            get
            {
                return _fyreXml.ToString();
            }
        }

        public void FyreXmlAdd(string fyreXml)
        {
            _fyreXml.Append(fyreXml);
        }

        public void FyreXmlClear()
        {
            _fyreXml.Length = 0;
            _fyreXml = null;
            _fyreXml = new System.Text.StringBuilder("");
        }
        #endregion

    }

}
