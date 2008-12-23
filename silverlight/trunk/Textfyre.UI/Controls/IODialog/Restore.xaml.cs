using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.Controls.IODialog
{
    public partial class Restore : UserControl
    {
        public class RestoreEventArgs : EventArgs
        {
            public Entities.SaveFile SaveFile;
        }

        public event EventHandler<FileEventArgs> DeleteRequest;

        public event EventHandler<RestoreEventArgs> RestoreRequest;

        public Restore()
        {
            InitializeComponent();
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Header, DialogTitle);
            DialogTitle.FontSize = 24d;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Footer, MemoryText);
            MemoryText.FontSize = 12d;
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
            if (RestoreRequest != null)
            {
                RestoreEventArgs args = new RestoreEventArgs();
                args.SaveFile = e.SaveFile;
                RestoreRequest(this, args);
            }
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
            if (RestoreRequest != null)
            {
                RestoreEventArgs args = new RestoreEventArgs();
                args.SaveFile = null;
                RestoreRequest(this, args);
            }
        }
    }
}
