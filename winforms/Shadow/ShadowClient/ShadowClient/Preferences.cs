﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Textfyre {
    public partial class Preferences : Form {
        public Preferences() {
            InitializeComponent();
        }

        private void Preferences_Load(object sender, EventArgs e) {
            CurrentFontTextBox.Text = Textfyre.Properties.Settings.Default.GameFont.FontFamily.Name + " " + Textfyre.Properties.Settings.Default.GameFont.Size.ToString();
            HFFont.Text = Textfyre.Properties.Settings.Default.HeaderFooterFont.FontFamily.Name + " " + Textfyre.Properties.Settings.Default.HeaderFooterFont.Size.ToString();
            BackgroundColorBox.BackColor = Textfyre.Properties.Settings.Default.MainBackColor;
            BackgroundColorBox.ForeColor = Textfyre.Properties.Settings.Default.MainForeColor;
            HeaderColorBox.BackColor = Textfyre.Properties.Settings.Default.HeaderBackColor;
            HeaderColorBox.ForeColor = Textfyre.Properties.Settings.Default.HeaderForeColor;
        }

        private void ChangeFontButton_Click(object sender, EventArgs e) {
            fontDialog1.ShowApply = false;
            fontDialog1.ShowColor = true;
            fontDialog1.ShowEffects = false;
            fontDialog1.Font = Textfyre.Properties.Settings.Default.GameFont;
            DialogResult result = fontDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                Textfyre.Properties.Settings.Default.GameFont = fontDialog1.Font;
                CurrentFontTextBox.Text = Textfyre.Properties.Settings.Default.GameFont.FontFamily.Name + " " + Textfyre.Properties.Settings.Default.GameFont.Size.ToString();
            }
        }

        private void HFButton_Click(object sender, EventArgs e) {
            fontDialog1.ShowApply = false;
            fontDialog1.ShowColor = true;
            fontDialog1.ShowEffects = false;
            fontDialog1.Font = Textfyre.Properties.Settings.Default.HeaderFooterFont;
            DialogResult result = DialogResult.Cancel;
            try {
                result = fontDialog1.ShowDialog();
            } catch {
                MessageBox.Show("You can only select TrueType fonts. Unfortunately we couldn't figure out how to block the non-TrueType fonts from the list. Cheers!");
            }

            if (result == DialogResult.OK) {
                    Textfyre.Properties.Settings.Default.HeaderFooterFont = fontDialog1.Font;
                    HFFont.Text = Textfyre.Properties.Settings.Default.HeaderFooterFont.FontFamily.Name + " " + Textfyre.Properties.Settings.Default.HeaderFooterFont.Size.ToString();
            }
        }

        private void PreferencesCancelButton_Click(object sender, EventArgs e) {
            this.Close();
        }

        private void ColorButton_Click(object sender, EventArgs e) {
            DialogResult result = colorDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                BackgroundColorBox.BackColor = colorDialog1.Color;
                Textfyre.Properties.Settings.Default.MainBackColor = colorDialog1.Color;
            }
        }

        private void TextColorButton_Click(object sender, EventArgs e) {
            DialogResult result = colorDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                BackgroundColorBox.ForeColor = colorDialog1.Color;
                Textfyre.Properties.Settings.Default.MainForeColor = colorDialog1.Color;
            }
        }

        private void HeaderBackgroundColorButton_Click(object sender, EventArgs e) {
            DialogResult result = colorDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                HeaderColorBox.BackColor = colorDialog1.Color;
                Textfyre.Properties.Settings.Default.HeaderBackColor = colorDialog1.Color;
            }
        }

        private void HeaderColorButton_Click(object sender, EventArgs e) {
            DialogResult result = colorDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                HeaderColorBox.ForeColor = colorDialog1.Color;
                Textfyre.Properties.Settings.Default.HeaderForeColor = colorDialog1.Color;
            }
        }


    }
}
