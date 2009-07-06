using System;
using System.Windows;
using System.Windows.Controls;

namespace Textfyre.UI.Controls.IODialog
{
    public partial class Save : UserControl
    {
        public class SaveEventArgs : EventArgs
        {
            public Entities.SaveFile SaveFile;
        }

        public event EventHandler<FileEventArgs> DeleteRequest;
        public event EventHandler<SaveEventArgs> SaveRequest;

        public Save()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer, MemoryText);
            MemoryText.FontSize = 12d;

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtTitle);
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtDescription);

            Refresh();
        }

        public void Show()
        {
            Refresh();
            this.Visibility = Visibility.Visible;
        }

        public void Hide()
        {
            this.Visibility = Visibility.Collapsed;
        }

        public void Refresh()
        {
            TbTitle.Text = String.Empty;
            TbDescription.Text = String.Empty;
            
            CalculcateFreeSpace();

            this.FilesList.Children.Clear();
            foreach (Entities.SaveFile saveFile in Entities.SaveFile.SaveFiles)
            {
                IODialog.File file = new File(saveFile);
                file.FileClick += new EventHandler<File.FileEventArgs>(file_FileClick);
                file.FileDeleteClick += new EventHandler<File.FileEventArgs>(file_FileDeleteClick);
                this.FilesList.Children.Add(file);
            }

        }

        void file_FileDeleteClick(object sender, File.FileEventArgs e)
        {
            if (DeleteRequest != null)
            {
                FileEventArgs args = new FileEventArgs();
                args.SaveFile = e.SaveFile;
                DeleteRequest(this, args);
            }
        }

        void file_FileClick(object sender, File.FileEventArgs e)
        {
            TbTitle.Text = e.SaveFile.Title;
            TbDescription.Text = e.SaveFile.Description;
        }

        private void CalculcateFreeSpace()
        {
            long free = Entities.SaveFile.FreeSpace / 1024;
            long total = Entities.SaveFile.TotalSpace / 1024;

            this.MemoryText.Text = "Free: " + free.ToString() + "K / " + 
                total.ToString() + "K";

        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Hide();
            if (SaveRequest != null)
            {
                SaveEventArgs args = new SaveEventArgs();
                args.SaveFile = null;
                SaveRequest(this, args);
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            
            if (TbTitle.Text.Trim().Length == 0)
                return;
            
            Hide();
            Current.Game.TextfyreBook.Wait.Show(true);
            if (SaveRequest != null)
            {
                Entities.SaveFile sf = new Textfyre.UI.Entities.SaveFile();
                sf.Title = this.TbTitle.Text.Trim();
                sf.Description = this.TbDescription.Text.Trim();
                sf.SaveTime = System.DateTime.Now;
                sf.GameFileVersion = Current.Game.GameFileName;
                sf.FyreXml = Current.Game.GameState.FyreXml;
                sf.Transcript = Current.Game.TextfyreBook.TranscriptDialog.TranscriptText.Text;
                sf.StoryTitle = Current.Game.StoryTitle;
                sf.Chapter = Current.Game.Chapter;
                sf.Theme = Current.Game.ThemeID;
                sf.Hints = Current.Game.Hints;


                SaveEventArgs args = new SaveEventArgs();
                args.SaveFile = sf;
                SaveRequest(this, args);
            }
        }
    }
}
