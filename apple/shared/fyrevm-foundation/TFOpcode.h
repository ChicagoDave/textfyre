//
//  TFOpcode.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


@interface TFOpcode : NSObject {
    NSInteger opcode;
    SEL selector;
    NSInteger loadArgs;
    NSInteger storeArgs;
    NSString *ruleName;
}

/*! Designated initializer.

 \param opcode Number in Glulx game image that, when encountered, will trigger the use of the rest of this opcode object.
 \param name Name of this opcode. Used to look up a method of the same name (but with trailing colon) in TFEngine, that is invoked to do the opcode's work.
 \param loadArgs Number of arguments to load in for this opcode. May be zero.
 \param loadArgs Number of arguments to store in for this opcode. May be zero.
 \param ruleName Name of special rule to use with this opcode. May be nil. TODO: use enum?
 */
- (id)initWithOpcode:(NSInteger)opcode 
                name:(NSString *)name 
            loadArgs:(NSInteger)loadArgs 
           storeArgs:(NSInteger)storeArgs 
            ruleName:(NSString *)ruleName;

@property (readonly) NSInteger opcode;
@property (readonly) SEL selector;
@property (readonly) NSInteger loadArgs;
@property (readonly) NSInteger storeArgs;
@property (readonly) NSString *ruleName;

+ (NSDictionary *)opcodeDictionary;

@end
