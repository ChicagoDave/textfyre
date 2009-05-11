/*
 * Copyright © 2008, Textfyre, Inc. - All Rights Reserved
 * Please read the accompanying COPYRIGHT file for licensing resstrictions.
 */
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection.Emit;
using System.Reflection;

namespace Textfyre.VM
{
    /// <summary>
    /// A delegate type for methods that implement Glulx opcodes.
    /// </summary>
    /// <param name="operands">The array of operand values, passed in and out of
    /// the method.</param>
    /// <remarks><para>Elements of the <paramref name="operands"/> array that correspond to
    /// load operands will be filled with the loaded values before the method is called.
    /// Elements corresponding to store operands must be filled in by the method;
    /// after the method returns, those values will be read from the array and stored
    /// in their destinations.</para>
    /// <para>Note that "delayed store" operands take up two entries in the array.</para></remarks>
    internal delegate void OpcodeHandler(uint[] operands);

    /// <summary>
    /// Describes exceptions to the typical operand order and meaning
    /// for certain opcodes that don't fit the pattern.
    /// </summary>
    internal enum OpcodeRule : byte
    {
        /// <summary>
        /// No special treatment.
        /// </summary>
        None,
        /// <summary>
        /// Indirect operands work with single bytes.
        /// </summary>
        Indirect8Bit,
        /// <summary>
        /// Indirect operands work with 16-bit words.
        /// </summary>
        Indirect16Bit,
        /// <summary>
        /// Has an additional operand that resembles a store, but which
        /// is not actually passed out by the opcode handler. Instead, the
        /// handler receives two values, DestType and DestAddr, which may
        /// be written into a call stub so the result can be stored later.
        /// </summary>
        DelayedStore,
        /// <summary>
        /// Special case for op_catch. This opcode has a load operand 
        /// (the branch offset) and a delayed store, but the store comes first.
        /// args[0] and [1] are the delayed store, and args[2] is the load.
        /// </summary>
        Catch,
    }

    internal class Opcode
    {
        private readonly OpcodeAttribute attr;
        private readonly OpcodeHandler handler;

        public Opcode(Engine engine, OpcodeAttribute attr, MethodInfo method)
        {
            this.attr = attr;
            this.handler = MakeHandler(engine, attr, method);
        }

        public OpcodeAttribute Attr
        {
            get { return attr; }
        }

        public OpcodeHandler Handler
        {
            get { return handler; }
        }

        public override string ToString()
        {
            return attr.Name;
        }

        private static readonly Type[] HandlerParamTypes =
            new Type[] {
                typeof(Engine),
                typeof(uint[]), // operands
            };

        /// <summary>
        /// Generates a dynamic method that loads the operands for a particular
        /// opcode, calls the opcode implementation, and stores the results.
        /// </summary>
        /// <param name="engine">The <see cref="Engine"/> to associate with the method.</param>
        /// <param name="attr">The attribute describing the opcode's behavior.</param>
        /// <param name="method">The method containing the opcode's implementation.</param>
        /// <returns>A delegate for the generated method.</returns>
        private static OpcodeHandler MakeHandler(Engine engine, OpcodeAttribute attr,
            MethodInfo method)
        {
            DynamicMethod dm = new DynamicMethod("decode_" + attr.Name, null,
                HandlerParamTypes, typeof(Engine));
            ILGenerator il = dm.GetILGenerator();

            // arg 0: Engine
            // arg 1: uint[] operands

            byte loadArgs = attr.LoadArgs;
            byte storeArgs = attr.StoreArgs;
            OpcodeRule rule = attr.Rule;

            int opcount = loadArgs + storeArgs;
            if (rule == OpcodeRule.DelayedStore)
                opcount++;
            else if (rule == OpcodeRule.Catch)
                opcount += 2;
            int typeBytes = (opcount + 1) / 2;

            LocalBuilder imageLocal = il.DeclareLocal(typeof(UlxImage));
            LocalBuilder pcLocal = il.DeclareLocal(typeof(uint));
            LocalBuilder operandPosLocal = il.DeclareLocal(typeof(uint));
            LocalBuilder typeByteLocal = il.DeclareLocal(typeof(byte));
            FieldInfo imageFI = typeof(Engine).GetField("image", BindingFlags.NonPublic | BindingFlags.Instance);
            FieldInfo pcFI = typeof(Engine).GetField("pc", BindingFlags.NonPublic | BindingFlags.Instance);
            MethodInfo readByteMI = typeof(UlxImage).GetMethod("ReadByte");
            MethodInfo decodeLoadMI = typeof(Engine).GetMethod("DecodeLoadOperand", BindingFlags.NonPublic | BindingFlags.Instance);
            MethodInfo decodeStoreMI = typeof(Engine).GetMethod("DecodeStoreOperand", BindingFlags.NonPublic | BindingFlags.Instance);
            MethodInfo decodeDelayedMI = typeof(Engine).GetMethod("DecodeDelayedStoreOperand",
                BindingFlags.NonPublic | BindingFlags.Instance);
            MethodInfo storeResultMI = typeof(Engine).GetMethod("StoreResult", BindingFlags.NonPublic | BindingFlags.Instance);

            // load image and PC from fields, and calculate operandPos
            il.Emit(OpCodes.Ldarg_0);
            il.Emit(OpCodes.Ldfld, imageFI);
            il.Emit(OpCodes.Stloc, imageLocal);

            il.Emit(OpCodes.Ldarg_0);
            il.Emit(OpCodes.Ldfld, pcFI);
            il.Emit(OpCodes.Stloc, pcLocal);

            il.Emit(OpCodes.Ldloc, pcLocal);
            il.Emit(OpCodes.Ldc_I4_S, (byte)typeBytes);
            il.Emit(OpCodes.Add);
            il.Emit(OpCodes.Stloc, operandPosLocal);

            // read operand types into locals
            LocalBuilder[] opTypeLocals = new LocalBuilder[opcount];
            for (int i = 0; i < typeBytes; i++)
            {
                //byte x = image.ReadByte(pc + i);
                il.Emit(OpCodes.Ldloc, imageLocal);
                il.Emit(OpCodes.Ldloc, pcLocal);
                if (i > 0)
                {
                    il.Emit(OpCodes.Ldc_I4_S, (byte)i);
                    il.Emit(OpCodes.Add);
                }
                il.Emit(OpCodes.Call, readByteMI);
                il.Emit(OpCodes.Stloc, typeByteLocal);

                //opTypes[i * 2] = (byte)(x & 0xF);
                il.Emit(OpCodes.Ldloc, typeByteLocal);
                il.Emit(OpCodes.Ldc_I4_S, (byte)0xF);
                il.Emit(OpCodes.And);
                opTypeLocals[i * 2] = il.DeclareLocal(typeof(byte));
                il.Emit(OpCodes.Stloc, opTypeLocals[i * 2]);

                if (i * 2 + 1 < opcount)
                {
                    //opTypes[i * 2 + 1] = (byte)(x >> 4);
                    il.Emit(OpCodes.Ldloc, typeByteLocal);
                    il.Emit(OpCodes.Ldc_I4_4);
                    il.Emit(OpCodes.Shr_Un);
                    opTypeLocals[i * 2 + 1] = il.DeclareLocal(typeof(byte));
                    il.Emit(OpCodes.Stloc, opTypeLocals[i * 2 + 1]);
                }
            }

            // decode load-operands
            for (int i = 0; i < loadArgs; i++)
            {
                //operands[i] = DecodeLoadOperand(rule, opTypes[i], ref operandPos);
                il.Emit(OpCodes.Ldarg_1);
                il.Emit(OpCodes.Ldc_I4_S, (byte)i);

                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Ldc_I4, (int)rule);
                il.Emit(OpCodes.Ldloc, opTypeLocals[i]);
                il.Emit(OpCodes.Ldloca, operandPosLocal);
                il.Emit(OpCodes.Call, decodeLoadMI);

                il.Emit(OpCodes.Stelem_I4);
            }

            // decode store-operands
            LocalBuilder[] resultAddrLocals = new LocalBuilder[storeArgs];

            for (int i = 0; i < storeArgs; i++)
            {
                //resultAddrs[i] = DecodeStoreOperand(rule, type, ref operandPos);
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Ldc_I4, (int)rule);
                il.Emit(OpCodes.Ldloc, opTypeLocals[loadArgs + i]);
                il.Emit(OpCodes.Ldloca, operandPosLocal);
                il.Emit(OpCodes.Call, decodeStoreMI);
                resultAddrLocals[i] = il.DeclareLocal(typeof(uint));
                il.Emit(OpCodes.Stloc, resultAddrLocals[i]);
            }

            if (rule == OpcodeRule.DelayedStore || rule == OpcodeRule.Catch)
            {
                // decode delayed store operand
                //DecodeDelayedStoreOperand(type, ref operandPos,
                //    operands, loadArgs + storeArgs);
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Ldloc, opTypeLocals[loadArgs + storeArgs]);
                il.Emit(OpCodes.Ldloca, operandPosLocal);
                il.Emit(OpCodes.Ldarg_1);
                il.Emit(OpCodes.Ldc_I4_S, (byte)(loadArgs + storeArgs));
                il.Emit(OpCodes.Call, decodeDelayedMI);
            }

            if (rule == OpcodeRule.Catch)
            {
                // decode final load operand for @catch
                //operands[loadArgs + storeArgs + 2] =
                //    DecodeLoadOperand(rule, type, ref operandPos);
                il.Emit(OpCodes.Ldarg_1);
                il.Emit(OpCodes.Ldc_I4_S, (byte)(loadArgs + storeArgs + 2));

                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Ldc_I4, (int)rule);
                il.Emit(OpCodes.Ldloc, opTypeLocals[loadArgs + storeArgs + 1]);
                il.Emit(OpCodes.Ldloca, operandPosLocal);
                il.Emit(OpCodes.Call, decodeLoadMI);

                il.Emit(OpCodes.Stelem_I4);
            }

            // set PC to the new operandPos (which now points to the next instruction)
            il.Emit(OpCodes.Ldarg_0);
            il.Emit(OpCodes.Ldloc, operandPosLocal);
            il.Emit(OpCodes.Stfld, pcFI);

            // call the opcode implementation
            il.Emit(OpCodes.Ldarg_0);
            il.Emit(OpCodes.Ldarg_1);
            il.Emit(OpCodes.Call, method);

            // store results
            for (int i = 0; i < storeArgs; i++)
            {
                //StoreResult(rule, resultTypes[i], resultAddrs[i],
                //    operands[loadArgs + i]);
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Ldc_I4, (int)rule);
                il.Emit(OpCodes.Ldloc, opTypeLocals[loadArgs + i]);
                il.Emit(OpCodes.Ldloc, resultAddrLocals[i]);
                il.Emit(OpCodes.Ldarg_1);
                il.Emit(OpCodes.Ldc_I4_S, (byte)(loadArgs + i));
                il.Emit(OpCodes.Ldelem_U4);
                il.Emit(OpCodes.Call, storeResultMI);
            }
            
            il.Emit(OpCodes.Ret);
            return (OpcodeHandler)dm.CreateDelegate(typeof(OpcodeHandler), engine);
        }
    }

    /// <summary>
    /// Describes a method that implements a Glulx opcode. The method must
    /// fit the pattern of the <see cref="OpcodeHandler"/> delegate.
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    class OpcodeAttribute : Attribute
    {
        private uint number;
        private string name;
        private byte loadArgs, storeArgs;
        private OpcodeRule rule;

        public OpcodeAttribute(uint num, string name, byte loadArgs)
        {
            this.number = num;
            this.name = name;
            this.loadArgs = loadArgs;
        }

        public OpcodeAttribute(uint num, string name, byte loadArgs, byte storeArgs)
            : this(num, name, loadArgs)
        {
            this.storeArgs = storeArgs;
        }

        /// <summary>
        /// Gets the opcode number.
        /// </summary>
        public uint Number
        {
            get { return number; }
        }

        /// <summary>
        /// Gets the opcode's mnemonic name.
        /// </summary>
        public string Name
        {
            get { return name; }
        }

        /// <summary>
        /// Gets the number of load operands, which appear before any store operands.
        /// </summary>
        /// <remarks>
        /// If <see cref="Rule"/> is set to <see cref="OpcodeRule.Branch"/>,
        /// the branch offset is not included in this count.
        /// </remarks>
        public byte LoadArgs
        {
            get { return loadArgs; }
        }

        /// <summary>
        /// Gets the number of store operands, which appear after the load operands.
        /// </summary>
        public byte StoreArgs
        {
            get { return storeArgs; }
        }

        /// <summary>
        /// Gets a value describing anything exceptional about this opcode.
        /// </summary>
        public OpcodeRule Rule
        {
            get { return rule; }
            set { rule = value; }
        }
    }

    public partial class Engine
    {
        [Opcode(0x00, "nop", 0)]
        private void op_nop(uint[] args)
        {
            // do nothing!
        }

        #region Arithmetic

        [Opcode(0x10, "add", 2, 1)]
        private void op_add(uint[] args)
        {
            args[2] = args[0] + args[1];
        }

        [Opcode(0x11, "sub", 2, 1)]
        private void op_sub(uint[] args)
        {
            args[2] = args[0] - args[1];
        }

        [Opcode(0x12, "mul", 2, 1)]
        private void op_mul(uint[] args)
        {
            args[2] = args[0] * args[1];
        }

        [Opcode(0x13, "div", 2, 1)]
        private void op_div(uint[] args)
        {
            args[2] = (uint)((int)args[0] / (int)args[1]);
        }

        [Opcode(0x14, "mod", 2, 1)]
        private void op_mod(uint[] args)
        {
            args[2] = (uint)((int)args[0] % (int)args[1]);
        }

        [Opcode(0x15, "neg", 1, 1)]
        private void op_neg(uint[] args)
        {
            args[1] = (uint)(-(int)args[0]);
        }

        [Opcode(0x18, "bitand", 2, 1)]
        private void op_bitand(uint[] args)
        {
            args[2] = args[0] & args[1];
        }

        [Opcode(0x19, "bitor", 2, 1)]
        private void op_bitor(uint[] args)
        {
            args[2] = args[0] | args[1];
        }

        [Opcode(0x1A, "bitxor", 2, 1)]
        private void op_bitxor(uint[] args)
        {
            args[2] = args[0] ^ args[1];
        }

        [Opcode(0x1B, "bitnot", 1, 1)]
        private void op_bitnot(uint[] args)
        {
            args[1] = ~args[0];
        }

        [Opcode(0x1C, "shiftl", 2, 1)]
        private void op_shiftl(uint[] args)
        {
            if (args[1] >= 32)
                args[2] = 0;
            else
                args[2] = args[0] << (int)args[1];
        }

        [Opcode(0x1D, "sshiftr", 2, 1)]
        private void op_sshiftr(uint[] args)
        {
            if (args[1] >= 32)
                args[2] = ((args[0] & 0x80000000) == 0) ? 0 : 0xFFFFFFFF;
            else
                args[2] = (uint)((int)args[0] >> (int)args[1]);
        }

        [Opcode(0x1E, "ushiftr", 2, 1)]
        private void op_ushiftr(uint[] args)
        {
            if (args[1] >= 32)
                args[2] = 0;
            else
                args[2] = args[0] >> (int)args[1];
        }

        #endregion

        #region Branching

        private void TakeBranch(uint target)
        {
            if (target == 0)
                LeaveFunction(0);
            else if (target == 1)
                LeaveFunction(1);
            else
                pc += target - 2;
        }

        [Opcode(0x20, "jump", 1)]
        private void op_jump(uint[] args)
        {
            TakeBranch(args[0]);
        }

        [Opcode(0x22, "jz", 2)]
        private void op_jz(uint[] args)
        {
            if (args[0] == 0)
                TakeBranch(args[1]);
        }

        [Opcode(0x23, "jnz", 2)]
        private void op_jnz(uint[] args)
        {
            if (args[0] != 0)
                TakeBranch(args[1]);
        }

        [Opcode(0x24, "jeq", 3)]
        private void op_jeq(uint[] args)
        {
            if (args[0] == args[1])
                TakeBranch(args[2]);
        }

        [Opcode(0x25, "jne", 3)]
        private void op_jne(uint[] args)
        {
            if (args[0] != args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x26, "jlt", 3)]
        private void op_jlt(uint[] args)
        {
            if ((int)args[0] < (int)args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x27, "jge", 3)]
        private void op_jge(uint[] args)
        {
            if ((int)args[0] >= (int)args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x28, "jgt", 3)]
        private void op_jgt(uint[] args)
        {
            if ((int)args[0] > (int)args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x29, "jle", 3)]
        private void op_jle(uint[] args)
        {
            if ((int)args[0] <= (int)args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x2A, "jltu", 3)]
        private void op_jltu(uint[] args)
        {
            if (args[0] < args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x2B, "jgeu", 3)]
        private void op_jgeu(uint[] args)
        {
            if (args[0] >= args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x2C, "jgtu", 3)]
        private void op_jgtu(uint[] args)
        {
            if (args[0] > args[1])
                TakeBranch(args[2]);
        }
        
        [Opcode(0x2D, "jleu", 3)]
        private void op_jleu(uint[] args)
        {
            if (args[0] <= args[1])
                TakeBranch(args[2]);
        }

        [Opcode(0x104, "jumpabs", 1)]
        private void op_jumpabs(uint[] args)
        {
            pc = args[0];
        }

        #endregion

        #region Functions

        private uint[] funcargs1 = new uint[1];
        private uint[] funcargs2 = new uint[2];
        private uint[] funcargs3 = new uint[3];

        [Opcode(0x30, "call", 2, Rule = OpcodeRule.DelayedStore)]
        private void op_call(uint[] args)
        {
            int count = (int)args[1];
            uint[] funcargs = new uint[count];

            for (int i = 0; i < count; i++)
                funcargs[i] = Pop();

            PerformCall(args[0], funcargs, args[2], args[3]);
        }

        [Opcode(0x160, "callf", 1, Rule = OpcodeRule.DelayedStore)]
        private void op_callf(uint[] args)
        {
            PerformCall(args[0], null, args[1], args[2]);
        }

        [Opcode(0x161, "callfi", 2, Rule = OpcodeRule.DelayedStore)]
        private void op_callfi(uint[] args)
        {
            funcargs1[0] = args[1];
            PerformCall(args[0], funcargs1, args[2], args[3]);
        }

        [Opcode(0x162, "callfii", 3, Rule = OpcodeRule.DelayedStore)]
        private void op_callfii(uint[] args)
        {
            funcargs2[0] = args[1];
            funcargs2[1] = args[2];
            PerformCall(args[0], funcargs2, args[3], args[4]);
        }

        [Opcode(0x163, "callfiii", 4, Rule = OpcodeRule.DelayedStore)]
        private void op_callfiii(uint[] args)
        {
            funcargs3[0] = args[1];
            funcargs3[1] = args[2];
            funcargs3[2] = args[3];
            PerformCall(args[0], funcargs3, args[4], args[5]);
        }

        private void PerformCall(uint address, uint[] args, uint destType, uint destAddr)
        {
            PerformCall(address, args, destType, destAddr, pc);
        }

        private void PerformCall(uint address, uint[] args, uint destType, uint destAddr, uint stubPC)
        {
            PerformCall(address, args, destType, destAddr, stubPC, false);
        }

        /// <summary>
        /// Enters a function, pushing a call stub first if necessary.
        /// </summary>
        /// <param name="address">The address of the function to call.</param>
        /// <param name="args">The function's arguments, or <b>null</b> to call without arguments.</param>
        /// <param name="destType">The DestType for the call stub. Ignored for tail calls.</param>
        /// <param name="destAddr">The DestAddr for the call stub. Ignored for tail calls.</param>
        /// <param name="stubPC">The PC value for the call stub. Ignored for tail calls.</param>
        /// <param name="tailCall"><b>true</b> to perform a tail call, reusing the current call stub
        /// and frame instead of pushing a new stub and creating a new frame.</param>
        private void PerformCall(uint address, uint[] args, uint destType, uint destAddr, uint stubPC, bool tailCall)
        {
            uint result;
            if (veneer.InterceptCall(this, address, args, out result))
            {
                PerformDelayedStore(destType, destAddr, result);
                return;
            }

            if (tailCall)
            {
                // pop the current frame and use the call stub below it
                sp = fp;
            }
            else
            {
                // use a new call stub
                PushCallStub(new CallStub(destType, destAddr, stubPC, fp));
            }

            byte type = image.ReadByte(address);
            if (type == 0xC0)
            {
                // arguments are passed in on the stack
                EnterFunction(address);
                if (args == null)
                {
                    Push(0);
                }
                else
                {
                    for (int i = args.Length - 1; i >= 0; i--)
                        Push(args[i]);
                    Push((uint)args.Length);
                }
            }
            else if (type == 0xC1)
            {
                // arguments are passed in local storage
                EnterFunction(address, args);
            }
            else
                throw new VMException(string.Format("Invalid function type {0:X}h", type));
        }

        [Opcode(0x31, "return", 1)]
        private void op_return(uint[] args)
        {
            LeaveFunction(args[0]);
        }

        [Opcode(0x32, "catch", 0, Rule = OpcodeRule.Catch)]
        private void op_catch(uint[] args)
        {
            PushCallStub(new CallStub(args[0], args[1], pc, fp));
            // the catch token is the value of sp after pushing that stub
            PerformDelayedStore(args[0], args[1], sp);
            TakeBranch(args[2]);
        }

        [Opcode(0x33, "throw", 2)]
        private void op_throw(uint[] args)
        {
            if (args[1] > sp)
                throw new VMException("Invalid catch token");

            // pop the stack back down to the stub pushed by catch
            sp = args[1];

            // restore from the stub
            CallStub stub = PopCallStub();
            pc = stub.PC;
            fp = stub.FramePtr;
            frameLen = ReadFromStack(fp);
            localsPos = ReadFromStack(fp + 4);

            // store the thrown value and resume after the catch opcode
            PerformDelayedStore(stub.DestType, stub.DestAddr, args[0]);
        }

        [Opcode(0x34, "tailcall", 2)]
        private void op_tailcall(uint[] args)
        {
            int count = (int)args[1];
            uint[] funcargs = new uint[count];

            for (int i = 0; i < count; i++)
                funcargs[i] = Pop();

            PerformCall(args[0], funcargs, 0, 0, 0, true);
        }

        #endregion

        #region Variables and Arrays

        [Opcode(0x40, "copy", 1, 1)]
        private void op_copy(uint[] args)
        {
            args[1] = args[0];
        }
        
        [Opcode(0x41, "copys", 1, 1, Rule = OpcodeRule.Indirect16Bit)]
        private void op_copys(uint[] args)
        {
            args[1] = args[0];
        }

        [Opcode(0x42, "copyb", 1, 1, Rule = OpcodeRule.Indirect8Bit)]
        private void op_copyb(uint[] args)
        {
            args[1] = args[0];
        }

        [Opcode(0x44, "sexs", 1, 1)]
        private void op_sexs(uint[] args)
        {
            args[1] = (uint)(int)(short)args[0];
        }

        [Opcode(0x45, "sexb", 1, 1)]
        private void op_sexb(uint[] args)
        {
            args[1] = (uint)(int)(sbyte)args[0];
        }

        [Opcode(0x48, "aload", 2, 1)]
        private void op_aload(uint[] args)
        {
            args[2] = image.ReadInt32(args[0] + 4 * args[1]);
        }

        [Opcode(0x49, "aloads", 2, 1)]
        private void op_aloads(uint[] args)
        {
            args[2] = image.ReadInt16(args[0] + 2 * args[1]);
        }

        [Opcode(0x4A, "aloadb", 2, 1)]
        private void op_aloadb(uint[] args)
        {
            args[2] = image.ReadByte(args[0] + args[1]);
        }

        [Opcode(0x4B, "aloadbit", 2, 1)]
        private void op_aloadbit(uint[] args)
        {
            uint address = (uint)(args[0] + ((int)args[1]) / 8);
            byte bit = (byte)(((int)args[1]) % 8);

            byte value = image.ReadByte(address);
            args[2] = (value & (1 << bit)) == 0 ? (uint)0 : (uint)1;
        }

        [Opcode(0x4C, "astore", 3)]
        private void op_astore(uint[] args)
        {
            image.WriteInt32(args[0] + 4 * args[1], args[2]);
        }

        [Opcode(0x4D, "astores", 3)]
        private void op_astores(uint[] args)
        {
            image.WriteInt16(args[0] + 2 * args[1], (ushort)args[2]);
        }

        [Opcode(0x4E, "astoreb", 3)]
        private void op_astoreb(uint[] args)
        {
            image.WriteByte(args[0] + args[1], (byte)args[2]);
        }

        [Opcode(0x4F, "astorebit", 3)]
        private void op_astorebit(uint[] args)
        {
            uint address = (uint)(args[0] + ((int)args[1]) / 8);
            byte bit = (byte)(((int)args[1]) % 8);

            byte value = image.ReadByte(address);
            if (args[2] == 0)
                value &= (byte)(~(1 << bit));
            else
                value |= (byte)(1 << bit);
            image.WriteByte(address, value);
        }

        #endregion

        #region Output

        [Opcode(0x70, "streamchar", 1)]
        private void op_streamchar(uint[] args)
        {
            StreamCharCore((byte)args[0]);
        }

        [Opcode(0x73, "streamunichar", 1)]
        private void op_streamunichar(uint[] args)
        {
            StreamCharCore(args[0]);
        }

        private void StreamCharCore(uint value)
        {
            if (outputSystem == IOSystem.Filter)
            {
                PerformCall(filterAddress, new uint[] { value }, GLULX_STUB_STORE_NULL, 0);
            }
            else
            {
                SendCharToOutput(value);
            }
        }

        [Opcode(0x71, "streamnum", 1)]
        private void op_streamnum(uint[] args)
        {
            if (outputSystem == IOSystem.Filter)
            {
                PushCallStub(new CallStub(GLULX_STUB_RESUME_FUNC, 0, pc, fp));
                string num = ((int)args[0]).ToString();
                PerformCall(filterAddress, new uint[] { (uint)num[0] },
                    GLULX_STUB_RESUME_NUMBER, 1, args[0]);
            }
            else
            {
                string num = ((int)args[0]).ToString();
                SendStringToOutput(num);
            }
        }

        [Opcode(0x72, "streamstr", 1)]
        private void op_streamstr(uint[] args)
        {
            if (outputSystem == IOSystem.Null)
                return;

            uint address = args[0];
            byte type = image.ReadByte(address);

            // for retrying a compressed string after we discover it needs a call stub
            byte savedDigit = 0;
            StrNode savedNode = null;

            /* if we're not using the userland output filter, and the string is
             * uncompressed (or contains no indirect references), we can just print it
             * right here. */
            if (outputSystem != IOSystem.Filter)
            {
                switch (type)
                {
                    case 0xE0:
                        // C string
                        SendStringToOutput(ReadCString(address + 1));
                        return;
                    case 0xE2:
                        // Unicode string
                        SendStringToOutput(ReadUniString(address + 4));
                        return;
                    case 0xE1:
                        // compressed string
                        if (nativeDecodingTable != null)
                        {
                            uint oldPC = pc;

                            pc = address + 1;
                            printingDigit = 0;

                            StrNode node = nativeDecodingTable.GetHandlingNode(this);
                            while (!node.NeedsCallStub)
                            {
                                if (node.IsTerminator)
                                {
                                    pc = oldPC;
                                    return;
                                }

                                node.HandleNextChar(this);

                                node = nativeDecodingTable.GetHandlingNode(this);
                            }

                            savedDigit = printingDigit;
                            savedNode = node;
                            address = pc - 1;
                            pc = oldPC;
                        }
                        break;
                }
            }

            // can't decompress anything without a decoding table
            if (type == 0xE1 && decodingTable == 0)
                throw new VMException("No string decoding table is set");

            /* otherwise, we have to push a call stub and let the main
             * interpreter loop take care of printing the string. */
            PushCallStub(new CallStub(GLULX_STUB_RESUME_FUNC, 0, pc, fp));

            switch (type)
            {
                case 0xE0:
                    execMode = ExecutionMode.CString;
                    pc = address + 1;
                    break;
                case 0xE1:
                    execMode = ExecutionMode.CompressedString;
                    pc = address + 1;
                    printingDigit = savedDigit;
                    // this won't read a bit, since savedNode can't be a branch...
                    if (savedNode != null)
                        savedNode.HandleNextChar(this);
                    break;
                case 0xE2:
                    execMode = ExecutionMode.UnicodeString;
                    pc = address + 4;
                    break;
                default:
                    throw new VMException(string.Format("Invalid string type {0:X}h", type));
            }
        }

        [Opcode(0x130, "glk", 2, 1)]
        private void op_glk(uint[] args)
        {
            // not really supported, just clear the stack
            for (uint i = 0; i < args[1]; i++)
                Pop();
            args[2] = 0;
        }

        [Opcode(0x140, "getstringtbl", 0, 1)]
        private void op_getstringtbl(uint[] args)
        {
            args[0] = decodingTable;
        }

        [Opcode(0x141, "setstringtbl", 1)]
        private void op_setstringtbl(uint[] args)
        {
            decodingTable = args[0];
            CacheDecodingTable();
        }

        [Opcode(0x148, "getiosys", 0, 2)]
        private void op_getiosys(uint[] args)
        {
            switch (outputSystem)
            {
                case IOSystem.Null:
                    args[0] = 0;
                    args[1] = 0;
                    break;

                case IOSystem.Filter:
                    args[0] = 1;
                    args[1] = filterAddress;
                    break;

                case IOSystem.Channels:
                    args[0] = 20;
                    args[1] = 0;
                    break;
            }
        }

        [Opcode(0x149, "setiosys", 2, 0)]
        private void op_setiosys(uint[] args)
        {
            SelectOutputSystem(args[0], args[1]);
        }

        #endregion

        #region Memory Management

        [Opcode(0x102, "getmemsize", 0, 1)]
        private void op_getmemsize(uint[] args)
        {
            args[0] = image.EndMem;
        }

        [Opcode(0x103, "setmemsize", 1, 1)]
        private void op_setmemsize(uint[] args)
        {
            if (heap != null)
                throw new VMException("setmemsize is not allowed while the heap is active");

            try
            {
                image.EndMem = args[0];
                args[1] = 0;
            }
            catch
            {
                args[1] = 1;
            }
        }

        [Opcode(0x170, "mzero", 2)]
        private void op_mzero(uint[] args)
        {
            for (uint i = 0; i < args[0]; i++)
                image.WriteByte(args[1] + i, 0);
        }

        [Opcode(0x171, "mcopy", 3)]
        private void op_mcopy(uint[] args)
        {
            if (args[2] < args[1])
            {
                for (uint i = 0; i < args[0]; i++)
                    image.WriteByte(args[2] + i, image.ReadByte(args[1] + i));
            }
            else
            {
                for (uint i = args[0] - 1; i >= 0; i--)
                    image.WriteByte(args[2] + i, image.ReadByte(args[1] + i));
            }
        }

        private bool HandleHeapMemoryRequest(uint newEndMem)
        {
            try
            {
                image.EndMem = newEndMem;
                return true;
            }
            catch
            {
                return false;
            }
        }

        [Opcode(0x178, "malloc", 1, 1)]
        private void op_malloc(uint[] args)
        {
            uint size = args[0];
            if ((int)size <= 0)
            {
                args[1] = 0;
                return;
            }

            if (heap == null)
            {
                uint oldEndMem = image.EndMem;
                heap = new HeapAllocator(oldEndMem, HandleHeapMemoryRequest);
                heap.MaxSize = maxHeapSize;
                args[1] = heap.Alloc(size);
                if (args[1] == 0)
                {
                    heap = null;
                    image.EndMem = oldEndMem;
                }
            }
            else
            {
                args[1] = heap.Alloc(size);
            }
        }

        [Opcode(0x179, "mfree", 1)]
        private void op_mfree(uint[] args)
        {
            if (heap != null)
            {
                heap.Free(args[0]);
                if (heap.BlockCount == 0)
                {
                    image.EndMem = heap.Address;
                    heap = null;
                }
            }
        }

        #endregion

        #region Searching

        [Flags]
        private enum SearchOptions
        {
            None = 0,

            KeyIndirect = 1,
            ZeroKeyTerminates = 2,
            ReturnIndex = 4,
        }

        private bool KeyIsZero(uint address, uint size)
        {
            for (uint i = 0; i < size; i++)
                if (image.ReadByte(address + i) != 0)
                    return false;

            return true;
        }

        private int CompareKeys(uint query, uint candidate, uint keySize, SearchOptions options)
        {
            if ((options & SearchOptions.KeyIndirect) == 0)
            {
                uint ckey;
                switch (keySize)
                {
                    case 1:
                        ckey = image.ReadByte(candidate);
                        query &= 0xFF;
                        break;
                    case 2:
                        ckey = image.ReadInt16(candidate);
                        query &= 0xFFFF;
                        break;
                    case 3:
                        ckey = (uint)(image.ReadByte(candidate) << 24 + image.ReadInt16(candidate + 1));
                        query &= 0xFFFFFF;
                        break;
                    default:
                        ckey = image.ReadInt32(candidate);
                        break;
                }

                return query.CompareTo(ckey);
            }

            for (uint i = 0; i < keySize; i++)
            {
                byte b1 = image.ReadByte(query++);
                byte b2 = image.ReadByte(candidate++);
                if (b1 < b2)
                    return -1;
                else if (b1 > b2)
                    return 1;
            }

            return 0;
        }

        [Opcode(0x150, "linearsearch", 7, 1)]
        private void op_linearsearch(uint[] args)
        {
            uint key = args[0];
            uint keySize = args[1];
            uint start = args[2];
            uint structSize = args[3];
            uint numStructs = args[4];
            uint keyOffset = args[5];
            SearchOptions options = (SearchOptions)args[6];

            if (keySize > 4 && (options & SearchOptions.KeyIndirect) == 0)
                throw new VMException("KeyIndirect option must be used when searching for a >4 byte key");

            uint result = (options & SearchOptions.KeyIndirect) == 0 ? 0 : 0xFFFFFFFF;

            for (uint index = 0; index < numStructs; index++)
            {
                if ((options & SearchOptions.ZeroKeyTerminates) != 0 &&
                    KeyIsZero(start + index * structSize + keyOffset, keySize))
                {
                    // stop searching, even if this key would match
                    break;
                }

                int cmp = CompareKeys(key, start + index * structSize + keyOffset, keySize, options);
                if (cmp == 0)
                {
                    // found it
                    if ((options & SearchOptions.ReturnIndex) == 0)
                        result = start + index * structSize;
                    else
                        result = index;
                    break;
                }
            }

            args[7] = result;
        }

        [Opcode(0x151, "binarysearch", 7, 1)]
        private void op_binarysearch(uint[] args)
        {
            uint key = args[0];
            uint keySize = args[1];
            uint start = args[2];
            uint structSize = args[3];
            uint numStructs = args[4];
            uint keyOffset = args[5];
            SearchOptions options = (SearchOptions)args[6];

            args[7] = PerformBinarySearch(key, keySize, start, structSize, numStructs, keyOffset, options);
        }

        // this is a separate method because it's also used by Veneer.CP__Tab
        private uint PerformBinarySearch(uint key, uint keySize, uint start, uint structSize, uint numStructs, uint keyOffset, SearchOptions options)
        {
            if ((options & SearchOptions.ReturnIndex) != 0)
                throw new VMException("ReturnIndex option may not be used with binarysearch");
            if (keySize > 4 && (options & SearchOptions.KeyIndirect) == 0)
                throw new VMException("KeyIndirect option must be used when searching for a >4 byte key");

            uint result = (options & SearchOptions.ReturnIndex) == 0 ? 0 : 0xFFFFFFFF;
            uint low = 0, high = numStructs;

            while (low < high)
            {
                uint index = (low + high) / 2;
                int cmp = CompareKeys(key, start + index * structSize + keyOffset, keySize, options);
                if (cmp == 0)
                {
                    // found it
                    if ((options & SearchOptions.ReturnIndex) == 0)
                        result = start + index * structSize;
                    else
                        result = index;
                    break;
                }
                else if (cmp < 0)
                {
                    high = index;
                }
                else
                {
                    low = index + 1;
                }
            }
            return result;
        }

        [Opcode(0x152, "linkedsearch", 6, 1)]
        private void op_linkedsearch(uint[] args)
        {
            uint key = args[0];
            uint keySize = args[1];
            uint start = args[2];
            uint keyOffset = args[3];
            uint nextOffset = args[4];
            SearchOptions options = (SearchOptions)args[5];

            uint result = 0;
            uint node = start;

            while (node != 0)
            {
                if ((options & SearchOptions.ZeroKeyTerminates) != 0 &&
                    KeyIsZero(node + keyOffset, keySize))
                {
                    // stop searching, even if this key would match
                    break;
                }

                int cmp = CompareKeys(key, node + keyOffset, keySize, options);
                if (cmp == 0)
                {
                    // found it
                    result = node;
                    break;
                }

                // advance to next item
                node = image.ReadInt32(node + nextOffset);
            }

            args[6] = result;
        }

        #endregion

        #region Stack Manipulation

        [Opcode(0x50, "stkcount", 0, 1)]
        private void op_stkcount(uint[] args)
        {
            args[0] = (sp - (fp + frameLen)) / 4;
        }

        [Opcode(0x51, "stkpeek", 1, 1)]
        private void op_stkpeek(uint[] args)
        {
            uint position = sp - 4 * (1 + args[0]);
            if (position < (fp + frameLen))
                throw new VMException("Stack underflow");

            args[1] = ReadFromStack(position);
        }

        [Opcode(0x52, "stkswap", 0)]
        private void op_stkswap(uint[] args)
        {
            if (sp - (fp + frameLen) < 8)
                throw new VMException("Stack underflow");

            uint a = Pop();
            uint b = Pop();
            Push(a);
            Push(b);
        }

        [Opcode(0x53, "stkroll", 2)]
        private void op_stkroll(uint[] args)
        {
            int items = (int)args[0];
            int distance = (int)args[1];

            if (items != 0)
            {
                distance %= items;

                if (distance != 0)
                {
                    // rolling X items down Y slots == rolling X items up X-Y slots
                    if (distance < 0)
                        distance += items;

                    if (sp - (fp + frameLen) < 4 * items)
                        throw new VMException("Stack underflow");

                    Stack<uint> temp1 = new Stack<uint>(distance);
                    Stack<uint> temp2 = new Stack<uint>(items - distance);

                    for (int i = 0; i < distance; i++)
                        temp1.Push(Pop());
                    for (int i = distance; i < items; i++)
                        temp2.Push(Pop());
                    while (temp1.Count > 0)
                        Push(temp1.Pop());
                    while (temp2.Count > 0)
                        Push(temp2.Pop());
                }
            }
        }

        [Opcode(0x54, "stkcopy", 1)]
        private void op_stkcopy(uint[] args)
        {
            uint bytes = args[0] * 4;
            if (bytes > sp - (fp + frameLen))
                throw new VMException("Stack underflow");

            uint start = sp - bytes;
            while (bytes-- > 0)
                stack[sp++] = stack[start++];
        }

        #endregion

        private enum Gestalt
        {
            GlulxVersion = 0,
            TerpVersion = 1,
            ResizeMem = 2,
            Undo = 3,
            IOSystem = 4,
            Unicode = 5,
            MemCopy = 6,
            MAlloc = 7,
            MAllocHeap = 8,
        }

        [Opcode(0x100, "gestalt", 2, 1)]
        private void op_gestalt(uint[] args)
        {
            Gestalt selector = (Gestalt)args[0];
            switch (selector)
            {
                case Gestalt.GlulxVersion:
                    args[2] = 0x00030100;
                    break;

                case Gestalt.TerpVersion:
                    args[2] = 0x00000900;
                    break;

                case Gestalt.ResizeMem:
                case Gestalt.Undo:
                case Gestalt.Unicode:
                case Gestalt.MemCopy:
                case Gestalt.MAlloc:
                    args[2] = 1;
                    break;

                case Gestalt.IOSystem:
                    if (args[1] == 0 || args[1] == 1 || args[1] == 20)
                        args[2] = 1;
                    else
                        args[2] = 0;
                    break;

                case Gestalt.MAllocHeap:
                    if (heap == null)
                        args[2] = 0;
                    else
                        args[2] = heap.Address;
                    break;

                default:
                    // unrecognized gestalt selector
                    args[2] = 0;
                    break;
            }
        }

        [Opcode(0x101, "debugtrap", 1)]
        private void op_debugtrap(uint[] args)
        {
            uint status = args[0];
            System.Diagnostics.Debugger.Break();
        }

        #region Game State

        [Opcode(0x120, "quit", 0)]
        private void op_quit(uint[] args)
        {
            // end execution
            running = false;
        }

        [Opcode(0x121, "verify", 0, 1)]
        private void op_verify(uint[] args)
        {
            // we already verified the game when it was loaded
            args[0] = 0;
        }

        [Opcode(0x122, "restart", 0)]
        private void op_restart(uint[] args)
        {
            Restart();
        }

        [Opcode(0x123, "save", 1, Rule = OpcodeRule.DelayedStore)]
        private void op_save(uint[] args)
        {
            if (nestingLevel == 0 && SaveRequested != null)
            {
                SaveRestoreEventArgs e = new SaveRestoreEventArgs();
                SaveRequested(this, e);
                if (e.Stream != null)
                {
                    try
                    {
                        SaveToStream(e.Stream, args[1], args[2]);
                    }
                    finally
                    {
                        e.Stream.Close();
                    }
                    PerformDelayedStore(args[1], args[2], 0);
                    return;
                }
            }

            // failed
            PerformDelayedStore(args[1], args[2], 1);
        }

        [Opcode(0x124, "restore", 1, Rule = OpcodeRule.DelayedStore)]
        private void op_restore(uint[] args)
        {
            if (LoadRequested != null)
            {
                SaveRestoreEventArgs e = new SaveRestoreEventArgs();
                LoadRequested(this, e);
                if (e.Stream != null)
                {
                    try
                    {
                        LoadFromStream(e.Stream);
                    }
                    finally
                    {
                        e.Stream.Close();
                    }
                    return;
                }
            }

            // failed
            PerformDelayedStore(args[1], args[2], 1);
        }

        [Opcode(0x125, "saveundo", 0, 0, Rule = OpcodeRule.DelayedStore)]
        private void op_saveundo(uint[] args)
        {
            if (nestingLevel != 0)
            {
                // can't save if there's native code on the call stack
                PerformDelayedStore(args[0], args[1], 1);
                return;
            }

            MemoryStream buffer = new MemoryStream();
            SaveToStream(buffer, args[0], args[1]);

            if (undoBuffers.Count >= MAX_UNDO_LEVEL)
                undoBuffers.RemoveAt(0);

            undoBuffers.Add(buffer);

            PerformDelayedStore(args[0], args[1], 0);
        }

        [Opcode(0x126, "restoreundo", 0, 0, Rule = OpcodeRule.DelayedStore)]
        private void op_restoreundo(uint[] args)
        {
            if (undoBuffers.Count == 0)
            {
                PerformDelayedStore(args[0], args[1], 1);
            }
            else
            {
                MemoryStream buffer = undoBuffers[undoBuffers.Count - 1];
                undoBuffers.RemoveAt(undoBuffers.Count - 1);

                buffer.Seek(0, System.IO.SeekOrigin.Begin);
                LoadFromStream(buffer);
            }
        }

        [Opcode(0x127, "protect", 2)]
        private void op_protect(uint[] args)
        {
            if (args[0] < image.EndMem)
            {
                protectionStart = args[0];
                protectionLength = args[1];

                if (protectionStart >= image.RamStart)
                {
                    protectionStart -= image.RamStart;
                }
                else
                {
                    protectionStart = 0;
                    protectionLength -= image.RamStart - protectionStart;
                }

                if (protectionStart + protectionLength > image.EndMem)
                    protectionLength = image.EndMem - protectionStart;
            }
        }

        #endregion

        #region Random Number Generator

        [Opcode(0x110, "random", 1, 1)]
        private void op_random(uint[] args)
        {
            if (args[0] == 0)
            {
                // 32 random bits
                byte[] buffer = new byte[4];
                randomGenerator.NextBytes(buffer);
                args[1] = (uint)(buffer[0] << 24 + buffer[1] << 16 + buffer[2] << 8 + buffer[3]);
            }
            else if ((int)args[0] > 0)
            {
                // range: 0 to args[0] - 1
                args[1] = (uint)randomGenerator.Next((int)args[0]);
            }
            else
            {
                // range: args[0] + 1 to 0
                args[1] = (uint)(-randomGenerator.Next(-(int)args[0]));
            }
        }

        [Opcode(0x111, "setrandom", 1)]
        private void op_setrandom(uint[] args)
        {
            if (args[0] == 0)
                randomGenerator = new Random();
            else
                randomGenerator = new Random((int)args[0]);
        }

        #endregion

        #region FyreVM Specific

        /// <summary>
        /// Selects a function for the FyreVM system call opcode.
        /// </summary>
        private enum FyreCall
        {
            /// <summary>
            /// Reads a line from the user: args[1] = buffer, args[2] = buffer size.
            /// </summary>
            ReadLine = 1,
            /// <summary>
            /// Selects a text style: args[1] = an OutputStyle value (see OutputBuffer.cs).
            /// </summary>
            SetStyle = 2,
            /// <summary>
            /// Converts a character to lowercase: args[1] = the character,
            /// result = the lowercased character.
            /// </summary>
            ToLower = 3,
            /// <summary>
            /// Converts a character to uppercase: args[1] = the character,
            /// result = the uppercased character.
            /// </summary>
            ToUpper = 4,
            /// <summary>
            /// Selects an output channel: args[1] = an OutputChannel value (see Output.cs).
            /// </summary>
            Channel = 5,
            /// <summary>
            /// Turns the main channel's output filtering on or off: args[1] = nonzero to
            /// turn it on.
            /// </summary>
            EnableFilter = 6,
            /// <summary>
            /// Reads a character from the user: result = the 16-bit Unicode value.
            /// </summary>
            ReadKey = 7,
            /// <summary>
            /// Registers a veneer function address or constant value: args[1] = a
            /// VeneerSlot value (see Veneer.cs), args[2] = the function address or
            /// constant value, result = nonzero if the value was accepted.
            /// </summary>
            SetVeneer = 8,
        }

        [Opcode(0x1000, "fyrecall", 3, 1)]
        private void op_fyrecall(uint[] args)
        {
            args[3] = 0;

            FyreCall call = (FyreCall)args[0];
            switch (call)
            {
                case FyreCall.ReadLine:
                    DeliverOutput();
                    InputLine(args[1], args[2]);
                    break;

                case FyreCall.ReadKey:
                    DeliverOutput();
                    args[3] = (uint)InputChar();
                    break;

                case FyreCall.SetStyle:
                    outputBuffer.SetStyle((OutputStyle)args[1]);
                    break;

                case FyreCall.ToLower:
                case FyreCall.ToUpper:
                    byte[] bytes = new byte[] { (byte)args[1] };
                    char[] chars = System.Text.Encoding.GetEncoding(LATIN1_CODEPAGE).GetChars(bytes);
                    if (call == FyreCall.ToLower)
                        chars[0] = char.ToLower(chars[0]);
                    else
                        chars[0] = char.ToUpper(chars[0]);
                    bytes = System.Text.Encoding.GetEncoding(LATIN1_CODEPAGE).GetBytes(chars);
                    args[3] = bytes[0];
                    break;

                case FyreCall.Channel:
                    outputBuffer.Channel = (OutputChannel)args[1];
                    break;

                case FyreCall.EnableFilter:
                    outputBuffer.FilterEnabled = (args[1] != 0);
                    break;

                case FyreCall.SetVeneer:
                    args[3] = (uint)(veneer.SetSlot(args[1], args[2]) ? 1 : 0);
                    break;

                default:
                    throw new VMException("Unrecognized FyreVM system call #" + args[0].ToString());
            }
        }

        #endregion
    }
}
