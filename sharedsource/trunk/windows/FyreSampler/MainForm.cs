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

namespace SimpleFyre
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

            lblPrompt.Text = "";
            txtInput.Bounds = inputPanel.ClientRectangle;
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void aboutSimpleFyreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("SimpleFyre\nA FyreVM sample application.");
        }

        private void openGameToolStripMenuItem_Click(object sender, EventArgs e)
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

            RunGame(filename);
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
                    txtOutput.Text += lblPrompt.Text + txtInput.Text + "\r\n";
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

            if (package.TryGetValue(OutputChannel.Main, out text))
            {
                txtOutput.Text += text.Replace("\n", "\r\n");
                txtOutput.SelectionStart = txtOutput.Text.Length;
                txtOutput.ScrollToCaret();
                channelText[((int)OutputChannel.Main)] = text;
            }

            if (package.TryGetValue(OutputChannel.Location, out text)) {
                txtLocation.Text = text.Trim();
                channelText[(int)OutputChannel.Location] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Score, out text)) {
                txtScore.Text = text.Trim();
                channelText[(int)OutputChannel.Score] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Time, out text)) {
                txtTime.Text = text.Trim();
                channelText[(int)OutputChannel.Time] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Hints, out text)) {
                channelText[(int)OutputChannel.Hints] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Help, out text)) {
                channelText[(int)OutputChannel.Help] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Map, out text)) {
                channelText[(int)OutputChannel.Map] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Progress, out text)) {
                channelText[(int)OutputChannel.Progress] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Theme, out text)) {
                channelText[(int)OutputChannel.Theme] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Prompt, out text)) {
                lblPrompt.Text = text.Trim();
                channelText[(int)OutputChannel.Prompt] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Conversation, out text)) {
                channelText[(int)OutputChannel.Conversation] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Sound, out text)) {
                switch (text.Trim()) {
                    case "1": playSound(1); break;
                    case "2": playSound(2); break;
                }
                channelText[(int)OutputChannel.Sound] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Prologue, out text)) {
                channelText[(int)OutputChannel.Prologue] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Title, out text)) {
                channelText[(int)OutputChannel.Title] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Credits, out text)) {
                channelText[(int)OutputChannel.Credits] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Chapter, out text)) {
                channelText[(int)OutputChannel.Chapter] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Death, out text)) {
                channelText[(int)OutputChannel.Death] = text.Trim();
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


        private void playSound(int soundNumber) {
            //System.Media.SoundPlayer player = new System.Media.SoundPlayer();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e) {
            RunGame(@"GameFiles\The Basics.ulx");
        }

        private void RunGame(string filename) {
            if (vmThread != null) {
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
    }
}
