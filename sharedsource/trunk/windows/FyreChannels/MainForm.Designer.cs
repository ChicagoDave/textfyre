namespace SimpleFyre
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
            this.components = new System.ComponentModel.Container();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openGameToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutSimpleFyreToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtTime = new System.Windows.Forms.TextBox();
            this.txtScore = new System.Windows.Forms.TextBox();
            this.txtOutput = new System.Windows.Forms.TextBox();
            this.inputPanel = new System.Windows.Forms.Panel();
            this.lblPrompt = new System.Windows.Forms.Label();
            this.txtInput = new System.Windows.Forms.TextBox();
            this.txtLocation = new System.Windows.Forms.TextBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.MainChannelButton = new System.Windows.Forms.Button();
            this.LocationChannelButton = new System.Windows.Forms.Button();
            this.ScoreChannelButton = new System.Windows.Forms.Button();
            this.TimeChannelButton = new System.Windows.Forms.Button();
            this.HintsChannelButton = new System.Windows.Forms.Button();
            this.HelpChannelButton = new System.Windows.Forms.Button();
            this.MapChannelButton = new System.Windows.Forms.Button();
            this.ProgressChannelButton = new System.Windows.Forms.Button();
            this.ThemeChannelButton = new System.Windows.Forms.Button();
            this.PromptChannelButton = new System.Windows.Forms.Button();
            this.ConversationChannelButton = new System.Windows.Forms.Button();
            this.SoundChannelButton = new System.Windows.Forms.Button();
            this.PrologueChannelButton = new System.Windows.Forms.Button();
            this.TitleChannelButton = new System.Windows.Forms.Button();
            this.CreditsChannelButton = new System.Windows.Forms.Button();
            this.ChapterChannelButton = new System.Windows.Forms.Button();
            this.DeathChannelButton = new System.Windows.Forms.Button();
            this.menuStrip1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.inputPanel.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1043, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openGameToolStripMenuItem,
            this.toolStripMenuItem1,
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(35, 20);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // openGameToolStripMenuItem
            // 
            this.openGameToolStripMenuItem.Name = "openGameToolStripMenuItem";
            this.openGameToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.openGameToolStripMenuItem.Text = "&Open Game...";
            this.openGameToolStripMenuItem.Click += new System.EventHandler(this.openGameToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(150, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.exitToolStripMenuItem.Text = "E&xit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutSimpleFyreToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.helpToolStripMenuItem.Text = "&Help";
            // 
            // aboutSimpleFyreToolStripMenuItem
            // 
            this.aboutSimpleFyreToolStripMenuItem.Name = "aboutSimpleFyreToolStripMenuItem";
            this.aboutSimpleFyreToolStripMenuItem.Size = new System.Drawing.Size(181, 22);
            this.aboutSimpleFyreToolStripMenuItem.Text = "&About SimpleFyre...";
            this.aboutSimpleFyreToolStripMenuItem.Click += new System.EventHandler(this.aboutSimpleFyreToolStripMenuItem_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 55F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 56F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Controls.Add(this.txtTime, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtScore, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtOutput, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.inputPanel, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtLocation, 0, 0);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(162, 24);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(155, 3, 3, 3);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 29F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(881, 500);
            this.tableLayoutPanel1.TabIndex = 1;
            // 
            // txtTime
            // 
            this.txtTime.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTime.Enabled = false;
            this.txtTime.Location = new System.Drawing.Point(774, 3);
            this.txtTime.Name = "txtTime";
            this.txtTime.ReadOnly = true;
            this.txtTime.Size = new System.Drawing.Size(48, 20);
            this.txtTime.TabIndex = 3;
            this.toolTip1.SetToolTip(this.txtTime, "Time");
            // 
            // txtScore
            // 
            this.txtScore.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.txtScore.Enabled = false;
            this.txtScore.Location = new System.Drawing.Point(830, 3);
            this.txtScore.Name = "txtScore";
            this.txtScore.ReadOnly = true;
            this.txtScore.Size = new System.Drawing.Size(48, 20);
            this.txtScore.TabIndex = 4;
            this.toolTip1.SetToolTip(this.txtScore, "Score");
            // 
            // txtOutput
            // 
            this.txtOutput.BackColor = System.Drawing.SystemColors.Window;
            this.tableLayoutPanel1.SetColumnSpan(this.txtOutput, 3);
            this.txtOutput.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtOutput.Location = new System.Drawing.Point(3, 28);
            this.txtOutput.Multiline = true;
            this.txtOutput.Name = "txtOutput";
            this.txtOutput.ReadOnly = true;
            this.txtOutput.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtOutput.Size = new System.Drawing.Size(875, 440);
            this.txtOutput.TabIndex = 1;
            // 
            // inputPanel
            // 
            this.inputPanel.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel1.SetColumnSpan(this.inputPanel, 3);
            this.inputPanel.Controls.Add(this.lblPrompt);
            this.inputPanel.Controls.Add(this.txtInput);
            this.inputPanel.Location = new System.Drawing.Point(3, 474);
            this.inputPanel.Name = "inputPanel";
            this.inputPanel.Size = new System.Drawing.Size(875, 23);
            this.inputPanel.TabIndex = 5;
            this.inputPanel.Resize += new System.EventHandler(this.ArrangeInput);
            // 
            // lblPrompt
            // 
            this.lblPrompt.AutoSize = true;
            this.lblPrompt.Location = new System.Drawing.Point(3, 4);
            this.lblPrompt.Name = "lblPrompt";
            this.lblPrompt.Size = new System.Drawing.Size(39, 13);
            this.lblPrompt.TabIndex = 2;
            this.lblPrompt.Text = "prompt";
            this.lblPrompt.Resize += new System.EventHandler(this.ArrangeInput);
            // 
            // txtInput
            // 
            this.txtInput.Enabled = false;
            this.txtInput.Location = new System.Drawing.Point(80, 1);
            this.txtInput.Name = "txtInput";
            this.txtInput.Size = new System.Drawing.Size(527, 20);
            this.txtInput.TabIndex = 1;
            this.txtInput.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtInput_KeyDown);
            this.txtInput.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtInput_KeyPress);
            // 
            // txtLocation
            // 
            this.txtLocation.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtLocation.Enabled = false;
            this.txtLocation.Location = new System.Drawing.Point(3, 3);
            this.txtLocation.Name = "txtLocation";
            this.txtLocation.ReadOnly = true;
            this.txtLocation.Size = new System.Drawing.Size(764, 20);
            this.txtLocation.TabIndex = 2;
            this.toolTip1.SetToolTip(this.txtLocation, "Location");
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel2.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tableLayoutPanel2.ColumnCount = 1;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel2.Controls.Add(this.MainChannelButton, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.LocationChannelButton, 0, 1);
            this.tableLayoutPanel2.Controls.Add(this.ScoreChannelButton, 0, 2);
            this.tableLayoutPanel2.Controls.Add(this.TimeChannelButton, 0, 3);
            this.tableLayoutPanel2.Controls.Add(this.HintsChannelButton, 0, 4);
            this.tableLayoutPanel2.Controls.Add(this.HelpChannelButton, 0, 5);
            this.tableLayoutPanel2.Controls.Add(this.MapChannelButton, 0, 6);
            this.tableLayoutPanel2.Controls.Add(this.ProgressChannelButton, 0, 7);
            this.tableLayoutPanel2.Controls.Add(this.ThemeChannelButton, 0, 8);
            this.tableLayoutPanel2.Controls.Add(this.PromptChannelButton, 0, 9);
            this.tableLayoutPanel2.Controls.Add(this.ConversationChannelButton, 0, 10);
            this.tableLayoutPanel2.Controls.Add(this.SoundChannelButton, 0, 11);
            this.tableLayoutPanel2.Controls.Add(this.PrologueChannelButton, 0, 12);
            this.tableLayoutPanel2.Controls.Add(this.TitleChannelButton, 0, 13);
            this.tableLayoutPanel2.Controls.Add(this.CreditsChannelButton, 0, 14);
            this.tableLayoutPanel2.Controls.Add(this.ChapterChannelButton, 0, 15);
            this.tableLayoutPanel2.Controls.Add(this.DeathChannelButton, 0, 16);
            this.tableLayoutPanel2.GrowStyle = System.Windows.Forms.TableLayoutPanelGrowStyle.FixedSize;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(12, 50);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 17;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(144, 440);
            this.tableLayoutPanel2.TabIndex = 7;
            // 
            // MainChannelButton
            // 
            this.MainChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.MainChannelButton.Enabled = false;
            this.MainChannelButton.Location = new System.Drawing.Point(3, 3);
            this.MainChannelButton.Name = "MainChannelButton";
            this.MainChannelButton.Size = new System.Drawing.Size(138, 20);
            this.MainChannelButton.TabIndex = 0;
            this.MainChannelButton.Text = "Main Channel";
            this.MainChannelButton.UseVisualStyleBackColor = true;
            this.MainChannelButton.Click += new System.EventHandler(this.MainChannelButton_Click);
            // 
            // LocationChannelButton
            // 
            this.LocationChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LocationChannelButton.Enabled = false;
            this.LocationChannelButton.Location = new System.Drawing.Point(3, 29);
            this.LocationChannelButton.Name = "LocationChannelButton";
            this.LocationChannelButton.Size = new System.Drawing.Size(138, 20);
            this.LocationChannelButton.TabIndex = 1;
            this.LocationChannelButton.Text = "Location Channel";
            this.LocationChannelButton.UseVisualStyleBackColor = true;
            this.LocationChannelButton.Click += new System.EventHandler(this.LocationChannelButton_Click);
            // 
            // ScoreChannelButton
            // 
            this.ScoreChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ScoreChannelButton.Enabled = false;
            this.ScoreChannelButton.Location = new System.Drawing.Point(3, 55);
            this.ScoreChannelButton.Name = "ScoreChannelButton";
            this.ScoreChannelButton.Size = new System.Drawing.Size(138, 20);
            this.ScoreChannelButton.TabIndex = 2;
            this.ScoreChannelButton.Text = "Score Channel";
            this.ScoreChannelButton.UseVisualStyleBackColor = true;
            this.ScoreChannelButton.Click += new System.EventHandler(this.ScoreChannelButton_Click);
            // 
            // TimeChannelButton
            // 
            this.TimeChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TimeChannelButton.Enabled = false;
            this.TimeChannelButton.Location = new System.Drawing.Point(3, 81);
            this.TimeChannelButton.Name = "TimeChannelButton";
            this.TimeChannelButton.Size = new System.Drawing.Size(138, 20);
            this.TimeChannelButton.TabIndex = 3;
            this.TimeChannelButton.Text = "Time Channel";
            this.TimeChannelButton.UseVisualStyleBackColor = true;
            this.TimeChannelButton.Click += new System.EventHandler(this.TimeChannelButton_Click);
            // 
            // HintsChannelButton
            // 
            this.HintsChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.HintsChannelButton.Enabled = false;
            this.HintsChannelButton.Location = new System.Drawing.Point(3, 107);
            this.HintsChannelButton.Name = "HintsChannelButton";
            this.HintsChannelButton.Size = new System.Drawing.Size(138, 20);
            this.HintsChannelButton.TabIndex = 4;
            this.HintsChannelButton.Text = "Hints Channel";
            this.HintsChannelButton.UseVisualStyleBackColor = true;
            this.HintsChannelButton.Click += new System.EventHandler(this.HintsChannelButton_Click);
            // 
            // HelpChannelButton
            // 
            this.HelpChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.HelpChannelButton.Enabled = false;
            this.HelpChannelButton.Location = new System.Drawing.Point(3, 133);
            this.HelpChannelButton.Name = "HelpChannelButton";
            this.HelpChannelButton.Size = new System.Drawing.Size(138, 20);
            this.HelpChannelButton.TabIndex = 5;
            this.HelpChannelButton.Text = "Help Channel";
            this.HelpChannelButton.UseVisualStyleBackColor = true;
            this.HelpChannelButton.Click += new System.EventHandler(this.HelpChannelButton_Click);
            // 
            // MapChannelButton
            // 
            this.MapChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.MapChannelButton.Enabled = false;
            this.MapChannelButton.Location = new System.Drawing.Point(3, 159);
            this.MapChannelButton.Name = "MapChannelButton";
            this.MapChannelButton.Size = new System.Drawing.Size(138, 20);
            this.MapChannelButton.TabIndex = 6;
            this.MapChannelButton.Text = "Map Channel";
            this.MapChannelButton.UseVisualStyleBackColor = true;
            this.MapChannelButton.Click += new System.EventHandler(this.MapChannelButton_Click);
            // 
            // ProgressChannelButton
            // 
            this.ProgressChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ProgressChannelButton.Enabled = false;
            this.ProgressChannelButton.Location = new System.Drawing.Point(3, 185);
            this.ProgressChannelButton.Name = "ProgressChannelButton";
            this.ProgressChannelButton.Size = new System.Drawing.Size(138, 20);
            this.ProgressChannelButton.TabIndex = 7;
            this.ProgressChannelButton.Text = "Progress Channel";
            this.ProgressChannelButton.UseVisualStyleBackColor = true;
            this.ProgressChannelButton.Click += new System.EventHandler(this.ProgressChannelButton_Click);
            // 
            // ThemeChannelButton
            // 
            this.ThemeChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ThemeChannelButton.Enabled = false;
            this.ThemeChannelButton.Location = new System.Drawing.Point(3, 211);
            this.ThemeChannelButton.Name = "ThemeChannelButton";
            this.ThemeChannelButton.Size = new System.Drawing.Size(138, 20);
            this.ThemeChannelButton.TabIndex = 8;
            this.ThemeChannelButton.Text = "Theme Channel";
            this.ThemeChannelButton.UseVisualStyleBackColor = true;
            this.ThemeChannelButton.Click += new System.EventHandler(this.ThemeChannelButton_Click);
            // 
            // PromptChannelButton
            // 
            this.PromptChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PromptChannelButton.Enabled = false;
            this.PromptChannelButton.Location = new System.Drawing.Point(3, 237);
            this.PromptChannelButton.Name = "PromptChannelButton";
            this.PromptChannelButton.Size = new System.Drawing.Size(138, 20);
            this.PromptChannelButton.TabIndex = 9;
            this.PromptChannelButton.Text = "Prompt Channel";
            this.PromptChannelButton.UseVisualStyleBackColor = true;
            this.PromptChannelButton.Click += new System.EventHandler(this.PromptChannelButton_Click);
            // 
            // ConversationChannelButton
            // 
            this.ConversationChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ConversationChannelButton.Enabled = false;
            this.ConversationChannelButton.Location = new System.Drawing.Point(3, 263);
            this.ConversationChannelButton.Name = "ConversationChannelButton";
            this.ConversationChannelButton.Size = new System.Drawing.Size(138, 20);
            this.ConversationChannelButton.TabIndex = 10;
            this.ConversationChannelButton.Text = "Conversation Channel";
            this.ConversationChannelButton.UseVisualStyleBackColor = true;
            this.ConversationChannelButton.Click += new System.EventHandler(this.ConversationChannelButton_Click);
            // 
            // SoundChannelButton
            // 
            this.SoundChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.SoundChannelButton.Enabled = false;
            this.SoundChannelButton.Location = new System.Drawing.Point(3, 289);
            this.SoundChannelButton.Name = "SoundChannelButton";
            this.SoundChannelButton.Size = new System.Drawing.Size(138, 20);
            this.SoundChannelButton.TabIndex = 11;
            this.SoundChannelButton.Text = "Sound Channel";
            this.SoundChannelButton.UseVisualStyleBackColor = true;
            this.SoundChannelButton.Click += new System.EventHandler(this.SoundChannelButton_Click);
            // 
            // PrologueChannelButton
            // 
            this.PrologueChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PrologueChannelButton.Enabled = false;
            this.PrologueChannelButton.Location = new System.Drawing.Point(3, 315);
            this.PrologueChannelButton.Name = "PrologueChannelButton";
            this.PrologueChannelButton.Size = new System.Drawing.Size(138, 20);
            this.PrologueChannelButton.TabIndex = 12;
            this.PrologueChannelButton.Text = "Prologue Channel";
            this.PrologueChannelButton.UseVisualStyleBackColor = true;
            this.PrologueChannelButton.Click += new System.EventHandler(this.PrologueChannelButton_Click);
            // 
            // TitleChannelButton
            // 
            this.TitleChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TitleChannelButton.Enabled = false;
            this.TitleChannelButton.Location = new System.Drawing.Point(3, 341);
            this.TitleChannelButton.Name = "TitleChannelButton";
            this.TitleChannelButton.Size = new System.Drawing.Size(138, 20);
            this.TitleChannelButton.TabIndex = 13;
            this.TitleChannelButton.Text = "Title Channel";
            this.TitleChannelButton.UseVisualStyleBackColor = true;
            this.TitleChannelButton.Click += new System.EventHandler(this.TitleChannelButton_Click);
            // 
            // CreditsChannelButton
            // 
            this.CreditsChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CreditsChannelButton.Enabled = false;
            this.CreditsChannelButton.Location = new System.Drawing.Point(3, 367);
            this.CreditsChannelButton.Name = "CreditsChannelButton";
            this.CreditsChannelButton.Size = new System.Drawing.Size(138, 20);
            this.CreditsChannelButton.TabIndex = 14;
            this.CreditsChannelButton.Text = "Credits Channel";
            this.CreditsChannelButton.UseVisualStyleBackColor = true;
            this.CreditsChannelButton.Click += new System.EventHandler(this.CreditsChannelButton_Click);
            // 
            // ChapterChannelButton
            // 
            this.ChapterChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ChapterChannelButton.Enabled = false;
            this.ChapterChannelButton.Location = new System.Drawing.Point(3, 393);
            this.ChapterChannelButton.Name = "ChapterChannelButton";
            this.ChapterChannelButton.Size = new System.Drawing.Size(138, 20);
            this.ChapterChannelButton.TabIndex = 15;
            this.ChapterChannelButton.Text = "Chapter Channel";
            this.ChapterChannelButton.UseVisualStyleBackColor = true;
            this.ChapterChannelButton.Click += new System.EventHandler(this.ChapterChannelButton_Click);
            // 
            // DeathChannelButton
            // 
            this.DeathChannelButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.DeathChannelButton.Enabled = false;
            this.DeathChannelButton.Location = new System.Drawing.Point(3, 419);
            this.DeathChannelButton.Name = "DeathChannelButton";
            this.DeathChannelButton.Size = new System.Drawing.Size(138, 20);
            this.DeathChannelButton.TabIndex = 16;
            this.DeathChannelButton.Text = "Death Channel";
            this.DeathChannelButton.UseVisualStyleBackColor = true;
            this.DeathChannelButton.Click += new System.EventHandler(this.DeathChannelButton_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1043, 524);
            this.Controls.Add(this.tableLayoutPanel2);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "Fyre Channels";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.inputPanel.ResumeLayout(false);
            this.inputPanel.PerformLayout();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem openGameToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutSimpleFyreToolStripMenuItem;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.TextBox txtLocation;
        private System.Windows.Forms.TextBox txtTime;
        private System.Windows.Forms.TextBox txtScore;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.TextBox txtOutput;
        private System.Windows.Forms.Panel inputPanel;
        private System.Windows.Forms.Label lblPrompt;
        private System.Windows.Forms.TextBox txtInput;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.Button MainChannelButton;
        private System.Windows.Forms.Button LocationChannelButton;
        private System.Windows.Forms.Button ScoreChannelButton;
        private System.Windows.Forms.Button TimeChannelButton;
        private System.Windows.Forms.Button HintsChannelButton;
        private System.Windows.Forms.Button HelpChannelButton;
        private System.Windows.Forms.Button MapChannelButton;
        private System.Windows.Forms.Button ProgressChannelButton;
        private System.Windows.Forms.Button ThemeChannelButton;
        private System.Windows.Forms.Button PromptChannelButton;
        private System.Windows.Forms.Button ConversationChannelButton;
        private System.Windows.Forms.Button SoundChannelButton;
        private System.Windows.Forms.Button PrologueChannelButton;
        private System.Windows.Forms.Button TitleChannelButton;
        private System.Windows.Forms.Button CreditsChannelButton;
        private System.Windows.Forms.Button ChapterChannelButton;
        private System.Windows.Forms.Button DeathChannelButton;
    }
}

