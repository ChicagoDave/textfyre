using System;
using System.Windows;
using System.Windows.Controls;

namespace Textfyre.UI.Controls.IODialog
{
    public class FileEventArgs : EventArgs
    {
        public Entities.SaveFile SaveFile;
    }
    
    public partial class File : UserControl
    {
        public class FileEventArgs : EventArgs
        {
            public Entities.SaveFile SaveFile;
        }

        public event EventHandler<FileEventArgs> FileClick;

        public event EventHandler<FileEventArgs> FileDeleteClick;

        private Entities.SaveFile _saveFile;



        public File( Entities.SaveFile saveFile )
        {
            _saveFile = saveFile;
            InitializeComponent();

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtFilename);
            TxtFilename.FontWeight = FontWeights.Bold;
            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, TxtDescription);

            TxtFilename.Text = _saveFile.Title;
            TxtDescription.Text = _saveFile.Description;
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (FileClick != null)
            {
                FileEventArgs args = new FileEventArgs();
                args.SaveFile = _saveFile;
                FileClick(this, args);
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (FileDeleteClick != null)
            {
                FileEventArgs args = new FileEventArgs();
                args.SaveFile = _saveFile;
                FileDeleteClick(this, args);
            }
        }
    }
}
