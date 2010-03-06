//
//  GlulxConstants.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

// Header size and field offsets
#define TFGlulxHeaderSize                       36
#define TFGlulxHeaderMagicOffset                 0
#define TFGlulxHeaderVersionOffset               4
#define TFGlulxHeaderRAMStartOffset              8
#define TFGlulxHeaderExtensionStartOffset       12
#define TFGlulxHeaderEndMemoryOffset            16
#define TFGlulxHeaderStackSizeOffset            20
#define TFGlulxHeaderStartFunctionOffset        24
#define TFGlulxHeaderDecodingTableOffset        28
#define TFGlulxHeaderChecksumOffset             32

// Call stub: DestType values for function calls
#define TFGlulxStubStoreNULL                     0
#define TFGlulxStubStoreMemory                   1
#define TFGlulxStubStoreLocal                    2
#define TFGlulxStubStoreStack                    3

// Call stub: DestType values for string printing
#define TFGlulxStubResumeCompressedString       10
#define TFGlulxStubResumeFunction               11
#define TFGlulxStubResumeNumber                 12
#define TFGlulxStubResumeCString                13
#define TFGlulxStubResumeUnicodeString          14

// FyreVM addition: DestType value for nested calls
#define TFFyreVMStubResumeNative                99

// String decoding table: header field offsets
#define TFGlulxHuffmanTableSizeOffset            0
#define TFGlulxHuffmanNodeCountOffset            4
#define TFGlulxHuffmanRootNodeOffset             8
/*
// String decoding table: node types
#define GLULX_HUFF_NODE_BRANCH                   0
#define GLULX_HUFF_NODE_END                      1
#define GLULX_HUFF_NODE_CHAR                     2
#define GLULX_HUFF_NODE_CSTR                     3
#define GLULX_HUFF_NODE_UNICHAR                  4
#define GLULX_HUFF_NODE_UNISTR                   5
#define GLULX_HUFF_NODE_INDIRECT                 8
#define GLULX_HUFF_NODE_DBLINDIRECT              9
#define GLULX_HUFF_NODE_INDIRECT_ARGS           10
#define GLULX_HUFF_NODE_DBLINDIRECT_ARGS        11
*/