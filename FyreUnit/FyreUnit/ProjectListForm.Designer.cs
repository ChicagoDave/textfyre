namespace FyreUnit
{
    partial class ProjectListForm
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
            this.ProjectListbox = new System.Windows.Forms.ListBox();
            this.OKButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ProjectListbox
            // 
            this.ProjectListbox.FormattingEnabled = true;
            this.ProjectListbox.Location = new System.Drawing.Point(13, 13);
            this.ProjectListbox.Name = "ProjectListbox";
            this.ProjectListbox.Size = new System.Drawing.Size(281, 316);
            this.ProjectListbox.TabIndex = 0;
            this.ProjectListbox.SelectedIndexChanged += new System.EventHandler(this.ProjectListbox_SelectedIndexChanged);
            this.ProjectListbox.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ProjectListbox_MouseDoubleClick);
            // 
            // OKButton
            // 
            this.OKButton.Location = new System.Drawing.Point(219, 336);
            this.OKButton.Name = "OKButton";
            this.OKButton.Size = new System.Drawing.Size(75, 23);
            this.OKButton.TabIndex = 1;
            this.OKButton.Text = "&OK";
            this.OKButton.UseVisualStyleBackColor = true;
            this.OKButton.Click += new System.EventHandler(this.OKButton_Click);
            // 
            // ProjectListForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(306, 375);
            this.Controls.Add(this.OKButton);
            this.Controls.Add(this.ProjectListbox);
            this.Name = "ProjectListForm";
            this.Text = "Select a Project";
            this.Load += new System.EventHandler(this.ProjectListForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox ProjectListbox;
        private System.Windows.Forms.Button OKButton;
    }
}