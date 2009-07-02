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

namespace FyreWinClient {
    public partial class MainForm : Form {
        private Engine vm;
        private Thread vmThread;

        private AutoResetEvent inputReadyEvent = new AutoResetEvent(false);
        private bool lineWanted = false;
        private bool keyWanted = false;
        private string inputLine = null;
        private string[] channelText = new string[18];

        public MainForm() {
            InitializeComponent();
            Properties.Settings.Default.Reload();
            SetPreferences();
            StartGame();
        }

        private void SetPreferences() {
            TextWindow.Font = Properties.Settings.Default.GameFont;
            UpperLeft.Font = Properties.Settings.Default.HeaderFooterFont;
            UpperRight.Font = Properties.Settings.Default.HeaderFooterFont;
            LowerLeft.Font = Properties.Settings.Default.HeaderFooterFont;
            LowerRight.Font = Properties.Settings.Default.HeaderFooterFont;
        }

        private void StartGame() {

            if (vmThread != null) {
                vmThread.Abort();
                vmThread.Join();
            }

            UpperLeft.Text = "";
            UpperRight.Text = "";
            LowerLeft.Text = "";
            LowerRight.Text = "";
            TextWindow.Clear();

            MemoryStream fileData = new MemoryStream(Properties.Resource.sl_v1_04e);

            vm = new Engine(fileData);
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

        private void MenuSave_Click(object sender, EventArgs e) {

        }

        private void MenuLoad_Click(object sender, EventArgs e) {

        }

        private void MenuExit_Click(object sender, EventArgs e) {

        }

        private void RequestLine() {
            lineWanted = true;
            keyWanted = false;

            InputText.Enabled = true;
            InputText.Focus();
        }

        private void RequestKey() {
            lineWanted = false;
            keyWanted = true;

            InputText.Enabled = true;
            InputText.Focus();
        }

        private void InputText_KeyPress(object sender, KeyPressEventArgs e) {
            if (keyWanted) {
                GotInput(new string(e.KeyChar, 1));
                e.Handled = true;
            } else if (e.KeyChar == '\r' || e.KeyChar == '\n') {
                // already handled in KeyDown
                e.Handled = true;
            }
        }

        private void InputText_KeyDown(object sender, KeyEventArgs e) {
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Return) {
                e.Handled = true;

                if (keyWanted) {
                    GotInput("\n");
                } else if (lineWanted) {
                    GotInput(InputText.Text);
                    InputText.Clear();
                }
            }
        }

        private void GotInput(string line) {
            InputText.Enabled = false;
            inputLine = line;
            inputReadyEvent.Set();
        }

        private void HandleOutput(Dictionary<OutputChannel, string> package) {
            string text;

            if (package.TryGetValue(OutputChannel.Title, out text)) {
                channelText[(int)OutputChannel.Title] = text.Trim();

                this.Text = text;
            }

            if (package.TryGetValue(OutputChannel.Prologue, out text)) {
                channelText[(int)OutputChannel.Prologue] = text.Trim();

                TextWindow.AppendText(String.Format("{0}\r\n\r\n", text));
            }

            if (package.TryGetValue(OutputChannel.Credits, out text)) {
                channelText[(int)OutputChannel.Credits] = text.Trim();

                TextWindow.AppendText(text);
            }

            if (package.TryGetValue(OutputChannel.Main, out text)) {
                channelText[((int)OutputChannel.Main)] = text;

                TextWindow.AppendText(text);
            }

            if (package.TryGetValue(OutputChannel.Location, out text)) {
                channelText[(int)OutputChannel.Location] = text.Trim();

                UpperRight.Text = text;
            }

            if (package.TryGetValue(OutputChannel.Score, out text)) {
                channelText[(int)OutputChannel.Score] = text.Trim();

                LowerRight.Text = String.Format("Score: {0}", text);
            }

            if (package.TryGetValue(OutputChannel.Time, out text)) {
                channelText[(int)OutputChannel.Time] = text.Trim();

                LowerLeft.Text = String.Format("Turns: {0}", text);
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
                channelText[(int)OutputChannel.Prompt] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Conversation, out text)) {
                channelText[(int)OutputChannel.Conversation] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Sound, out text)) {
                channelText[(int)OutputChannel.Sound] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Chapter, out text)) {
                channelText[(int)OutputChannel.Chapter] = text.Trim();

                UpperLeft.Text = text;
            }

            if (package.TryGetValue(OutputChannel.Death, out text)) {
                channelText[(int)OutputChannel.Death] = text.Trim();
            }
        }

        private void ArrangeInput(object sender, EventArgs e) {
            // we don't care about the > prompt in the WinForms version...
        }

        private Stream RequestSaveStream() {
            using (SaveFileDialog dlg = new SaveFileDialog()) {
                dlg.Title = "Select Save File";
                dlg.Filter = "Textfyre save files (*.tfq)|*.tfq";

                if (dlg.ShowDialog() == DialogResult.Cancel)
                    return null;
                else
                    return new FileStream(dlg.FileName, FileMode.Create, FileAccess.Write);
            }
        }

        private Stream RequestLoadStream() {
            using (OpenFileDialog dlg = new OpenFileDialog()) {
                dlg.Title = "Load a Saved Game";
                dlg.Filter = "Textfyre save files (*.tfq)|*.tfq";

                if (dlg.ShowDialog() == DialogResult.Cancel)
                    return null;
                else
                    return new FileStream(dlg.FileName, FileMode.Open, FileAccess.Read);
            }
        }

        private void GameFinished() {
        }

        #region VM Thread

        private void VMThreadProc(object dummy) {
            try {
                vm.Run();
                this.Invoke(new Action(GameFinished));
            } catch (Exception ex) {
                MessageBox.Show(ex.ToString());
            }
        }

        private void vm_LineWanted(object sender, LineWantedEventArgs e) {
            this.Invoke(new Action(RequestLine));
            inputReadyEvent.WaitOne();
            e.Line = inputLine;
        }

        private void vm_KeyWanted(object sender, KeyWantedEventArgs e) {
            this.Invoke(new Action(RequestKey));
            inputReadyEvent.WaitOne();
            e.Char = inputLine[0];
        }

        private void vm_OutputReady(object sender, OutputReadyEventArgs e) {
            this.Invoke(
                new Action<Dictionary<OutputChannel, string>>(HandleOutput),
                e.Package);
        }

        private void vm_SaveRequested(object sender, SaveRestoreEventArgs e) {
            e.Stream = (Stream)this.Invoke(new Func<Stream>(RequestSaveStream));
        }

        private void vm_LoadRequested(object sender, SaveRestoreEventArgs e) {
            e.Stream = (Stream)this.Invoke(new Func<Stream>(RequestLoadStream));
        }
        #endregion

        private void MenuPreferences_Click(object sender, EventArgs e) {
            Preferences prefWindow = new Preferences();
            DialogResult result = prefWindow.ShowDialog();
            if (result == DialogResult.OK) {
                SetPreferences();
                Properties.Settings.Default.Save();
            }
        }

    }
}
