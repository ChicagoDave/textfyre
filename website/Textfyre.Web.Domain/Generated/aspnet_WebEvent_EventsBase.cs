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
    /// Base aspnet_WebEvent_Events domain class. This class is generated for each build and should never be modified
    /// directly. To change the functionality, the domainBase.cs template should be modified and related code
    /// generations tested.
    /// </summary>
    [Serializable()]
    public abstract class aspnet_WebEvent_EventsBase : INotifyPropertyChanged {

        #region Members
        /// <summary>
        /// Internal items collection for the aspnet_WebEvent_Events domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsCollection _items = new aspnet_WebEvent_EventsCollection();
        /// <summary>
        /// Internal recordset for the aspnet_WebEvent_Events domain class.
        /// </summary>
        private Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset _recordset = new aspnet_WebEvent_EventsRecordset();

        /// <summary>
        /// Non-serialized instance of the aspnet_WebEvent_Events data layer class.
        /// </summary>
        [NonSerialized]
        private Textfyre.TextfyreWeb.DataLayer.aspnet_WebEvent_EventsData _dataFactory;

        /// <summary>
        /// String constant containing 'aspnet_WebEvent_Events'.
        /// </summary>
        private const string TABLE_NAME = "aspnet_WebEvent_Events";

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
        public aspnet_WebEvent_EventsBase() {
            _dataFactory = new aspnet_WebEvent_EventsData();
        }

        public aspnet_WebEvent_EventsBase(string EventId) : this() {
				Load(EventId);
		}                     
        
        /// <summary> 
        /// Recordset constructor. 
        /// </summary> 
        public aspnet_WebEvent_EventsBase(Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset Recordset) : this() {             
            _recordset = Recordset; 
            _recordset.IsDirty = false; 
        }
        #endregion 
        
        #region Methods
        
        /// <summary>
        /// Load method that retrieves a record from the aspnet_WebEvent_Events table by the primary key id.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset Load(string EventId) {
            _recordset = DataFactory.Getaspnet_WebEvent_EventsById(EventId);
            return _recordset;
        }

        /// <summary>
        /// LoadAll function that will load all records from the aspnet_WebEvent_Events table.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsCollection LoadAll() {
            Fill(DataFactory.GetAllaspnet_WebEvent_Events());
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
            Save(SaveOperation.Delete);
        }

        public enum SaveOperation {
            Insert,
            Update,
            Delete
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(SaveOperation saveOperation)
        {
            int ReturnValue = -1;
            
            if (_recordset.IsDeleted || saveOperation == SaveOperation.Delete) {
                ReturnValue = DataFactory.Deleteaspnet_WebEvent_Events(_recordset.EventId);                
            } else {
                if (saveOperation == SaveOperation.Insert) {
                    ReturnValue = _dataFactory.Insertaspnet_WebEvent_Events(_recordset);
                    
                } else {
                    if(_recordset.IsDirty) {    
                        ReturnValue = DataFactory.Updateaspnet_WebEvent_Events(_recordset);                        
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
        protected void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> recs) {
            Items.Fill(recs);
            _items.IsCollectionDirty = false;
        }
        #endregion

        #region Properties


		public virtual string EventId {
			get { return _recordset.EventId; }
			set {
				if (_recordset.EventId != value) {
					_recordset.EventId = value;
					NotifyPropertyChanged("EventId");
				}
			}
		}

		public virtual DateTime EventTimeUtc {
			get { return _recordset.EventTimeUtc; }
			set {
				if (_recordset.EventTimeUtc != value) {
					_recordset.EventTimeUtc = value;
					NotifyPropertyChanged("EventTimeUtc");
				}
			}
		}

		public virtual DateTime EventTime {
			get { return _recordset.EventTime; }
			set {
				if (_recordset.EventTime != value) {
					_recordset.EventTime = value;
					NotifyPropertyChanged("EventTime");
				}
			}
		}

		public virtual string EventType {
			get { return _recordset.EventType; }
			set {
				if (_recordset.EventType != value) {
					_recordset.EventType = value;
					NotifyPropertyChanged("EventType");
				}
			}
		}

		public virtual decimal EventSequence {
			get { return _recordset.EventSequence; }
			set {
				if (_recordset.EventSequence != value) {
					_recordset.EventSequence = value;
					NotifyPropertyChanged("EventSequence");
				}
			}
		}

		public virtual decimal EventOccurrence {
			get { return _recordset.EventOccurrence; }
			set {
				if (_recordset.EventOccurrence != value) {
					_recordset.EventOccurrence = value;
					NotifyPropertyChanged("EventOccurrence");
				}
			}
		}

		public virtual Int32 EventCode {
			get { return _recordset.EventCode; }
			set {
				if (_recordset.EventCode != value) {
					_recordset.EventCode = value;
					NotifyPropertyChanged("EventCode");
				}
			}
		}

		public virtual Int32 EventDetailCode {
			get { return _recordset.EventDetailCode; }
			set {
				if (_recordset.EventDetailCode != value) {
					_recordset.EventDetailCode = value;
					NotifyPropertyChanged("EventDetailCode");
				}
			}
		}

		public virtual string Message {
			get { return _recordset.Message; }
			set {
				if (_recordset.Message != value) {
					_recordset.Message = value;
					NotifyPropertyChanged("Message");
				}
			}
		}

		public virtual string ApplicationPath {
			get { return _recordset.ApplicationPath; }
			set {
				if (_recordset.ApplicationPath != value) {
					_recordset.ApplicationPath = value;
					NotifyPropertyChanged("ApplicationPath");
				}
			}
		}

		public virtual string ApplicationVirtualPath {
			get { return _recordset.ApplicationVirtualPath; }
			set {
				if (_recordset.ApplicationVirtualPath != value) {
					_recordset.ApplicationVirtualPath = value;
					NotifyPropertyChanged("ApplicationVirtualPath");
				}
			}
		}

		public virtual string MachineName {
			get { return _recordset.MachineName; }
			set {
				if (_recordset.MachineName != value) {
					_recordset.MachineName = value;
					NotifyPropertyChanged("MachineName");
				}
			}
		}

		public virtual string RequestUrl {
			get { return _recordset.RequestUrl; }
			set {
				if (_recordset.RequestUrl != value) {
					_recordset.RequestUrl = value;
					NotifyPropertyChanged("RequestUrl");
				}
			}
		}

		public virtual string ExceptionType {
			get { return _recordset.ExceptionType; }
			set {
				if (_recordset.ExceptionType != value) {
					_recordset.ExceptionType = value;
					NotifyPropertyChanged("ExceptionType");
				}
			}
		}

		public virtual string Details {
			get { return _recordset.Details; }
			set {
				if (_recordset.Details != value) {
					_recordset.Details = value;
					NotifyPropertyChanged("Details");
				}
			}
		}


        /// <summary>
        /// Current recordset.
        /// </summary>
        public virtual Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset Recordset { 
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
        protected Textfyre.TextfyreWeb.DataLayer.aspnet_WebEvent_EventsData DataFactory { 
            get {
                if (_dataFactory == null)
                    _dataFactory = new aspnet_WebEvent_EventsData();
                return _dataFactory;
            } 
        }

        /// <summary>
        /// Collection of records.
        /// </summary>
        public Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsCollection Items {
            get {
                if (_items == null)
                    _items = new Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsCollection();
                return _items;
            }
            set {
                _items = value;
            }
        }

        /// <summary>
        /// Collection of recordsets.
        /// </summary>
        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> ItemsData {
            get {
                List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset> recs = new List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset>();
                foreach(Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_Events entity in Items) {
                    recs.Add((Textfyre.TextfyreWeb.BusinessLayer.aspnet_WebEvent_EventsRecordset)entity.Recordset.Clone());
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
			public static Comparison<aspnet_WebEvent_Events> EventIdColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.EventId.CompareTo(o2.EventId);
				};

			public static Comparison<aspnet_WebEvent_Events> EventIdColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.EventId.CompareTo(o1.EventId);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTimeUtcColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.EventTimeUtc.CompareTo(o2.EventTimeUtc);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTimeUtcColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.EventTimeUtc.CompareTo(o1.EventTimeUtc);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTimeColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.EventTime.CompareTo(o2.EventTime);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTimeColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.EventTime.CompareTo(o1.EventTime);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTypeColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.EventType.CompareTo(o2.EventType);
				};

			public static Comparison<aspnet_WebEvent_Events> EventTypeColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.EventType.CompareTo(o1.EventType);
				};

			public static Comparison<aspnet_WebEvent_Events> EventSequenceColumnASC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<decimal>(o1.EventSequence, o2.EventSequence);
					};

			public static Comparison<aspnet_WebEvent_Events> EventSequenceColumnDESC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<decimal>(o2.EventSequence, o1.EventSequence);
					};

			public static Comparison<aspnet_WebEvent_Events> EventOccurrenceColumnASC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<decimal>(o1.EventOccurrence, o2.EventOccurrence);
					};

			public static Comparison<aspnet_WebEvent_Events> EventOccurrenceColumnDESC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<decimal>(o2.EventOccurrence, o1.EventOccurrence);
					};

			public static Comparison<aspnet_WebEvent_Events> EventCodeColumnASC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<Int32>(o1.EventCode, o2.EventCode);
					};

			public static Comparison<aspnet_WebEvent_Events> EventCodeColumnDESC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<Int32>(o2.EventCode, o1.EventCode);
					};

			public static Comparison<aspnet_WebEvent_Events> EventDetailCodeColumnASC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<Int32>(o1.EventDetailCode, o2.EventDetailCode);
					};

			public static Comparison<aspnet_WebEvent_Events> EventDetailCodeColumnDESC =
					delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
					{
						return Nullable.Compare<Int32>(o2.EventDetailCode, o1.EventDetailCode);
					};

			public static Comparison<aspnet_WebEvent_Events> MessageColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.Message.CompareTo(o2.Message);
				};

			public static Comparison<aspnet_WebEvent_Events> MessageColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.Message.CompareTo(o1.Message);
				};

			public static Comparison<aspnet_WebEvent_Events> ApplicationPathColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.ApplicationPath.CompareTo(o2.ApplicationPath);
				};

			public static Comparison<aspnet_WebEvent_Events> ApplicationPathColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.ApplicationPath.CompareTo(o1.ApplicationPath);
				};

			public static Comparison<aspnet_WebEvent_Events> ApplicationVirtualPathColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.ApplicationVirtualPath.CompareTo(o2.ApplicationVirtualPath);
				};

			public static Comparison<aspnet_WebEvent_Events> ApplicationVirtualPathColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.ApplicationVirtualPath.CompareTo(o1.ApplicationVirtualPath);
				};

			public static Comparison<aspnet_WebEvent_Events> MachineNameColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.MachineName.CompareTo(o2.MachineName);
				};

			public static Comparison<aspnet_WebEvent_Events> MachineNameColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.MachineName.CompareTo(o1.MachineName);
				};

			public static Comparison<aspnet_WebEvent_Events> RequestUrlColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.RequestUrl.CompareTo(o2.RequestUrl);
				};

			public static Comparison<aspnet_WebEvent_Events> RequestUrlColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.RequestUrl.CompareTo(o1.RequestUrl);
				};

			public static Comparison<aspnet_WebEvent_Events> ExceptionTypeColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.ExceptionType.CompareTo(o2.ExceptionType);
				};

			public static Comparison<aspnet_WebEvent_Events> ExceptionTypeColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.ExceptionType.CompareTo(o1.ExceptionType);
				};

			public static Comparison<aspnet_WebEvent_Events> DetailsColumnASC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o1.Details.CompareTo(o2.Details);
				};

			public static Comparison<aspnet_WebEvent_Events> DetailsColumnDESC =
				delegate(aspnet_WebEvent_Events o1, aspnet_WebEvent_Events o2)
				{
					return o2.Details.CompareTo(o1.Details);
				};


        }

        #endregion
    } 
} 