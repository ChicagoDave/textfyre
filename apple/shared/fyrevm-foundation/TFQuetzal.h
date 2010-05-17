//
//  TFQuetzal.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

#pragma mark Exposed for testing ONLY, DO NOT USE

typedef enum {
    TFQuetzalNoLoadError = 0,
    TFQuetzalErrorReadingFileContents = 1,
    TFQuetzalFileShorterThanHeader = 2,
    TFQuetzalHeaderTypeUnsupported = 3,
    TFQuetzalHeaderLengthTooShort = 4,
    TFQuetzalHeaderSubtypeUnsupported = 5,
    TFQuetzalFileNotEqualToLength = 6,
    TFQuetzalChunkTooShort = 7,
    TFQuetzalFileShorterThanChunk = 8
} TFQuetzalLoadError;

/*! \brief Implements the Quetzal saved game session file specification by holding a list of typed data chunks which can be read from or written to streams.

    http://www.ifarchive.org/if-archive/infocom/interpreters/specification/savefile_14.txt
*/
@interface TFQuetzal : NSObject {

@private
    NSMutableDictionary *chunks;
    
    /*! \brief Hack to preserve order of first setting of chunks. Used to ensure standard order of chunks, for sake of unit test binary comparison.
    
        May need to be redesigned if setChunk:forType: is called many times. 
    */
    NSMutableArray *typeAddOrder;
}

#pragma mark APIs

/*! \brief Loads a collection of chunks from a Quetzal file.

    Name of method is patterned after similar system method +[NSData dataWithContentsOfFile:].

    Duplicate chunks are not supported by this class. Only the last chunk of a given type will be available.
    
    \param path Full path of Quetzal saved game session file. Method will assert on nil or blank path.
    
    On success, returns non-nil TFQuetzal instance.
    
    On failure, returns nil, at which point technical details will be printed to Console.
*/
+ (TFQuetzal *)gameSessionWithContentsOfFile:(NSString *)path;

/*! Gets typed data chunk.

    \param type The 4-character type identifier, written in code in the form 'ABCD'.
*/
- (NSData *)chunkForType:(uint32_t)type;

/*! Sets typed data chunk.

    \param type The 4-character type identifier, written in code in the form 'ABCD'.
*/
- (void)setChunk:(NSData *)chunk forType:(uint32_t)type;

/*! \brief Writes the chunks to a Quetzal file.

    \param path Full path of Quetzal file to write to.
    
    \param On failure, contains an NSError object that describes the error writing out the data.

    On success, returns YES.
    
    On failure, returns NO. Does *not* print anything to Console.
 */
- (BOOL)writeToFile:(NSString *)path error:(NSError **)error;

/*! Compresses a block of memory by comparing it with the original version from the game file.

    \param memory data containing changed memory to be compressed.
    \param range location and length of changed memory within data.
    \param originalMemory data containing original memory.
    \param originalRange location and length of original memory within data.

    \return the RLE-compressed set of differences between the original and changed memory blocks, prefixed with a 4-byte length of uncompressed changed memory.
*/
+ (NSData *)compressMemory:(NSData *)memory range:(NSRange)range
            originalMemory:(NSData *)originalMemory originalRange:(NSRange)originalRange;

/*! Reconstitutes a changed block of memory by applying a compressed set of differences to the original block from the game file.

    \param originalMemory the original block of memory.
    \param delta the RLE-compressed set of differences, prefixed with a 4-byte length. This length may be larger than the original block, but not smaller.
    \return the changed block of memory.The length of this array is specified at the beginning of delta.
*/
+ (NSData *)decompressMemory:(NSData *)originalMemory delta:(NSData *)delta;

#pragma mark Exposed for testing ONLY, DO NOT USE

/*! \brief Loads a collection of chunks from a Quetzal file. See gameSessionWithContentsOfFile: for more details.

    Provides additional information on failure for sake of unit tests.

    \param errorString On failure, set to error string (minus initial prefix section identifying path of file) that should be printed to Console.
    \param errorCode On failure, set to TFQuetzalLoadError value.
 */
+ (TFQuetzal *)gameSessionWithContentsOfFile:(NSString *)path errorString:(NSString **)errorString errorCode:(TFQuetzalLoadError *)errorCode;

@end
