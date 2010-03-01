//
//  GlulxConstants.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "GlulxConstants.h"

const uint32_t TFGlulxHeaderSize = 36;
const uint32_t TFGlulxHeaderMagicOffset = 0;
const uint32_t TFGlulxHeaderVersionOffset = 4;
const uint32_t TFGlulxHeaderRAMStartOffset = 8;
const uint32_t TFGlulxHeaderExtensionStartOffset = 12;
const uint32_t TFGlulxHeaderEndMemoryOffset = 16;
const uint32_t TFGlulxHeaderStackSizeOffset = 20;
const uint32_t TFGlulxHeaderStartFunctionOffset = 24;
const uint32_t TFGlulxHeaderDecodingTableOffset = 28;
const uint32_t TFGlulxHeaderChecksumOffset = 32;

const uint32_t TFGlulxStubStoreNULL = 0;
const uint32_t TFGlulxStubStoreMemory = 1;
const uint32_t TFGlulxStubStoreLocal = 2;
const uint32_t TFGlulxStubStoreStack = 3;
