//
//  TFHeapAllocator.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFHeapAllocator.h"

#import "TFEngine.h"
#import "TFUlxImage.h"


@implementation TFHeapAllocator

@synthesize address = heapAddress;
@synthesize size = heapExtent;
@synthesize maxSize = maxHeapExtent;

- (id)initWithEngine:(TFEngine *)theEngine heapAddress:(uint32_t)theHeapAddress {
    self = [super init];

    engine = theEngine;

    heapAddress = heapAddress;

    blocks = [[NSMutableArray alloc] init];
    freeList = [[NSMutableArray alloc] init];

    endMem = heapAddress;
    
    return self;
}

#define TFDataIntegerFromAtAddress(data, address) \
    NSSwapBigIntToHost(*((uint32_t *)([data bytes] + (address))))

- (id)initWithEngine:(TFEngine *)theEngine savedHeap:(NSData *)savedHeap {
    self = [super init];

    engine = theEngine;

    heapAddress = TFDataIntegerFromAtAddress(savedHeap, 0);

    uint32_t numBlocks = TFDataIntegerFromAtAddress(savedHeap, 4);

    blocks = [[NSMutableArray alloc] initWithCapacity:numBlocks];
    freeList = [[NSMutableArray alloc] init];

    uint32_t nextAddress = heapAddress;

    for (uint32_t i = 0; i < numBlocks; i++) {
        uint32_t start = TFDataIntegerFromAtAddress(savedHeap, 8 * i + 8);
        uint32_t length = TFDataIntegerFromAtAddress(savedHeap, 8 * i + 12);
        [blocks addObject:[NSValue valueWithRange:NSMakeRange(start,length)]];

        if (nextAddress < start) {
            [freeList addObject:[NSValue valueWithRange:NSMakeRange(nextAddress, start - nextAddress)]];
        }

        nextAddress = start + length;
    }

    endMem = nextAddress;
    heapExtent = nextAddress - heapAddress;

    engine.image.endMemory = endMem;

    [blocks sortUsingSelector:@selector(compare:)];
    [freeList sortUsingSelector:@selector(compare:)];
    
    return self;
}

- (NSUInteger)blockCount {
    return [blocks count];
}

#define TFDataWriteIntegerToAddress(data, address, value) \
    temp = NSSwapHostIntToBig(value); \
    [data replaceBytesInRange:NSMakeRange(address, sizeof(uint32_t)) withBytes:&temp length:sizeof(uint32_t)];

- (NSData *)save {
    NSMutableData *result = [NSMutableData dataWithLength:8 + [blocks count] * 8];

    uint32_t temp;

    TFDataWriteIntegerToAddress(result, 0, heapAddress);
    TFDataWriteIntegerToAddress(result, 4, (uint32_t)[blocks count]);
    for (NSUInteger i = 0; i < [blocks count]; i++) {
        NSRange range = [[blocks objectAtIndex:i] rangeValue];
    
        TFDataWriteIntegerToAddress(result, 8 * i + 8, range.location);
        TFDataWriteIntegerToAddress(result, 8 * i + 12, range.length);
    }

    return result;
}

#define TFArrayBinarySearchArrayForRange(array, range) \
    (NSUInteger)CFArrayBSearchValues((CFArrayRef)array, \
                                     CFRangeMake(0, (CFIndex)[array count]), \
                                     [NSValue valueWithRange:range], \
                                     TFRangeComparatorFunction, NULL)

- (uint32_t)alloc:(uint32_t)size {
    NSRange result = NSMakeRange(0, size);

    // look for a free block
    for (int i = 0; i < [freeList count]; i++)
    {
        NSRange entry = [[freeList objectAtIndex:i] rangeValue];
        if (entry.location >= size)
        {
            result.location = entry.location;

            if (entry.length > size)
            {
                // shrink the free block
                entry.location += size;
                entry.length -= size;
                [freeList replaceObjectAtIndex:i withObject:[NSValue valueWithRange:entry]];
            } else {
                [freeList removeObjectAtIndex:i];
            }

            break;
        }
    }

    if (result.location == 0) {
        // enforce maximum heap size
        if (maxHeapExtent != 0 && heapExtent + size > maxHeapExtent) {
            return 0;
        }

        // add a new block at the end
        result = NSMakeRange(heapAddress + heapExtent, size);

        if (heapAddress + heapExtent + size > endMem) {
            // grow the heap, but not by too little
            const uint32_t fiveFourthsGrowth = heapExtent * 5 / 4;
            const uint32_t exactSizeGrowth = heapExtent + size;
            
            uint32_t newHeapAllocation = (fiveFourthsGrowth > exactSizeGrowth ? fiveFourthsGrowth : exactSizeGrowth);

            if (maxHeapExtent != 0) {
                newHeapAllocation = (newHeapAllocation < maxHeapExtent ? newHeapAllocation : maxHeapExtent);
            }

            @try {
                engine.image.endMemory = heapAddress + newHeapAllocation;
                endMem = heapAddress + newHeapAllocation;
            } @catch (...) {
                return 0;
            }
        }

        heapExtent += size;
    }

    NSUInteger index = TFArrayBinarySearchArrayForRange(blocks, result);
    NSAssert(index < [blocks count], @"TODO");
    [blocks insertObject:[NSValue valueWithRange:result] atIndex:index];

    return result.location;
}

- (void)free:(uint32_t)address {
    NSRange entry = NSMakeRange(address, 0);
    NSUInteger index = TFArrayBinarySearchArrayForRange(blocks, entry);
    if (index >= 0) {
        // delete the block
        entry = [[blocks objectAtIndex:index] rangeValue];
        [blocks removeObjectAtIndex:index];

        // adjust the heap extent if necessary
        if (entry.location + entry.length - heapAddress == heapExtent) {
            if (index == 0) {
                heapExtent = 0;
            } else {
                NSRange prev = [[blocks objectAtIndex:index - 1] rangeValue];
                heapExtent = prev.location + prev.length - heapAddress;
            }
        }

        // add the block to the free list
        index = TFArrayBinarySearchArrayForRange(freeList, entry);
        NSAssert(index >= 0, @"TODO");
        [freeList insertObject:[NSValue valueWithRange:entry] atIndex:index];

        if (index < [freeList count] - 1) {
            [self coalesceRangesAtIndex1:index index2:index + 1];
        }
        if (index > 0) {
            [self coalesceRangesAtIndex1:index - 1 index2:index];
        }

        // shrink the heap if necessary
        if ([blocks count] > 0 && heapExtent <= (endMem - heapAddress) / 2) {
            @try {
                engine.image.endMemory = heapAddress + heapExtent;

                endMem = heapAddress + heapExtent;

                for (int i = [freeList count] - 1; i >= 0; i--) {
                    if ([[freeList objectAtIndex:i] rangeValue].location >= endMem) {
                        [freeList removeObjectAtIndex:i];
                    }
                }
            } @catch (...) {
            }
        }
    }
}

- (void)coalesceRangesAtIndex1:(NSUInteger)index1 index2:(NSUInteger)index2 {
    NSRange first = [[freeList objectAtIndex:index1] rangeValue];
    NSRange second = [[freeList objectAtIndex:index2] rangeValue];

    if (first.location + first.length >= second.location)
    {
        first.length = second.location + second.length - first.location;
        [freeList replaceObjectAtIndex:index1 withObject:[NSValue valueWithRange:first]];
        [freeList removeObjectAtIndex:index2];
    }
}

@end

@implementation NSValue (TFCompareToRange)

- (NSComparisonResult)TFCompareToRange:(NSValue *)otherRangeValue {
    return (NSComparisonResult)TFRangeComparatorFunction(self, otherRangeValue, NULL);
}

@end

CFComparisonResult TFRangeComparatorFunction(const void *rangeValue1, const void *rangeValue2, void *context) {
    NSRange range = [(id)rangeValue1 rangeValue];
    NSRange otherRange = [(id)rangeValue2 rangeValue];

    if (range.location < otherRange.location) {
        return -1;
    } else if (range.location > otherRange.location) {
        return 1;
    } else {
        if (range.length < otherRange.length) {
            return -1;
        } else if (range.length > otherRange.length) {
            return 1;
        }
    }
    
    return 0;
}
