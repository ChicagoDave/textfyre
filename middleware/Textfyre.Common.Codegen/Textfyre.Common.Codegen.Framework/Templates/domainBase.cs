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
using #rootNamespace#.DataLayer;

namespace #rootNamespace#.BusinessLayer { 
    
    /// <summary>
    /// Base #tableName# domain class. This class is generated for each build and should never be modified
    /// directly. To change the functionality, the domainBase.cs template should be modified and related code
    /// generations tested.
    /// </summary>
    [Serializable()]
    public abstract class #tableName#Base : INotifyPropertyChanged {

        #region Members
        /// <summary>
        /// Internal items collection for the #tableName# domain class.
        /// </summary>
        private #rootNamespace#.BusinessLayer.#tableName#Collection _items = new #tableName#Collection();
        /// <summary>
        /// Internal recordset for the #tableName# domain class.
        /// </summary>
        private #rootNamespace#.BusinessLayer.#tableName#Recordset _recordset = new #tableName#Recordset();

        /// <summary>
        /// Non-serialized instance of the #tableName# data layer class.
        /// </summary>
        [NonSerialized]
        private #rootNamespace#.DataLayer.#tableName#Data _dataFactory;

        /// <summary>
        /// String constant containing '#tableName#'.
        /// </summary>
        private const string TABLE_NAME = "#tableName#";

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
        public #tableName#Base() {
            _dataFactory = new #tableName#Data();
        }

        #generatedPKConstructor#                     
        
        /// <summary> 
        /// Recordset constructor. 
        /// </summary> 
        public #tableName#Base(#rootNamespace#.BusinessLayer.#tableName#Recordset Recordset) : this() {             
            _recordset = Recordset; 
            _recordset.IsDirty = false; 
        }
        #endregion 
        
        #region Methods
        
        /// <summary>
        /// Load method that retrieves a record from the #tableName# table by the primary key id.
        /// </summary>
        public #rootNamespace#.BusinessLayer.#tableName#Recordset Load(#loadArguments#) {
            _recordset = DataFactory.Get#tableName#ById(#loadArgumentsNoType#);
            return _recordset;
        }

        /// <summary>
        /// LoadAll function that will load all records from the #tableName# table.
        /// </summary>
        public #rootNamespace#.BusinessLayer.#tableName#Collection LoadAll() {
            Fill(DataFactory.GetAll#tableName#());
            return _items;
        }

        /// <summary>
        /// Mark a record for deletion. Record is not physically deleted until .Save() is called.
        /// </summary>
        public virtual void Delete() {
            _recordset.IsDeleted = true;
        }

#saveRecordMethod#

        /// <summary>
        /// Fill a collection of recordsets from the data layer list.
        /// </summary>
        protected void Fill(List<#rootNamespace#.BusinessLayer.#tableName#Recordset> recs) {
            Items.Fill(recs);
            _items.IsCollectionDirty = false;
        }
        #endregion

        #region Properties

#publicProperties#

        /// <summary>
        /// Current recordset.
        /// </summary>
        public virtual #rootNamespace#.BusinessLayer.#tableName#Recordset Recordset { 
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
        protected #rootNamespace#.DataLayer.#tableName#Data DataFactory { 
            get {
                if (_dataFactory == null)
                    _dataFactory = new #tableName#Data();
                return _dataFactory;
            } 
        }

        /// <summary>
        /// Collection of records.
        /// </summary>
        public #rootNamespace#.BusinessLayer.#tableName#Collection Items {
            get {
                if (_items == null)
                    _items = new #rootNamespace#.BusinessLayer.#tableName#Collection();
                return _items;
            }
            set {
                _items = value;
            }
        }

        /// <summary>
        /// Collection of recordsets.
        /// </summary>
        public List<#rootNamespace#.BusinessLayer.#tableName#Recordset> ItemsData {
            get {
                List<#rootNamespace#.BusinessLayer.#tableName#Recordset> recs = new List<#rootNamespace#.BusinessLayer.#tableName#Recordset>();
                foreach(#rootNamespace#.BusinessLayer.#tableName# entity in Items) {
                    recs.Add((#rootNamespace#.BusinessLayer.#tableName#Recordset)entity.Recordset.Clone());
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
#sortDelegates#
        }

        #endregion
    } 
} 