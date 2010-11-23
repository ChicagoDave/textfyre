using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace FyreUnit
{
    public enum TestStatus
    {
        NotTested,
        Succeeded,
        Failed
    }

    public enum CommandType
    {
        LineWanted,
        KeyWanted,
        TransitionRequested
    }

    [Serializable()]
    public class FyreTest
    {
        private TestStatus status;

        public Guid UniqueId { get; set; }
        public string TestName { get; set; }
        public SortedList<int, FyreStep> Steps { get; set; }
        public FyreStep CurrentStep { get; set; }
        public bool HasSaveFile { get; set; }
        public string SaveFileName { get; set; }

        public TestStatus Status
        {
            get
            {
                status = TestStatus.Succeeded;
                for (int s = 0; s < Steps.Count; s++ )
                {
                    if (Steps[s].Status == TestStatus.Failed || Steps[s].Status == TestStatus.NotTested)
                        status = TestStatus.Failed;
                }

                return status;
            }
            set { status = value; }
        }

        /// <summary>
        /// A new unique id is used when creating a test step. This is used for save/restore
        /// commands. The save file will be named with the Guid. Only one save file is allowed
        /// in any given test.
        /// </summary>
        public FyreTest()
        {
            this.UniqueId = System.Guid.NewGuid();
        }

        public void Run()
        {
            HasSaveFile = false;
            SaveFileName = "";
            CurrentStep = Steps[0];
        }

        public void NextStep()
        {
            if (CurrentStep.StepNumber > Steps.Count)
                CurrentStep = null;
            else
                CurrentStep = Steps[CurrentStep.StepNumber + 1];
        }
    }

    public class FyreStep
    {
        public int StepNumber { get; set; }
        public string Command { get; set; }
        public CommandType CommandType { get; set; }
        public Dictionary<string, string> ExpectedResults { get; set; }
        public Dictionary<string, string> ActualResults { get; set; }
        public TestStatus Status { get; set; }
        public string Message { get; set; }

        public void CompareResults()
        {
            foreach (KeyValuePair<string, string> pair in ActualResults)
            {
                string expected = ExpectedResults[pair.Key];

                if (expected != pair.Value)
                {
                    Status = TestStatus.Failed;
                    Message = String.Concat("Unexpected results for channel '", pair.Key, "'.");
                } else
                    Status = TestStatus.Succeeded;
            }
        }
    }
}
