//
//  TFUlxImage.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFUlxImage.h"

#import "GlulxConstants.h"

#import <CommonCrypto/CommonCryptor.h>

//#define ENCRYPTED_GAMES_ONLY

@interface TFUlxImage ()

@property (readwrite, retain) NSString *path;
@property (readwrite) uint32_t RAMStart;

@end



@implementation TFUlxImage

@synthesize path;
@synthesize RAMStart;

#pragma mark Helper methods

// Returns non-nil autoreleased NSMutableData on success, nil on failure, at which point technical details will be printed to Console.
static NSMutableData *decryptedDataForPath(NSString *path) {
    //
    // Read in file
    //

    NSMutableData *result = nil;
    
    NSError *error = nil;

    NSData *data = [[NSData alloc] initWithContentsOfFile:path options:NSUncachedRead error:&error];
    if (data == nil) {
        NSLog(@"Unable to load Glulx (.ulx) game file at path \"%@\": %@", path, error);
    } else {
        // Must be enough space for original header, unencrypted + and actual header inside encrypted portion.
        if ([data length] <= TFGlulxHeaderSize * 2) {
            NSLog(@"Glulx (.ulx) game file at path \"%@\" is too small", path);
        } else if (strncmp([data bytes], "JACK", 4) != 0) {
            NSLog(@"Glulx (.ulx) game file at path \"%@\" has wrong magic number", path);
        // I haven't seen any documentation that says this, but my experimentation (building CommonCrypto from Darwin sources and stepping through it) shows that the crypto APIs will return kCCParamError if the passed-in data's length is not a multiple of kCCBlockSizeAES128.
        // For the sample games that I have, this always seems to be true. See TestTFUlxImage.
        } else if ((([data length]-TFGlulxHeaderSize) % kCCBlockSizeAES128) != 0) {
            NSLog(@"Length %lu of Glulx (.ulx) game file at path \"%@\", minus header size %lu, should be a multiple of AES block size %ld, but is %ld longer", 
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
            
            const NSUInteger dataLength = [data length]-TFGlulxHeaderSize;

            // TODO Windows code read in header first, then allocated only amount of space specified in header. For us, it's easier to decrypt the whole thing at once. Are there any downsides to this approach? Here's one: we need to save off "end memory" value explicitly, since we can't query the length of this.
            NSMutableData *decryptedData = [[NSMutableData alloc] initWithLength:dataLength];

            if (decryptedData == NULL) {
                NSLog(@"During decryption of Glulx (.ulx) game file at path \"%@\", unable to create NSMutableData of %lu bytes", path, (unsigned long)dataLength);
            } else {
                size_t movedBytes = 0;

                CCCryptorStatus ccStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, 0, key, kCCKeySizeAES256, iv, bytes+TFGlulxHeaderSize, dataLength, [decryptedData mutableBytes], dataLength, &movedBytes);
                if (ccStatus != kCCSuccess) {
                    NSLog(@"Problem with CCCrypt, ccStatus == %d.", (long)ccStatus);
                } else if (movedBytes != dataLength) {
                    NSLog(@"CCCrypt should have \"moved\" then entire passed-in data length %ld, but only moved %ld bytes", (unsigned long)dataLength, (unsigned long)movedBytes);
                } else {
                    //
                    // Success
                    //

                    result = [[decryptedData retain] autorelease];
                }
                
                [decryptedData release];
            }
        }
        
        [data release], data = nil;
    }
    
    return result;
}

#pragma mark Public methods

- (BOOL)loadFromPath:(NSString *)thePath {

    [self cleanup];

    BOOL succeeded = NO;
    
    self.path = thePath;

    decryptedData = [decryptedDataForPath(self.path) retain];
        
    //
    // Analyze decrypted contents
    //

    if (decryptedData) {
        if (strncmp([decryptedData bytes], "Glul", 4) != 0) {
            NSLog(@"Glulx (.ulx) game file at path \"%@\" has wrong magic number2", self.path);
        } else {
            // verify checksum
            const uint32_t expectedChecksum = [self checksum];
            const uint32_t checksum = [self int32AtOffset:TFGlulxHeaderChecksumOffset];
            if (checksum != expectedChecksum) {
                NSLog(@"Glulx (.ulx) game file at path \"%@\" has checksum %lu, when it should have checksum %lu", (unsigned long)expectedChecksum, (unsigned long)checksum);
            } else {
                endMemory = [self int32AtOffset:TFGlulxHeaderEndMemoryOffset];
                if (self.endMemory > [decryptedData length]) {
                    NSLog(@"In Glulx (.ulx) game file at path \"%@\", endMemory value in header (%lu) is greater than length of encrypted bytes of file (%lu)", (unsigned long)self.endMemory, (unsigned long)[decryptedData length]);
                } else {
                    self.RAMStart = [self int32AtOffset:TFGlulxHeaderRAMStartOffset];
                
                    // cache original RAM and IFHD immediately so we don't have to decrypt again when saving

                    const uint32_t endMemoryOffset = [self int32AtOffset:TFGlulxHeaderEndMemoryOffset];
                    
                    void *originalHeaderBuffer = malloc(128);
                    memcpy(originalHeaderBuffer, [decryptedData bytes], 128);
                    originalHeader = [[NSData alloc] initWithBytesNoCopy:originalHeaderBuffer length:128];

                    const size_t originalRAMLength = endMemoryOffset - self.RAMStart;
                    void *originalRAMBuffer = malloc(originalRAMLength);
                    memcpy(originalRAMBuffer, [decryptedData bytes]+self.RAMStart, originalRAMLength);
                    originalRAM = [[NSData alloc] initWithBytesNoCopy:originalRAMBuffer length:originalRAMLength];
                
                    succeeded = YES;
                }
            }
        }
    }
    
    if (succeeded == NO) {
        [self cleanup];
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
- (uint32_t)int32AtOffset:(NSUInteger)offset {
    NSAssert(decryptedData != nil, @"int32AtOffset: called when decryptedData is nil!");
    
    return NSSwapBigIntToHost(*((uint32_t *)([decryptedData bytes]+offset)));
}

- (uint32_t)checksum {
    NSAssert(decryptedData != nil, @"checksum called when decryptedData is nil!");
    
    uint32_t result = 0;

    uint32_t end = [self int32AtOffset:TFGlulxHeaderExtensionStartOffset];

    uint32_t sum = (uint32_t)(-[self int32AtOffset:TFGlulxHeaderChecksumOffset]);

    if (end % 256 != 0) {
        NSLog(@"Glulx 1.2 specification says ENDMEM % 256 == 0, but it instead is %lu", end % 256);
    } else {
        for (uint32_t i = 0; i < end; i += 4) {
            sum += [self int32AtOffset:i];
        }
        
        result = sum;
    }

    return result;
}

- (uint32_t)endMemory {
    NSAssert(decryptedData != nil, @"endMemory called when decryptedData is nil!");
    
    return endMemory;
}

- (void)setEndMemory:(uint32_t)newEndMemory {
    NSAssert(NO, @"setEndMemory: not yet implemented!");
}

- (NSUInteger)majorVersion {
    NSAssert(decryptedData != nil, @"majorVersion called when decryptedData is nil!");
    
    uint32_t version = [self int32AtOffset:TFGlulxHeaderVersionOffset];

    return version >> 16;
}
- (NSUInteger)minorVersion {
    NSAssert(decryptedData != nil, @"minorVersion called when decryptedData is nil!");
    
    uint32_t version = [self int32AtOffset:TFGlulxHeaderVersionOffset];
    
    return (version >> 8) & 0xFF;
}


- (void)cleanup {
    [path release], path = nil;
    [decryptedData release], decryptedData = nil;
    [originalHeader release], originalHeader = nil;
    [originalRAM release], originalRAM = nil;
}

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end