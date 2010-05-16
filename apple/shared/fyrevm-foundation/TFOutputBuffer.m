//
//  TFOutputBuffer.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFOutputBuffer.h"

#import "TFOutputFilterTags.h"

static BOOL isFilteredChannel(TFOutputChannel aChannel) {
    switch (aChannel) {
        case TFOutputChannelMain:
        case TFOutputChannelPrologue:
            return YES;
    }
    
    return NO;
}
static void appendCharacterToString(NSMutableString *string, UniChar character) {
    NSString *characterString = [[NSString alloc] initWithCharacters:&character length:1];
    [string appendString:characterString];
    [characterString release];
}

@implementation TFOutputBuffer

#pragma mark Private methods

- (void)openFormattingTags:(NSMutableString *)string {
    if (mainIsFixed) {
        [string appendString:filterTags.startFixedPitch];
    }
    if (mainIsItalic) {
        [string appendString:filterTags.startItalicType];
    }
    if (mainIsBold) {
        [string appendString:filterTags.startBoldType];
    }
}

- (void)closeFormattingTags:(NSMutableString *)string {
    if (mainIsBold) {
        [string appendString:filterTags.endBoldType];
    }
    if (mainIsItalic) {
        [string appendString:filterTags.endItalicType];
    }
    if (mainIsFixed) {
        [string appendString:filterTags.endFixedPitch];
    }
}

#pragma mark APIs

@synthesize channel;
@synthesize filterEnabled;
@synthesize overrideFiltering;
@synthesize filterTags;

/*! If the output channel is changed to any channel other than TFOutputChannelMain, the channel's contents will be cleared first.
 */
- (void)setChannel:(TFOutputChannel)value {
    if (channel != value) {
        channel = value;
        if (channel != TFOutputChannelMain) {
            NSMutableString *string = [strings objectAtIndex:(NSUInteger)value - 1];
            [string deleteCharactersInRange:NSMakeRange(0, [string length])];
        }
    }
}

- (void)setFilterEnabled:(BOOL)value {
    if (overrideFiltering == NO) {
        filterEnabled = value;
    }
}

- (void)writeString:(NSString *)string {
    if (isFilteredChannel(channel) && self.filterEnabled) {
        const NSUInteger length = [string length];
        
        // main channel needs char-by-char filtering
        for (NSUInteger i = 0; i < length; ++i) {
            [self writeCharacter:[string characterAtIndex:i]];
        }
    } else {
        [[strings objectAtIndex:(NSUInteger)channel - 1] appendString:string];
    }
}

- (void)writeCharacter:(UniChar)character {
    if (isFilteredChannel(channel) && self.filterEnabled) {
        NSMutableString *string = [strings objectAtIndex:(NSUInteger)channel - 1];
        if (character == '\n') {
            if (mainParaOpen) {
                if (mainBreakPending) {
                    [self closeFormattingTags:string];
                    [string appendString:filterTags.endParagraph];
                    mainBreakPending = NO;
                    mainParaOpen = NO;
                } else {
                    mainBreakPending = YES;
                }
            }

            mainRightQuote = YES;
        } else {
            if (mainParaOpen == NO) {
                [string appendString:filterTags.startParagraph];
                [self openFormattingTags:string];
                mainBreakPending = false;
                mainParaOpen = true;
            }
            if (mainBreakPending == YES) {
                [string appendString:filterTags.lineBreak];
                mainBreakPending = false;
            }
            switch (character) {
                case '<': 
                    [string appendString:filterTags.leftAngleBracket]; 
                    break;
                case '>': 
                    [string appendString:filterTags.rightAngleBracket]; 
                    break;
                case '&': 
                    [string appendString:filterTags.ampersand]; 
                    break;

                case '"':
                    if (mainRightQuote) {
                        [string appendString:filterTags.rightDoubleQuote];
                    } else {
                        [string appendString:filterTags.leftDoubleQuote];
                    }
                    break;
                case '\'':
                    if (mainRightQuote) {
                        [string appendString:filterTags.rightSingleQuote];
                    } else {
                        [string appendString:filterTags.leftSingleQuote];
                    }
                    break;

                default:
                    appendCharacterToString(string, character);
                    mainRightQuote = ![[NSCharacterSet whitespaceCharacterSet] characterIsMember:character];
                    break;
            }
        }
    } else {
        appendCharacterToString([strings objectAtIndex:(NSUInteger)channel - 1], character);
    }
}

- (void)setStyle:(TFOutputStyle)style {
    if (isFilteredChannel(channel) && self.filterEnabled) {
        NSMutableString *string = [strings objectAtIndex:(NSUInteger)TFOutputChannelMain - 1];
        // canonical nesting order: (fixed (italic (bold)))
        switch (style) {
            case TFOutputStyleRoman:
                if (mainParaOpen) {
                    if (mainIsBold) {
                        [string appendString:filterTags.endBoldType];
                    }
                    if (mainIsItalic) {
                        [string appendString:filterTags.endItalicType];
                    }
                }
                mainIsBold = mainIsItalic = NO;
                break;

            case TFOutputStyleBold:
                if (mainParaOpen && !mainIsBold) {
                    [string appendString:filterTags.startBoldType];
                }
                mainIsBold = YES;
                break;

            case TFOutputStyleItalic:
                if (!mainIsItalic) {
                    if (mainParaOpen) {
                        if (mainIsBold) {
                            [string appendString:filterTags.endBoldType];
                            [string appendString:filterTags.startItalicType];
                            [string appendString:filterTags.startBoldType];
                        } else {
                            [string appendString:filterTags.startItalicType];
                        }
                    }

                    mainIsItalic = YES;
                }
                break;

            case TFOutputStyleFixed:
            case TFOutputStyleVariable:
                if (!mainIsFixed) {
                    if (mainParaOpen) {
                        [self closeFormattingTags:string];
                    }

                    mainIsFixed = (style == TFOutputStyleFixed);

                    if (mainParaOpen) {
                        [self openFormattingTags:string];
                    }
                }
                break;
        }
    }
}
/*
        /// <summary>
        /// Packages all the output that has been stored so far, returns it,
        /// and empties the buffer.
        /// </summary>
        /// <returns>A dictionary mapping each active output channel to the
        /// string of text that has been sent to it since the last flush.</returns>
        public IDictionary<OutputChannel, string> Flush()
        {
            Dictionary<OutputChannel, string> result = new Dictionary<OutputChannel, string>();

            // end tags on the main channel
            StringBuilder main = strings[(int)OutputChannel.Main - 1];
            if (main.Length > 0)
            {
                CloseFormattingTags(main);
                if (mainParaOpen)
                    main.Append(filterTags.EndParagraph);

                mainIsBold = mainIsItalic = mainIsFixed = false;
            }
            mainBreakPending = mainParaOpen = false;

            for (int i = 0; i < strings.Length; i++)
            {
                if (strings[i].Length > 0)
                {
                    result.Add((OutputChannel)(i + 1), strings[i].ToString());
                    strings[i] = new StringBuilder();
                }
            }

            return result;
        }
    }
}
*/

#pragma mark Standard methods

- (id)init {
    self = [super init];
    
    channel = TFOutputChannelMain;
    
    const NSUInteger count = TFOutputChannelLast;

    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:count]; // output channels start at 1
    for (NSUInteger i = 0; i < count; ++i) {
        NSMutableString *string = [[NSMutableString alloc] init];
    
        [temp addObject:string];
        
        [string release];
    }
    
    strings = temp;

    filterEnabled = YES;
    
    filterTags = [[TFOutputFilterTags alloc] init];
    
    return self;
}

- (void)dealloc {
    [strings release], strings = nil;

    [filterTags release], filterTags = nil;

    [super dealloc];
}

@end