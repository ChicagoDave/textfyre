namespace FyreWinClient {
    partial class Preferences {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.fontDialog1 = new System.Windows.Forms.FontDialog();
            this.label1 = new System.Windows.Forms.Label();
            this.CurrentFontTextBox = new System.Windows.Forms.TextBox();
            this.ChangeFontButton = new System.Windows.Forms.Button();
            this.PreferenceOKButton = new System.Windows.Forms.Button();
            this.PreferencesCancelButton = new System.Windows.Forms.Button();
            this.HFButton = new System.Windows.Forms.Button();
            this.HFFont = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.ColorButton = new System.Windows.Forms.Button();
            this.BackgroundColorBox = new System.Windows.Forms.TextBox();
            this.TextColorButton = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.HeaderColorButton = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.HeaderBackgroundColorButton = new System.Windows.Forms.Button();
            this.HeaderColorBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 133);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Game Font";
            // 
            // CurrentFontTextBox
            // 
            this.CurrentFontTextBox.Location = new System.Drawing.Point(15, 149);
            this.CurrentFontTextBox.Name = "CurrentFontTextBox";
            this.CurrentFontTextBox.ReadOnly = true;
            this.CurrentFontTextBox.Size = new System.Drawing.Size(280, 20);
            this.CurrentFontTextBox.TabIndex = 1;
            // 
            // ChangeFontButton
            // 
            this.ChangeFontButton.Location = new System.Drawing.Point(298, 148);
            this.ChangeFontButton.Name = "ChangeFontButton";
            this.ChangeFontButton.Size = new System.Drawing.Size(25, 20);
            this.ChangeFontButton.TabIndex = 2;
            this.ChangeFontButton.Text = "...";
            this.ChangeFontButton.UseVisualStyleBackColor = true;
            this.ChangeFontButton.Click += new System.EventHandler(this.ChangeFontButton_Click);
            // 
            // PreferenceOKButton
            // 
            this.PreferenceOKButton.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.PreferenceOKButton.Location = new System.Drawing.Point(167, 275);
            this.PreferenceOKButton.Name = "PreferenceOKButton";
            this.PreferenceOKButton.Size = new System.Drawing.Size(75, 23);
            this.PreferenceOKButton.TabIndex = 3;
            this.PreferenceOKButton.Text = "&OK";
            this.PreferenceOKButton.UseVisualStyleBackColor = true;
            // 
            // PreferencesCancelButton
            // 
            this.PreferencesCancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.PreferencesCancelButton.Location = new System.Drawing.Point(248, 275);
            this.PreferencesCancelButton.Name = "PreferencesCancelButton";
            this.PreferencesCancelButton.Size = new System.Drawing.Size(75, 23);
            this.PreferencesCancelButton.TabIndex = 4;
            this.PreferencesCancelButton.Text = "&Cancel";
            this.PreferencesCancelButton.UseVisualStyleBackColor = true;
            this.PreferencesCancelButton.Click += new System.EventHandler(this.PreferencesCancelButton_Click);
            // 
            // HFButton
            // 
            this.HFButton.Location = new System.Drawing.Point(298, 21);
            this.HFButton.Name = "HFButton";
            this.HFButton.Size = new System.Drawing.Size(25, 20);
            this.HFButton.TabIndex = 7;
            this.HFButton.Text = "...";
            this.HFButton.UseVisualStyleBackColor = true;
            this.HFButton.Click += new System.EventHandler(this.HFButton_Click);
            // 
            // HFFont
            // 
            this.HFFont.Location = new System.Drawing.Point(15, 22);
            this.HFFont.Name = "HFFont";
            this.HFFont.ReadOnly = true;
            this.HFFont.Size = new System.Drawing.Size(280, 20);
            this.HFFont.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(101, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Header/Footer Font";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 200);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Background Color";
            // 
            // ColorButton
            // 
            this.ColorButton.Location = new System.Drawing.Point(110, 196);
            this.ColorButton.Name = "ColorButton";
            this.ColorButton.Size = new System.Drawing.Size(25, 20);
            this.ColorButton.TabIndex = 10;
            this.ColorButton.Text = "...";
            this.ColorButton.UseVisualStyleBackColor = true;
            this.ColorButton.Click += new System.EventHandler(this.ColorButton_Click);
            // 
            // BackgroundColorBox
            // 
            this.BackgroundColorBox.BackColor = System.Drawing.Color.White;
            this.BackgroundColorBox.ForeColor = System.Drawing.Color.Black;
            this.BackgroundColorBox.Location = new System.Drawing.Point(15, 174);
            this.BackgroundColorBox.Name = "BackgroundColorBox";
            this.BackgroundColorBox.ReadOnly = true;
            this.BackgroundColorBox.Size = new System.Drawing.Size(280, 20);
            this.BackgroundColorBox.TabIndex = 9;
            this.BackgroundColorBox.Text = "The lazy fox jumped over the brown grue.";
            // 
            // TextColorButton
            // 
            this.TextColorButton.Location = new System.Drawing.Point(110, 221);
            this.TextColorButton.Name = "TextColorButton";
            this.TextColorButton.Size = new System.Drawing.Size(25, 20);
            this.TextColorButton.TabIndex = 12;
            this.TextColorButton.Text = "...";
            this.TextColorButton.UseVisualStyleBackColor = true;
            this.TextColorButton.Click += new System.EventHandler(this.TextColorButton_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 225);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "Text Color";
            // 
            // HeaderColorButton
            // 
            this.HeaderColorButton.Location = new System.Drawing.Point(110, 94);
            this.HeaderColorButton.Name = "HeaderColorButton";
            this.HeaderColorButton.Size = new System.Drawing.Size(25, 20);
            this.HeaderColorButton.TabIndex = 17;
            this.HeaderColorButton.Text = "...";
            this.HeaderColorButton.UseVisualStyleBackColor = true;
            this.HeaderColorButton.Click += new System.EventHandler(this.HeaderColorButton_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 98);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(55, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Text Color";
            // 
            // HeaderBackgroundColorButton
            // 
            this.HeaderBackgroundColorButton.Location = new System.Drawing.Point(110, 69);
            this.HeaderBackgroundColorButton.Name = "HeaderBackgroundColorButton";
            this.HeaderBackgroundColorButton.Size = new System.Drawing.Size(25, 20);
            this.HeaderBackgroundColorButton.TabIndex = 15;
            this.HeaderBackgroundColorButton.Text = "...";
            this.HeaderBackgroundColorButton.UseVisualStyleBackColor = true;
            this.HeaderBackgroundColorButton.Click += new System.EventHandler(this.HeaderBackgroundColorButton_Click);
            // 
            // HeaderColorBox
            // 
            this.HeaderColorBox.BackColor = System.Drawing.Color.White;
            this.HeaderColorBox.ForeColor = System.Drawing.Color.Black;
            this.HeaderColorBox.Location = new System.Drawing.Point(15, 47);
            this.HeaderColorBox.Name = "HeaderColorBox";
            this.HeaderColorBox.ReadOnly = true;
            this.HeaderColorBox.Size = new System.Drawing.Size(280, 20);
            this.HeaderColorBox.TabIndex = 14;
            this.HeaderColorBox.Text = "The lazy fox jumped over the brown grue.";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 73);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(92, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Background Color";
            // 
            // Preferences
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(337, 310);
            this.Controls.Add(this.HeaderColorButton);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.HeaderBackgroundColorButton);
            this.Controls.Add(this.HeaderColorBox);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.TextColorButton);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.ColorButton);
            this.Controls.Add(this.BackgroundColorBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.HFButton);
            this.Controls.Add(this.HFFont);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.PreferencesCancelButton);
            this.Controls.Add(this.PreferenceOKButton);
            this.Controls.Add(this.ChangeFontButton);
            this.Controls.Add(this.CurrentFontTextBox);
            this.Controls.Add(this.label1);
            this.Name = "Preferences";
            this.Text = "Preferences";
            this.Load += new System.EventHandler(this.Preferences_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FontDialog fontDialog1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox CurrentFontTextBox;
        private System.Windows.Forms.Button ChangeFontButton;
        private System.Windows.Forms.Button PreferenceOKButton;
        private System.Windows.Forms.Button PreferencesCancelButton;
        private System.Windows.Forms.Button HFButton;
        private System.Windows.Forms.TextBox HFFont;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ColorDialog colorDialog1;
        private System.Windows.Forms.Button ColorButton;
        private System.Windows.Forms.TextBox BackgroundColorBox;
        private System.Windows.Forms.Button TextColorButton;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button HeaderColorButton;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button HeaderBackgroundColorButton;
        private System.Windows.Forms.TextBox HeaderColorBox;
        private System.Windows.Forms.Label label6;
    }
}