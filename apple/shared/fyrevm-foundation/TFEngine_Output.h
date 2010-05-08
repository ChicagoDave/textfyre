//
//  TFEngine_Output.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine.h"


/*! Indicates the channel a piece of output is being sent on. */
typedef enum _TFOutputChannel {
    /*! The regular game output channel. */
    TFOutputChannelMain = 1,
    /*! The name of the current area. */
    TFOutputChannelLocation = 2,
    /*! The player's score. */
    TFOutputChannelScore = 3,
    /*! The time of day or turn count. */
    TFOutputChannelTime = 4,
    /*! Spoilery hint data for the player's current situation. */
    TFOutputChannelHints = 5,
    /*! Help data for the player's current situation. */
    TFOutputChannelHelp = 6,
    /*! Data about visited areas, map connections, etc. */
    TFOutputChannelMap = 7,
    /*! A structured description of the player's progress in the story. */
    TFOutputChannelProgress = 8,
    /*! A control channel for the interpreter's visual appearance. */
    TFOutputChannelTheme = 9,
    /*! A prompt to use for the next input request, such as "> ". */
    TFOutputChannelPrompt = 10,
    /*! A list of topics the player can select that auto-inputs the proper command. */
    TFOutputChannelConversation = 11,
    /*! A Channel for playing sounds. */
    TFOutputChannelSound = 12,
    /*! A channel for the prologue text. */
    TFOutputChannelPrologue = 13,
    /*! A channel for the title text. */
    TFOutputChannelTitle = 14,
    /*! A channel for the credits of the game. */
    TFOutputChannelCredits = 15,
    /*! A channel for the chapter text. */
    TFOutputChannelChapter = 16,
    /*! A channel for reporting that the game has ended in death. */
    TFOutputChannelDeath = 17,

    _TFOutputChannelLast = TFOutputChannelDeath
} TFOutputChannel;

@interface TFEngine (Output)

/*! Sends a single character to the output system (other than TFIOSystemFilter).

    \param ch The character to send.
 */
- (void)sendCharToOutput:(uint32_t)character;

/*! Sends a string to the output system (other than TFIOSystemFilter).

    \param string The string to send.
 */
- (void)sendStringToOutput:(NSString *)string;

- (void)selectOutputSystem:(TFIOSystem)number;

- (void)nextCStringChar;
- (void)nextUniStringChar;
- (void)nextDigit;
- (BOOL)nextCompressedStringBit;

#pragma mark Native String Decoding Table

/*! Builds a native version of the string decoding table if the table is entirely in ROM, or verifies the table's current state if the table is in RAM. */
- (void)cacheDecodingTable;

- (NSString *)readCString:(uint32_t)address;
- (NSString *)readUniString:(uint32_t)address;

/* Checks that the string decoding table is well-formed, i.e., that it contains at least one branch, one end marker, and no unrecognized node types. */
- (void)verifyDecodingTable;

/*! \brief Prints the next character of a compressed string, consuming one or more bits. 

    This is only used when the string decoding table is in RAM.
 */
- (void)nextCompressedChar;

/*! Prints a string, or calls a routine, when an indirect node is encountered in a compressed string.

    \param address The address of the string or routine.
    \param argCount The number of arguments passed in.
    \param argsAt The address where the argument array is stored.
 */
- (void)printIndirect:(uint32_t)address argCount:(uint32_t)argCount argsAt:(uint32_t)argsAt;

- (void)donePrinting;

@end
