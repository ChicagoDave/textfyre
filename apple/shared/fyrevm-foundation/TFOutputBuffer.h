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
//        private StringBuilder[] strings;
    BOOL mainIsBold, mainIsItalic, mainIsFixed, mainParaOpen, mainBreakPending;
    BOOL mainRightQuote;
    BOOL filtering;
    BOOL overrideFiltering;
    TFOutputFilterTags *filterTags;
}

/*! Writes a string to the buffer for the currently selected output channel.

    \param string The string to write.
 */
- (void)writeString:(NSString *)string;
/*! Writes a single character to the buffer for the currently selected output channel.

    \param character The character to write.
 */
- (void)writeCharacter:(char)character;

@end
