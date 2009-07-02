/*
 * Copyright © 2009, Textfyre, Inc. - All Rights Reserved
 * Please read the accompanying COPYRIGHT file for licensing resstrictions.
 */
using System;

namespace Textfyre.VM
{
    // TODO: include Glulx backtrace in VM exceptions?

    /// <summary>
    /// An exception that is thrown by FyreVM when the game misbehaves.
    /// </summary>
    public class VMException : Exception
    {
        public VMException(string message)
            : base(message)
        {
        }

        public VMException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
