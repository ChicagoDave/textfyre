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
    public partial class TableOfContent : UserControl
    {
        public enum Action
        {
            Introduction,
            StartNewGame,
            ContinueGame,
            SaveGame,
            RestoreGame,
            Quit,
            Transcript,
            Map,
            Hints
        }

        public class TableOfContentActionEventArgs : EventArgs
        {
            public Action Action;
        }

        public event EventHandler<TableOfContentActionEventArgs> TableOfContentAction; 

        public TableOfContent()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, TitleText);
            TitleText.FontSize = 24d;
            Refresh();

            string tocs = Settings.TOCs;
            BtnIntroduction.Visibility = (tocs.IndexOf("Introduction") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnMap.Visibility = (tocs.IndexOf("Map") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnHints.Visibility = (tocs.IndexOf("Hints") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnHelp.Visibility = (tocs.IndexOf("Help") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnTranscript.Visibility = (tocs.IndexOf("Transcript") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnCredits.Visibility = (tocs.IndexOf("Credits") > -1) ? Visibility.Visible : Visibility.Collapsed;
            BtnQuit.Visibility = (tocs.IndexOf("Quit") > -1) ? Visibility.Visible : Visibility.Collapsed;

            
        }

        public void Refresh()
        {
            //BtnStartNewGame.Enabled = !Current.Application.IsStoryRunning;
            BtnContinueGame.Enabled = Current.Game.IsStoryRunning;
            BtnSaveGame.Enabled = Current.Game.IsStoryRunning;
            BtnTranscript.Enabled = Current.Game.IsStoryRunning;
            BtnMap.Enabled = Current.Game.IsStoryRunning;
            BtnHints.Enabled = Current.Game.IsStoryRunning;
            BtnRestoreGame.Enabled = (Entities.SaveFile.SaveFilesCount > 0);
        }

        private void BtnStartNewGame_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.StartNewGame);
        }

        private void OnTableOfContentAction( Action action )
        {
            if( TableOfContentAction != null )
            {
                TableOfContentActionEventArgs args = new TableOfContentActionEventArgs();
                args.Action = action;
                TableOfContentAction(this, args );
            }
        }

        private void BtnContinueGame_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.ContinueGame);
        }

        private void BtnSaveGame_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.SaveGame);
        }

        private void BtnRestoreGame_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.RestoreGame);
        }

        private void BtnQuit_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.Quit);
        }

        private void BtnTranscript_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.Transcript);
        }

        private void BtnMap_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.Map);
        }

        private void BtnHints_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.Hints);
        }

        private void BtnIntroduction_Click(object sender, EventArgs e)
        {
            OnTableOfContentAction(Action.Introduction);
        }
    }
}
