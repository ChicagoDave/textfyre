//
//  TFOutputFilterTags.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


/*! \brief Controls the tags for output filtering.

    The default set of tags is suitable for XAML.
    
    I don't see where these values are ever actually overridden in the Windows code. If they're not, then making this a modifiable class is a waste of code and runtime effort.
    
    Setters in Apple code don't have the same exception-throwing logic on nil input that Windows code does, but since I don't know if it's necessary yet (or something that really needs to be checked), and it's the difference between a runtime-supplied method and typing my own, I'm going to leave that as-is for now.
*/
@interface TFOutputFilterTags : NSObject {

@private
    /*! String that begins a paragraph. */
    NSString *startParagraph;
    /*! String that ends a paragraph. */
    NSString *endParagraph;
    /*! String that introduces a line break. */
    NSString *lineBreak;
    /*! String that encodes a left angle bracket (less-than sign). */
    NSString *leftAngleBracket;
    /*! String that encodes a right angle bracket (greater-than sign). */
    NSString *rightAngleBracket;
    /*! String that encodes an ampersand. */
    NSString *ampersand;
    /*! String that encodes an opening double-quote mark. */
    NSString *leftDoubleQuote;
    /*! String that encodes a closing double-quote mark. */
    NSString *rightDoubleQuote;
    /*! String that encodes an opening single-quote mark. */
    NSString *leftSingleQuote;
    /*! String that encodes a closing single-quote mark (apostrophe). */
    NSString *rightSingleQuote;
    /*! String that begins fixed-pitch type. */
    NSString *startFixedPitch;
    /*! String that ends fixed-pitch type. */
    NSString *endFixedPitch;
    /*! String that begins italic type. */
    NSString *startItalicType;
    /*! String that ends italic type. */
    NSString *endItalicType;
    /*! String that begins bold type. */
    NSString *startBoldType;
    /*! String that ends bold type. */
    NSString *endBoldType;
}

@property (retain) NSString *startParagraph;
@property (retain) NSString *endParagraph;
@property (retain) NSString *lineBreak;
@property (retain) NSString *leftAngleBracket;
@property (retain) NSString *rightAngleBracket;
@property (retain) NSString *ampersand;
@property (retain) NSString *leftDoubleQuote;
@property (retain) NSString *rightDoubleQuote;
@property (retain) NSString *leftSingleQuote;
@property (retain) NSString *rightSingleQuote;
@property (retain) NSString *startFixedPitch;
@property (retain) NSString *endFixedPitch;
@property (retain) NSString *startItalicType;
@property (retain) NSString *endItalicType;
@property (retain) NSString *startBoldType;
@property (retain) NSString *endBoldType;

@end
