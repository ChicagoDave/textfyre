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
using System.IO;
using SevenZip.Compression.LZMA;

namespace Textfyre.UI
{
    public class DecompressingStream : Stream
    {
        private MemoryStream decompressed;

        public DecompressingStream(Stream inputStream)
        {
            // isolated storage is slow, so read everything into memory first
            MemoryStream temp = new MemoryStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.Read(buffer, 0, buffer.Length)) != 0)
                temp.Write(buffer, 0, bytesRead);
            temp.Seek(0, SeekOrigin.Begin);
            inputStream.Close();

            // magic number
            byte[] magic = new byte[4];
            bytesRead = temp.Read(magic, 0, 4);
            if (bytesRead != 4 || magic[0] != '7' || magic[1] != 'Z' ||
                magic[2] != 'S' || magic[3] != 'V')
            {
                // not compressed, just use it as-is
                decompressed = temp;
            }
            else
            {
                const string STooShort = "Compressed stream is too short";

                // file size
                long size = 0;
                for (int i = 7; i >= 0; i--)
                {
                    int b = temp.ReadByte();
                    if (b < 0)
                        throw new Exception(STooShort);

                    size |= (long)b << (8 * i);
                }

                // coder properties
                byte[] props = new byte[5];
                if (temp.Read(props, 0, 5) != 5)
                    throw new Exception(STooShort);

                Decoder decoder = new Decoder();
                decoder.SetDecoderProperties(props);

                // compressed data
                long inSize = temp.Length - temp.Position;
                decompressed = new MemoryStream();
                decoder.Code(temp, decompressed, inSize, size, null);
            }

            decompressed.Seek(0, SeekOrigin.Begin);
        }

        public override bool CanRead
        {
            get { return true; }
        }

        public override bool CanSeek
        {
            get { return true; }
        }

        public override bool CanWrite
        {
            get { return false; }
        }

        public override void Flush()
        {
            // nada
        }

        public override long Length
        {
            get { return decompressed.Length; }
        }

        public override long Position
        {
            get { return decompressed.Position; }
            set { decompressed.Position = value; }
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            return decompressed.Read(buffer, offset, count);
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return decompressed.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            throw new NotSupportedException();
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            throw new NotSupportedException();
        }
    }
}
