using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FyreWinClient {
    public partial class HintForm : Form {
        public HintForm() {
            InitializeComponent();
        }

        private void HintForm_Load(object sender, EventArgs e) {
            string path = String.Concat(Application.StartupPath, @"\Shadow in the Cathedral Hints.html");
            webBrowser1.Navigate(path);
        }
    }
}
