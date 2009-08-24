using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Textfyre.Common.DataLayer {
    
    /// <summary>
    /// The signature of an item placed in cache. Each use of a domain object contains the table name,
    /// the sql command text, and the parameter list. Table name doesn't change, but can be used to
    /// flush all cached items for a given table. The sql command text and parameter list are used to
    /// remove individual cache items. A GUID is used to identify a given cache item.
    /// 
    /// It does not contain the actual cached item as that is placed into the actual caching system.
    /// The signature is stored in application memory space as an index to the cache.
    /// </summary>
    public class CacheItem {

        private Guid _cacheId;
        private string _tableName;
        private string _commandText;
        private List<SqlParameter> _parameterList;

        /// <summary>
        /// Empty Constructor.
        /// </summary>
        public CacheItem() { }

        /// <summary>
        /// Constructor including all signature values.
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="commandText"></param>
        /// <param name="parameterList"></param>
        public CacheItem(string tableName, string commandText, List<SqlParameter> parameterList) {
            _cacheId = Guid.NewGuid();
            _tableName = tableName;
            _commandText = commandText;
            _parameterList = parameterList;
        }

        /// <summary>
        /// Cache Id.
        /// </summary>
        public Guid CacheId {
            get { return _cacheId; }
        }

        /// <summary>
        /// Table name.
        /// </summary>
        public string TableName {
            get { return _tableName; }
        }

        /// <summary>
        /// SQL command text.
        /// </summary>
        public string CommandText {
            get { return _commandText; }
        }

        /// <summary>
        /// Parameter list.
        /// </summary>
        public List<SqlParameter> ParameterList {
            get { return _parameterList; }
        }

        /// <summary>
        /// Overidden equals methTextfyre. to compare CacheItem's.
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public override bool Equals(object item) {
            CacheItem cacheItem = item as CacheItem;

            if (cacheItem == null)
                return false;

            bool isEqual = true;

            isEqual = (cacheItem.TableName == _tableName && cacheItem.CommandText == _commandText);

            if (isEqual) {
                if (cacheItem.ParameterList != null && _parameterList != null) {
                    if (cacheItem.ParameterList.Count == _parameterList.Count) {
                        for (int p = 0; p <= cacheItem.ParameterList.Count - 1; p++) {
                            if (cacheItem.ParameterList[p].ParameterName != _parameterList[p].ParameterName ||
                                cacheItem.ParameterList[p].Value.ToString() != _parameterList[p].Value.ToString()) {
                                isEqual = false;
                                break;
                            }
                        }
                    } else
                        isEqual = false;
                } else {
                    isEqual = (cacheItem.ParameterList == null && _parameterList == null);
                }
            }

            return isEqual;
        }

        /// <summary>
        /// Override for GetHashCTextfyre.e().
        /// </summary>
        /// <returns></returns>
        public override int GetHashCode() {
            return base.GetHashCode();
        }

    }
}
