//
//  TestTFEngine.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFEngine.h"

#import "TFEngine.h"

@implementation TestTFEngine

- (void)testOpcodeDictionary {
    TFEngine *engine = [[TFEngine alloc] init];
    STAssertTrue([engine initOpcodeDictionary], @"See log for details.");
    
    [engine release];
}

@end
