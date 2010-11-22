using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;

namespace FyreUnit
{
    public partial class MainForm : Form
    {
        private const string I7_VERSION = "I7-Version:";
        private const string I7_PATH = "I7-Path:";
        private const string I7_EXTENSIONS_PATH = "I7-Extensions-Path:";
        private const string I7_EXTENSION_AUTHOR = "I7-Extension-Author:";
        private const string I7_EXTENSION_NAME = "I7-Extension-Name:";
        private const string RESULTS_PATH = "Results-Path:";

        string selectedFolder;
        string selectedSource;
        string[] source;

        Dictionary<string, string> Def;

        public MainForm()
        {
            InitializeComponent();
        }

        private void OpenFileMenu_Click(object sender, EventArgs e)
        {
            ProjectListForm pForm = new ProjectListForm();
            pForm.ShowDialog();

            selectedFolder = pForm.SelectedFolder;
            selectedSource = pForm.SelectedSource;

            pForm.Dispose();
            pForm = null;

            this.Text = string.Concat("FyreUnit - ", selectedFolder);

            OpenProject();
            ReadFyreUnitHeader();
        }

        private void OpenProject()
        {
            OutputTextbox.AppendText(string.Concat("You selected the Inform 7 project: ", selectedFolder, "\n"));

            source = File.ReadAllLines(selectedSource);

            OutputTextbox.AppendText(string.Format("Opened project source with {0} lines.\n", source.Length));
        }

        //[#FyreUnit
        //    I7-Version: 6F95
        //    I7-Path: C:\Program Files (x86)\Inform 7 6F95\
        //    I7-Extensions-Path: D:\My Documents\Inform\Extensions\
        //    I7-Extension-Author: Textfyre
        //    I7-Extension-Name: EG Unit Tests
        //    Results-Path: D:\My Documents\Inform\EG Test Results\
        //#End-FyreUnit]
        private void ReadFyreUnitHeader()
        {
            bool readingDefs = false;
            bool endReading = false;

            Def = new Dictionary<string, string>();

            for (int linenum=0; linenum < source.Length; linenum++)
            {
                string line = source[linenum];
                int valueIndex = line.IndexOf(":") + 1;

                if (readingDefs)
                {
                    ReadFyreUnitDef(I7_VERSION, line, valueIndex);
                    ReadFyreUnitDef(I7_PATH, line, valueIndex);
                    ReadFyreUnitDef(I7_EXTENSIONS_PATH, line, valueIndex);
                    ReadFyreUnitDef(I7_EXTENSION_AUTHOR, line, valueIndex);
                    ReadFyreUnitDef(I7_EXTENSION_NAME, line, valueIndex);
                    ReadFyreUnitDef(RESULTS_PATH, line, valueIndex);
                }

                if (line.ToUpper().Contains("#FYREUNIT"))
                    readingDefs = true;

                if (line.ToUpper().Contains("#END-FYREUNIT"))
                    endReading = true;

                if (endReading) break;
            }
        }

        private void ReadFyreUnitDef(string key, string line, int valueIndex)
        {
            // Keys are case-insensitive.
            if (line.ToUpper().Contains(key.ToUpper()))
            {
                string value = line.Substring(valueIndex, line.Length - valueIndex);
                OutputTextbox.AppendText(String.Format("Read {0} with value {1}\n", key, value));
                Def.Add(key, value);
            }
        }
    }
}
