namespace Textfyre.Common.Codegen.Windows
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Tables = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.Database = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.RootNamespace = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.label4 = new System.Windows.Forms.Label();
            this.GenFilesPath = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.Overwrite = new System.Windows.Forms.CheckBox();
            this.button3 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.EditFilesPath = new System.Windows.Forms.TextBox();
            this.button4 = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.Edit2FilesPath = new System.Windows.Forms.TextBox();
            this.btnSPXML = new System.Windows.Forms.Button();
            this.txtSPXMLPath = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // Tables
            // 
            this.Tables.FormattingEnabled = true;
            this.Tables.Location = new System.Drawing.Point(12, 74);
            this.Tables.Name = "Tables";
            this.Tables.SelectionMode = System.Windows.Forms.SelectionMode.MultiSimple;
            this.Tables.Size = new System.Drawing.Size(176, 212);
            this.Tables.Sorted = true;
            this.Tables.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Select table(s)";
            // 
            // Database
            // 
            this.Database.FormattingEnabled = true;
            this.Database.Location = new System.Drawing.Point(15, 32);
            this.Database.Name = "Database";
            this.Database.Size = new System.Drawing.Size(173, 21);
            this.Database.TabIndex = 2;
            this.Database.SelectedIndexChanged += new System.EventHandler(this.Database_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 16);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Select Database";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(221, 263);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(506, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "Generate";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // RootNamespace
            // 
            this.RootNamespace.Location = new System.Drawing.Point(221, 33);
            this.RootNamespace.Name = "RootNamespace";
            this.RootNamespace.Size = new System.Drawing.Size(173, 20);
            this.RootNamespace.TabIndex = 5;
            this.RootNamespace.Text = "OD";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(218, 17);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(90, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Root Namespace";
            // 
            // textBox2
            // 
            this.textBox2.BackColor = System.Drawing.SystemColors.Control;
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Location = new System.Drawing.Point(221, 59);
            this.textBox2.Multiline = true;
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(173, 30);
            this.textBox2.TabIndex = 7;
            this.textBox2.Text = "This should be Textfyre without the quotes.";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(218, 221);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(198, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Save Non-Editable Generated Files Path";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // GenFilesPath
            // 
            this.GenFilesPath.Location = new System.Drawing.Point(221, 237);
            this.GenFilesPath.Name = "GenFilesPath";
            this.GenFilesPath.Size = new System.Drawing.Size(473, 20);
            this.GenFilesPath.TabIndex = 8;
            this.GenFilesPath.Text = "C:\\Projects\\Nextgen\\OD\\Textfyre.AuctionCenter\\Textfyre.AuctionCenter\\Textfyre.Auc" +
                "tionCenter.Model\\Generated";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(700, 237);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(26, 19);
            this.button2.TabIndex = 10;
            this.button2.Text = "...";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Overwrite
            // 
            this.Overwrite.AutoSize = true;
            this.Overwrite.Location = new System.Drawing.Point(420, 36);
            this.Overwrite.Name = "Overwrite";
            this.Overwrite.Size = new System.Drawing.Size(173, 17);
            this.Overwrite.TabIndex = 11;
            this.Overwrite.Text = "Overwrite descending classes?";
            this.Overwrite.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(700, 159);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(26, 19);
            this.button3.TabIndex = 14;
            this.button3.Text = "...";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(218, 143);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(175, 13);
            this.label5.TabIndex = 13;
            this.label5.Text = "Save Editable Generated Files Path";
            // 
            // EditFilesPath
            // 
            this.EditFilesPath.Location = new System.Drawing.Point(221, 159);
            this.EditFilesPath.Name = "EditFilesPath";
            this.EditFilesPath.Size = new System.Drawing.Size(473, 20);
            this.EditFilesPath.TabIndex = 12;
            this.EditFilesPath.Text = "C:\\Projects\\Nextgen\\OD\\Textfyre.AuctionCenter\\Textfyre.AuctionCenter\\Textfyre.Auc" +
                "tionCenter.Model";
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(700, 198);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(26, 19);
            this.button4.TabIndex = 17;
            this.button4.Text = "...";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(218, 182);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(225, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Save Editable, less-used Generated Files Path";
            // 
            // Edit2FilesPath
            // 
            this.Edit2FilesPath.Location = new System.Drawing.Point(221, 198);
            this.Edit2FilesPath.Name = "Edit2FilesPath";
            this.Edit2FilesPath.Size = new System.Drawing.Size(473, 20);
            this.Edit2FilesPath.TabIndex = 15;
            this.Edit2FilesPath.Text = "C:\\Projects\\Nextgen\\OD\\Textfyre.AuctionCenter\\Textfyre.AuctionCenter\\Textfyre.Auc" +
                "tionCenter.Model\\Subclasses";
            // 
            // btnSPXML
            // 
            this.btnSPXML.Location = new System.Drawing.Point(617, 105);
            this.btnSPXML.Name = "btnSPXML";
            this.btnSPXML.Size = new System.Drawing.Size(109, 23);
            this.btnSPXML.TabIndex = 19;
            this.btnSPXML.Text = "Find SP XML File";
            this.btnSPXML.UseVisualStyleBackColor = true;
            this.btnSPXML.Click += new System.EventHandler(this.btnSPXML_Click);
            // 
            // txtSPXMLPath
            // 
            this.txtSPXMLPath.Location = new System.Drawing.Point(221, 108);
            this.txtSPXMLPath.Name = "txtSPXMLPath";
            this.txtSPXMLPath.Size = new System.Drawing.Size(390, 20);
            this.txtSPXMLPath.TabIndex = 20;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(741, 294);
            this.Controls.Add(this.txtSPXMLPath);
            this.Controls.Add(this.btnSPXML);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.Edit2FilesPath);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.EditFilesPath);
            this.Controls.Add(this.Overwrite);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.GenFilesPath);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.RootNamespace);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Database);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Tables);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "OneDegree Code Generation";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox Tables;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox Database;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox RootNamespace;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox GenFilesPath;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.CheckBox Overwrite;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox EditFilesPath;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox Edit2FilesPath;
        private System.Windows.Forms.Button btnSPXML;
        private System.Windows.Forms.TextBox txtSPXMLPath;
    }
}

