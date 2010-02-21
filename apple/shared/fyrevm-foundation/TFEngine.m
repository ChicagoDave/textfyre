//
//  TFEngine.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine.h"

#import "TFUlxImage.h"
#import "GlulxConstants.h"
#import "TFOpcode.h"

static const NSUInteger TFEngineFirstMajorVersion = 2;
static const NSUInteger TFEngineFirstMinorVersion = 0;
static const NSUInteger TFEngineLastMajorVersion = 3;
static const NSUInteger TFEngineLastMinorVersion = 1;

@implementation TFEngine

#pragma mark Private methods

/*! Attempts to fill in opcode dictionary.

    On failure, technical details will be printed to Console.
 */
- (BOOL)initOpcodeDictionary {
    opcodeDict = [[TFOpcode opcodeDictionary] retain];
    
    return (opcodeDict != nil);
}

/*! Compares version numbers of image to what this game engine supports.

    On failure, technical details will be printed to Console.
 */
- (BOOL)isImageVersionCompatible:(TFUlxImage *)theImage {
    NSUInteger majorVersion = [theImage majorVersion];
    NSUInteger minorVersion = [theImage minorVersion];

    BOOL result =
        (majorVersion < TFEngineFirstMajorVersion ||
        (majorVersion == TFEngineFirstMajorVersion && minorVersion < TFEngineFirstMinorVersion) ||
        majorVersion > TFEngineLastMajorVersion ||
        (majorVersion == TFEngineLastMajorVersion && minorVersion > TFEngineLastMinorVersion));

    if (result == NO) {
        NSLog(@"Glulx (.ulx) game file at path \"%@\" has major version %lu and minor version %lu, which are not compatible with this game engine's first major version number %lu, first minor version number %lu, last major version number %lu, last minor version number %lu", 
                theImage.path, 
                (unsigned long)majorVersion,
                (unsigned long)minorVersion,
                (unsigned long)TFEngineFirstMajorVersion,
                (unsigned long)TFEngineFirstMinorVersion,
                (unsigned long)TFEngineLastMajorVersion,
                (unsigned long)TFEngineLastMinorVersion);
    }
    
    return result;
}

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is called by -loadGameImageFromPath: on failure.
 */
- (void)cleanup {
    [opcodeDict release], opcodeDict = nil;

    [image  cleanup], [image release], image = nil;

    [stack release], stack = nil;


    [stack release], stack = nil;
}

#pragma mark APIs

- (BOOL)loadGameImageFromPath:(NSString *)path {
    NSAssert(image == nil, @"loadGameImageFromPath: called when image has already been set to something!");

    BOOL result = NO;
    
    image = [[TFUlxImage alloc] init];
    
    if ([image loadFromPath:path]) {
    
        if ([self isImageVersionCompatible:image]) {
            uint32_t stackSize = [image int32AtOffset:TFGlulxHeaderStackSizeOffset];
            stack = [[NSMutableData alloc] initWithLength:stackSize];

            result = [self initOpcodeDictionary];
        }
    }
    
    if (result == NO) {
        [self cleanup];
    }

    return result;
}

#pragma mark APIs for Opcodes

#pragma mark Standard methods

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end
