/*
 *  DO NOT EDIT THIS CLASS.
 * 
 *  This class is generated by a tool and should not be edited. If you need to change the functionality of 
 *  this class, you should discuss your changes with the team and they should be implemented in the
 *  appropriate template.
 *  
 */
using System;

namespace Textfyre.TextfyreWeb.BusinessLayer {   
    /// <summary>
    /// CustomerDownloadRecordsetBase class.
    /// </summary>
    [Serializable()]
    public abstract class CustomerDownloadRecordsetBase { 
      #region Members

			/// <summary>
			/// Email field.
			/// </summary>
			private string _Email;
			/// <summary>
			/// ProductId field.
			/// </summary>
			private string _ProductId;
			/// <summary>
			/// PurchaseDateTime field.
			/// </summary>
			private DateTime _PurchaseDateTime;
      /// <summary>
      /// _isDirty field.
      /// </summary>
      private bool _isDirty = false;
      /// <summary>
      /// _isDeleted field.
      /// </summary>
      private bool _isDeleted = false;
      /// <summary>
      /// _isInserted field.
      /// </summary>
      private bool _isInserted = false;
      #endregion 

      #region Properties
        

		public string Email {
			get { return _Email; }
			set {
				if(_Email != value) {
					_isDirty = true;
					_Email = value;
				}
			}
		}

		public string ProductId {
			get { return _ProductId; }
			set {
				if(_ProductId != value) {
					_isDirty = true;
					_ProductId = value;
				}
			}
		}

		public DateTime PurchaseDateTime {
			get { return _PurchaseDateTime; }
			set {
				if(_PurchaseDateTime != value) {
					_isDirty = true;
					_PurchaseDateTime = value;
				}
			}
		}

        
      /// <summary>
      /// Flag for when recordset data has changed.
      /// </summary>
      public bool IsDirty { 
          get { return _isDirty; } 
          set { _isDirty = value; } 
      } 
        
      /// <summary>
      /// Delete flag.
      /// </summary>
      public bool IsDeleted { 
          get { return _isDeleted; } 
          set { _isDeleted = value; } 
      }

      /// <summary>
      /// Insert flag for composite keys only.
      /// </summary>
      public bool IsInserted {
          get { return _isInserted; }
          set { _isInserted = value; }
      }
        
      #endregion 
        
      /// <summary>
      /// Empty constructor.
      /// </summary>
      public CustomerDownloadRecordsetBase() {
      } 

      /// <summary>
      /// Returns a new instance of the current recordset.
      /// </summary>
      /// <returns></returns>
      public virtual CustomerDownloadRecordset Clone() {
          CustomerDownloadRecordset newCustomerDownloadRS = new CustomerDownloadRecordset(); 
          newCustomerDownloadRS.Email = _Email;
					newCustomerDownloadRS.ProductId = _ProductId;
					newCustomerDownloadRS.PurchaseDateTime = _PurchaseDateTime;
					
          newCustomerDownloadRS.IsDirty = _isDirty;
          newCustomerDownloadRS.IsDeleted = _isDeleted;
          return newCustomerDownloadRS; 
      }

      /// <summary>
      /// Sets the identity column.
      /// </summary>
      /// <param name="IdentityValue"></param>
		public void SetIdentity(string Email, string ProductId) {
			_Email = Email;
			_ProductId = ProductId;

		}

    } 
} 