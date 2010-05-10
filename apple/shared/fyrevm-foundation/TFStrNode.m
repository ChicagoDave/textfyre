//
//  TFStrNode.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFStrNode.h"

#import "GlulxConstants.h"
#import "TFArguments.h"
#import "TFEngine.h"
#import "TFEngine_Opcodes.h"
#import "TFEngine_Output.h"
#import "TFUlxImage.h"


@implementation TFStrNode

#pragma mark Private methods

- (void)emitChar:(uint32_t)character engine:(TFEngine *)engine {
    if (engine.outputSystem == TFIOSystemFilter) {
        [engine performCallWithAddress:engine.filterAddress args:[TFArguments argumentsWithArg:character] destType:TFGlulxStubResumeCompressedString destAddr:engine.printingDigit stubPC:engine.pc];
    } else {
        [engine sendCharToOutput:character];
    }
}

#pragma mark APIs

- (void)handleNextChar:(TFEngine *)engine {
    NSAssert(NO, @"Must be implemented by subclasses.");
}

- (TFStrNode *)handlingNode:(TFEngine *)engine {
    return self;
}

- (BOOL)needsCallStub {
    return NO;
}

- (BOOL)isTerminator {
    return NO;
}

@end

@implementation TFEndStrNode

#pragma mark APIs

- (void)handleNextChar:(TFEngine *)engine {
    [engine donePrinting];
}

- (BOOL)isTerminator {
    return YES;
}

@end

@implementation TFBranchStrNode

#pragma mark APIs

@synthesize left;
@synthesize right;

- (id)initWithLeft:(TFStrNode *)leftParam right:(TFStrNode *)rightParam {
    self = [super init];
    
    left = [leftParam retain];
    right = [rightParam retain];
    
    return self;
}

- (void)handleNextChar:(TFEngine *)engine {
    if ([engine nextCompressedStringBit] == YES) {
        [right handleNextChar:engine];
    } else {
        [left handleNextChar:engine];
    }
}

- (TFStrNode *)handlingNode:(TFEngine *)engine {
    if ([engine nextCompressedStringBit] == YES) {
        return [right handlingNode:engine];
    } else {
        return [left handlingNode:engine];
    }
}

#pragma mark Standard methods

- (void)dealloc {
    [left release], left = nil;
    [right release], right = nil;

    [super dealloc];
}

@end

@implementation TFCharStrNode

#pragma mark APIs

@synthesize character;

- (id)initWithCharacter:(char)characterParam {
    self = [super init];
    
    character = characterParam;
    
    return self;
}

- (void)handleNextChar:(TFEngine *)engine {
    [self emitChar:(uint32_t)character engine:engine];
}

#pragma mark Standard methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> '%c'", [self class], self, character];
}

@end

@implementation TFUniCharStrNode

#pragma mark APIs

- (id)initWithUniChar:(UniChar)characterParam {
    self = [super init];
    
    character = characterParam;

    return self;
}

- (void)handleNextChar:(TFEngine *)engine {
    [self emitChar:(uint32_t)character engine:engine];
}

#pragma mark Standard methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> '%C'", [self class], self, character];
}

@end

@implementation TFStringStrNode

#pragma mark APIs

- (void)handleNextChar:(TFEngine *)engine {
    if (engine.outputSystem == TFIOSystemFilter) {
        [engine pushCallStub:TFMakeCallStub(TFGlulxStubResumeCompressedString, engine.printingDigit, engine.pc, engine.fp)];
        engine.pc = address;
        engine.execMode = mode;
    } else {
        [engine sendStringToOutput:string];
    }
}

#pragma mark Standard methods

- (id)initWithAddress:(uint32_t)addressParam mode:(TFExecutionMode)modeParam string:(NSString *)stringParam {
    self = [super init];

    address = addressParam;
    mode = modeParam;
    string = [stringParam copy];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> \"%@\"", [self class], self, string];
}

- (void)dealloc {
    [string release], string = nil;

    [super dealloc];
}

@end

@implementation TFIndirectStrNode

#pragma mark APIs

- (id)initWithAddress:(uint32_t)addressParam doubleIndirect:(BOOL)doubleIndirectParam argCount:(uint32_t)argCountParam argsAt:(uint32_t)argsAtParam {
    self = [super init];

    address = addressParam;
    doubleIndirect = doubleIndirectParam;
    argCount = argCountParam;
    argsAt = argsAtParam;

    return self;
}

- (void)handleNextChar:(TFEngine *)engine {
    [engine printIndirect:(doubleIndirect ? [engine.image integerAtAddress:address] : address) argCount:argCount argsAt:argsAt];
}

- (BOOL)needsCallStub {
    return YES;
}

@end
