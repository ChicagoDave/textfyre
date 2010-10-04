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

namespace ShadowWP7
{
	public class NotifyingStream : Stream
	{
		public event EventHandler Closed;

		private Stream stream;

		public NotifyingStream( Stream stream )
		{
			this.stream = stream;
		}

		public override bool CanRead { get { return stream.CanRead; } }
		public override bool CanSeek { get { return stream.CanSeek; } }
		public override bool CanWrite { get { return stream.CanWrite; } }
		public override void Flush() { stream.Flush(); }
		public override long Length { get { return stream.Length; } }
		public override long Position { get { return stream.Position; } set { stream.Position = value; } }
		public override int Read( byte[] buffer, int offset, int count ) { return stream.Read( buffer, offset, count ); }
		public override long Seek( long offset, SeekOrigin origin ) { return stream.Seek( offset, origin ); }
		public override void SetLength( long value ) { stream.SetLength( value ); }
		public override void Write( byte[] buffer, int offset, int count ) { stream.Write( buffer, offset, count ); }

		public override void Close()
		{
			if ( Closed != null ) Closed( this, EventArgs.Empty );

			base.Close();
		}
	}
}
