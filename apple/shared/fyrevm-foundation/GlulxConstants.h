//
//  GlulxConstants.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

// Header size and field offsets
const NSInteger TFGlulxHeaderSize;
const NSInteger TFGlulxHeaderMagicOffset;
const NSInteger TFGlulxHeaderVersionOffset;
const NSInteger TFGlulxHeaderRAMStartOffset;
const NSInteger TFGlulxHeaderExtensionStartOffset;
const NSInteger TFGlulxHeaderEndMemoryOffset;
const NSInteger TFGlulxHeaderStackSizeOffset;
const NSInteger TFGlulxHeaderStartFunctionOffset;
const NSInteger TFGlulxHeaderDecodingTableOffset;
const NSInteger TFGlulxHeaderChecksumOffset;
/*
// Call stub: DestType values for function calls
const NSInteger TFGlulxStubSTORE_NULL = 0;
const NSInteger TFGlulxStubSTORE_MEM = 1;
const NSInteger TFGlulxStubSTORE_LOCAL = 2;
const NSInteger TFGlulxStubSTORE_STACK = 3;

// Call stub: DestType values for string printing
const NSInteger TFGlulxStubRESUME_HUFFSTR = 10;
const NSInteger TFGlulxStubRESUME_FUNC = 11;
const NSInteger TFGlulxStubRESUME_NUMBER = 12;
const NSInteger TFGlulxStubRESUME_CSTR = 13;
const NSInteger TFGlulxStubRESUME_UNISTR = 14;

// FyreVM addition: DestType value for nested calls
const NSInteger TFFyreVMStubRESUME_NATIVE = 99;

// String decoding table: header field offsets
const NSInteger GLULX_HUFF_TABLESIZEOffset = 0;
const NSInteger GLULX_HUFF_NODECOUNTOffset = 4;
const NSInteger GLULX_HUFF_ROOTNODEOffset = 8;

// String decoding table: node types
const NSInteger GLULX_HUFF_NODE_BRANCH = 0;
const NSInteger GLULX_HUFF_NODE_END = 1;
const NSInteger GLULX_HUFF_NODE_CHAR = 2;
const NSInteger GLULX_HUFF_NODE_CSTR = 3;
const NSInteger GLULX_HUFF_NODE_UNICHAR = 4;
const NSInteger GLULX_HUFF_NODE_UNISTR = 5;
const NSInteger GLULX_HUFF_NODE_INDIRECT = 8;
const NSInteger GLULX_HUFF_NODE_DBLINDIRECT = 9;
const NSInteger GLULX_HUFF_NODE_INDIRECT_ARGS = 10;
const NSInteger GLULX_HUFF_NODE_DBLINDIRECT_ARGS = 11;
*/