//
//  TestTFHeapAllocator.m
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFHeapAllocator.h"

#import "TFHeapAllocator.h"

typedef struct _RangeTest {
    NSRange range;
    NSUInteger desiredIndex;
} RangeTest;

@implementation TestTFHeapAllocator

- (void)testRangeComparisonWithName:(NSString *)name rangeTests:(RangeTest *)rangeTests count:(NSUInteger)count {
    NSMutableArray *desiredArray = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; ++i) {
        [desiredArray addObject:[NSNull null]];
    }

    NSMutableArray *initialArray = [NSMutableArray array];

    for (size_t i = 0; i < count; ++i) {
        NSValue *value = [NSValue valueWithRange:rangeTests[i].range];
    
        [initialArray addObject:value];
        
        [desiredArray replaceObjectAtIndex:rangeTests[i].desiredIndex withObject:value];
    }
    
    NSArray *sortedArray = [initialArray sortedArrayUsingSelector:@selector(TFCompareToRange:)];
    
    STAssertEqualObjects(sortedArray, desiredArray, @"For test \"%@\", sorted array should be %@, but instead is %@", name, desiredArray, sortedArray);

    for (NSUInteger i = 0; i < count; ++i) {
        NSValue *value = [sortedArray objectAtIndex:i];
    
        NSUInteger index = 
            (NSUInteger)CFArrayBSearchValues((CFArrayRef)sortedArray,
                                             CFRangeMake(0, (CFIndex)[sortedArray count]),
                                             value,
                                             TFRangeComparatorFunction, NULL);  

        STAssertEquals(index, i, @"For test \"%@\", sorted array %@, %@ should be found in binary search at index %lu, but instead was found at index %lu", name, sortedArray, value, (unsigned long)i, (unsigned long)index);
    }
}

static RangeTest kRangeTests1[] = {
    { {3,  3}, 4 },
    { {0,  3}, 1 },
    { {0,  1}, 0 },
    { {2, 10}, 3 },
    { {1,  1}, 2 }
};
static const size_t kRangeTests1Count = sizeof(kRangeTests1) / sizeof(RangeTest);

// TODO add more sets of tests

- (void)testRangeComparison {
    [self testRangeComparisonWithName:@"kRangeTests1" rangeTests:kRangeTests1 count:kRangeTests1Count];
}

@end
