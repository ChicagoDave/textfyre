//
//  TestTFEngine.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFEngine.h"

#import "TFEngine.h"

@interface TFTestVersionsUlxImage : NSObject {
    NSUInteger majorVersion;
    NSUInteger minorVersion;
}

+ (TFTestVersionsUlxImage *)fauxImageWithMajorVersion:(NSUInteger)majorVersion minorVersion:(NSUInteger)minorVersion;

- (NSString *)path;

@property (readonly) NSUInteger majorVersion;
@property (readonly) NSUInteger minorVersion;

@end

@implementation TFTestVersionsUlxImage

@synthesize majorVersion;
@synthesize minorVersion;

+ (TFTestVersionsUlxImage *)fauxImageWithMajorVersion:(NSUInteger)majorVersion minorVersion:(NSUInteger)minorVersion {
    TFTestVersionsUlxImage *result = [[[TFTestVersionsUlxImage alloc] init] autorelease];
    
    result->majorVersion = majorVersion;
    result->minorVersion = minorVersion;
    
    return result;
}

- (NSString *)path {
    return @"TESTING";
}

@end

@implementation TestTFEngine

- (void)testEngine:(TFEngine *)engine withImageWithMajorVersion:(NSUInteger)majorVersion minorVersion:(NSUInteger)minorVersion expectedToPass:(BOOL)expectedToPass {
    TFTestVersionsUlxImage *image = [TFTestVersionsUlxImage fauxImageWithMajorVersion:majorVersion minorVersion:minorVersion];
    
    STAssertEquals([engine isImageVersionCompatible:(TFUlxImage *)image], expectedToPass, @"Image with major version %lu and minor version %lu is%@ expected to pass isImageVersionCompatible:, but does%@ pass.",
        (unsigned long)majorVersion,
        (unsigned long)minorVersion,
        (expectedToPass ? @"" : @" not"),
        (expectedToPass ? @" not" : @""));
}

- (void)testIsImageVersionCompatible {
    TFEngine *engine = [[TFEngine alloc] init];
    
    [self testEngine:engine withImageWithMajorVersion:0 minorVersion:0 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:0 minorVersion:1 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:1 minorVersion:1 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:1 minorVersion:1000 expectedToPass:NO];

    [self testEngine:engine withImageWithMajorVersion:2 minorVersion:0 expectedToPass:YES];
    [self testEngine:engine withImageWithMajorVersion:2 minorVersion:1 expectedToPass:YES];
    [self testEngine:engine withImageWithMajorVersion:2 minorVersion:1000 expectedToPass:YES];
    [self testEngine:engine withImageWithMajorVersion:3 minorVersion:0 expectedToPass:YES];
    [self testEngine:engine withImageWithMajorVersion:3 minorVersion:1 expectedToPass:YES];

    [self testEngine:engine withImageWithMajorVersion:3 minorVersion:2 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:3 minorVersion:1000 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:4 minorVersion:0 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:4 minorVersion:1000 expectedToPass:NO];
    [self testEngine:engine withImageWithMajorVersion:1000 minorVersion:1000 expectedToPass:NO];
    
    [engine release];
}

- (void)testOpcodeDictionary {
    TFEngine *engine = [[TFEngine alloc] init];
    STAssertTrue([engine initOpcodeDictionary], @"See log for details.");
    
    [engine release];
}

@end
