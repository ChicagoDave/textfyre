using System;
using System.IO;
using System.Threading;

namespace ShadowWP7
{
	/// <summary><see cref="Streams"/> aids in copying data between <see cref="Stream"/> objects, allowing for [describe WaitHandle].</summary>
	public static class Streams
	{
		private static int defaultChunkSize = 1024 * 256;

		/// <overloads>Copy data between <see cref="Stream"/> objects.</overloads>
		/// <summary>Copy between <see cref="Stream"/> objects using a default chunk size.</summary>
		/// <param name="source">Source <see cref="Stream"/>.</param>
		/// <param name="destination">Destination <see cref="Stream"/>.</param>
		/// <returns>Returns <c>true</c> if the copy succeeded.</returns>
		public static void CopyStream( Stream source, Stream destination )
		{
			CopyStream( source, destination, null );
		}

		/// <summary>Copy between <see cref="Stream"/> objects using specified chunk size.</summary>
		/// <param name="source">Source <see cref="Stream"/>.</param>
		/// <param name="destination">Destination <see cref="Stream"/>.</param>
		/// <param name="chunkSize">The size in bytes used during each <see cref="Stream.Read( byte[], int, int )"/> call.</param>
		/// <returns>Returns <c>true</c> if the copy succeeded.</returns>
		public static void CopyStream( Stream source, Stream destination, int chunkSize )
		{
			CopyStream( source, destination, chunkSize, null );
		}

		/// <summary>Copy between <see cref="Stream"/> objects using default chunk size.</summary>
		/// <param name="source">Source <see cref="Stream"/>.</param>
		/// <param name="destination">Destination <see cref="Stream"/>.</param>
		/// <param name="waitHandle">WaitHandle (will abort copy if set)</param>
		/// <returns>Returns <c>true</c> if the copy succeeded.  Returns <c>false</c> if the copy was aborted.</returns>
		public static void CopyStream( Stream source, Stream destination, WaitHandle waitHandle )
		{
			CopyStream( source, destination, defaultChunkSize, waitHandle );
		}

		/// <summary>Copy between <see cref="Stream"/> objects using specified chunk size.</summary>
		/// <param name="source">Source <see cref="Stream"/>.</param>
		/// <param name="destination">Destination <see cref="Stream"/>.</param>
		/// <param name="chunkSize">The size in bytes used during each <see cref="Stream.Read( byte[], int, int )"/> call.</param>
		/// <param name="waitHandle">WaitHandle (will abort copy if set)</param>
		/// <returns>Returns <c>true</c> if the copy succeeded.  Returns <c>false</c> if the copy was aborted.</returns>
		public static bool CopyStream( Stream source, Stream destination, int chunkSize, WaitHandle waitHandle )
		{
			if ( source == null )
			{
				throw new ArgumentNullException( "source" );
			}
			if ( destination == null )
			{
				throw new ArgumentNullException( "destination" );
			}

			byte[] buffer = new byte[ chunkSize ];
			bool abort = false;
			int count;

			while ( ( count = source.Read( buffer, 0, chunkSize ) ) > 0 && !abort )
			{
				if ( waitHandle != null && waitHandle.WaitOne( 0 ) ) abort = true;
				else destination.Write( buffer, 0, count );
			}

			return !abort;
		}
	}
}