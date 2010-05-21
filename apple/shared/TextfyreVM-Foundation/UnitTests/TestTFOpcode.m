//
//  TestTFOpcode.m
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFOpcode.h"

#import "TFOpcode.h"


@implementation TestTFOpcode

- (void)testOpcodeDictionary {
    NSDictionary *opcodeDictionary = [TFOpcode opcodeDictionary];
    
    STAssertNotNil(opcodeDictionary, @"See log for details.");
}

@end
