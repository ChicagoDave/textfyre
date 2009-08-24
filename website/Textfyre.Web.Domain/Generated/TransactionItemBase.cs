/*
 *  DO NOT EDIT THIS CLASS.
 * 
 *  This class is generated by a tool and should not be edited. If you need to change the functionality of 
 *  this class, you should discuss your changes with the team and they should be implemented in the
 *  appropriate template.
 *  
 */
using System; 
using System.Data; 
using System.Data.SqlClient;
using System.Collections.Generic;
using System.ComponentModel;
using Textfyre.TextfyreWeb.DataLayer;

namespace Textfyre.TextfyreWeb.BusinessLayer { 
    
    /// <summary>
    /// Base TransactionItem domain class. This class is generated for each build and should never be modified
    /// directly. To change the functionality, the domainBase.cs template should be modified and related code
    /// generations tested.
    /// </summary>
    [Serializable()]
    public abstract class TransactionItemBase : INotifyPropertyChanged {

        #region Members
        /// <summary>
        /// Internal items collection for the TransactionItem domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.TransactionItemCollection _items = new TransactionItemCollection();
        /// <summary>
        /// Internal recordset for the TransactionItem domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset _recordset = new TransactionItemRecordset();

        /// <summary>
        /// Non-serialized instance of the TransactionItem data layer class.
        /// </summary>
        [NonSerialized]
        private Textfyre.TextfyreWeb.DataLayer.TransactionItemData _dataFactory;

        /// <summary>
        /// String constant containing 'TransactionItem'.
        /// </summary>
        private const string TABLE_NAME = "TransactionItem";

        /// <summary>
        /// Property Changed event definition.
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// Notify Property changed event handler.
        /// </summary>
        private void NotifyPropertyChanged(String info) {
            if (PropertyChanged != null) {
                PropertyChanged(this, new PropertyChangedEventArgs(info));
            }
        }

        #endregion
        
        #region Constructors
        /// <summary> 
        /// Empty default constructor. 
        /// </summary> 
        public TransactionItemBase() {
            _dataFactory = new TransactionItemData();
        }

        public TransactionItemBase(Int32 ItemId) : this() {
				Load(ItemId);
		}                     
        
        /// <summary> 
        /// Recordset constructor. 
        /// </summary> 
        public TransactionItemBase(Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset Recordset) : this() {             
            _recordset = Recordset; 
            _recordset.IsDirty = false; 
        }
        #endregion 
        
        #region Methods
        
        /// <summary>
        /// Load method that retrieves a record from the TransactionItem table by the primary key id.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset Load(Int32 ItemId) {
            _recordset = DataFactory.GetTransactionItemById(ItemId);
            return _recordset;
        }

        /// <summary>
        /// LoadAll function that will load all records from the TransactionItem table.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.TransactionItemCollection LoadAll() {
            Fill(DataFactory.GetAllTransactionItem());
            return _items;
        }

        /// <summary>
        /// Mark a record for deletion. Record is not physically deleted until .Save() is called.
        /// </summary>
        public virtual void Delete() {
            _recordset.IsDeleted = true;
        }

        /// <summary>
        /// Delete a record and commit the deletion to the database.
        /// </summary>
        public virtual void DeleteNow() {
            _recordset.IsDeleted = true;
            Save();
        }

        /// <summary>
        /// Overload for calling save without concern for the new primary key on insert.
        /// </summary>
        public virtual int Save() {
            Int32 newPrimaryKey;
            return Save(out newPrimaryKey);
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(out Int32 newPrimaryKey)
        {
            int ReturnValue = -1;
            newPrimaryKey = -1;
            
            if (_recordset.IsDeleted) {
                ReturnValue = DataFactory.DeleteTransactionItem(_recordset.ItemId);                
            } else {
                if (_recordset.ItemId == -1) {
                    newPrimaryKey = _dataFactory.InsertTransactionItem(_recordset);
					if (newPrimaryKey != -1)
						ReturnValue = -1;
					else
						ReturnValue = 0;;                    
                } else {
                    if(_recordset.IsDirty) {    
                        ReturnValue = DataFactory.UpdateTransactionItem(_recordset);                        
                    }
                }

                _recordset.IsDirty = false;
            }

            if (DataFactory.CacheManager != null) {
                string cacheKey = DataFactory.CacheManager.CreateCacheKey(TABLE_NAME, null);
                DataFactory.CacheManager.Remove2(cacheKey);
            }

            return ReturnValue;
        }


        /// <summary>
        /// Fill a collection of recordsets from the data layer list.
        /// </summary>
        protected void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset> recs) {
            Items.Fill(recs);
            _items.IsCollectionDirty = false;
        }
        #endregion

        #region Properties


		public virtual Int32 ItemId {
			get { return _recordset.ItemId; }
			set {
				if (_recordset.ItemId != value) {
					_recordset.ItemId = value;
					NotifyPropertyChanged("ItemId");
				}
			}
		}

		public virtual Int32 TransactionId {
			get { return _recordset.TransactionId; }
			set {
				if (_recordset.TransactionId != value) {
					_recordset.TransactionId = value;
					NotifyPropertyChanged("TransactionId");
				}
			}
		}

		public virtual Byte? Sequence {
			get { return _recordset.Sequence; }
			set {
				if (_recordset.Sequence != value) {
					_recordset.Sequence = value;
					NotifyPropertyChanged("Sequence");
				}
			}
		}

		public virtual string ItemName {
			get { return _recordset.ItemName; }
			set {
				if (_recordset.ItemName != value) {
					_recordset.ItemName = value;
					NotifyPropertyChanged("ItemName");
				}
			}
		}

		public virtual string ItemNumber {
			get { return _recordset.ItemNumber; }
			set {
				if (_recordset.ItemNumber != value) {
					_recordset.ItemNumber = value;
					NotifyPropertyChanged("ItemNumber");
				}
			}
		}

		public virtual Int32? Quantity {
			get { return _recordset.Quantity; }
			set {
				if (_recordset.Quantity != value) {
					_recordset.Quantity = value;
					NotifyPropertyChanged("Quantity");
				}
			}
		}

		public virtual decimal? MCGross {
			get { return _recordset.MCGross; }
			set {
				if (_recordset.MCGross != value) {
					_recordset.MCGross = value;
					NotifyPropertyChanged("MCGross");
				}
			}
		}

		public virtual string Option1 {
			get { return _recordset.Option1; }
			set {
				if (_recordset.Option1 != value) {
					_recordset.Option1 = value;
					NotifyPropertyChanged("Option1");
				}
			}
		}

		public virtual string Option2 {
			get { return _recordset.Option2; }
			set {
				if (_recordset.Option2 != value) {
					_recordset.Option2 = value;
					NotifyPropertyChanged("Option2");
				}
			}
		}

		public virtual string Option3 {
			get { return _recordset.Option3; }
			set {
				if (_recordset.Option3 != value) {
					_recordset.Option3 = value;
					NotifyPropertyChanged("Option3");
				}
			}
		}

		public virtual string SKU {
			get { return _recordset.SKU; }
			set {
				if (_recordset.SKU != value) {
					_recordset.SKU = value;
					NotifyPropertyChanged("SKU");
				}
			}
		}


        /// <summary>
        /// Current recordset.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset Recordset { 
            get { return _recordset; } 
            set { _recordset = value; } 
        } 
        
        /// <summary>
        /// Flag that identifies a modified record.
        /// </summary>
        public virtual bool IsDirty { 
            get { return _recordset.IsDirty; } 
            set { _recordset.IsDirty = value; } 
        } 

        /// <summary>
        /// Instance of DataBase class to enable data layer execution.
        /// </summary>
        protected Textfyre.TextfyreWeb.DataLayer.TransactionItemData DataFactory { 
            get {
                if (_dataFactory == null)
                    _dataFactory = new TransactionItemData();
                return _dataFactory;
            } 
        }

        /// <summary>
        /// Collection of records.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.TransactionItemCollection Items {
            get {
                if (_items == null)
                    _items = new Textfyre.TextfyreWeb.BusinessLayer.TransactionItemCollection();
                return _items;
            }
            set {
                _items = value;
            }
        }

        /// <summary>
        /// Collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset> ItemsData {
            get {
                List<Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset> recs = new List<Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset>();
                foreach(Textfyre.TextfyreWeb.BusinessLayer.TransactionItem entity in Items) {
                    recs.Add((Textfyre.TextfyreWeb.BusinessLayer.TransactionItemRecordset)entity.Recordset.Clone());
                }

                return recs;
            }
        }
        #endregion

        #region Sorting Delegates
        /// <summary>
        /// Internal class containing sorting delegates.
        /// </summary>
        public class SortBy
        {
			public static Comparison<TransactionItem> ItemIdColumnASC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o1.ItemId, o2.ItemId);
					};

			public static Comparison<TransactionItem> ItemIdColumnDESC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o2.ItemId, o1.ItemId);
					};

			public static Comparison<TransactionItem> TransactionIdColumnASC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o1.TransactionId, o2.TransactionId);
					};

			public static Comparison<TransactionItem> TransactionIdColumnDESC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o2.TransactionId, o1.TransactionId);
					};

			public static Comparison<TransactionItem> SequenceColumnASC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Byte>(o1.Sequence, o2.Sequence);
					};

			public static Comparison<TransactionItem> SequenceColumnDESC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Byte>(o2.Sequence, o1.Sequence);
					};

			public static Comparison<TransactionItem> ItemNameColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.ItemName.CompareTo(o2.ItemName);
				};

			public static Comparison<TransactionItem> ItemNameColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.ItemName.CompareTo(o1.ItemName);
				};

			public static Comparison<TransactionItem> ItemNumberColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.ItemNumber.CompareTo(o2.ItemNumber);
				};

			public static Comparison<TransactionItem> ItemNumberColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.ItemNumber.CompareTo(o1.ItemNumber);
				};

			public static Comparison<TransactionItem> QuantityColumnASC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o1.Quantity, o2.Quantity);
					};

			public static Comparison<TransactionItem> QuantityColumnDESC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<Int32>(o2.Quantity, o1.Quantity);
					};

			public static Comparison<TransactionItem> MCGrossColumnASC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<decimal>(o1.MCGross, o2.MCGross);
					};

			public static Comparison<TransactionItem> MCGrossColumnDESC =
					delegate(TransactionItem o1, TransactionItem o2)
					{
						return Nullable.Compare<decimal>(o2.MCGross, o1.MCGross);
					};

			public static Comparison<TransactionItem> Option1ColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.Option1.CompareTo(o2.Option1);
				};

			public static Comparison<TransactionItem> Option1ColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.Option1.CompareTo(o1.Option1);
				};

			public static Comparison<TransactionItem> Option2ColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.Option2.CompareTo(o2.Option2);
				};

			public static Comparison<TransactionItem> Option2ColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.Option2.CompareTo(o1.Option2);
				};

			public static Comparison<TransactionItem> Option3ColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.Option3.CompareTo(o2.Option3);
				};

			public static Comparison<TransactionItem> Option3ColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.Option3.CompareTo(o1.Option3);
				};

			public static Comparison<TransactionItem> SKUColumnASC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o1.SKU.CompareTo(o2.SKU);
				};

			public static Comparison<TransactionItem> SKUColumnDESC =
				delegate(TransactionItem o1, TransactionItem o2)
				{
					return o2.SKU.CompareTo(o1.SKU);
				};


        }

        #endregion
    } 
} 