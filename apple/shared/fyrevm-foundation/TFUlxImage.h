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
    NSData *_decryptedData;
    
    uint32_t RAMStart;
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

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is also called by -loadFromPath:.
 */
- (void)cleanup;

@end
