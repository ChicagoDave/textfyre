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

static const NSUInteger TFEngineFirstMajorVersion = 2;
static const NSUInteger TFEngineFirstMinorVersion = 0;
static const NSUInteger TFEngineLastMajorVersion = 3;
static const NSUInteger TFEngineLastMinorVersion = 1;

@implementation TFEngine

- (void)initOpcodeDictionary {
    // TODO
}

- (BOOL)loadGameImageFromPath:(NSString *)path {
    NSAssert(image == nil, @"loadGameImageFromPath: called when image has already been set to something!");

    BOOL result = NO;
    
    image = [[TFUlxImage alloc] init];
    
    if ([image loadFromPath:path]) {
    
        if ([self isImageVersionCompatible:image]) {
            uint32_t stackSize = [image int32AtOffset:TFGlulxHeaderStackSizeOffset];
            stack = [[NSMutableData alloc] initWithLength:stackSize];

            [self initOpcodeDictionary];
        
            result = YES;
        }
    }
    
    if (result == NO) {
        [image cleanup];
    }

    return result;
}

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

- (void)cleanup {
    [image cleanup], [image release], image = nil;
    [stack release], stack = nil;
}

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end
