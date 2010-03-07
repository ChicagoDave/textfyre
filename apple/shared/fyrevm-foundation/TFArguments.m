//
//  TFArguments.m
//  fyrep-cocoa
//
//  Created by Andrew Pontious on 3/3/10.
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//

#import "TFArguments.h"

@interface TFArguments ()

@property (readwrite) NSUInteger count;

@end


@implementation TFArguments

@synthesize count;

+ (TFArguments *) arguments {
    return [[[TFArguments alloc] init] autorelease];
}
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0 {
    TFArguments *result = [[[TFArguments alloc] init] autorelease];
    
    result.count = 1;

    [result setArg:argAtIndex0 atIndex:0];
    
    return result;
}
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0 arg:(uint32_t)argAtIndex1 {
    TFArguments *result = [[[TFArguments alloc] init] autorelease];
    
    result.count = 2;

    [result setArg:argAtIndex0 atIndex:0];
    [result setArg:argAtIndex1 atIndex:1];
    
    return result;
}
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0 arg:(uint32_t)argAtIndex1 arg:(uint32_t)argAtIndex2 {
    TFArguments *result = [[[TFArguments alloc] init] autorelease];
    
    result.count = 3;

    [result setArg:argAtIndex0 atIndex:0];
    [result setArg:argAtIndex1 atIndex:1];
    [result setArg:argAtIndex2 atIndex:2];
    
    return result;
}

+ (TFArguments *) argumentsWithCount:(uint32_t)count {
    TFArguments *result = [[[TFArguments alloc] init] autorelease];
    
    result.count = count;
    
    if (count > TFArgumentsMaxArrayCount) {
        result->args.pointer = malloc(sizeof(uint32_t) * count);
    }
    
    return result;
}

- (uint32_t)argAtIndex:(NSUInteger)index {
    NSAssert2(index < self.count, @"Attempting to get value from TFArguments %@ with index %lu, when argument count is %lu",
              (unsigned long)index, (unsigned long)self.count);
    
    if (self.count > TFArgumentsMaxArrayCount) {
        return args.pointer[index];
    } else {
        return args.array[index];
    }
    
    return 0;
}
- (void)setArg:(uint32_t)arg atIndex:(NSUInteger)index {
    NSAssert2(index < self.count, @"Attempting to set value in TFArguments %@ with index %lu, when argument count is %lu",
              (unsigned long)index, (unsigned long)self.count);
    
    if (self.count > TFArgumentsMaxArrayCount) {
        args.pointer[index] = arg;
    } else {
        args.array[index] = arg;
    }
}

- (NSString *)description {
    NSMutableString *result = [NSMutableString stringWithFormat:@"<%@ %p> count %lu", [self class], self, (unsigned long)self.count];
    if (self.count > 0) {
        [result appendString:@" {"];
        for (NSUInteger i = 0; i < self.count; ++i) {
            [result appendFormat:@" %lu", (unsigned long)[self argAtIndex:i]];
        }
        [result appendString:@" }"];
    }
    return result;
}

- (void)dealloc {
    if (self.count > TFArgumentsMaxArrayCount) {
        free(args.pointer), args.pointer = NULL;
    }

    [super dealloc];
}

@end
