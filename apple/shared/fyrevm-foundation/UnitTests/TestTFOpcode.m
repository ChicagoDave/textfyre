//
//  TestTFOpcode.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFOpcode.h"

#import "TFOpcode.h"


@implementation TestTFOpcode

- (void)testOpcodeDictionary {
    NSDictionary *opcodeDictionary = [TFOpcode opcodeDictionary];
    
    STAssertNotNil(opcodeDictionary, @"opcodeDictionary is nil. See log for details.");
}

@end
