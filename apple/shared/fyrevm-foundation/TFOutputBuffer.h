//
//  TFOutputBuffer.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


@interface TFOutputBuffer : NSObject {

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
