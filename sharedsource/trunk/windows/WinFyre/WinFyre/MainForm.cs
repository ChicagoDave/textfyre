using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Textfyre.VM;

namespace WinFyre
{
    public partial class MainForm : Form
    {
        private Engine vm;
        private Thread vmThread;
        private Stream gameFile;

        private AutoResetEvent inputReadyEvent = new AutoResetEvent(false);
        private bool lineWanted = false;
        private bool keyWanted = false;
        private string inputLine = null;
        private string[] channelText = new string[18];

        public MainForm()
        {
            InitializeComponent();
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string filename;

            using (OpenFileDialog dlg = new OpenFileDialog())
            {
                dlg.Title = "Select Game File";
                dlg.Filter = "Glulx files (*.ulx)|*.ulx";

                if (dlg.ShowDialog() == DialogResult.Cancel)
                    return;

                filename = dlg.FileName;
            }

            if (vmThread != null)
            {
                vmThread.Abort();
                vmThread.Join();
            }

            if (gameFile != null)
                gameFile.Close();

            txtOutput.Clear();
            txtInput.Clear();
            txtLocation.Clear();
            txtTime.Clear();
            txtScore.Clear();

            gameFile = new FileStream(filename, FileMode.Open, FileAccess.Read);

            vm = new Engine(gameFile);
            vm.OutputFilterEnabled = false;

            vm.LineWanted += new LineWantedEventHandler(vm_LineWanted);
            vm.KeyWanted += new KeyWantedEventHandler(vm_KeyWanted);
            vm.OutputReady += new OutputReadyEventHandler(vm_OutputReady);
            vm.SaveRequested += new SaveRestoreEventHandler(vm_SaveRequested);
            vm.LoadRequested += new SaveRestoreEventHandler(vm_LoadRequested);

            vmThread = new Thread(VMThreadProc);
            vmThread.IsBackground = true;
            vmThread.Start();
        }
        private void RequestLine()
        {
            lineWanted = true;
            keyWanted = false;

            txtInput.Enabled = true;
            txtInput.Focus();
        }

        private void RequestKey()
        {
            lineWanted = false;
            keyWanted = true;

            txtInput.Enabled = true;
            txtInput.Focus();
        }

        private void txtInput_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (keyWanted)
            {
                GotInput(new string(e.KeyChar, 1));
                e.Handled = true;
            }
            else if (e.KeyChar == '\r' || e.KeyChar == '\n')
            {
                // already handled in KeyDown
                e.Handled = true;
            }
        }

        private void txtInput_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Return)
            {
                e.Handled = true;

                if (keyWanted)
                {
                    GotInput("\n");
                }
                else if (lineWanted)
                {
                    GotInput(txtInput.Text);
                    //txtOutput.Text += lblPrompt.Text + txtInput.Text + "\r\n";
                    txtInput.Clear();
                }
            }
        }

        private void GotInput(string line)
        {
            txtInput.Enabled = false;
            inputLine = line;
            inputReadyEvent.Set();
        }

        private void HandleOutput(Dictionary<OutputChannel, string> package)
        {
            string text;
            MainChannelButton.Enabled = false;
            LocationChannelButton.Enabled = false;
            ScoreChannelButton.Enabled = false;
            TimeChannelButton.Enabled = false;
            HintsChannelButton.Enabled = false;
            HelpChannelButton.Enabled = false;
            MapChannelButton.Enabled = false;
            ProgressChannelButton.Enabled = false;
            ThemeChannelButton.Enabled = false;
            PromptChannelButton.Enabled = false;
            ConversationChannelButton.Enabled = false;
            SoundChannelButton.Enabled = false;
            PrologueChannelButton.Enabled = false;
            TitleChannelButton.Enabled = false;
            CreditsChannelButton.Enabled = false;
            ChapterChannelButton.Enabled = false;
            DeathChannelButton.Enabled = false;

            if (package.TryGetValue(OutputChannel.Main, out text))
            {
                //txtOutput.Text += text.Replace("\n", "\r\n");
                //txtOutput.SelectionStart = txtOutput.Text.Length;
                //txtOutput.ScrollToCaret();
                channelText[((int)OutputChannel.Main)] = text;
                MainChannelButton.Enabled = true;
                MainChannelButton_Click(null, null);
            }

            if (package.TryGetValue(OutputChannel.Location, out text))
            {
                channelText[(int)OutputChannel.Location] = text.Trim();
                LocationChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Score, out text))
            {
                channelText[(int)OutputChannel.Score] = text.Trim();
                ScoreChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Time, out text))
            {
                channelText[(int)OutputChannel.Time] = text.Trim();
                TimeChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Hints, out text))
            {
                channelText[(int)OutputChannel.Hints] = text.Trim();
                HintsChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Help, out text))
            {
                channelText[(int)OutputChannel.Help] = text.Trim();
                HelpChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Map, out text))
            {
                channelText[(int)OutputChannel.Map] = text.Trim();
                MapChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Progress, out text))
            {
                channelText[(int)OutputChannel.Progress] = text.Trim();
                ProgressChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Theme, out text))
            {
                channelText[(int)OutputChannel.Theme] = text.Trim();
                ThemeChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Prompt, out text))
            {
                channelText[(int)OutputChannel.Prompt] = text.Trim();
                PromptChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Conversation, out text))
            {
                channelText[(int)OutputChannel.Conversation] = text.Trim();
                ConversationChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Sound, out text))
            {
                channelText[(int)OutputChannel.Sound] = text.Trim();
                SoundChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Prologue, out text))
            {
                channelText[(int)OutputChannel.Prologue] = text.Trim();
                PrologueChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Title, out text))
            {
                channelText[(int)OutputChannel.Title] = text.Trim();
                TitleChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Credits, out text))
            {
                channelText[(int)OutputChannel.Credits] = text.Trim();
                CreditsChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Chapter, out text))
            {
                channelText[(int)OutputChannel.Chapter] = text.Trim();
                ChapterChannelButton.Enabled = true;
            }

            if (package.TryGetValue(OutputChannel.Death, out text))
            {
                channelText[(int)OutputChannel.Death] = text.Trim();
                DeathChannelButton.Enabled = true;
            }
        }

        private void ArrangeInput(object sender, EventArgs e)
        {
            txtInput.Left = lblPrompt.Right + 2;
            txtInput.Width = inputPanel.ClientSize.Width - txtInput.Left;
        }

        private Stream RequestSaveStream()
        {
            using (SaveFileDialog dlg = new SaveFileDialog())
            {
                dlg.Title = "Select Save File";
                dlg.Filter = "Quetzal save files (*.sav)|*.sav";

                if (dlg.ShowDialog() == DialogResult.Cancel)
                    return null;
                else
                    return new FileStream(dlg.FileName, FileMode.Create, FileAccess.Write);
            }
        }

        private Stream RequestLoadStream()
        {
            using (OpenFileDialog dlg = new OpenFileDialog())
            {
                dlg.Title = "Load a Saved Game";
                dlg.Filter = "Quetzal save files (*.sav)|*.sav";

                if (dlg.ShowDialog() == DialogResult.Cancel)
                    return null;
                else
                    return new FileStream(dlg.FileName, FileMode.Open, FileAccess.Read);
            }
        }

        private void GameFinished()
        {
            txtOutput.Text += "\r\n[The game has finished.]";
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        #region VM Thread

        private void VMThreadProc(object dummy)
        {
            try
            {
                vm.Run();
                this.Invoke(new Action(GameFinished));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void vm_LineWanted(object sender, LineWantedEventArgs e)
        {
            this.Invoke(new Action(RequestLine));
            inputReadyEvent.WaitOne();
            e.Line = inputLine;
        }

        private void vm_KeyWanted(object sender, KeyWantedEventArgs e)
        {
            this.Invoke(new Action(RequestKey));
            inputReadyEvent.WaitOne();
            e.Char = inputLine[0];
        }

        private void vm_OutputReady(object sender, OutputReadyEventArgs e)
        {
            this.Invoke(
                new Action<Dictionary<OutputChannel, string>>(HandleOutput),
                e.Package);
        }

        private void vm_SaveRequested(object sender, SaveRestoreEventArgs e)
        {
            e.Stream = (Stream)this.Invoke(new Func<Stream>(RequestSaveStream));
        }

        private void vm_LoadRequested(object sender, SaveRestoreEventArgs e)
        {
            e.Stream = (Stream)this.Invoke(new Func<Stream>(RequestLoadStream));
        }

        #endregion

        private void MainChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Main)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void LocationChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Location)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void ScoreChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Score)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void TimeChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Time)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void HintsChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Hints)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void HelpChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Help)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void MapChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Map)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void ProgressChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Progress)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void ThemeChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Theme)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void PromptChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Prompt)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void ConversationChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Conversation)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void SoundChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Sound)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void PrologueChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Prologue)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void TitleChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Title)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void CreditsChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Credits)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void ChapterChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Chapter)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }

        private void DeathChannelButton_Click(object sender, EventArgs e)
        {
            txtOutput.Text = channelText[((int)OutputChannel.Death)].Replace("\n", "\r\n");
            txtOutput.SelectionStart = txtOutput.Text.Length;
            txtOutput.ScrollToCaret();
        }
    }
}
