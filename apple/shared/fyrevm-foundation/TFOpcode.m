//
//  TFOpcode.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFOpcode.h"


static NSString *const TFOpcodesPlistFilename = @"Opcodes";

static const NSUInteger TFMinOpcodeDataArrayElementCount = 3;
static const NSUInteger TFMaxOpcodeDataArrayElementCount = 5;


@implementation TFOpcode

@synthesize opcode;
@synthesize selector;
@synthesize loadArgs;
@synthesize storeArgs;
@synthesize ruleName;

- (id)initWithOpcode:(NSInteger)opcodeParam
                name:(NSString *)nameParam
            loadArgs:(NSInteger)loadArgsParam
           storeArgs:(NSInteger)storeArgsParam
            ruleName:(NSString *)ruleNameParam {
    self = [super init];
    
    opcode = opcodeParam;

    NSString *selectorName = [[NSString alloc] initWithFormat:@"op_%@:", nameParam];

    // This does *not* check whether anyone actually implements this selector.
    selector = NSSelectorFromString(selectorName);
    
    [selectorName release];

    loadArgs = loadArgsParam;
    storeArgs = storeArgsParam;
    ruleName = [ruleNameParam retain];
    
    return self;
}

+ (NSDictionary *)opcodeDictionary {

    NSDictionary *result = nil;

    NSMutableDictionary *opcodeDictionary = [[[NSMutableDictionary alloc] init] autorelease];


    NSString *plistPath = [[NSBundle bundleForClass:[self class]] pathForResource:TFOpcodesPlistFilename ofType:@"plist"];
    if (plistPath == nil) {
        NSLog(@"Unable to find file with name \"%@.plist\" in application bundle.", TFOpcodesPlistFilename);
    } else {
        // Note: we don't have to check whether resulting object is of class NSArray, that seems to be done for us when using the NSArray loading API. (Other top-level possibility is dictionary.)
        NSArray *opcodeDataArrays = [NSArray arrayWithContentsOfFile:plistPath];
        if (opcodeDataArrays == nil) {
            NSLog(@"Unable to read plist at path \"%@\" as plist.", plistPath);
        } else {
            NSUInteger i = 0;
        
            for (NSArray *opcodeDataArray in opcodeDataArrays) {

                // Helper method for errors
                #define TFOpcodeErrorLog(logStringAndArgs, ...) \
                    NSLog(@"Error with entry %@ at index %lu of plist at path \"%@\": %@", \
                          opcodeDataArray, (unsigned long)i, plistPath, [NSString stringWithFormat:logStringAndArgs, ##__VA_ARGS__]);

                
                if ([opcodeDataArray isKindOfClass:[NSArray class]] == NO) {
                    TFOpcodeErrorLog(@"supposed to be of class %@, but instead is of class %@.", 
                                     [NSArray class], [opcodeDataArray class]);
                    break;
                } else {
                    if ([opcodeDataArray count] < TFMinOpcodeDataArrayElementCount || [opcodeDataArray count] > TFMaxOpcodeDataArrayElementCount) {
                        TFOpcodeErrorLog(@"should be an array of between %lu and %lu elements, but instead it has %lu elements.", 
                                         (unsigned long)TFMinOpcodeDataArrayElementCount, 
                                         (unsigned long)TFMaxOpcodeDataArrayElementCount, 
                                         (unsigned long)[opcodeDataArray count]);
                        break;
                    } else {
                        NSNumber *opcodeNumber = [opcodeDataArray objectAtIndex:0];
                        NSString *name = [opcodeDataArray objectAtIndex:1];
                        NSNumber *loadArgsNumber = [opcodeDataArray objectAtIndex:2];
                        NSNumber *storeArgsNumber = ([opcodeDataArray count] > 3 ? [opcodeDataArray objectAtIndex:3] : nil);
                        NSString *ruleName = ([opcodeDataArray count] > 4 ? [opcodeDataArray objectAtIndex:4] : nil);
                        
                        NSMutableString *errorString = [NSMutableString string];
                        
                        if ([opcodeNumber isKindOfClass:[NSNumber class]] == NO) {
                            [errorString appendFormat:@"\n- First element, opcodeNumber, should be of class %@, but instead is of class %@. Use <integer></integer> to wrap the element. ", 
                                                      [NSNumber class], [opcodeNumber class]];
                        } else if ([opcodeNumber integerValue] < 0) {
                            [errorString appendFormat:@"\n- First element, opcodeNumber, should be a positive number, but is %ld. ", (long)[opcodeNumber integerValue]];
                        }
                        if ([name isKindOfClass:[NSString class]] == NO) {
                            [errorString appendFormat:@"\n- Second element, name, should be of class %@, but instead is of class %@. Use <string></string> to wrap the element. ", 
                                                      [NSString class], [name class]];
                        } else if ([name length] == 0) {
                            [errorString appendFormat:@"\n- Second element, name, should not be blank. "];
                        }
                        if ([loadArgsNumber isKindOfClass:[NSNumber class]] == NO) {
                            [errorString appendFormat:@"\n- Third element, loadArgsNumber, should be of class %@, but instead is of class %@. Use <integer></integer> to wrap the element. ", 
                                                      [NSNumber class], [loadArgsNumber class]];
                        } else if ([loadArgsNumber integerValue] < 0) {
                            [errorString appendFormat:@"\n- Third element, loadArgsNumber, should be a positive number, but is %ld. ", (long)[loadArgsNumber integerValue]];
                        }
                        if (storeArgsNumber != nil && [storeArgsNumber isKindOfClass:[NSNumber class]] == NO) {
                            [errorString appendFormat:@"\n- Fourth element, storeArgsNumber, should be of class %@, but instead is of class %@. Use <integer></integer> to wrap the element. ",
                                                      [NSNumber class], [storeArgsNumber class]];
                        } else if ([storeArgsNumber integerValue] < 0) {
                            [errorString appendFormat:@"\n- Fourth element, storeArgsNumber, should be a positive number, but is %ld. ", (long)[storeArgsNumber integerValue]];
                        }
                        if (ruleName != nil && [ruleName isKindOfClass:[NSString class]] == NO) {
                            [errorString appendFormat:@"\n- Fifth element, ruleName, should be of class %@, but instead is of class %@. Use <string></string> to wrap the element. ",
                                             [        NSString class], [ruleName class]];
                        } else if (ruleName != nil && [ruleName length] == 0) {
                            [errorString appendFormat:@"\n- Fifth element, ruleName, should not be blank. "];
                        }
                        
                        if ([errorString length] > 0) {
                            TFOpcodeErrorLog(errorString)
                            break;
                        } else {
                            if ([opcodeDictionary objectForKey:opcodeNumber] != nil) {
                                TFOpcodeErrorLog(@"opcode %@ (0x%X) has already been encountered.", opcodeNumber, (long)[opcodeNumber integerValue]);
                            } else {
                                TFOpcode *opcode = 
                                    [[TFOpcode alloc] initWithOpcode:[opcodeNumber integerValue] 
                                                                name:name 
                                                            loadArgs:[loadArgsNumber integerValue]
                                                           storeArgs:[storeArgsNumber integerValue]
                                                            ruleName:ruleName];
                            
                                if (opcode == nil) {
                                    TFOpcodeErrorLog(@"could not be turned into an object of class %@", [TFOpcode class]);
                                    break;
                                } else {
                                    [opcodeDictionary setObject:opcode forKey:opcodeNumber];
                                }
                            }
                        }
                    }
                }
                
                ++i;
            }
            
            // We made all opcodes successfully? Then overall success!
            if ([opcodeDictionary count] == [opcodeDataArrays count]) {
                result = opcodeDictionary;
            } else {
                NSLog(@"Were %lu elements in array from plist at path \"%@\", but only %lu object of class %@ were successfully created.", (unsigned long)[opcodeDataArrays count], plistPath, (unsigned long)[opcodeDictionary count], [TFOpcode class]);
            }
        }
    }
    
    return result;
}

#pragma mark Standard methods

- (void)dealloc {
    [ruleName release], ruleName = nil;

    [super dealloc];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> opcode %ld (0x%X), selector %@, loadArgs %ld, storeArgs %ld, ruleName %@", 
                                      [self class], self, 
                                      (long)opcode, (long)opcode, 
                                      NSStringFromSelector(selector), 
                                      (long)loadArgs, 
                                      (long)storeArgs, 
                                      (ruleName != nil ? ruleName : @"{none}")];
}

@end
