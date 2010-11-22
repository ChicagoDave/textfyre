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
    public partial class ProjectListForm : Form
    {
        public string SelectedFolder { get; set; }
        public string SelectedSource { get; set; }

        string informFolder;

        public ProjectListForm()
        {
            InitializeComponent();
        }

        private void ProjectListForm_Load(object sender, EventArgs e)
        {
            informFolder = string.Concat(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments),"\\Inform\\Projects");
            DirectoryInfo dir = new DirectoryInfo(informFolder);

            foreach (DirectoryInfo dirInfo in dir.GetDirectories())
            {
                if (dirInfo.Name.EndsWith(".inform"))
                    ProjectListbox.Items.Add(dirInfo.Name);
            }

        }

        private void OKButton_Click(object sender, EventArgs e)
        {
            SetProperties();
            this.Close();
        }

        private void ProjectListbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetProperties();
        }

        private void ProjectListbox_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            this.Close();
        }

        private void SetProperties()
        {
            this.SelectedFolder = ProjectListbox.SelectedItem.ToString();
            this.SelectedSource = string.Concat(informFolder, "\\", this.SelectedFolder, "\\Source\\story.ni");
        }
    }
}
