//
//  TFVeneer.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFVeneer.h"

#import "TFEngine.h"
#import "TFUlxImage.h"


// RAM addresses of compiler-generated global variables
static const uint32_t SELF_OFFSET = 16;
static const uint32_t SENDER_OFFSET = 20;
// offsets of compiler-generated property numbers from INDIV_PROP_START
static const uint32_t CALL_PROP = 5;
static const uint32_t PRINT_PROP = 6;
static const uint32_t PRINT_TO_ARRAY_PROP = 7;


@interface TFVeneer ()

#pragma mark Veneer Methods

// distinguishes between strings, routines, and objects
- (uint32_t)Z__Region:(uint32_t)address;
- (uint32_t)CP__Tab:(uint32_t)obj identifier:(uint32_t)identifier;
- (uint32_t)parent:(uint32_t)obj;
- (uint32_t)OC__Cl:(uint32_t)obj class:(uint32_t)class;
- (uint32_t)RA__Pr:(uint32_t)obj identifier:(uint32_t)identifier;
- (uint32_t)RL__Pr:(uint32_t)obj identifier:(uint32_t)identifier;

@end


@implementation TFVeneer

#pragma mark Veneer Methods

// distinguishes between strings, routines, and objects
- (uint32_t)Z__Region:(uint32_t)address 
{
    if (address < 36 || address >= engine.image.endMemory) {
        return 0;
    }

    uint8_t type = [engine.image byteAtOffset:address];
    if (type >= 0xE0) {
        return 3;
    }
    if (type >= 0xC0) {
        return 2;
    }
    if (type >= 0x70 && type <= 0x7F && address >= engine.image.RAMStart) {
        return 1;
    }

    return 0;
}

// finds an object's common property table
- (uint32_t)CP__Tab:(uint32_t)obj identifier:(uint32_t)identifier
{
    if ([self Z__Region:obj] != 1)
    {
        [engine nestedCallAtAddress:rt_err_fn arg:23 arg:obj];
        return 0;
    }

    uint32_t otab = [engine.image integerAtOffset:obj + 16];
    if (otab == 0)
        return 0;
    uint32_t max = [engine.image integerAtOffset:otab];
    otab += 4;
    return e.PerformBinarySearch(identifier, 2, otab, 10, max, 0, SearchOptions.None];
}

/*! finds the location of an object ("parent()" function) */
- (uint32_t)parent:(uint32_t)obj {
    return [engine.image integerAtOffset:obj + 1 + num_attr_bytes + 12];
}

/*! determines whether an object is a member of a given class ("ofclass" operator) */
- (uint32_t)OC__Cl:(uint32_t)obj class:(uint32_t)class {
    switch ([self Z__Region:obj])
    {
        case 3:
            return (uint32_t)(class == string_mc ? 1 : 0);

        case 2:
            return (uint32_t)(class == routine_mc ? 1 : 0);

        case 1:
            if (class == class_mc)
            {
                if ([self parent:obj] == class_mc)
                    return 1;
                if (obj == class_mc || obj == string_mc ||
                    obj == routine_mc || obj == object_mc)
                    return 1;
                return 0;
            }

            if (class == object_mc)
            {
                if ([self parent:obj] == class_mc)
                    return 0;
                if (obj == class_mc || obj == string_mc ||
                    obj == routine_mc || obj == object_mc)
                    return 0;
                return 1;
            }

            if (class == string_mc || class == routine_mc)
                return 0;

            if ([self parent:class] != class_mc)
            {
                [engine nestedCallAtAddress:rt_err_fn arg:ofclass_err arg:class arg:0xFFFFFFFF];
                return 0;
            }

            uint32_t inlist = [self RA__Pr:obj identifier:2];
            if (inlist == 0)
                return 0;

            uint32_t inlistlen = [self RL__Pr:obj identifier:2] / 4;
            for (uint32_t jx = 0; jx < inlistlen; jx++) {
                if ([engine.image integerAtOffset:inlist + jx * 4] == class) {
                    return 1;
                }
            }
            return 0;

        default:
            return 0;
    }
}

/*! finds the address of an object's property (".&" operator) */
- (uint32_t)RA__Pr:(uint32_t)obj identifier:(uint32_t)identifier {
    uint32_t cla = 0;
    if ((identifier & 0xFFFF0000) != 0)
    {
        cla = [engine.image integerAtOffset:classes_table + 4 * (identifier & 0xFFFF)];
        if ([self OC__Cl:obj class:cla] == 0)
            return 0;

        identifier >>= 16;
        obj = cla;
    }

    uint32_t prop = [self CP__Tab:obj identifier:identifier];
    if (prop == 0)
        return 0;

    if ([self parent:obj] == class_mc && cla == 0) {
        if (identifier < indiv_prop_start || identifier >= indiv_prop_start + 8) {
            return 0;
        }
    }

    if ([engine.image integerAtOffset:engine.image.RAMStart + SELF_OFFSET] != obj) {
        int ix = [engine.image byteAtOffset:(prop + 9) & 1];
        if (ix != 0) {
            return 0;
        }
    }

    return [engine.image integerAtOffset:prop + 4];
}

// finds the length of an object's property (".#" operator)
- (uint32_t)RL__Pr:(uint32_t)obj identifier:(uint32_t)identifier {
    uint32_t cla = 0;
    if ((identifier & 0xFFFF0000) != 0)
    {
        cla = [engine.image integerAtOffset:classes_table + 4 * (identifier & 0xFFFF)];
        if ([self OC__Cl:obj class:cla] == 0)
            return 0;

        identifier >>= 16;
        obj = cla;
    }

    uint32_t prop = [self CP__Tab:obj identifier:identifier];
    if (prop == 0)
        return 0;

    if ([self parent:obj] == class_mc && cla == 0)
        if (identifier < indiv_prop_start || identifier >= indiv_prop_start + 8)
            return 0;

    if ([engine.image integerAtOffset:engine.image.RAMStart + SELF_OFFSET] != obj)
    {
        int ix = [engine.image byteAtOffset:(prop + 9) & 1];
        if (ix != 0)
            return 0;
    }

    return (uint32_t)(4 * [engine.image shortAtOffset:prop + 2]);
}

// performs bounds checking when reading from a word array ("-->" operator)
- (uint32_t)RT__ChLDW:(uint32_t)array offset:(uint32_t)offset {
    uint32_t address = array + 4 * offset;
    if (address >= engine.image.endMemory) {
        return [engine nestedCallAtAddress:rt_err_fn arg:25];
    }
    return [engine.image integerAtOffset:address];
}

// reads the value of an object's property ("." operator)
- (uint32_t)RV__Pr:(uint32_t)obj identifier:(uint32_t)identifier {
    uint32_t addr = [self RA__Pr:obj identifier:identifier];
    if (addr == 0) {
        if (identifier > 0 && identifier < indiv_prop_start) {
            return [engine.image integerAtOffset:cpv_start + 4 * identifier];
        }

        [engine nestedCallAtAddress:rt_err_fn arg:readprop_err arg:obj arg:identifier];
        return 0;
    }

    return [engine.image integerAtOffset:addr];
}

// determines whether an object provides a given property ("provides" operator)
- (uint32_t)OP__Pr:(uint32_t)obj identifier:(uint32_t)identifier {
    switch ([self Z__Region:obj]) {
        case 3:
            if (identifier == indiv_prop_start + PRINT_PROP ||
                identifier == indiv_prop_start + PRINT_TO_ARRAY_PROP) {
                return 1;
            } else {
                return 0;
            }

        case 2:
            if (identifier == indiv_prop_start + CALL_PROP) {
                return 1;
            } else {
                return 0;
            }

        case 1:
            if (identifier >= indiv_prop_start && identifier < indiv_prop_start + 8) {
                if ([self parent:obj] == class_mc) {
                    return 1;
                }
            }

            if ([self RA__Pr:obj identifier:identifier] != 0) {
                return 1;
            } else {
                return 0;
            }

        default:
            return 0;
    }
}

// performs bounds checking when writing to a word array ("-->" operator)
- (uint32_t)RT__ChSTW:(uint32_t)array offset:(uint32_t)offset value:(uint32_t)value {
    uint32_t address = array + 4 * offset;
    if (address >= engine.image.endMemory || address < engine.image.RAMStart) {
        return [engine nestedCallAtAddress:rt_err_fn arg:27];
    }
    else {
        [engine.image writeInt32(address, val];
        return 0;
    }
}

// performs bounds checking when reading from a byte array ("->" operator)
- (uint32_t)RT__ChLDB(Engine e:(uint32_t) array:(uint32_t) offset)
{
    uint32_t address = array + offset;
    if (address >= engine.image.EndMem)
        return [engine nestedCallAtAddress:rt_err_fn, 24];

    return engine.image.ReadByte(address];
}

// determines the metaclass of a routine, string, or object ("metaclass()" function)
- (uint32_t)meta__class:(uint32_t)obj {
    switch ([self Z__Region:obj]) {
        case 2:
            return routine_mc;
        case 3:
            return string_mc;
        case 1:
            if ([self parent:obj] == class_mc)
                return class_mc;
            if (obj == class_mc || obj == string_mc ||
                obj == routine_mc || obj == object_mc)
                return class_mc;
            return object_mc;
        default:
            return 0;
    }
}
}
}

#pragma mark APIs

- (id)initWithEngine:(TFEngine *)e {
    self = [super init];
    
    engine = e;
    
    return self;
}

- (BOOL)setValue:(uint32_t)value forSlot:(uint32_t)slot {
    switch ((TFVeneerSlot)slot) {
        case TFVeneerSlotZ__Region: zregion_fn = value; break;
        case TFVeneerSlotCP__Tab: cp_tab_fn = value; break;
        case TFVeneerSlotOC__Cl: oc_cl_fn = value; break;
        case TFVeneerSlotRA__Pr: ra_pr_fn = value; break;
        case TFVeneerSlotRT__ChLDW: rt_chldw_fn = value; break;
        case TFVeneerSlotUnsigned__Compare: unsigned_compare_fn = value; break;
        case TFVeneerSlotRL__Pr: rl_pr_fn = value; break;
        case TFVeneerSlotRV__Pr: rv_pr_fn = value; break;
        case TFVeneerSlotOP__Pr: op_pr_fn = value; break;
        case TFVeneerSlotRT__ChSTW: rt_chstw_fn = value; break;
        case TFVeneerSlotRT__ChLDB: rt_chldb_fn = value; break;
        case TFVeneerSlotMeta__class: meta_class_fn = value; break;

        case TFVeneerSlotString: string_mc = value; break;
        case TFVeneerSlotRoutine: routine_mc = value; break;
        case TFVeneerSlotClass: class_mc = value; break;
        case TFVeneerSlotObject: object_mc = value; break;
        case TFVeneerSlotRT__Err: rt_err_fn = value; break;
        case TFVeneerSlotNUM_ATTR_BYTES: num_attr_bytes = value; break;
        case TFVeneerSlotclasses_table: classes_table = value; break;
        case TFVeneerSlotINDIV_PROP_START: indiv_prop_start = value; break;
        case TFVeneerSlotcpv__start: cpv_start = value; break;
        case TFVeneerSlotofclass_err: ofclass_err = value; break;
        case TFVeneerSlotreadprop_err: readprop_err = value; break;

        default:
            // not recognized
            return NO;
    }

    // recognized
    return YES;
}

- (BOOL)interceptCallAtAddress:(uint32_t)address args:(TFArguments *)args result:(uint32_t *)result {
    NSAssert(result != NULL, @"result parameter of interceptCallAtAddress:args:result: cannot be NULL");

    BOOL intercepted = NO;
    (*result) = 0;
    
    if (address != 0) {
        if (address == zregion_fn)
        {
            (*result) = [self Z__Region:[args argAtIndex:0]];
            intercepted = YES;
        } else if (address == cp_tab_fn)
        {
            (*result) = [self CP__Tab:[args argAtIndex:0] identifier:[args argAtIndex:1]];
            intercepted = YES;
        } else if (address == oc_cl_fn)
        {
            (*result) = [self OC__Cl:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == ra_pr_fn)
        {
            (*result) = [self RA__Pr:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == rt_chldw_fn)
        {
            (*result) = [self RT__ChLDW:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == unsigned_compare_fn)
        {
            (*result) = [self (uint)[args argAtIndex:0].CompareTo(args.arg2];
            intercepted = YES;
        } else if (address == rl_pr_fn)
        {
            (*result) = [self RL__Pr:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == rv_pr_fn)
        {
            (*result) = [self RV__Pr:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == op_pr_fn)
        {
            (*result) = [self OP__Pr:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == rt_chstw_fn)
        {
            (*result) = [self RT__ChSTW:[args argAtIndex:0], [args argAtIndex:1], [args argAtIndex:2]];
            intercepted = YES;
        } else if (address == rt_chldb_fn)
        {
            (*result) = [self RT__ChLDB:[args argAtIndex:0], [args argAtIndex:1]];
            intercepted = YES;
        } else if (address == meta_class_fn)
        {
            (*result) = [self meta__class:[args argAtIndex:0]];
            intercepted = YES;
        }
    }
    
    
    return intercepted;
}
@end
