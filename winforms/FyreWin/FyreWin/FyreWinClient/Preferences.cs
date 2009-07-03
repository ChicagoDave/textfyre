using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FyreWinClient {
    public partial class Preferences : Form {
        public Preferences() {
            InitializeComponent();
        }

        private void Preferences_Load(object sender, EventArgs e) {
            CurrentFontTextBox.Text = FyreWinClient.Properties.Settings.Default.GameFont.FontFamily.Name + " " + FyreWinClient.Properties.Settings.Default.GameFont.Size.ToString();
            HFFont.Text = FyreWinClient.Properties.Settings.Default.HeaderFooterFont.FontFamily.Name + " " + FyreWinClient.Properties.Settings.Default.HeaderFooterFont.Size.ToString();
        }

        private void ChangeFontButton_Click(object sender, EventArgs e) {
            fontDialog1.ShowApply = false;
            fontDialog1.ShowColor = true;
            fontDialog1.ShowEffects = false;
            fontDialog1.Font = FyreWinClient.Properties.Settings.Default.GameFont;
            DialogResult result = fontDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                FyreWinClient.Properties.Settings.Default.GameFont = fontDialog1.Font;
            }
        }

        private void HFButton_Click(object sender, EventArgs e) {
            fontDialog1.ShowApply = false;
            fontDialog1.ShowColor = true;
            fontDialog1.ShowEffects = false;
            fontDialog1.Font = FyreWinClient.Properties.Settings.Default.HeaderFooterFont;
            DialogResult result = fontDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                FyreWinClient.Properties.Settings.Default.HeaderFooterFont = fontDialog1.Font;
            }
        }

        private void PreferencesCancelButton_Click(object sender, EventArgs e) {
            this.Close();
        }

        private void ColorButton_Click(object sender, EventArgs e) {
            DialogResult result = colorDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                BackgroundColorBox.BackColor = colorDialog1.Color;
                FyreWinClient.Properties.Settings.Default.WindowBackColor = colorDialog1.Color;
            }
        }


    }
}
