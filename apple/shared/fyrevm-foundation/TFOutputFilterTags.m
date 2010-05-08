//
//  TFOutputFilterTags.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFOutputFilterTags.h"


@implementation TFOutputFilterTags

@synthesize startParagraph;
@synthesize endParagraph;
@synthesize lineBreak;
@synthesize leftAngleBracket;
@synthesize rightAngleBracket;
@synthesize ampersand;
@synthesize leftDoubleQuote;
@synthesize rightDoubleQuote;
@synthesize leftSingleQuote;
@synthesize rightSingleQuote;
@synthesize startFixedPitch;
@synthesize endFixedPitch;
@synthesize startItalicType;
@synthesize endItalicType;
@synthesize startBoldType;
@synthesize endBoldType;

- (id)init {
    self = [super init];

    // Uses dot notation so strings are retained, in case they're ever overridden (in which case they'll be released). By same logic, they're released in dealloc.

    self.startParagraph = @"<Paragraph>";
    self.endParagraph = @"</Paragraph>";
    self.lineBreak = @"<LineBreak/>";
    self.leftAngleBracket = @"&lt;";
    self.rightAngleBracket = @"&gt;";
    self.ampersand = @"&amp;";
    self.leftDoubleQuote = @"\"\""; //"&#8220;";
    self.rightDoubleQuote = @"\"\""; //"&#8221;";
    self.leftSingleQuote = @"'"; //"&#8216;";
    self.rightSingleQuote = @"'"; //"&#8217;";
    self.startFixedPitch = @"<Span FontFamily=\"Courier New\">";
    self.endFixedPitch = @"</Span>";
    self.startItalicType = @"<Italic>";
    self.endItalicType = @"</Italic>";
    self.startBoldType = @"<Bold>";
    self.endBoldType = @"</Bold>";

/*
    // Alternate tags from Windows code.
    startParagraph = @"<TextBlock Height=\"Auto\" Width=\"Auto\" xmlns=\"http://schemas.microsoft.com/client/2007\" xmlns:x=\"http://schemas.microsoft.com/winfx/2006/xaml\" FontFamily=\"Arial\" >";
    self.endParagraph = @"</TextBlock>~";
    self.lineBreak = @"<LineBreak/>";
    self.leftAngleBracket = @"<";
    self.rightAngleBracket = @">";
    self.ampersand = @"&";
    self.leftDoubleQuote = @"&#8220;";
    self.rightDoubleQuote = @"&#8221;";
    self.leftDoubleQuote = @"&#8216;";
    self.rightDoubleQuote = @"&#8217;";
    self.startFixedPitch = @"<Run FontFamily=\"Courier New\">";
    self.endFixedPitch = @"</Run>";
    self.startItalicType = @"<Run FontStyle=\"Italic\">";
    self.endItalicType = @"</Run>";
    self.startBoldType = @"<Run FontWeight=\"Bold\">";
    self.endBoldType = @"</Run>";
*/
    
    return self;
}

- (void)dealloc {
    [startParagraph release], startParagraph = nil;
    [endParagraph release], endParagraph = nil;
    [lineBreak release], lineBreak = nil;
    [leftAngleBracket release], leftAngleBracket = nil;
    [rightAngleBracket release], rightAngleBracket = nil;
    [ampersand release], ampersand = nil;
    [leftDoubleQuote release], leftDoubleQuote = nil;
    [rightDoubleQuote release], rightDoubleQuote = nil;
    [leftSingleQuote release], leftSingleQuote = nil;
    [rightSingleQuote release], rightSingleQuote = nil;
    [startFixedPitch release], startFixedPitch = nil;
    [endFixedPitch release], endFixedPitch = nil;
    [startItalicType release], startItalicType = nil;
    [endItalicType release], endItalicType = nil;
    [startBoldType release], startBoldType = nil;
    [endBoldType release], endBoldType = nil;

    [super dealloc];
}

@end
