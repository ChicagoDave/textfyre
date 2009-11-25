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
using System.Windows.Threading;
using System.Threading;

namespace Textfyre.ShadowFyre
{
	public class DeferredMemoryStream : MemoryStream
	{
		public event EventHandler Closed;

		private byte[] deferredBuffer;
		private long deferredLength;

		public override void Close()
		{
			deferredBuffer = base.GetBuffer();
			deferredLength = base.Length;

			base.Close();

			if ( Closed != null ) Closed( this, EventArgs.Empty );
		}

		public override byte[] GetBuffer() { return deferredBuffer; }
		public override long Length { get { return deferredLength; } }
	}
}