//
//  TFHeapAllocator.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

@class TFEngine;

/*! \brief Manages the heap size and block allocation for the malloc/mfree opcodes.

    Comment from Windows codebase: If Inform ever starts using the malloc opcode directly, instead of its own heap allocator, this should be made a little smarter. Currently we make no attempt to avoid heap fragmentation.
    
    Does that mean that this isn't used at all? If so, then it probably doesn't need to be ported. As of now, I'm not porting over the concept of a "memory requester" delegate, since only one delegate is ever actually used in the Windows version.
 */
@interface TFHeapAllocator : NSObject {

@private
    TFEngine *engine; // Not retained

    uint32_t heapAddress;

    NSMutableArray *blocks;    // sorted
    NSMutableArray *freeList;  // sorted

    uint32_t endMem;
    uint32_t heapExtent;
    uint32_t maxHeapExtent;
}

/*! Initializes a new allocator with an empty heap.

    \param heapAddress The address where the heap will start.
 */
- (id)initWithEngine:(TFEngine *)engine heapAddress:(uint32_t)heapAddress;

/*! Initializes a new allocator from a previous saved heap state.

    \param savedHeap A data object describing the heap state, as returned by the #save.
    \param requester A delegate to request more memory.
 */
- (id)initWithEngine:(TFEngine *)engine savedHeap:(NSData *)savedHeap;

/*! The address where the heap starts. */
@property (readonly) uint32_t address;

/*! The size of the heap, in bytes. */
@property (readonly) uint32_t size;

/*! \brief Gets or sets the maximum allowed size of the heap, in bytes, or 0 to allow an unlimited heap.

    When a maximum size is set, memory allocations will be refused if they would cause the heap to grow past the maximum size. Setting the maximum size to less than the current <see cref="Size"/> is allowed, but such a value will have no effect until deallocations cause the heap to shrink below the new maximum size.
 */
@property uint32_t maxSize;

/*! The number of blocks that the allocator is managing. */
@property (readonly) NSUInteger blockCount;

/*! Saves the heap state to a data object.

    \return A data object describing the current heap state.
 */
- (NSData *)save;

/*! Allocates a new block on the heap.

    \param size The size of the new block, in bytes.

    \return The address of the new block, or 0 if allocation failed.
 */
- (uint32_t)alloc:(uint32_t)size;

/*! Deallocates a previously allocated block.

    \param address The address of the block to deallocate.
 */
- (void)free:(uint32_t)address;

- (void)coalesceRangesStartingAtIndex:(NSUInteger)index;

@end

@interface NSValue (TFCompareToRange)

/*! \brief Comparison method for NSValue objects that represent an NSRange.

    The unusual name is to prevent naming collisions. There is almost certainly an official compare: method for most concrete NSValue subclasses.
 */
- (NSComparisonResult)TFCompareToRange:(NSValue *)otherRangeValue;

@end

/*! Core Foundation-level comparison function, used in in call to CFArrayBSearchValues. */
CFComparisonResult TFRangeComparatorFunction(const void *rangeValue1, const void *rangeValue2, void *context);
