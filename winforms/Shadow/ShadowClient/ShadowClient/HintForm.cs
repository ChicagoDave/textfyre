using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;

namespace Textfyre {
    public partial class HintForm : Form {

        public string HintXML;

        public HintForm() {
            InitializeComponent();
        }

        private void HintForm_Load(object sender, EventArgs e) {
            string html = Utility.GetHtmlHints(HintXML);

            string template = Properties.Resource.hintTemplate;
            html = template.Replace("#content#", html);

            TextWriter tw = File.CreateText(string.Concat(Application.StartupPath, @"\ShadowHints.html"));
            tw.Write(html);
            tw.Close();

            string path = String.Concat(Application.StartupPath, @"\ShadowHints.html");
            webBrowser1.Navigate(path);
        }
    }
}
