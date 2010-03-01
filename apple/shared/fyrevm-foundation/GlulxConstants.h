//
//  GlulxConstants.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

// Header size and field offsets
const uint32_t TFGlulxHeaderSize;
const uint32_t TFGlulxHeaderMagicOffset;
const uint32_t TFGlulxHeaderVersionOffset;
const uint32_t TFGlulxHeaderRAMStartOffset;
const uint32_t TFGlulxHeaderExtensionStartOffset;
const uint32_t TFGlulxHeaderEndMemoryOffset;
const uint32_t TFGlulxHeaderStackSizeOffset;
const uint32_t TFGlulxHeaderStartFunctionOffset;
const uint32_t TFGlulxHeaderDecodingTableOffset;
const uint32_t TFGlulxHeaderChecksumOffset;

// Call stub: DestType values for function calls
const uint32_t TFGlulxStubStoreNULL;
const uint32_t TFGlulxStubStoreMemory;
const uint32_t TFGlulxStubStoreLocal;
const uint32_t TFGlulxStubStoreStack;
/*
// Call stub: DestType values for string printing
const uint32_t TFGlulxStubRESUME_HUFFSTR = 10;
const uint32_t TFGlulxStubRESUME_FUNC = 11;
const uint32_t TFGlulxStubRESUME_NUMBER = 12;
const uint32_t TFGlulxStubRESUME_CSTR = 13;
const uint32_t TFGlulxStubRESUME_UNISTR = 14;

// FyreVM addition: DestType value for nested calls
const uint32_t TFFyreVMStubRESUME_NATIVE = 99;

// String decoding table: header field offsets
const uint32_t GLULX_HUFF_TABLESIZEOffset = 0;
const uint32_t GLULX_HUFF_NODECOUNTOffset = 4;
const uint32_t GLULX_HUFF_ROOTNODEOffset = 8;

// String decoding table: node types
const uint32_t GLULX_HUFF_NODE_BRANCH = 0;
const uint32_t GLULX_HUFF_NODE_END = 1;
const uint32_t GLULX_HUFF_NODE_CHAR = 2;
const uint32_t GLULX_HUFF_NODE_CSTR = 3;
const uint32_t GLULX_HUFF_NODE_UNICHAR = 4;
const uint32_t GLULX_HUFF_NODE_UNISTR = 5;
const uint32_t GLULX_HUFF_NODE_INDIRECT = 8;
const uint32_t GLULX_HUFF_NODE_DBLINDIRECT = 9;
const uint32_t GLULX_HUFF_NODE_INDIRECT_ARGS = 10;
const uint32_t GLULX_HUFF_NODE_DBLINDIRECT_ARGS = 11;
*/