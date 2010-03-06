//
//  TFEngine_Opcodes.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine.h"


@interface TFEngine (Opcodes)


- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr;
- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr stubPC:(uint32_t)stubPC;

/*! Enters a function, pushing a call stub first if necessary.

    \param address The address of the function to call.
    \param args The function's arguments, or <b>null</b> to call without arguments.
    \param destType The DestType for the call stub. Ignored for tail calls.
    \param destAddr The DestAddr for the call stub. Ignored for tail calls.
    \param stubPC The PC value for the call stub. Ignored for tail calls.
    \param tailCall YES to perform a tail call, reusing the current call stub and frame instead of pushing a new stub and creating a new frame.
 */
- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr stubPC:(uint32_t)stubPC tailCall:(BOOL)tailCall;

@end
