using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading;
using FyreVM;

namespace FyreUnit
{
    public class TestRunner
    {
        private MemoryStream game;
        private Engine engine;
        private FyreTest test;

        public TestRunner(MemoryStream gameData, FyreTest unitTest)
        {
            game = gameData;
            test = unitTest;
        }

        private void Run()
        {
            engine = new Engine(game);

            engine.OutputReady += new OutputReadyEventHandler(engine_OutputReady);
            engine.KeyWanted += new KeyWantedEventHandler(engine_KeyWanted);
            engine.LineWanted += new LineWantedEventHandler(engine_LineWanted);
            engine.SaveRequested += new SaveRestoreEventHandler(engine_SaveRequested);
            engine.LoadRequested += new SaveRestoreEventHandler(engine_LoadRequested);
            engine.TransitionRequested += new TransitionRequestedEventHandler(engine_TransitionRequested);

            // Start unit test
            test.Run();

            // Start game
            engine.Run();
        }

        void engine_TransitionRequested(object sender, TransitionEventArgs e)
        {
            if (test.CurrentStep.CommandType != CommandType.TransitionRequested)
            {
                test.CurrentStep.Status = TestStatus.Failed;
                test.CurrentStep.Message = "Game requested unexpected transition request.";
                engine.Stop();
            }
        }

        void engine_LoadRequested(object sender, SaveRestoreEventArgs e)
        {
            if (test.HasSaveFile)
                e.Stream = new MemoryStream(File.ReadAllBytes(test.SaveFileName));
        }

        void engine_SaveRequested(object sender, SaveRestoreEventArgs e)
        {
            if (test.HasSaveFile)
            {
                e.Stream = new FileStream(test.SaveFileName, FileMode.CreateNew);
            }
            else
            {
                // first we have to make the filename
                test.HasSaveFile = true;
                test.SaveFileName = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\" + test.UniqueId;
                e.Stream = new FileStream(test.SaveFileName, FileMode.CreateNew);
            }
        }

        void engine_LineWanted(object sender, LineWantedEventArgs e)
        {
            if (test.CurrentStep.CommandType != CommandType.LineWanted)
            {
                test.CurrentStep.Status = TestStatus.Failed;
                test.CurrentStep.Message = "Game requested unexpected line wanted.";
                engine.Stop();
            }
            else
                e.Line = test.CurrentStep.Command;
        }

        void engine_KeyWanted(object sender, KeyWantedEventArgs e)
        {
            if (test.CurrentStep.CommandType != CommandType.KeyWanted)
            {
                test.CurrentStep.Status = TestStatus.Failed;
                test.CurrentStep.Message = "Game requested unexpected key press.";
                engine.Stop();
            }
            else
                e.Char = (char)test.CurrentStep.Command[0];
        }

        void engine_OutputReady(object sender, OutputReadyEventArgs e)
        {
            test.CurrentStep.ActualResults = (Dictionary<string, string>)e.Package;

            // We have our output
            // Tell the test step to compare
            test.CurrentStep.CompareResults();

            // Setup the next step.
            test.NextStep();

            if (test.CurrentStep == null)
                engine.Stop();
        }
    
    }
}
