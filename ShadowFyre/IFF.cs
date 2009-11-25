/*
 * Copyright © 2008, Textfyre, Inc. - All Rights Reserved
 * Please read the accompanying COPYRIGHT file for licensing resstrictions.
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Textfyre.ShadowFyre
{
	/// <summary>
	/// Implements the Quetzal saved-game file specification by holding a list of
	/// typed data chunks which can be read from or written to streams.
	/// </summary>
	/// <remarks>
	/// http://www.ifarchive.org/if-archive/infocom/interpreters/specification/savefile_14.txt
	/// </remarks>
	public class IFF
	{
		public struct ChunkType
		{
			public uint Type { get; private set; }

			public ChunkType( uint type )
				: this()
			{
				this.Type = type;
			}

			public ChunkType( string type )
				: this( StrToID( type ) )
			{
			}

			private static uint StrToID( string type )
			{
				byte a = (byte)type[ 0 ];
				byte b = (byte)type[ 1 ];
				byte c = (byte)type[ 2 ];
				byte d = (byte)type[ 3 ];
				return (uint)( ( a << 24 ) + ( b << 16 ) + ( c << 8 ) + d );
			}

			public override string ToString()
			{
				return Encoding.UTF8.GetString(
					new[]
					{
						(byte)( ( Type >> 24 ) & 255 ),
						(byte)( ( Type >> 16 ) & 255 ),
						(byte)( ( Type >> 8 ) & 255 ),
						(byte)( Type & 255 )
					}, 0, 4 );
			}

			public static implicit operator uint( ChunkType type )
			{
				return type.Type;
			}

			public static implicit operator ChunkType( uint type )
			{
				return new ChunkType( type );
			}
		}

		protected Dictionary<ChunkType, byte[]> chunks = new Dictionary<ChunkType, byte[]>();

		protected static readonly ChunkType FORM = new ChunkType( "FORM" );
		protected static readonly ChunkType LIST = new ChunkType( "LIST" );
		protected static readonly ChunkType CAT_ = new ChunkType( "CAT " );

		/// <summary>
		/// Initializes a new chunk collection.
		/// </summary>
		public IFF()
		{
		}

		/// <summary>
		/// Loads a collection of chunks from a Quetzal file.
		/// </summary>
		/// <param name="stream">The stream to read from.</param>
		/// <returns>A new <see cref="Quetzal"/> instance initialized
		/// from the stream.</returns>
		/// <remarks>
		/// Duplicate chunks are not supported by this class. Only the last
		/// chunk of a given type will be available.
		/// </remarks>
		public virtual void Load( Stream stream, ChunkType requiredType )
		{
			var type = (ChunkType)BigEndian.ReadInt32( stream );

			if ( type != FORM && type != LIST && type != CAT_ )
				throw new ArgumentException( "Invalid IFF type" );

			int length = (int)BigEndian.ReadInt32( stream );
			byte[] buffer = new byte[ length ];
			int amountRead = stream.Read( buffer, 0, (int)length );
			if ( amountRead < length )
				throw new ArgumentException( "IFF file is too short" );

			stream = new MemoryStream( buffer );
			type = (ChunkType)BigEndian.ReadInt32( stream );
			if ( type != requiredType )
				throw new ArgumentException( "Wrong IFF sub-type: not a Blorb file" );

			while ( stream.Position < stream.Length )
			{
				type = (ChunkType)BigEndian.ReadInt32( stream );
				length = (int)BigEndian.ReadInt32( stream );
				byte[] chunk = new byte[ length ];
				amountRead = stream.Read( chunk, 0, length );
				if ( amountRead < length )
					throw new ArgumentException( "Chunk extends past end of file" );

				chunks[ type ] = chunk;

				if ( ( length & 1 ) == 1 ) stream.ReadByte();
			}
		}

		/// <summary>
		/// Gets or sets typed data chunks.
		/// </summary>
		/// <param name="type">The 4-character type identifier.</param>
		/// <returns>The contents of the chunk.</returns>
		public byte[] this[ ChunkType type ]
		{
			get
			{
				byte[] result = null;
				chunks.TryGetValue( type, out result );
				return result;
			}
			set
			{
				chunks[ type ] = value;
			}
		}

		/// <summary>
		/// Checks whether the Quetzal file contains a given chunk type.
		/// </summary>
		/// <param name="type">The 4-character type identifier.</param>
		/// <returns><see langword="true"/> if the chunk is present.</returns>
		public bool Contains( ChunkType type )
		{
			return chunks.ContainsKey( type );
		}

		/*
				/// <summary>
				/// Writes the chunks to a Quetzal file.
				/// </summary>
				/// <param name="stream">The stream to write to.</param>
				public void WriteToStream(Stream stream)
				{
					BigEndian.WriteInt32(stream, FORM);     // IFF tag
					BigEndian.WriteInt32(stream, 0);        // file length (filled in later)
					BigEndian.WriteInt32(stream, IFZS);     // FORM sub-ID for Quetzal

					uint totalSize = 2;// 4; // includes sub-ID
					foreach (KeyValuePair<uint, byte[]> pair in chunks)
					{
						BigEndian.WriteInt32(stream, pair.Key);                 // chunk type
						BigEndian.WriteInt32(stream, (uint)pair.Value.Length);  // chunk length
						stream.Write(pair.Value, 0, pair.Value.Length);         // chunk data
						totalSize += 8 + (uint)(pair.Value.Length);
					}

					if (totalSize % 2 == 1)
						stream.WriteByte(0);    // padding (not counted in file length)

					stream.Seek(4, SeekOrigin.Begin);
					BigEndian.WriteInt32(stream, totalSize);
				}*/
	}
}