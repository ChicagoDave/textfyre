//
//  TFStrNode.h
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

#import "TFEngine.h" // For TFExecutionMode

@interface TFStrNode : NSObject

#pragma mark APIs

/*! Performs the action associated with this string node: printing a character or string, terminating output, or reading a bit and delegating to another node.

    When called on a branch node, this will consume one or more compressed string bits.

    \param engine The TFEngine that is printing.
 */
- (void)handleNextChar:(TFEngine *)engine;

/*! Returns the non-branch node that will handle the next string action.

    When called on a branch node, this will consume one or more compressed string bits.
    
    Base class implementation returns self.

    \param engine The TFEngine that is printing.
    \return A non-branch string node.
 */
- (TFStrNode *)handlingNode:(TFEngine *)engine;

/*! \brief Gets a value indicating whether this node requires a call stub to be pushed. 

    Base class implementation returns NO.
 */
- (BOOL)needsCallStub;

/*! Gets a value indicating whether this node terminates the string.

    Base class implementation returns NO.
 */
- (BOOL)isTerminator;

@end

@interface TFEndStrNode : TFStrNode
@end

@interface TFBranchStrNode : TFStrNode {

@private
    TFStrNode *left;
    TFStrNode *right;
}

#pragma mark APIs

@property (readonly) TFStrNode *left;
@property (readonly) TFStrNode *right;

- (id)initWithLeft:(TFStrNode *)left right:(TFStrNode *)right;

@end

@interface TFCharStrNode : TFStrNode {

@private
    char character;
}

#pragma mark APIs

@property (readonly) char character;

- (id)initWithCharacter:(char)character;

@end

@interface TFUniCharStrNode : TFStrNode {

@private
    UniChar character;
}

#pragma mark APIs

- (id)initWithUniChar:(UniChar)character;

@end

@interface TFStringStrNode : TFStrNode {

@private
    uint32_t address;
    TFExecutionMode mode;
    NSString *string;
}

#pragma mark APIs

- (id)initWithAddress:(uint32_t)address mode:(TFExecutionMode)mode string:(NSString *)string;

@end

@interface TFIndirectStrNode : TFStrNode {

@private
    uint32_t address;
    BOOL doubleIndirect;
    uint32_t argCount, argsAt;
}

#pragma mark APIs

- (id)initWithAddress:(uint32_t)address doubleIndirect:(BOOL)doubleIndirect argCount:(uint32_t)argCount argsAt:(uint32_t)argsAt;

@end