using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Text;
using System.Diagnostics;
using FyreVM;

namespace Zifmia.FyreVM.Service
{
    [Serializable()]
    public class EngineWrapper
    {
        private Engine vm;
        string entry = "";
        string saveCommand;
        Stream saveFileData;

        string outputXML;
        Hashtable outputHash;
        byte[] outSaveFile;

        // The default is to load a game and return with any prologue data...
        VMWrapperState wrapperState = VMWrapperState.LoadGame;
        VMRequestType requestType = VMRequestType.StartGame;

        MemoryStream saveStream;

        public enum VMRequestType
        {
            StartGame,
            ExecuteCommand
        }

        public enum VMWrapperState
        {
            LoadGame,
            RunCommand,
            RequestRestore,
            RequestSave
        }

        public EngineWrapper() { }

        /// <summary>
        /// Assume we're running a command and have save game data.
        /// </summary>
        /// <param name="gameFile"></param>
        /// <param name="saveFile"></param>
        /// <param name="command"></param>
        public EngineWrapper(byte[] gameFile, byte[] saveFile, string command)
        {
            if (gameFile == null)
                throw new Exception("Missing game key.");

            if (saveFile == null)
                throw new Exception("Missing required Save File.");

            if (command == "")
                throw new Exception("Missing command.");

            MemoryStream gameData = new MemoryStream(gameFile);
            saveFileData = new MemoryStream(saveFile);

            vm = new Engine(gameData);

            wrapperState = VMWrapperState.LoadGame;
            requestType = VMRequestType.ExecuteCommand;

            // save the user's command for later
            saveCommand = command;

            Run();
        }

        /// <summary>
        /// Load the game and return data.
        /// </summary>
        /// <param name="gameFile"></param>
        public EngineWrapper(byte[] gameFile)
        {
            if (gameFile == null)
                throw new Exception("Missing game file.");

            MemoryStream gameData = new MemoryStream(gameFile);

            vm = new Engine(gameData);

            requestType = VMRequestType.StartGame;
            wrapperState = VMWrapperState.LoadGame;

            Run();
        }

        public void SendCommand(string command)
        {
            wrapperState = VMWrapperState.LoadGame;
            requestType = VMRequestType.ExecuteCommand;

            saveCommand = command;

            vm.Continue();
        }

        private void Run()
        {
            vm.OutputReady += new OutputReadyEventHandler(vm_OutputReady);
            vm.LineWanted += new LineWantedEventHandler(vm_LineWanted);
            vm.KeyWanted += new KeyWantedEventHandler(vm_KeyWanted);
            vm.SaveRequested += new SaveRestoreEventHandler(vm_SaveRequested);
            vm.LoadRequested += new SaveRestoreEventHandler(vm_LoadRequested);

            vm.Run();
        }

        /// <summary>
        /// Starting game
        ///     - retrieves output (startup)
        ///     - ignore output (save)
        /// 
        /// Entering a command
        ///     - ignore output (startup and load)
        ///     - retrieves output (command)
        ///     - ignore output (save)
        /// 
        /// </summary>
        /// <param name="package"></param>
        private void HandleOutput(Dictionary<string, string> package)
        {
            // Reset hashtable
            outputHash = new Hashtable();

            StringWriter sWriter = new StringWriter();
            XmlTextWriter writer = new XmlTextWriter(sWriter);

            // Open XML stream
            writer.WriteStartDocument();
            writer.WriteStartElement("fyrevm");
            writer.WriteStartElement("channels");

            // loop through results and output to xml
            foreach (string channel in package.Keys)
            {
                SetChannelData(channel, package, writer);
            }

            writer.WriteEndElement();
            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            StringBuilder data = sWriter.GetStringBuilder();
            outputXML = data.ToString();
            sWriter.Close();
        }

        private void SetChannelData(string channel, Dictionary<string, string> package, XmlTextWriter writer)
        {
            string text = "";
            string channelName = channel;

            if (package.TryGetValue(channel, out text))
            {
                WriteElementCDATA(writer, channelName, text.Trim());
                outputHash.Add(channelName, text.Trim());
            }
            else
            {
                WriteElementCDATA(writer, channelName, "");
                outputHash.Add(channelName, "");
            }
        }

        private void WriteElementCDATA(XmlTextWriter xWriter, string elementName, string text)
        {
            xWriter.WriteStartElement(elementName);
            xWriter.WriteCData(text);
            xWriter.WriteEndElement();
        }

        private void vm_OutputReady(object sender, OutputReadyEventArgs e)
        {
            // ----------- DECIDE TO STORE OUTPUT --------------

            if ((wrapperState == VMWrapperState.LoadGame && requestType == VMRequestType.StartGame) || wrapperState == VMWrapperState.RunCommand)
            {
                HandleOutput((Dictionary<string, string>)e.Package);
            }

            // ----------- DETERMINE STATE -------------

            if (wrapperState == VMWrapperState.RequestSave)
            {
                outSaveFile = saveStream.GetBuffer();
                vm.Stop();
            }

            if (wrapperState == VMWrapperState.RunCommand || (wrapperState == VMWrapperState.LoadGame && requestType == VMRequestType.StartGame))
                wrapperState = VMWrapperState.RequestSave;

            if (wrapperState == VMWrapperState.RequestRestore && requestType == VMRequestType.ExecuteCommand)
                wrapperState = VMWrapperState.RunCommand;

            if (wrapperState == VMWrapperState.LoadGame && requestType == VMRequestType.ExecuteCommand)
                wrapperState = VMWrapperState.RequestRestore;

        }

        private void vm_LineWanted(object sender, LineWantedEventArgs e)
        {
            if (wrapperState == VMWrapperState.RequestRestore)
                entry = "restore";

            if (wrapperState == VMWrapperState.RunCommand)
                entry = saveCommand;

            if (wrapperState == VMWrapperState.RequestSave)
                entry = "save";

            e.Line = entry;
        }

        private void vm_KeyWanted(object sender, KeyWantedEventArgs e)
        {
            e.Char = entry[0];
        }

        private void vm_SaveRequested(object sender, SaveRestoreEventArgs e)
        {
            saveStream = new MemoryStream();
            e.Stream = saveStream;
        }

        private void vm_LoadRequested(object sender, SaveRestoreEventArgs e)
        {
            e.Stream = saveFileData;
        }

        public string ToXML
        {
            get
            {
                return outputXML;
            }
        }

        public string FromHash(string channelName)
        {
            if (outputHash.ContainsKey(channelName))
                return (string)outputHash[channelName];
            else
                return "";
        }

        public Hashtable FromHash()
        {
            return outputHash;
        }

        public byte[] SaveFile
        {
            get
            {
                return outSaveFile;
            }
        }

        public VMWrapperState WrapperState
        {
            get
            {
                return wrapperState;
            }
        }
    }
}
