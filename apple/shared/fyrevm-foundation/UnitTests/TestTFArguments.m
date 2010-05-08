//
//  TestTFArguments.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFArguments.h"

#import "TFArguments.h"


@implementation TestTFArguments

- (TFArguments *)makeArgsFromArgsAsArray:(NSArray *)argsAsArray {
    TFArguments *result = nil;
    
    switch ([argsAsArray count]) {
        case 0:
            result = [TFArguments arguments];
            break;
        case 1:
            result = [TFArguments argumentsWithArg:[[argsAsArray objectAtIndex:0] unsignedIntegerValue]];
            break;
        case 2:
            result = [TFArguments argumentsWithArg:[[argsAsArray objectAtIndex:0] unsignedIntegerValue]
                                               arg:[[argsAsArray objectAtIndex:1] unsignedIntegerValue]];
            break;
        case 3:
            result = [TFArguments argumentsWithArg:[[argsAsArray objectAtIndex:0] unsignedIntegerValue]
                                               arg:[[argsAsArray objectAtIndex:1] unsignedIntegerValue]
                                               arg:[[argsAsArray objectAtIndex:2] unsignedIntegerValue]];
            break;
        default:
            result = [TFArguments argumentsWithCount:[argsAsArray count]];
            for (NSUInteger i = 0; i < [argsAsArray count]; ++i) {
                [result setArg:[[argsAsArray objectAtIndex:i] unsignedIntegerValue] atIndex:i];
            }
            break;
    }

    return result;
}

- (void)testArgumentsWithArgsInternal:(NSArray *)argsAsArray {
    TFArguments *args = [self makeArgsFromArgsAsArray:argsAsArray];
    
    STAssertEquals(args.count, [argsAsArray count], @"Count of args object %@, created from array of numbers %@, should be %lu, but is %lu", args, argsAsArray, (unsigned long)[argsAsArray count], (unsigned long)args.count);
    
    for (NSUInteger i = 0; i < [argsAsArray count]; ++i) {
        STAssertEquals([args argAtIndex:i], (uint32_t)[[argsAsArray objectAtIndex:i] unsignedIntegerValue], 
                       @"In args object %@, arg at index %lu should be %@, but instead is %lu",
                       args, (unsigned long)i, [argsAsArray objectAtIndex:i], (unsigned long)[args argAtIndex:i]);
    }
}

- (void)testArgumentsWithArgs:(NSArray *)argsAsArray {
    // Test it forwards
    [self testArgumentsWithArgsInternal:argsAsArray];
    
    // Now, for kicks, test it backwards
    NSMutableArray *reversedArgsAsArray = [NSMutableArray array];
    
    NSEnumerator *enumerator = [argsAsArray reverseObjectEnumerator];
    NSNumber *argValue = nil;
    while ((argValue = [enumerator nextObject]) != nil) {
        [reversedArgsAsArray addObject:argValue];
    }
    
    [self testArgumentsWithArgsInternal:reversedArgsAsArray];
}

- (void)testArgumentsWithArgCount:(NSUInteger)count {
    NSMutableArray *args = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < count; ++i) {
        [args addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    
    [self testArgumentsWithArgs:args];
}

- (void)testArguments {
    for (NSUInteger i = 0; i <= 200; ++i) {
        [self testArgumentsWithArgCount:i];
    }
}

@end
