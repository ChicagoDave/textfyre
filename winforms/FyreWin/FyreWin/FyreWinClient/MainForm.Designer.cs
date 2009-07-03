namespace FyreWinClient {
    partial class MainForm {
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
            this.TextWindow = new System.Windows.Forms.RichTextBox();
            this.InputText = new System.Windows.Forms.TextBox();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.UpperLeft = new System.Windows.Forms.Label();
            this.UpperRight = new System.Windows.Forms.Label();
            this.LowerLeft = new System.Windows.Forms.Label();
            this.LowerRight = new System.Windows.Forms.Label();
            this.PageArt = new System.Windows.Forms.PictureBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuPreferences = new System.Windows.Forms.ToolStripMenuItem();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.PageArt)).BeginInit();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // TextWindow
            // 
            this.TextWindow.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TextWindow.Location = new System.Drawing.Point(3, 23);
            this.TextWindow.Name = "TextWindow";
            this.TextWindow.ReadOnly = true;
            this.TextWindow.Size = new System.Drawing.Size(494, 412);
            this.TextWindow.TabIndex = 1;
            this.TextWindow.Text = "";
            // 
            // InputText
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.InputText, 2);
            this.InputText.Dock = System.Windows.Forms.DockStyle.Fill;
            this.InputText.Location = new System.Drawing.Point(3, 461);
            this.InputText.Name = "InputText";
            this.InputText.Size = new System.Drawing.Size(995, 20);
            this.InputText.TabIndex = 0;
            this.InputText.KeyDown += new System.Windows.Forms.KeyEventHandler(this.InputText_KeyDown);
            this.InputText.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.InputText_KeyPress);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.InputText, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.TextWindow, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.UpperLeft, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.UpperRight, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.LowerLeft, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.LowerRight, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.PageArt, 1, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 24);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 24F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1001, 482);
            this.tableLayoutPanel1.TabIndex = 1;
            // 
            // UpperLeft
            // 
            this.UpperLeft.AutoSize = true;
            this.UpperLeft.Dock = System.Windows.Forms.DockStyle.Fill;
            this.UpperLeft.Location = new System.Drawing.Point(3, 0);
            this.UpperLeft.Name = "UpperLeft";
            this.UpperLeft.Size = new System.Drawing.Size(494, 20);
            this.UpperLeft.TabIndex = 2;
            this.UpperLeft.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // UpperRight
            // 
            this.UpperRight.AutoSize = true;
            this.UpperRight.Dock = System.Windows.Forms.DockStyle.Fill;
            this.UpperRight.Location = new System.Drawing.Point(503, 0);
            this.UpperRight.Name = "UpperRight";
            this.UpperRight.Size = new System.Drawing.Size(495, 20);
            this.UpperRight.TabIndex = 3;
            this.UpperRight.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // LowerLeft
            // 
            this.LowerLeft.AutoSize = true;
            this.LowerLeft.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LowerLeft.Location = new System.Drawing.Point(3, 438);
            this.LowerLeft.Name = "LowerLeft";
            this.LowerLeft.Size = new System.Drawing.Size(494, 20);
            this.LowerLeft.TabIndex = 4;
            this.LowerLeft.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // LowerRight
            // 
            this.LowerRight.AutoSize = true;
            this.LowerRight.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LowerRight.Location = new System.Drawing.Point(503, 438);
            this.LowerRight.Name = "LowerRight";
            this.LowerRight.Size = new System.Drawing.Size(495, 20);
            this.LowerRight.TabIndex = 5;
            this.LowerRight.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // PageArt
            // 
            this.PageArt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PageArt.Location = new System.Drawing.Point(503, 23);
            this.PageArt.Name = "PageArt";
            this.PageArt.Size = new System.Drawing.Size(495, 412);
            this.PageArt.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.PageArt.TabIndex = 6;
            this.PageArt.TabStop = false;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.editToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1001, 24);
            this.menuStrip1.TabIndex = 2;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.exitToolStripMenuItem.Text = "E&xit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.MenuExit_Click);
            // 
            // editToolStripMenuItem
            // 
            this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuPreferences});
            this.editToolStripMenuItem.Name = "editToolStripMenuItem";
            this.editToolStripMenuItem.Size = new System.Drawing.Size(39, 20);
            this.editToolStripMenuItem.Text = "&Edit";
            // 
            // MenuPreferences
            // 
            this.MenuPreferences.Name = "MenuPreferences";
            this.MenuPreferences.Size = new System.Drawing.Size(152, 22);
            this.MenuPreferences.Text = "&Preferences";
            this.MenuPreferences.Click += new System.EventHandler(this.MenuPreferences_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1001, 506);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "MainForm";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.PageArt)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox TextWindow;
        private System.Windows.Forms.TextBox InputText;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label UpperLeft;
        private System.Windows.Forms.Label UpperRight;
        private System.Windows.Forms.Label LowerLeft;
        private System.Windows.Forms.Label LowerRight;
        private System.Windows.Forms.PictureBox PageArt;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem MenuPreferences;
    }
}