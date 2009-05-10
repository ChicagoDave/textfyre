using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using Textfyre.VM;

namespace FyreFrotz
{
    class Program
    {
        private string filename = "";

        static void Main(string[] args)
        {
            string filename;

            if (args.Length != 1)
            {
                Console.WriteLine("FyreFrotz v1.0 - 10-May-2009 - D. Cornelson");
                Console.WriteLine("Usage:");
                Console.WriteLine("  fyrefrotz gamefile.ulx");
            }

            filename = args[0];

            Runner runner;

            FileInfo file = new FileInfo(filename);
            if (file.Exists)
                runner = new Runner(filename);
            else
                Console.WriteLine("Game file does not exist.");
        }
    }

    public class Runner {

        private Engine vm;
        private Stream gameFile;

        private string inputLine = null;
        private string[] channelText = new string[18];
        
        public Runner(string filename) {
            if (gameFile != null)
                gameFile.Close();

            gameFile = new FileStream(filename, FileMode.Open, FileAccess.Read);

            vm = new Engine(gameFile);
            vm.OutputFilterEnabled = false;

            vm.LineWanted += new LineWantedEventHandler(vm_LineWanted);
            vm.KeyWanted += new KeyWantedEventHandler(vm_KeyWanted);
            vm.OutputReady += new OutputReadyEventHandler(vm_OutputReady);
            vm.SaveRequested += new SaveRestoreEventHandler(vm_SaveRequested);
            vm.LoadRequested += new SaveRestoreEventHandler(vm_LoadRequested);

            vm.Run();
        }        
        
        private void RequestLine()
        {
        }

        private void RequestKey()
        {
        }

        private void vm_LineWanted(object sender, LineWantedEventArgs e)
        {
            Console.Write("\r\n > ");
            inputLine = Console.ReadLine();
            e.Line = inputLine;
        }

        private void vm_KeyWanted(object sender, KeyWantedEventArgs e)
        {
            Console.Write("\r\n > ");
            ConsoleKeyInfo inputKey = Console.ReadKey();
            inputLine = inputKey.KeyChar.ToString();
            e.Char = inputLine[0];
        }

        private string RemoveMarkup(string text)
        {
            Console.WindowWidth = 80;
            Console.WindowHeight = 40;
            string outText = text.Replace("</Paragraph><Paragraph>", "\n\n");
            outText = outText.Replace("<Paragraph>", "");
            outText = outText.Replace("</Paragraph>", "");
            outText = outText.Replace("<Bold>", "");
            outText = outText.Replace("</Bold>", "");
            outText = outText.Replace("<Italic>", "");
            outText = outText.Replace("</Italic>", "");
            return outText.Replace("<LineBreak/>", "\r\n");
        }

        private void PrintLines(string text)
        {
            PrintLines(text, false);
        }

        private void PrintLines(string text, bool isConversation)
        {
            string printText = RemoveMarkup(text);
            string[] textLines = printText.Split(new char[] { '\n' });
            int question = 0;
            foreach (string textLine in textLines)
            {
                question++;
                if (isConversation && textLine.Length > 0)
                    Console.WriteLine(wrapForConsole(question + ". " + textLine, " ", " "));
                else
                    Console.WriteLine(wrapForConsole(textLine, " ", " "));
            }
        }

        private void vm_OutputReady(object sender, OutputReadyEventArgs e)
        {
            string text;

            Dictionary<OutputChannel, string> package = (Dictionary<OutputChannel, string>)e.Package;

            if (package.TryGetValue(OutputChannel.Credits, out text))
            {
                channelText[(int)OutputChannel.Credits] = text.Trim();
                PrintLines(text);
            }

            if (package.TryGetValue(OutputChannel.Prologue, out text))
            {
                channelText[(int)OutputChannel.Prologue] = text.Trim();
                PrintLines(text);
            }

            if (package.TryGetValue(OutputChannel.Main, out text))
            {
                channelText[((int)OutputChannel.Main)] = text;
                PrintLines(text);
            }

            if (package.TryGetValue(OutputChannel.Conversation, out text))
            {
                channelText[(int)OutputChannel.Conversation] = text.Trim();
                Console.WriteLine("");
                PrintLines(text, true);
            }

            if (package.TryGetValue(OutputChannel.Location, out text)) {
                channelText[(int)OutputChannel.Location] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Score, out text)) {
                channelText[(int)OutputChannel.Score] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Time, out text)) {
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
                channelText[(int)OutputChannel.Prompt] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Sound, out text)) {
                channelText[(int)OutputChannel.Sound] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Title, out text)) {
                channelText[(int)OutputChannel.Title] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Chapter, out text)) {
                channelText[(int)OutputChannel.Chapter] = text.Trim();
            }

            if (package.TryGetValue(OutputChannel.Death, out text)) {
                channelText[(int)OutputChannel.Death] = text.Trim();
            }

            Console.Title = channelText[(int)OutputChannel.Title] + " - " + channelText[(int)OutputChannel.Chapter];
        }

        private void vm_SaveRequested(object sender, SaveRestoreEventArgs e)
        {
            string saveFile = "save.dat";
            Console.Write(" Enter file name: ");
            saveFile = Console.ReadLine();

            FileInfo file = new FileInfo(saveFile);

            bool doSave = false;

            if (!file.Directory.Exists)
            {
                Console.WriteLine(" Invalid path.");
                return;
            }

            if (file.Exists)
            {
                Console.WriteLine(" The file '{0}' already exists. Do you want to replace it (Y/N)?", saveFile);
                ConsoleKeyInfo response = Console.ReadKey();
                if (response.Key == ConsoleKey.Y)
                    doSave = true;
            }
            else
                doSave = true;

            if (doSave)
                e.Stream = new FileStream(saveFile, FileMode.Create, FileAccess.Write);
            //else
            //    Console.WriteLine(" Save failed.");

        }

        private void vm_LoadRequested(object sender, SaveRestoreEventArgs e)
        {
            string saveFile = "save.dat";
            Console.Write(" Enter file name: ");
            saveFile = Console.ReadLine();

            FileInfo file = new FileInfo(saveFile);

            if (file.Exists)
            {
                e.Stream = new FileStream(saveFile, FileMode.Open, FileAccess.Read);
                //Console.WriteLine(" Restore succeeded.");
            }
            //else
                //Console.WriteLine(" Restore failed.");
        }

        private static string wrapForConsole(string message, string firstLinePrefix, string normalLinePrefix)
        {
            // Reset StringBuilder 
            consoleBuffer.Remove(0, consoleBuffer.Length);
            int maxLength = Console.BufferWidth;
            consoleBuffer.Append(firstLinePrefix);
            int currentLineLength = consoleBuffer.Length;

            string[] Words = message.Split(' ');

            foreach (string currentWord in Words)
            {
                if ((currentLineLength + currentWord.Length) < maxLength)
                {
                    consoleBuffer.Append(currentWord);
                    consoleBuffer.Append(' ');
                    currentLineLength += currentWord.Length + 1;
                }
                else
                {
                    if (consoleBuffer[consoleBuffer.Length - 1] == ' ')
                        consoleBuffer.Remove(consoleBuffer.Length - 1, 1);
                    consoleBuffer.Append(Environment.NewLine);
                    consoleBuffer.Append(normalLinePrefix);
                    consoleBuffer.Append(currentWord);
                    consoleBuffer.Append(' ');
                    currentLineLength = normalLinePrefix.Length + currentWord.Length + 1;
                }
            }
            return consoleBuffer.ToString();
        }

        /// <summary> 
        /// Console buffer, used by wrapForConsole method 
        /// </summary> 
        private static StringBuilder consoleBuffer = new StringBuilder(); 

    }

}
