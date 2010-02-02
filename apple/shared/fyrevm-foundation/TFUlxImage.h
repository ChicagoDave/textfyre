//
//  TFUlxImage.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


/*! Represents the ROM and RAM of a Glulx game image.

    Currently assumes the loaded game image is encrypted, and will throw if it isn't.
 */
@interface TFUlxImage : NSObject {

@private
    /*! Cached copy of entirety of decrypted contents of file */
    NSMutableData *decryptedData;
    
    uint32_t RAMStart;
    uint32_t endMemory;
    
    NSData *originalHeader;
    NSData *originalRAM;
}

/*! Attempts to load Glulx (.ulx) game image file into memory and decrypt it. 

    On success, the other APIs of this class can be used to access the memory of that game image.

    On failure, technical details will be printed to Console.

    \param path Full path to Glulx (.ulx) file.
 */
- (BOOL)loadFromPath:(NSString *)path;

/*! Gets the address at which RAM begins.

    The region of memory below RAMStart is considered ROM. Addresses below RAMStart are readable but unwritable.
 */
@property (readonly) uint32_t RAMStart;

/*! Gets or sets the address at which memory ends.

    This can be changed by the game with @setmemsize (or managed automatically by the heap allocator). Addresses above EndMem are neither readable nor writable.
 */
@property uint32_t endMemory;

- (uint32_t)int32AtOffset:(NSUInteger)offset;

/*! Calculates the checksum of the image.

    \result The sum of the entire image, taken as an array of 32-bit words.
 */
- (uint32_t)checksum;

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is also called by -loadFromPath:.
 */
- (void)cleanup;

@end
