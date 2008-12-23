using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO.IsolatedStorage;
using System.IO;

namespace Textfyre.UI.Transcript.Lib
{
    public static class IO
    {
        private const string _directory = "Transcript";
        private const string _filename = @"Transcript\Transcript.txt";

        private static void Init()
        {
            IsolatedStorageFile iso =
                System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForSite();

            if (iso.DirectoryExists(_directory) == false)
                iso.CreateDirectory(_directory);

        }

        public static void Delete()
        {
            IsolatedStorageFile iso =
                System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForSite();

            if (iso.FileExists(_filename))
                iso.DeleteFile(_filename);

            if (iso.DirectoryExists(_directory))
                iso.DeleteDirectory(_directory);
        }

        public static string Get()
        {
            Init();

            IsolatedStorageFile iso =
               System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForSite();

            if (iso.FileExists(_filename) == false)
                return String.Empty;

            string output = String.Empty;
            using (IsolatedStorageFileStream isoStream =
    new IsolatedStorageFileStream(_filename,
        FileMode.OpenOrCreate, iso))
            {
                using (StreamReader reader = new StreamReader(isoStream))
                {
                    output = reader.ReadToEnd();
                }
            }

            return output;
        }

        public static void Set( string transcript )
        {
            Init();
            IsolatedStorageFile iso =
                System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForSite();

            using (IsolatedStorageFileStream isoStream =
    new IsolatedStorageFileStream(_filename,
        FileMode.OpenOrCreate, iso))
            {
                using (StreamWriter writer = new StreamWriter(isoStream))
                {
                    writer.Write(transcript);
                }

            }
            
        }

    }
}
