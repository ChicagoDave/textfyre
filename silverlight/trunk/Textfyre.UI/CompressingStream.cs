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
    public class CompressingStream : Stream
    {
        private Stream outputStream;
        private MemoryStream mstr;

        public CompressingStream(Stream outputStream)
        {
            this.outputStream = outputStream;

            mstr = new MemoryStream();
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
            get { return true; }
        }

        public override void Flush()
        {
            // nada
        }

        public override long Length
        {
            get { return mstr.Length; }
        }

        public override long Position
        {
            get { return mstr.Position; }
            set { mstr.Position = value; }
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            return mstr.Read(buffer, offset, count);
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return mstr.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            mstr.SetLength(value);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            mstr.Write(buffer, offset, count);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && outputStream != null)
            {
                long inputSize = mstr.Length;

                // isolated storage is slow, so compress in memory first
                MemoryStream temp = new MemoryStream((int)inputSize);

                // magic number
                temp.WriteByte((byte)'7');
                temp.WriteByte((byte)'Z');
                temp.WriteByte((byte)'S');
                temp.WriteByte((byte)'V');

                // file size
                for (int i = 7; i >= 0; i--)
                    temp.WriteByte((byte)(inputSize >> (8 * i)));

                // coder properties
                Encoder encoder = new Encoder();
                encoder.WriteCoderProperties(temp);

                // compressed data
                mstr.Seek(0, SeekOrigin.Begin);
                encoder.Code(mstr, temp, -1, -1, null);

                // now copy the compressed data to the output stream
                temp.Seek(0, SeekOrigin.Begin);
                byte[] buffer = new byte[2048];
                int bytesRead;
                while ((bytesRead = temp.Read(buffer, 0, buffer.Length)) != 0)
                    outputStream.Write(buffer, 0, bytesRead);

                outputStream.Close();
                outputStream = null;
            }

            base.Dispose(disposing);
        }
    }
}
