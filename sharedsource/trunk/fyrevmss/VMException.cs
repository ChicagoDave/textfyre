/*
 * Copyright © 2008, Textfyre, Inc. - All Rights Reserved
 * Please read the accompanying COPYRIGHT file for licensing restrictions.
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Textfyre.VM
{
    // TODO: include Glulx backtrace in VM exceptions?

    /// <summary>
    /// An exception that is thrown by FyreVM when the game misbehaves.
    /// </summary>
    public class VMException : Exception
    {
        /// <summary>
        /// Constructor with message.
        /// </summary>
        /// <param name="message"></param>
        public VMException(string message)
            : base(message)
        {
        }

        /// <summary>
        /// Constructor with message and inner exception.
        /// </summary>
        /// <param name="message"></param>
        /// <param name="innerException"></param>
        public VMException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
