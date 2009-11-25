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
    public class Blorb : IFF
    {
		protected static ChunkType IFRS = new ChunkType( "IFRS" );
		protected static ChunkType RIdx = new ChunkType( "RIdx" );
		protected static ChunkType ReIN = new ChunkType( "ReIN" );
		protected static ChunkType IFhd = new ChunkType( "IFhd" );
		protected static ChunkType Copyright = new ChunkType( "(c) " );
		protected static ChunkType AUTH = new ChunkType( "AUTH" );
		protected static ChunkType ANNO = new ChunkType( "ANNO" );

		public static ChunkType GLUL = new ChunkType( "GLUL" );

		public static ChunkType Pict = new ChunkType( "Pict" );
		public static ChunkType Snd = new ChunkType( "Snd " );
		public static ChunkType Exec = new ChunkType( "Exec" );

        /// <summary>
        /// Initializes a new chunk collection.
        /// </summary>
        public Blorb()
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
        public static Blorb FromStream(Stream stream)
        {
            var result = new Blorb();

			result.Load( stream, IFRS );

			return result;
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

            uint totalSize = 4; // includes sub-ID
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
        }
*/
    }
}
