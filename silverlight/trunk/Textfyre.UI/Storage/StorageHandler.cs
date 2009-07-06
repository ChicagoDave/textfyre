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

namespace Textfyre.UI.Storage {
    public static class StorageHandler {
        #region :: ReadTextFile, WriteTextFile ::
        public static void WriteTextFile(string filename, string data) {
            DeleteFile(filename);

            try {
                IsolatedStorageFile IsoStorageFile =
                    System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                using (IsolatedStorageFileStream isoStream =
        new IsolatedStorageFileStream(filename,
            FileMode.OpenOrCreate, IsoStorageFile)) {
                    using (StreamWriter writer = new StreamWriter(isoStream)) {
                        writer.Write(data);
                    }

                }
            } catch {
            }
        }

        public static string ReadTextFile(string filename) {
            string sb = string.Empty;
            try {

                IsolatedStorageFile IsoStorageFile =
                    System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                if (IsoStorageFile.FileExists(filename) == false)
                    return sb;

                using (IsolatedStorageFileStream isoStream =
        new IsolatedStorageFileStream(filename,
            FileMode.OpenOrCreate, IsoStorageFile)) {
                    using (StreamReader reader = new StreamReader(isoStream)) {
                        sb = reader.ReadToEnd();
                    }
                }
            } catch {
            }
            return sb;
        }
        #endregion

        #region :: DeleteFile ::
        public static void DeleteFile(string filename) {
            try {
                IsolatedStorageFile IsoStorageFile =
        System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                if (IsoStorageFile.FileExists(filename))
                    IsoStorageFile.DeleteFile(filename);
            } catch {
            }
        }
        #endregion
    }
}
