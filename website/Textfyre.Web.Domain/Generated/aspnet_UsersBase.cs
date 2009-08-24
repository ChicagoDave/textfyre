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
    /// Base aspnet_Users domain class. This class is generated for each build and should never be modified
    /// directly. To change the functionality, the domainBase.cs template should be modified and related code
    /// generations tested.
    /// </summary>
    [Serializable()]
    public abstract class aspnet_UsersBase : INotifyPropertyChanged {

        #region Members
        /// <summary>
        /// Internal items collection for the aspnet_Users domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersCollection _items = new aspnet_UsersCollection();
        /// <summary>
        /// Internal recordset for the aspnet_Users domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset _recordset = new aspnet_UsersRecordset();

        /// <summary>
        /// Non-serialized instance of the aspnet_Users data layer class.
        /// </summary>
        [NonSerialized]
        private Textfyre.TextfyreWeb.DataLayer.aspnet_UsersData _dataFactory;

        /// <summary>
        /// String constant containing 'aspnet_Users'.
        /// </summary>
        private const string TABLE_NAME = "aspnet_Users";

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
        public aspnet_UsersBase() {
            _dataFactory = new aspnet_UsersData();
        }

        public aspnet_UsersBase(Guid UserId) : this() {
				Load(UserId);
		}                     
        
        /// <summary> 
        /// Recordset constructor. 
        /// </summary> 
        public aspnet_UsersBase(Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset Recordset) : this() {             
            _recordset = Recordset; 
            _recordset.IsDirty = false; 
        }
        #endregion 
        
        #region Methods
        
        /// <summary>
        /// Load method that retrieves a record from the aspnet_Users table by the primary key id.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset Load(Guid UserId) {
            _recordset = DataFactory.Getaspnet_UsersById(UserId);
            return _recordset;
        }

        /// <summary>
        /// LoadAll function that will load all records from the aspnet_Users table.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersCollection LoadAll() {
            Fill(DataFactory.GetAllaspnet_Users());
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
            Guid newPrimaryKey;
            return Save(out newPrimaryKey);
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(out Guid newPrimaryKey)
        {
            int ReturnValue = -1;
            newPrimaryKey = Guid.Empty;
            
            if (_recordset.IsDeleted) {
                ReturnValue = DataFactory.Deleteaspnet_Users(_recordset.UserId);                
            } else {
                if (_recordset.UserId == Guid.Empty) {
                    newPrimaryKey = _dataFactory.Insertaspnet_Users(_recordset);
					if (newPrimaryKey != Guid.Empty)
						ReturnValue = -1;
					else
						ReturnValue = 0;;                    
                } else {
                    if(_recordset.IsDirty) {    
                        ReturnValue = DataFactory.Updateaspnet_Users(_recordset);                        
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
        protected void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset> recs) {
            Items.Fill(recs);
            _items.IsCollectionDirty = false;
        }
        #endregion

        #region Properties


		public virtual Guid ApplicationId {
			get { return _recordset.ApplicationId; }
			set {
				if (_recordset.ApplicationId != value) {
					_recordset.ApplicationId = value;
					NotifyPropertyChanged("ApplicationId");
				}
			}
		}

		public virtual Guid UserId {
			get { return _recordset.UserId; }
			set {
				if (_recordset.UserId != value) {
					_recordset.UserId = value;
					NotifyPropertyChanged("UserId");
				}
			}
		}

		public virtual string UserName {
			get { return _recordset.UserName; }
			set {
				if (_recordset.UserName != value) {
					_recordset.UserName = value;
					NotifyPropertyChanged("UserName");
				}
			}
		}

		public virtual string LoweredUserName {
			get { return _recordset.LoweredUserName; }
			set {
				if (_recordset.LoweredUserName != value) {
					_recordset.LoweredUserName = value;
					NotifyPropertyChanged("LoweredUserName");
				}
			}
		}

		public virtual string MobileAlias {
			get { return _recordset.MobileAlias; }
			set {
				if (_recordset.MobileAlias != value) {
					_recordset.MobileAlias = value;
					NotifyPropertyChanged("MobileAlias");
				}
			}
		}

		public virtual bool IsAnonymous {
			get { return _recordset.IsAnonymous; }
			set {
				if (_recordset.IsAnonymous != value) {
					_recordset.IsAnonymous = value;
					NotifyPropertyChanged("IsAnonymous");
				}
			}
		}

		public virtual DateTime LastActivityDate {
			get { return _recordset.LastActivityDate; }
			set {
				if (_recordset.LastActivityDate != value) {
					_recordset.LastActivityDate = value;
					NotifyPropertyChanged("LastActivityDate");
				}
			}
		}


        /// <summary>
        /// Current recordset.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset Recordset { 
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
        protected Textfyre.TextfyreWeb.DataLayer.aspnet_UsersData DataFactory { 
            get {
                if (_dataFactory == null)
                    _dataFactory = new aspnet_UsersData();
                return _dataFactory;
            } 
        }

        /// <summary>
        /// Collection of records.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersCollection Items {
            get {
                if (_items == null)
                    _items = new Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersCollection();
                return _items;
            }
            set {
                _items = value;
            }
        }

        /// <summary>
        /// Collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset> ItemsData {
            get {
                List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset> recs = new List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset>();
                foreach(Textfyre.TextfyreWeb.BusinessLayer.aspnet_Users entity in Items) {
                    recs.Add((Textfyre.TextfyreWeb.BusinessLayer.aspnet_UsersRecordset)entity.Recordset.Clone());
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
			public static Comparison<aspnet_Users> ApplicationIdColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.ApplicationId.CompareTo(o2.ApplicationId);
				};

			public static Comparison<aspnet_Users> ApplicationIdColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.ApplicationId.CompareTo(o1.ApplicationId);
				};

			public static Comparison<aspnet_Users> UserIdColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.UserId.CompareTo(o2.UserId);
				};

			public static Comparison<aspnet_Users> UserIdColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.UserId.CompareTo(o1.UserId);
				};

			public static Comparison<aspnet_Users> UserNameColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.UserName.CompareTo(o2.UserName);
				};

			public static Comparison<aspnet_Users> UserNameColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.UserName.CompareTo(o1.UserName);
				};

			public static Comparison<aspnet_Users> LoweredUserNameColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.LoweredUserName.CompareTo(o2.LoweredUserName);
				};

			public static Comparison<aspnet_Users> LoweredUserNameColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.LoweredUserName.CompareTo(o1.LoweredUserName);
				};

			public static Comparison<aspnet_Users> MobileAliasColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.MobileAlias.CompareTo(o2.MobileAlias);
				};

			public static Comparison<aspnet_Users> MobileAliasColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.MobileAlias.CompareTo(o1.MobileAlias);
				};

			public static Comparison<aspnet_Users> IsAnonymousColumnASC =
					delegate(aspnet_Users o1, aspnet_Users o2)
					{
						return Nullable.Compare<bool>(o1.IsAnonymous, o2.IsAnonymous);
					};

			public static Comparison<aspnet_Users> IsAnonymousColumnDESC =
					delegate(aspnet_Users o1, aspnet_Users o2)
					{
						return Nullable.Compare<bool>(o2.IsAnonymous, o1.IsAnonymous);
					};

			public static Comparison<aspnet_Users> LastActivityDateColumnASC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o1.LastActivityDate.CompareTo(o2.LastActivityDate);
				};

			public static Comparison<aspnet_Users> LastActivityDateColumnDESC =
				delegate(aspnet_Users o1, aspnet_Users o2)
				{
					return o2.LastActivityDate.CompareTo(o1.LastActivityDate);
				};


        }

        #endregion
    } 
} 