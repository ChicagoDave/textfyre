using System;
using System.Web.Compilation;
using System.Resources;
using System.Collections;
using System.Collections.Generic;

namespace IAAI.Common.Globalization
{
   /// <summary>
   /// Implementation of IResourceReader required to retrieve a dictionary
   /// of resource values for implicit localization. 
   /// </summary>
   public class SqlDbResourceReader : DisposableBaseType, IResourceReader {

       #region Constants
       private const string READER_ALREADY_DISPOSED = "SqlDbResourceReader object is already disposed.";
       #endregion

       #region Members
       private Dictionary<string, string> m_resourceDictionary;
       #endregion

       #region Constructor
       public SqlDbResourceReader(Dictionary<string, string> resourceDictionary) {
           this.m_resourceDictionary = resourceDictionary;
       }
       #endregion

       #region Overriden Cleanup Method (DisposableBaseType)
       protected override void Cleanup() {
           base.Cleanup();
           this.m_resourceDictionary = null;
       }
       #endregion

       #region IResourceReader Members

       public void Close() {
           this.Dispose();
       }

       public IDictionaryEnumerator GetEnumerator() {                      
           // NOTE: this is the only enumerator called by the runtime for 
           // implicit expressions

           if (Disposed) {
               throw new ObjectDisposedException(READER_ALREADY_DISPOSED);
           }

           return this.m_resourceDictionary.GetEnumerator();
       }

       #endregion

       #region IEnumerable Members

       IEnumerator IEnumerable.GetEnumerator() {
           if (Disposed) {
               throw new ObjectDisposedException(READER_ALREADY_DISPOSED);
           }

           return this.m_resourceDictionary.GetEnumerator();
       }

       #endregion
   }

}