using System;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

namespace Textfyre.UI.Controls.IODialog
{
    public partial class Notes : UserControl
    {
        public Notes()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
        }

        public void Show()
        {
            Current.Game.IsInputFocusActive = false;
            this.Visibility = Visibility.Visible;

            if (GetName().Length == 0)
                TbNotesBy.Focus();
            else if (GetText().Length == 0)
                NotesText.Focus();
            
        }

        public void Hide()
        {
            this.Visibility = Visibility.Collapsed;
            Current.Game.IsInputFocusActive = true;
            Current.Game.TextfyreBook.TextfyreDocument.InputFocus();
        }

        public void AddNotes(string nodes)
        {
            string name = GetName();
            string text = nodes;

            if (text == "*")
                text = String.Empty;

            if (text.StartsWith("*"))
            {
                text = text.Substring(1);
            }

            NotesText.Text = text;

            LogNotes();

        }

        private void LogNotes()
        {
            if (GetName().Length == 0 || GetText().Length == 0)
            {
                Show();
            }
            else
            {
                Hide();
                Current.User.LogNotes(GetName(), GetText());
                Current.Game.TextfyreBook.TranscriptDialog.AddText(
    System.Environment.NewLine + "[Comment from " + GetName() + ":" + System.Environment.NewLine + GetText() + System.Environment.NewLine + "]" + System.Environment.NewLine
);
                Current.Game.TextfyreBook.TextfyreDocument.AddStml("<Italic>Your comment was written to the transcript.</Italic><LineBreak/>");
            }
        }

        public void AddText(string text)
        {
            string transcript = text.Replace("<Paragraph>", System.Environment.NewLine + "<Paragraph>").Replace("</Paragraph>", "</Paragraph>" + System.Environment.NewLine);

            NotesText.Text += RemoveTags(transcript);
        }

        private string RemoveTags(string text)
        {
            return Regex.Replace(text, @"<(.|\n)*?>", string.Empty);
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Hide();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (GetName().Length == 0)
            {
                Current.Game.TextfyreBook.ConfirmNotesProvideName.Show();
            }
            else
            {
                LogNotes();
            }
        }

        private string GetName()
        {
            return TbNotesBy.Text.Trim();
        }

        private string GetText()
        {
            return NotesText.Text.Trim();
        }
    }
}
