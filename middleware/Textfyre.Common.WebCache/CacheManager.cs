using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Caching;
using System.Data.SqlClient;
using IAAI.Common.DataLayer;

namespace IAAI.Common.WebCache {
    /// <summary>
    /// Cache Manager class that stores Lists of Recordsets in the ASP.NET cache.
    /// </summary>
    public class CacheManager : ICacheManager {

        private const string CACHE_LIST = "AC3_CACHE_LIST";

        private List<CacheItem> _items;

        private Cache cache = HttpContext.Current.Cache;
        private HttpApplicationState Application = HttpContext.Current.Application;

        #region Constructors
        /// <summary>
        /// Sets or reloads the cache name list from application state.
        /// </summary>
        public CacheManager() {
            Application.Lock();
            if (Application[CACHE_LIST] == null) {
                _items = new List<CacheItem>();
                Application[CACHE_LIST] = _items;
            }
            _items = (List<CacheItem>)Application[CACHE_LIST];
            Application.UnLock();
        }
        #endregion

        #region Public Interface
        /// <summary>
        /// Sets the cache object.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="expiration"></param>
        public void Set(CacheItem cacheItem, object value) {
            Set(cacheItem, value, "12h");
        }

        /// <summary>
        /// Sets the cache object with an expiration.
        /// </summary>
        /// <param name="cacheItem"></param>
        /// <param name="value"></param>
        /// <param name="expiration"></param>
        public void Set(CacheItem cacheItem, object value, string expiration) {
            TimeSpan expires;
            if (!TimeSpan.TryParse(expiration, out expires))
                expires = TimeSpan.FromHours(12); // TO DO - default in Web.config?

            if (cache[cacheItem.CacheId.ToString()] == null) {
                cache.Add(cacheItem.CacheId.ToString(), value, null, DateTime.MaxValue, expires, CacheItemPriority.Default, null);
                Application.Lock();
                _items.Add(cacheItem);
                Application.UnLock();
            } else {
                cache.Remove(cacheItem.CacheId.ToString());
                Set(cacheItem, value);
            }
        }

        /// <summary>
        /// Remove an object from the cache.
        /// </summary>
        /// <param name="name"></param>
        public void Remove(Guid cacheId) {
            if (cache[cacheId.ToString()] != null) {
                cache.Remove(cacheId.ToString());
                Application.Lock();
                _items.Remove(Find(cacheId));
                Application.UnLock();
            }
        }

        /// <summary>
        /// Get a list from the cache.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="name"></param>
        /// <returns></returns>
        public List<T> Get<T>(Guid cacheId) {
            List<T> cachedRecords = (List<T>)cache.Get(cacheId.ToString());
            return cachedRecords;
        }

        /// <summary>
        /// Check if a list exists.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool Exists(CacheItem cacheItem) {
            foreach (CacheItem item in _items) {
                if (item.Equals(cacheItem))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Remove all cache objects.
        /// </summary>
        public void Flush() {
            foreach (CacheItem item in _items) {
                cache.Remove(item.CacheId.ToString());
            }
        }

        /// <summary>
        /// Flush all cache signatures with the specified table name.
        /// </summary>
        /// <param name="tableName"></param>
        public void FlushTable(string tableName) {
            for (int index = 0; index <= _items.Count - 1; index++) {
                if (_items[index].TableName == tableName) {
                    cache.Remove(_items[index].CacheId.ToString());
                }
            }
            for (int index = _items.Count - 1; index >= 0; index--) {
                if (_items[index].TableName == tableName) {
                    _items.Remove(_items[index]);
                }
            }
        }

        /// <summary>
        /// Find a cache item and return the cache id.
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameterList"></param>
        /// <returns></returns>
        public CacheItem Find(string tableName, string commandText, List<SqlParameter> parameterList) {
            foreach (CacheItem item in _items) {
                if (item.Equals(new CacheItem(tableName,commandText,parameterList))) {
                    // This is to verify that the found item is actually in the cache.
                    // If not, remove it from the index and return null.
                    if (cache.Get(item.CacheId.ToString()) != null)
                        return item;
                    else
                        _items.Remove(item);
                }
            }

            return null;
        }

        /// <summary>
        /// Find a cache item by its Id.
        /// </summary>
        /// <param name="cacheId"></param>
        /// <returns></returns>
        private CacheItem Find(Guid cacheId) {
            foreach (CacheItem item in _items) {
                if (item.CacheId == cacheId) {
                    // This is to verify that the found item is actually in the cache.
                    // If not, remove it from the index and return null.
                    if (cache.Get(cacheId.ToString()) != null)
                        return item;
                    else
                        _items.Remove(item);
                }
            }

            return null;
        }
        #endregion
    }
}
