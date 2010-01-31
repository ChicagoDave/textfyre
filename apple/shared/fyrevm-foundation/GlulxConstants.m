//
//  GlulxConstants.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "GlulxConstants.h"

const NSInteger TFGlulxHeaderSize = 36;
const NSInteger TFGlulxHeaderMagicOffset = 0;
const NSInteger TFGlulxHeaderVersionOffset = 4;
const NSInteger TFGlulxHeaderRAMStartOffset = 8;
const NSInteger TFGlulxHeaderExtensionStartOffset = 12;
const NSInteger TFGlulxHeaderEndMemoryOffset = 16;
const NSInteger TFGlulxHeaderStackSizeOffset = 20;
const NSInteger TFGlulxHeaderStartFunctionOffset = 24;
const NSInteger TFGlulxHeaderDecodingTableOffset = 28;
const NSInteger TFGlulxHeaderChecksumOffset = 32;
