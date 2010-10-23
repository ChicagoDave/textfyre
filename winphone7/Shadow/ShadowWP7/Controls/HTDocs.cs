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
    public class HTDocs
    {
        // Assumes there is an htdocs.txt file in root of XAP file.
        public static void MoveFiles(IsolatedStorageFile isf) {
            // Get list of files to move to Isolated Storage.
            StreamReader reader = new StreamReader(TitleContainer.OpenStream("htdocs.txt"));
            while (!reader.EndOfStream)
            {
                string filename = reader.ReadLine();

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
            reader.Close();
            reader = null;
        }
    }
}
