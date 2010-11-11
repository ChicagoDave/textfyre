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
using System.Reflection;
using System.IO;
using Microsoft.Phone.Controls;
using Microsoft.Xna.Framework;
using System.IO.IsolatedStorage;

namespace ShadowWP7.Controls
{
    public static class ISExtensions
    {
        public static void CopyTextFile(this IsolatedStorageFile isf, string filename, bool replace = false)
        {
            if (!isf.FileExists(filename) || replace == true)
            {
                StreamReader stream = new StreamReader(TitleContainer.OpenStream(filename));
                IsolatedStorageFileStream outFile = isf.CreateFile(filename);

                string fileAsString = stream.ReadToEnd();
                byte[] fileBytes = System.Text.Encoding.UTF8.GetBytes(fileAsString);

                outFile.Write(fileBytes, 0, fileBytes.Length);

                stream.Close();
                outFile.Close();
            }
        }

        public static void CopyBinaryFile(this IsolatedStorageFile isf, string filename, bool replace = false)
        {
            if (!isf.FileExists(filename) || replace == true)
            {
                BinaryReader fileReader = new BinaryReader(TitleContainer.OpenStream(filename));
                IsolatedStorageFileStream outFile = isf.CreateFile(filename);

                bool eof = false;
                long fileLength = fileReader.BaseStream.Length;
                int writeLength = 512;
                while (!eof)
                {
                    if (fileLength < 512)
                    {
                        writeLength = Convert.ToInt32(fileLength);
                        outFile.Write(fileReader.ReadBytes(writeLength), 0, writeLength);
                    }
                    else
                    {
                        outFile.Write(fileReader.ReadBytes(writeLength), 0, writeLength);
                    }

                    fileLength = fileLength - 512;

                    if (fileLength <= 0) eof = true;
                }
                fileReader.Close();
                outFile.Close();
            }

        }
    }
}
