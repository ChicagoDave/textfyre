//
//  TFUlxImage.m
//  fyrep-cocoa
//
//  Created by Andrew Pontious on 1/30/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import "TFUlxImage.h"

#import "GlulxConstants.h"

#import <CommonCrypto/CommonCryptor.h>

//#define ENCRYPTED_GAMES_ONLY

@interface TFUlxImage ()

@property (readwrite) uint32_t RAMStart;

@end



@implementation TFUlxImage

@synthesize RAMStart;

#pragma mark Helper methods

#pragma mark Public methods

- (BOOL)loadFromPath:(NSString *)path {

    [self cleanup];

    BOOL succeeded = NO;

    NSError *error = nil;

    //
    // Read in file
    //

    NSData *data = [[NSData alloc] initWithContentsOfFile:path options:NSUncachedRead error:&error];
    if (data == nil) {
        NSLog(@"Unable to load file at path \"%@\": %@", path, error);
    } else {
        // Must be enough space for original header, unencrypted + and actual header inside encrypted portion.
        if ([data length] <= TFGlulxHeaderSize * 2) {
            NSLog(@"File at path \"%@\" is too small", path);
        } else if (strncmp([data bytes], "JACK", 4) != 0) {
            NSLog(@"File at path \"%@\" has wrong magic number", path);
        // I haven't seen any documentation that says this, but my experimentation (building CommonCrypto from Darwin sources and stepping through it) shows that the crypto APIs will return kCCParamError if the passed-in data's length is not a multiple of kCCBlockSizeAES128.
        // For the sample games that I have, this always seems to be true. See TestTFUlxImage.
        } else if ((([data length]-TFGlulxHeaderSize) % kCCBlockSizeAES128) != 0) {
            NSLog(@"Length %lu of file at path \"%@\", minus header size %lu, should be a multiple of AES block size %ld, but is %ld longer", 
                  (unsigned long)[data length], path, (unsigned long)TFGlulxHeaderSize, (long)kCCBlockSizeAES128, ([data length]-TFGlulxHeaderSize) % kCCBlockSizeAES128);
        } else {

            //
            // Decrypt in file
            //
            
            const uint8_t *bytes = [data bytes];

            // 4-byte magic number is followed by a 32-byte munged key, which we transform by XORing with our own key
            //                             12345678901234567890123456789012
            const uint8_t originalKey[] = "Please don't share the game file";
            
            uint8_t key[32];
            for (NSInteger i = 0; i < 32; ++i) {
                key[i] = bytes[4 + i] ^ originalKey[i];
            }
            
            // we need a 16-byte initialization vector too
            //              1234567890123456
            uint8_t iv[] = "Hi from Textfyre";
            
            const size_t dataLength = [data length]-TFGlulxHeaderSize;

            uint8_t *bufferPtr = malloc(dataLength);

            if (bufferPtr == NULL) {
                NSLog(@"During decryption of file at path \"%@\", unable to malloc %lu-sized buffer", path, (unsigned long)dataLength);
            } else {
                size_t movedBytes = 0;

                CCCryptorStatus ccStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, 0, key, kCCKeySizeAES256, iv, bytes+TFGlulxHeaderSize, dataLength, bufferPtr, dataLength, &movedBytes);
                if (ccStatus != kCCSuccess) {
                    NSLog(@"Problem with CCCrypt, ccStatus == %d.", (long)ccStatus);
                } else if (movedBytes != dataLength) {
                    NSLog(@"CCCrypt should have \"moved\" then entire passed-in data length %ld, but only moved %ld bytes", (unsigned long)dataLength, (unsigned long)movedBytes);
                } else {
                    _decryptedData = [[NSData alloc] initWithBytesNoCopy:bufferPtr length:movedBytes];
                }

                if (_decryptedData == nil) {
                    free(bufferPtr);
                }
            }
        }
        
        [data release], data = nil;
    }
    
    //
    // Analyze decrypted contents
    //

    if (_decryptedData != nil) {
        if (strncmp([_decryptedData bytes], "Glul", 4) != 0) {
            NSLog(@"File at path \"%@\" has wrong magic number2", path);
        } else {
            self.RAMStart = NSSwapBigIntToHost(*((int32_t *)([_decryptedData bytes]+TFGlulxHeaderRAMStartOffset)));
        
            // Do more cool stuff
/*
                uint endmem = ReadInt32(Engine.GLULX_HDR_ENDMEM_OFFSET);
                uint length = ReadInt32(Engine.GLULX_HDR_EXTSTART_OFFSET);

                // now read the whole thing
                byte[] header = memory;
                memory = new byte[endmem];
                Array.Copy(header, memory, Engine.GLULX_HDR_SIZE);
                cstream.Read(memory, Engine.GLULX_HDR_SIZE, (int)length - Engine.GLULX_HDR_SIZE);

                // cache original RAM and IFHD immediately so we don't have to decrypt again when saving
                originalHeader = new byte[128];
                Array.Copy(memory, originalHeader, 128);

                originalRam = new byte[endmem - ramstart];
                Array.Copy(memory, (int)ramstart, originalRam, 0, originalRam.Length);
            }

            // verify checksum
            uint checksum = CalculateChecksum();
            if (checksum != ReadInt32(Engine.GLULX_HDR_CHECKSUM_OFFSET))
                throw new ArgumentException(".ulx file has incorrect checksum");
*/
        
            succeeded = YES;
        }
    }

    return succeeded;
}

/*
        /// <summary>
        /// Gets or sets the address at which memory ends.
        /// </summary>
        /// <remarks>
        /// This can be changed by the game with @setmemsize (or managed
        /// automatically by the heap allocator). Addresses above EndMem are
        /// neither readable nor writable.
        /// </remarks>
        public uint EndMem {
            get {
                return (uint)memory.Length;
            }
            set {
                // round up to the next multiple of 256
                if (value % 256 != 0)
                    value = (value + 255) & 0xFFFFFF00;

                if ((uint)memory.Length != value) {
                    byte[] newMem = new byte[value];
                    Array.Copy(memory, newMem, (int)Math.Min((uint)memory.Length, (int)value));
                    memory = newMem;
                }
            }
        }

        /// <summary>
        /// Reads a single byte from memory.
        /// </summary>
        /// <param name="offset">The address to read from.</param>
        /// <returns>The byte at the specified address.</returns>
        public byte ReadByte(uint offset) {
            return memory[offset];
        }

        /// <summary>
        /// Reads a big-endian word from memory.
        /// </summary>
        /// <param name="offset">The address to read from</param>
        /// <returns>The word at the specified address.</returns>
        public ushort ReadInt16(uint offset) {
            return BigEndian.ReadInt16(memory, offset);
        }

        /// <summary>
        /// Reads a big-endian double word from memory.
        /// </summary>
        /// <param name="offset">The address to read from.</param>
        /// <returns>The 32-bit value at the specified address.</returns>
        public uint ReadInt32(uint offset) {
            return BigEndian.ReadInt32(memory, offset);
        }

        /// <summary>
        /// Writes a single byte into memory.
        /// </summary>
        /// <param name="offset">The address to write to.</param>
        /// <param name="value">The value to write.</param>
        /// <exception cref="VMException">The address is below RamStart.</exception>
        public void WriteByte(uint offset, byte value) {
            if (offset < ramstart)
                throw new VMException("Writing into ROM");

            memory[offset] = value;
        }

        /// <summary>
        /// Writes a big-endian 16-bit word into memory.
        /// </summary>
        /// <param name="offset">The address to write to.</param>
        /// <param name="value">The value to write.</param>
        /// <exception cref="VMException">The address is below RamStart.</exception>
        public void WriteInt16(uint offset, ushort value) {
            if (offset < ramstart)
                throw new VMException("Writing into ROM");

            BigEndian.WriteInt16(memory, offset, value);
        }

        /// <summary>
        /// Writes a big-endian 32-bit word into memory.
        /// </summary>
        /// <param name="offset">The address to write to.</param>
        /// <param name="value">The value to write.</param>
        /// <exception cref="VMException">The address is below RamStart.</exception>
        public void WriteInt32(uint offset, uint value) {
            if (offset < ramstart)
                throw new VMException("Writing into ROM");

            BigEndian.WriteInt32(memory, offset, value);
        }

        /// <summary>
        /// Calculates the checksum of the image.
        /// </summary>
        /// <returns>The sum of the entire image, taken as an array of
        /// 32-bit words.</returns>
        public uint CalculateChecksum() {
            uint end = ReadInt32(Engine.GLULX_HDR_EXTSTART_OFFSET);
            // negative checksum here cancels out the one we'll add inside the loop
            uint sum = (uint)(-ReadInt32(Engine.GLULX_HDR_CHECKSUM_OFFSET));

            System.Diagnostics.Debug.Assert(end % 4 == 0); // Glulx spec 1.2 says ENDMEM % 256 == 0

            for (uint i = 0; i < end; i += 4)
                sum += ReadInt32(i);

            return sum;
        }

        /// <summary>
        /// Gets the entire contents of memory.
        /// </summary>
        /// <returns>An array containing all VM memory, ROM and RAM.</returns>
        public byte[] GetMemory() {
            return memory;
        }

        /// <summary>
        /// Sets the entire contents of RAM, changing the size if necessary.
        /// </summary>
        /// <param name="newBlock">The new contents of RAM.</param>
        /// <param name="embeddedLength">If true, indicates that <paramref name="newBlock"/>
        /// is prefixed with a 32-bit word giving the new size of RAM, which may be
        /// more than the number of bytes actually contained in the rest of the array.</param>
        public void SetRAM(byte[] newBlock, bool embeddedLength) {
            uint length;
            int offset;

            if (embeddedLength) {
                offset = 4;
                length = (uint)((newBlock[0] << 24) + (newBlock[1] << 16) + (newBlock[2] << 8) + newBlock[3]);
            } else {
                offset = 0;
                length = (uint)newBlock.Length;
            }

            EndMem = ramstart + length;
            Array.Copy(newBlock, offset, memory, (int)ramstart, newBlock.Length - offset);
        }

        /// <summary>
        /// Obtains the initial contents of RAM from the game file.
        /// </summary>
        /// <returns>The initial contents of RAM.</returns>
        public byte[] GetOriginalRAM() {
            if (originalRam == null) {
                int length = (int)(ReadInt32(Engine.GLULX_HDR_ENDMEM_OFFSET) - ramstart);
                originalRam = new byte[length];
                originalStream.Seek(ramstart, SeekOrigin.Begin);
                originalStream.Read(originalRam, 0, length);
            }
            return originalRam;
        }

        /// <summary>
        /// Obtains the header from the game file.
        /// </summary>
        /// <returns>The first 128 bytes of the game file.</returns>
        public byte[] GetOriginalIFHD() {
            if (originalHeader == null) {
                originalHeader = new byte[128];
                originalStream.Seek(0, SeekOrigin.Begin);
                originalStream.Read(originalHeader, 0, 128);
            }
            return originalHeader;
        }

        /// <summary>
        /// Copies a block of data out of RAM.
        /// </summary>
        /// <param name="address">The address, based at <see cref="RamStart"/>,
        /// at which to start copying.</param>
        /// <param name="length">The number of bytes to copy.</param>
        /// <param name="dest">The destination array.</param>
        public void ReadRAM(uint address, uint length, byte[] dest) {
            Array.Copy(memory, (int)(ramstart + address), dest, 0, (int)length);
        }

        /// <summary>
        /// Copies a block of data into RAM, expanding the memory map if needed.
        /// </summary>
        /// <param name="address">The address, based at <see cref="RamStart"/>,
        /// at which to start copying.</param>
        /// <param name="src">The source array.</param>
        public void WriteRAM(uint address, byte[] src) {
            EndMem = Math.Max(EndMem, ramstart + (uint)src.Length);
            Array.Copy(src, 0, memory, (int)(ramstart + address), src.Length);
        }

        /// <summary>
        /// Reloads the game file, discarding all changes that have been made
        /// to RAM and restoring the memory map to its original size.
        /// </summary>
        public void Revert() {
            LoadFromStream(originalStream);
        }
    }
}
*/

- (void)cleanup {
    [_decryptedData release];
}

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end