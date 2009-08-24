using System;
using IAAI.Common.Logging;

namespace IAAI.Common.Globalization
{
    public class DisposableBaseType : IDisposable {

        #region Members
        private bool _disposed;
        #endregion

        #region Properties
        public bool Disposed {
            get {
                lock (this) { return _disposed; }
            }
        }
        #endregion

        #region IDisposable Implementation

        public void Dispose() {
            lock (this) {
                if (!_disposed) {
                    
                    try {
                        Cleanup();
                    } catch(Exception ex) {
                        Logger.LogMessage(typeof(DisposableBaseType).FullName, "Dispose",
                                          "An exception occurred while disposing.", ex,
                                          Severity.WARN, LogLocation.TEXT_FILE);
                    }

                    _disposed = true;
                    GC.SuppressFinalize(this);
                }
            }
        }

        #endregion

        #region Virtual cleanup method
        protected virtual void Cleanup() { 
            //Default implementation is to do nothing
        }
        #endregion

        #region Finalizer
        //Finalizer won't run if Dispose is explicitly called
        ~DisposableBaseType() {
            try {
                Cleanup();
            } catch(Exception ex) {
                Logger.LogMessage(typeof(DisposableBaseType).FullName, "~DisposableBaseType",
                                  "An exception occurred in destructor.", ex,
                                  Severity.WARN, LogLocation.TEXT_FILE);                
            }
        }
        #endregion
    }
}
