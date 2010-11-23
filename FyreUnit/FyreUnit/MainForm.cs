using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading;
using System.Windows.Forms;
using FyreVM;

namespace FyreUnit
{
    /// <summary>
    /// - Load global settings
    /// - Load game
    ///   a. load game related settings
    ///   b. load game
    ///   c. load tests
    ///      - if no tests, load game and record load channel data as standard Prologue Test.
    ///   d. load list of reports
    ///   e. display data
    /// - Record test
    ///   a. Begin with existing test?
    ///   b. User enters commands
    ///   c. User stops recording
    ///   d. Name new test
    ///   e. Add test
    /// </summary>
    public partial class MainForm : Form
    {
        private MemoryStream game;

        public MainForm()
        {
            InitializeComponent();
        }

        private void OpenFileMenu_Click(object sender, EventArgs e)
        {
            DialogResult result = openFileDialog1.ShowDialog();

            game = new MemoryStream(File.ReadAllBytes(openFileDialog1.FileName));
        }


    }
}
