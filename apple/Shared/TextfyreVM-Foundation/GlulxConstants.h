//
//  GlulxConstants.h
//  TextfyreVM-Foundation
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

// String decoding table: node types
#define TFGlulxHuffmanNodeBranch                 0
#define TFGlulxHuffmanNodeEnd                    1
#define TFGlulxHuffmanNodeChar                   2
#define TFGlulxHuffmanNodeCStr                   3
#define TFGlulxHuffmanNodeUnichar                4
#define TFGlulxHuffmanNodeUnistr                 5
#define TFGlulxHuffmanNodeIndirect               8
#define TFGlulxHuffmanNodeDoubleIndirect         9
#define TFGlulxHuffmanNodeIndirectArgs          10
#define TFGlulxHuffmanNodeDoubleIndirectArgs    11
