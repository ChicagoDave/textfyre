using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using Textfyre.Common.Codegen.Framework;
using Textfyre.Common.Utilities;

namespace Textfyre.Common.Codegen.Windows
{
    public partial class MainForm : Form
    {
        private ConnectionStringSettingsCollection _csSettings;

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            this.Text = String.Concat("OD Code Generation Tool - ", Application.ProductVersion);

            LoadDatabases();

            if (Properties.Settings.Default.Database.Length > 0)
                Database.Text = Properties.Settings.Default.Database;

            if (Properties.Settings.Default.RootNamespace.Length > 0)
                RootNamespace.Text = Properties.Settings.Default.RootNamespace;

            Overwrite.Checked = Properties.Settings.Default.Overwrite;

            if (Properties.Settings.Default.SelectedTables.Length > 0)
            {
                string[] tables = Properties.Settings.Default.SelectedTables.Split(',');
                foreach (string table in tables)
                {
                    for (int t = 0; t < Tables.Items.Count - 1; t++)
                    {
                        if ((string)Tables.Items[t] == table)
                            Tables.SetSelected(t, true);
                    }
                }
            }

            if (Properties.Settings.Default.MainPath.Length > 0)
                EditFilesPath.Text = Properties.Settings.Default.MainPath;

            if (Properties.Settings.Default.DetailsPath.Length > 0)
                Edit2FilesPath.Text = Properties.Settings.Default.DetailsPath;

            if (Properties.Settings.Default.GenPath.Length > 0)
                GenFilesPath.Text = Properties.Settings.Default.GenPath;
        }

        private void LoadDatabases()
        {
            _csSettings = ConfigurationManager.ConnectionStrings;
            foreach (ConnectionStringSettings csSetting in _csSettings)
            {
                Database.Items.Add(csSetting.Name);
            }
            Database.SelectedIndex = 0;
        }

        private void Database_SelectedIndexChanged(object sender, EventArgs e)
        {
            RootNamespace.Text = "Textfyre." + Database.Text;
            Tables.Items.Clear();

            SqlCommand command = new SqlCommand(String.Concat("SELECT TABLE_NAME FROM ", Database.Text, ".INFORMATION_SCHEMA.TABLES"), new SqlConnection(_csSettings[Database.Text].ConnectionString));
            command.Connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string tableName = (string)reader["TABLE_NAME"];
                if (!tableName.StartsWith("sys"))
                    Tables.Items.Add((string)reader["TABLE_NAME"]);
            }
            reader.Close();
            command.Connection.Close();
            command.Dispose();

            Tables.SelectedItems.Clear();
        }

        #region Generate Button Handler
        private void button1_Click(object sender, EventArgs e)
        {            
            //File paths must be specified or nothing can be generated
            if (String.IsNullOrEmpty(GenFilesPath.Text) ||
                String.IsNullOrEmpty(EditFilesPath.Text) ||
                String.IsNullOrEmpty(Edit2FilesPath.Text))
                return;            

            //Only check for a table if the user did not specify an xml file for stored procedure(s)
            List<string> tableList = null;
            if (String.IsNullOrEmpty(txtSPXMLPath.Text)) {
                tableList = new List<string>();
                string tableListSetting = String.Empty;

                for (int i = 0; i < Tables.SelectedItems.Count; i++) {
                    tableList.Add((string)Tables.SelectedItems[i]);
                    tableListSetting = String.Concat(tableListSetting, Tables.SelectedItems[i], ",");
                }
                tableListSetting = General.TrimEnd(tableListSetting, 1);

                Properties.Settings.Default.SelectedTables = tableListSetting;
            }

            ValidateDirectories();
            SaveProperties();

            //Generate classes            
            FrameworkDriver driver = new FrameworkDriver();
            if (String.IsNullOrEmpty(txtSPXMLPath.Text)) {
                driver.GenerateClasses(RootNamespace.Text,
                                       EditFilesPath.Text,
                                       Edit2FilesPath.Text,
                                       GenFilesPath.Text,
                                       tableList,
                                       Database.Text,
                                       _csSettings[Database.Text].ConnectionString,
                                       Overwrite.Checked);
            } else {
                driver.GenerateClasses(RootNamespace.Text,
                                       EditFilesPath.Text,
                                       Edit2FilesPath.Text,
                                       GenFilesPath.Text,
                                       Overwrite.Checked,
                                       txtSPXMLPath.Text);
            }

            MessageBox.Show("Completed.");
        }

        private void ValidateDirectories() {
            if (!Directory.Exists(GenFilesPath.Text))
                Directory.CreateDirectory(GenFilesPath.Text);

            if (!Directory.Exists(EditFilesPath.Text))
                Directory.CreateDirectory(EditFilesPath.Text);

            if (!Directory.Exists(Edit2FilesPath.Text))
                Directory.CreateDirectory(Edit2FilesPath.Text);
        }

        private void SaveProperties() {
            Properties.Settings.Default.MainPath = EditFilesPath.Text;
            Properties.Settings.Default.GenPath = GenFilesPath.Text;
            Properties.Settings.Default.DetailsPath = Edit2FilesPath.Text;
            Properties.Settings.Default.Database = Database.Text;
            Properties.Settings.Default.Overwrite = Overwrite.Checked;
            Properties.Settings.Default.RootNamespace = RootNamespace.Text;
            Properties.Settings.Default.Save();
        }
        #endregion

        #region Event Handlers
        private void button2_Click(object sender, EventArgs e) {
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK) {
                GenFilesPath.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                EditFilesPath.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                Edit2FilesPath.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        //Entry point for code generation pertaining to stored procedures
        private void btnSPXML_Click(object sender, EventArgs e) {
            using (OpenFileDialog ofd = new OpenFileDialog()) {
                ofd.Filter = "Config|*.config|XML|*.xml|All Files|*.*";
                DialogResult dr = ofd.ShowDialog();

                if (dr == DialogResult.OK) {
                    txtSPXMLPath.Text = ofd.FileName;
                }
            }
        }
        #endregion

    }
}
