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
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Game Font";
            // 
            // CurrentFontTextBox
            // 
            this.CurrentFontTextBox.Location = new System.Drawing.Point(15, 25);
            this.CurrentFontTextBox.Name = "CurrentFontTextBox";
            this.CurrentFontTextBox.ReadOnly = true;
            this.CurrentFontTextBox.Size = new System.Drawing.Size(280, 20);
            this.CurrentFontTextBox.TabIndex = 1;
            // 
            // ChangeFontButton
            // 
            this.ChangeFontButton.Location = new System.Drawing.Point(298, 24);
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
            this.PreferenceOKButton.Location = new System.Drawing.Point(210, 275);
            this.PreferenceOKButton.Name = "PreferenceOKButton";
            this.PreferenceOKButton.Size = new System.Drawing.Size(75, 23);
            this.PreferenceOKButton.TabIndex = 3;
            this.PreferenceOKButton.Text = "&OK";
            this.PreferenceOKButton.UseVisualStyleBackColor = true;
            // 
            // PreferencesCancelButton
            // 
            this.PreferencesCancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.PreferencesCancelButton.Location = new System.Drawing.Point(291, 275);
            this.PreferencesCancelButton.Name = "PreferencesCancelButton";
            this.PreferencesCancelButton.Size = new System.Drawing.Size(75, 23);
            this.PreferencesCancelButton.TabIndex = 4;
            this.PreferencesCancelButton.Text = "&Cancel";
            this.PreferencesCancelButton.UseVisualStyleBackColor = true;
            // 
            // HFButton
            // 
            this.HFButton.Location = new System.Drawing.Point(298, 63);
            this.HFButton.Name = "HFButton";
            this.HFButton.Size = new System.Drawing.Size(25, 20);
            this.HFButton.TabIndex = 7;
            this.HFButton.Text = "...";
            this.HFButton.UseVisualStyleBackColor = true;
            this.HFButton.Click += new System.EventHandler(this.HFButton_Click);
            // 
            // HFFont
            // 
            this.HFFont.Location = new System.Drawing.Point(15, 64);
            this.HFFont.Name = "HFFont";
            this.HFFont.ReadOnly = true;
            this.HFFont.Size = new System.Drawing.Size(280, 20);
            this.HFFont.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(101, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Header/Footer Font";
            // 
            // Preferences
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(370, 310);
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
    }
}