//
//  TFOpcode.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

/* Describes exceptions to the typical operand order and meaning for certain opcodes that don't fit the pattern. */
typedef enum _TFOpcodeRule
{
    /* No special treatment. */
    TFOpcodeRuleNone = 0,
    /* Indirect operands work with single bytes. */
    TFOpcodeRuleIndirect8Bit,
    /* Indirect operands work with 16-bit words. */
    TFOpcodeRuleIndirect16Bit,
    /* Has an additional operand that resembles a store, but which is not actually passed out by the opcode handler. Instead, the handler receives two values, DestType and DestAddr, which may be written into a call stub so the result can be stored later. */
    TFOpcodeRuleDelayedStore,
    /* Special case for op_catch. This opcode has a load operand (the branch offset) and a delayed store, but the store comes first. args[0] and [1] are the delayed store, and args[2] is the load. */
    TFOpcodeRuleCatch
} TFOpcodeRule;

@interface TFOpcode : NSObject {
    NSInteger opcode;
    SEL selector;
    NSInteger loadArgs;
    NSInteger storeArgs;
    TFOpcodeRule rule;
}

/*! Designated initializer.

 \param opcode Number in Glulx game image that, when encountered, will trigger the use of the rest of this opcode object.
 \param name Name of this opcode. Used to look up a method of the same name (but with trailing colon) in TFEngine, that is invoked to do the opcode's work.
 \param loadArgs Number of arguments to load in for this opcode. May be zero.
 \param loadArgs Number of arguments to store in for this opcode. May be zero.
 \param ruleName Special rule to use with this opcode. May be TFOpcodeRuleNone.
 */
- (id)initWithOpcode:(NSInteger)opcode 
                name:(NSString *)name 
            loadArgs:(NSInteger)loadArgs 
           storeArgs:(NSInteger)storeArgs 
                rule:(TFOpcodeRule)rule;

@property (readonly) NSInteger opcode;
@property (readonly) SEL selector;
@property (readonly) NSInteger loadArgs;
@property (readonly) NSInteger storeArgs;
@property (readonly) TFOpcodeRule rule;

#pragma mark APIs

/*! Attempts to read in opcode information from plist.

    On success, returns autoreleased dictionary.
    
    On failure, returns nil, at which point technical details will be printed to Console.
 */
+ (NSDictionary *)opcodeDictionary;

- (void)performWithOperands:(uint32_t *)operands;

@end
