using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using Textfyre.VM;

namespace FyreConsoleClient {
    public class Program {
        private Engine vm;

        private AutoResetEvent inputReadyEvent = new AutoResetEvent(false);
        private string inputLine = null;
        private bool closeEngine = false;
        private bool restartEngine = false;

        private int width = 72;

        static void Main(string[] args) {
            Program program = new Program();
            program.StartGame();
        }

        private void StartGame() {

            width = Console.BufferWidth - 4;

            while (true) {
                MemoryStream fileData = new MemoryStream(Resource.sl_v1_05xe);

                vm = new Engine(fileData);
                vm.OutputFilterEnabled = false;

                vm.LineWanted += new LineWantedEventHandler(vm_LineWanted);
                vm.KeyWanted += new KeyWantedEventHandler(vm_KeyWanted);
                vm.OutputReady += new OutputReadyEventHandler(vm_OutputReady);
                vm.SaveRequested += new SaveRestoreEventHandler(vm_SaveRequested);
                vm.LoadRequested += new SaveRestoreEventHandler(vm_LoadRequested);

                VMRun();

                if (closeEngine) return;
                restartEngine = false;
                Console.Clear();
            }
        }

        private void RequestLine() {
            if (restartEngine || closeEngine) {
                vm.Stop();
                return;
            }

            Console.Write("> ");
            inputLine = Console.ReadLine();

            switch (inputLine.ToUpper()) {
                case "Q":
                case "QUIT":
                case "EXIT":
                    closeEngine = true;
                    DoTrySave("Q");
                    break;
                case "RESTART":
                    restartEngine = true;
                    DoTrySave("R");
                    break;
            }

            GotInput();
        }

        private void RequestKey() {
            Console.Write("> ");
            ConsoleKeyInfo inputKey = Console.ReadKey();

            inputLine = inputKey.KeyChar.ToString();
            GotInput();
        }

        private void GotInput() {
            inputReadyEvent.Set();
        }

        private void HandleOutput(Dictionary<OutputChannel, string> package) {
            string text;

            if (package.TryGetValue(OutputChannel.Title, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Prologue, out text)) {
                WrapOutput(text);
                Console.WriteLine();
            }

            if (package.TryGetValue(OutputChannel.Credits, out text)) {
                Console.Write(String.Concat(text.Replace("&#169;", "@"), "\r\n"));
            }

            if (package.TryGetValue(OutputChannel.Main, out text)) {
                WrapOutput(text.Trim());
                Console.WriteLine();
            }

            if (package.TryGetValue(OutputChannel.Location, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Score, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Time, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Hints, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Help, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Map, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Progress, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Theme, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Prompt, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Conversation, out text)) {
                Console.Write("\r\n");

                if (text.Length > 0) {
                    string[] delim = new string[] { "\n" };
                    string[] clines = text.Split(delim, StringSplitOptions.RemoveEmptyEntries);

                    int num = 0;
                    foreach (string cline in clines) {
                        num++;
                        WrapOutput(string.Format("{0}. {1}\r\n", num, cline));
                    }
                }
            }

            if (package.TryGetValue(OutputChannel.Sound, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Chapter, out text)) {
            }

            if (package.TryGetValue(OutputChannel.Death, out text)) {
            }
        }

        private void WrapOutput(string outputText) {
            string[] depar = new string[] { "\n" };
            string[] delim = new string[] { " " };
            string[] paras = outputText.Split(depar, StringSplitOptions.RemoveEmptyEntries);

            foreach (string para in paras) {
                string[] words = para.Split(delim, StringSplitOptions.RemoveEmptyEntries);

                int pos = 0;

                foreach (string word in words) {
                    if (pos + word.Length >= width - 1) {
                        Console.WriteLine();
                        pos = 0;
                    }

                    Console.Write(string.Concat(word.Trim(), " "));
                    pos = pos + word.Length + 1;
                }

                Console.WriteLine();
                if ("\"!.;:".IndexOf(para.Substring(para.Length-1, 1)) > -1)
                    Console.WriteLine();
            }
        }

        private void ArrangeInput(object sender, EventArgs e) {
            // we don't care about the > prompt in the WinForms version...
        }

        private Stream RequestSaveStream() {
            Console.Write("\r\nFilename: ");
            string filename = Console.ReadLine();

            FileInfo file = new FileInfo(filename);

            if (file.Exists) {
                Console.Write("Overwrite file (Y/<N>)? ");
                string overwrite = Console.ReadLine();
                if (overwrite.ToUpper() == "Y")
                    file.Delete();
            }

            return new FileStream(filename, FileMode.Create, FileAccess.Write);
        }

        private Stream RequestLoadStream() {
            Console.Write("\r\nFilename: ");
            string filename = Console.ReadLine();

            FileInfo file = new FileInfo(filename);

            if (!file.Exists) {
                return null;
            }

            return new FileStream(filename, FileMode.Open, FileAccess.Read);
        }

        private void DoTrySave(string action) {
            Console.Write("Do you want to save your game before ");
            if (action == "Q")
                Console.Write("quitting (<Y>/N)? ");
            else
                Console.Write("restarting (<Y>/N? ");

            string doSave = Console.ReadLine();

            if (doSave.ToUpper() == "N")
                return;

            inputLine = "save"; // we make the next command save
        }

        private void GameFinished() {
            if (closeEngine) {
                Console.Write(" press any key to close the window ");
                Console.ReadKey();
            }
        }

        #region VM Events

        private void VMRun() {
            try {
                vm.Run();
                GameFinished();
            } catch (Exception ex) {
                Console.WriteLine(ex.ToString());
            }
        }

        private void vm_LineWanted(object sender, LineWantedEventArgs e) {
            RequestLine();
            e.Line = inputLine;
        }

        private void vm_KeyWanted(object sender, KeyWantedEventArgs e) {
            RequestKey();
            e.Char = inputLine[0];
        }

        private void vm_OutputReady(object sender, OutputReadyEventArgs e) {
            HandleOutput((Dictionary<OutputChannel,string>)e.Package);
        }

        private void vm_SaveRequested(object sender, SaveRestoreEventArgs e) {
            e.Stream = RequestSaveStream();
        }

        private void vm_LoadRequested(object sender, SaveRestoreEventArgs e) {
            e.Stream = RequestLoadStream();
        }
        #endregion
    }
}
