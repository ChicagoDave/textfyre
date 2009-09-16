using System;
using System.Collections.Generic;
using System.Collections;
using System.ComponentModel; 

namespace Textfyre.TextfyreWeb.BusinessLayer { 

    /// <summary>
    /// Starter Download domain class. This class is only generated the first time and will not
    /// be over-written by the code generation tool.
    /// </summary>
    [Serializable()]
    public class Download : DownloadBase, IEditableObject {
        
        /// <summary>
        /// Empty default constructor.
        /// </summary>
        public Download() : base() {
        }

        public Download(Int32 DownloadId) : base(DownloadId) {
		}        

        /// <summary>
        /// Empty constructor that accepts a Downloadrecordset object.
        /// </summary>
        public Download(DownloadRecordset Recordset) : base(Recordset) {
        }

        public DownloadCollection LoadByUserId(Guid UserId) {
            return DataLayer.DownloadData.LoadByUserId(UserId);
        }

        #region "IEditableObject Interface" 
        /// <summary>
        /// IEditableObject: Original data container.
        /// </summary>
        private Hashtable _OriginalData; 
        /// <summary>
        /// IEditableObject: Editing flag.
        /// </summary>
        private bool _Editing = false; 
        /// <summary>
        /// IEditableObject: IsAddNew flag.
        /// </summary>
        private bool _IsAddNew = false; 
        
        /// <summary>
        /// IEditableObject: Cancel Add New Event.
        /// </summary>
        public event CancelAddNewEventHandler CancelAddNew; 
        /// <summary>
        /// IEditableObject: Cancel Add New delegate.
        /// </summary>
        public delegate void CancelAddNewEventHandler(Download sender, bool Remove);
        
        /// <summary>
        /// IEditableObject: New object constructor.
        /// </summary>
        public Download(bool IsAddNew) : this(0) { 
            _IsAddNew = IsAddNew; 
        } 
        
        /// <summary>
        /// IEditableObject: Begin edit methTextfyre. Saves original data.
        /// </summary>
        public void BeginEdit() { 
            if (!_Editing) { 
                _Editing = true; 
                _OriginalData = new Hashtable(); 
                PropertyDescriptorCollection Properties = TypeDescriptor.GetProperties(this); 
                foreach (PropertyDescriptor prop in Properties) { 
                    _OriginalData.Add(prop, prop.GetValue(this)); 
                } 
            } 
        } 
        
        /// <summary>
        /// IEditableObject: End editing. Clears flags and original data storage.
        /// </summary>
        public void EndEdit() { 
            if (_Editing) { 
                if ((_IsAddNew)) { 
                    if (CancelAddNew != null)
                        CancelAddNew(this, false);
                }
                _OriginalData = null; 
                _Editing = false; 
            } 
        } 
        
        /// <summary>
        /// IEditableObject: Cancel Edit. Resets original data.
        /// </summary>
        public void CancelEdit() { 
            if (_Editing) { 
                if ((_IsAddNew)) { 
                    if (CancelAddNew != null) 
                        CancelAddNew(this, true);
                } 
                else { 
                    PropertyDescriptor prop; 
                    foreach (DictionaryEntry entry in _OriginalData) { 
                        prop = (PropertyDescriptor)entry.Key; 
                        prop.SetValue(this, entry.Value); 
                    } 
                    _OriginalData = null; 
                    _Editing = false; 
                } 
            } 
        } 
        #endregion 
    } 
} 