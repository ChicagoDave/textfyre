//
//  TFVeneer.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

@class TFEngine;
@class TFArguments;

/*! Provides hardcoded versions of some commonly used veneer routines (low-level functions that are automatically compiled into every Inform game).

    Inform games rely heavily on these routines, and substituting our C# versions for the Glulx versions in the story file can increase performance significantly.
 */
@interface TFVeneer : NSObject {

@private
    TFEngine *engine; // Not retained

    uint32_t zregion_fn, cp_tab_fn, oc_cl_fn, ra_pr_fn, rt_chldw_fn;
    uint32_t unsigned_compare_fn, rl_pr_fn, rv_pr_fn, op_pr_fn;
    uint32_t rt_chstw_fn, rt_chldb_fn, meta_class_fn;

    uint32_t string_mc, routine_mc, class_mc, object_mc;
    uint32_t rt_err_fn, num_attr_bytes, classes_table;
    uint32_t indiv_prop_start, cpv_start;
    uint32_t ofclass_err, readprop_err;

}

- (id)initWithEngine:(TFEngine *)engine;

/*! Registers a routine address or constant value.

    \param value The address of the routine or value of the constant.
    \param slot Identifies the address or constant being registered.
    \return YES if registration was successful, NO otherwise.
 */
- (BOOL)setValue:(uint32_t)value forSlot:(uint32_t)slot;

/*! Intercepts a routine call if its address has previously been registered.

    \param address The address of the routine.
    \param args The routine's arguments.
    \param result Result of call is placed here.

    \return YES if call was intercepted, NO otherwise.
 */
- (BOOL)interceptCallAtAddress:(uint32_t)address args:(TFArguments *)args result:(uint32_t *)result;

@end

typedef enum _TFVeneerSlot {
    // routine addresses
    TFVeneerSlotZ__Region = 1,
    TFVeneerSlotCP__Tab = 2,
    TFVeneerSlotOC__Cl = 3,
    TFVeneerSlotRA__Pr = 4,
    TFVeneerSlotRT__ChLDW = 5,
    TFVeneerSlotUnsigned__Compare = 6,
    TFVeneerSlotRL__Pr = 7,
    TFVeneerSlotRV__Pr = 8,
    TFVeneerSlotOP__Pr = 9,
    TFVeneerSlotRT__ChSTW = 10,
    TFVeneerSlotRT__ChLDB = 11,
    TFVeneerSlotMeta__class = 12,

    // object numbers and compiler constants
    TFVeneerSlotString = 1001,
    TFVeneerSlotRoutine = 1002,
    TFVeneerSlotClass = 1003,
    TFVeneerSlotObject = 1004,
    TFVeneerSlotRT__Err = 1005,
    TFVeneerSlotNUM_ATTR_BYTES = 1006,
    TFVeneerSlotclasses_table = 1007,
    TFVeneerSlotINDIV_PROP_START = 1008,
    TFVeneerSlotcpv__start = 1009,
    TFVeneerSlotofclass_err = 1010,
    TFVeneerSlotreadprop_err = 1011,
} TFVeneerSlot;

