//
//  TFUlxImage.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


/*! Represents the ROM and RAM of a Glulx game image.

    Glulx specification available at http://www.eblong.com/zarf/glulx/glulx-spec.html

    Currently assumes the loaded game image is encrypted, and will throw if it isn't.
 */
@interface TFUlxImage : NSObject {

@private
    NSString *path;

    /*! Cached copy of entirety of decrypted contents of file 
    
        Equivalent to "memory" variable of Windows codebase. However, unlike "memory", the length of decryptedData is the length of what we read in from disk, not the original endMemory value from the Glulx header, so it could be longer.
     */
    NSMutableData *decryptedData;
    
    uint32_t RAMStart;
    uint32_t endMemory;
    
    NSData *originalHeader;
    NSData *originalRAM;
}

/*! Attempts to load Glulx (.ulx) game image file into memory, decrypt it, and verify it. 

    On success, returns YES, at which point the other APIs of this class can be used to access the memory of that game image.

    On failure, returns NO, at which point technical details will be printed to Console.

    \param path Full path to Glulx (.ulx) file.
 */
- (BOOL)loadFromPath:(NSString *)path;

@property (readonly, retain) NSString *path;

/*! Gets the address at which RAM begins.

    The region of memory below RAMStart is considered ROM. Addresses below RAMStart are readable but unwritable.
 */
@property (readonly) uint32_t RAMStart;

/*! Gets or sets the address at which memory ends.

    This can be changed by the game with @setmemsize (or managed automatically by the heap allocator). Addresses above endMemory are neither readable nor writable.
 */
@property uint32_t endMemory;

#pragma mark -

/*! Returns a single unsigned byte from memory.

    \param offset The address to read from.

    \return The unsigned 8-bit value at the specified address.
 */
- (uint8_t)byteAtOffset:(uint32_t)offset;

/*! Returns a big-endian unsigned 16-bit short from memory.

    \param offset The address to read from.

    \return The unsigned 16-bit value at the specified address.
 */
- (uint16_t)shortAtOffset:(uint32_t)offset;

/*! Returns a big-endian unsigned 32-bit integer from memory.

    \param offset The address to read from.

    \return The unsigned 32-bit value at the specified address.
 */
- (uint32_t)integerAtOffset:(NSUInteger)offset;

#pragma mark -

/*! Set a single unsigned byte in memory.

    \param value The value to set.
    \param offset The address to write to.
 */
- (void)setByte:(uint8_t)value atOffset:(uint32_t)offset;

/*! Sets a big-endian unsigned 16-bit word in memory.

    \param value The value to set.
    \param offset The address to write to.
 */
- (void)setShort:(uint16_t)value atOffset:(uint32_t)offset;

/*! Sets a big-endian unsigned 32-bit integer in memory.

    \param value The value to set.
    \param offset The address to write to.
 */
- (void)setInteger:(uint32_t)value atOffset:(uint32_t)offset;

#pragma mark -

/*! Calculates the checksum of the image.

    \result The sum of the entire image, taken as an array of 32-bit words.
 */
- (uint32_t)checksum;

/*! Returns major version number from image header. */
- (NSUInteger)majorVersion;
/*! Returns minor version number from image header. 

    Author writes in specification, "I will try to maintain the convention that minor version changes are backwards compatible."
*/
- (NSUInteger)minorVersion;

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is also called by -loadFromPath: on failure.
 */
- (void)cleanup;

@end
