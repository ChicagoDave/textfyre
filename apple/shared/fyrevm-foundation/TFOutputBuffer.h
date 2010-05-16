//
//  TFOutputBuffer.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine_Output.h"

@class TFOutputFilterTags;

/*! \brief Indicates a text style that may be selected.

    Selecting the Roman style turns off Bold and Italic.
    Selecting the Fixed style turns off Variable, and vice versa.
*/
typedef enum {
    TFOutputStyleRoman = 1,
    TFOutputStyleBold = 2,
    TFOutputStyleItalic = 3,
    TFOutputStyleFixed = 4,
    TFOutputStyleVariable = 5,
} TFOutputStyle;

@interface TFOutputBuffer : NSObject {

@private
    TFOutputChannel channel;
    NSArray *strings;
    BOOL mainIsBold, mainIsItalic, mainIsFixed, mainParaOpen, mainBreakPending;
    BOOL mainRightQuote;
    BOOL filterEnabled;
    BOOL overrideFiltering;
    TFOutputFilterTags *filterTags;
}

#pragma mark APIs

@property TFOutputChannel channel;
/*! Whether the TFOutputChannelMain output channel's text should be filtered to change line breaks, styles, and special characters to a configurable set of tags and entities.
*/
@property BOOL filterEnabled;
@property BOOL overrideFiltering;
/*! The object controlling the set of strings that are used when output output filtering is enabled. */
@property (readonly) TFOutputFilterTags *filterTags;

/*! Writes a string to the buffer for the currently selected output channel.

    \param string The string to write.
 */
- (void)writeString:(NSString *)string;
/*! Writes a single character to the buffer for the currently selected output channel.

    \param character The character to write.
 */
- (void)writeCharacter:(UniChar)character;

/* \brief Sets the current output style.

    This method has no effect unless the main channel is selected and filterEnabled is YES.
*/
- (void)setStyle:(TFOutputStyle)style;

@end
