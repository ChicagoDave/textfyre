//
//  TFArguments.h
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


#define TFArgumentsMaxArrayCount      3

/*! \brief Custom object for holding the kind of arguments needed by the FyreVM. 

    Could use a standard NSMutableArray, but that would mean continually boxing and unboxing uint32_t values into NSNumber objects.
    
    Needs to be an object, rather than a struct or a C array, because the callee will change these values, and the caller will want access to those changed values.
    
    For arguments of low count, storage that comes with this object is used. Otherwise, storage is explicitly allocated and freed.
 */
@interface TFArguments : NSObject {

@private
    NSUInteger count;
    union {
        uint32_t array[TFArgumentsMaxArrayCount];
        uint32_t *pointer;
    } args;
}

+ (TFArguments *) arguments;
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0;
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0 arg:(uint32_t)argAtIndex1;
+ (TFArguments *) argumentsWithArg:(uint32_t)argAtIndex0 arg:(uint32_t)argAtIndex1 arg:(uint32_t)argAtIndex2;

/*! All arguments are set to 0. */
+ (TFArguments *) argumentsWithCount:(uint32_t)count;

@property (readonly) NSUInteger count;

- (uint32_t)argAtIndex:(NSUInteger)index;
- (void)setArg:(uint32_t)arg atIndex:(NSUInteger)index;

@end