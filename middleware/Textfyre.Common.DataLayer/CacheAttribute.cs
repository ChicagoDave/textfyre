using System;
using System.Configuration;
using System.Reflection;

namespace Textfyre.Common.DataLayer {
    /// <summary>
    /// Attribute to tag DAL objects for caching.
    /// </summary>
    public class CacheAttribute : Attribute {

        #region Private Fields
        private ICacheManager _cacheManager;
        private string _expiration;

        private const string CACHE_MANAGER = "CacheManager";
        #endregion

        #region Constructors
        /// <summary>
        /// Turn on caching for the associated domain object and load the cache manager.
        /// </summary>
        public CacheAttribute() {
            SetCacheManager();
        }

        /// <summary>
        /// Expiration time span as a string.
        /// </summary>
        /// <param name="expiration"></param>
        /// <example>1 Hour is 01:00:00\n1 Day is 01:00:00:00\n45 Minutes is 00:45:00</example>
        public CacheAttribute(string expiration) {
            SetCacheManager();
            _expiration = expiration;
        }

        #endregion

        #region Public Interface

        /// <summary>
        /// Property for cache manager instance.
        /// </summary>
        public ICacheManager CacheManager {
            get {
                return _cacheManager;
            }
        }

        public string Expiration {
            get {
                return _expiration;
            }
        }
        #endregion

        #region Private Interface
        /// <summary>
        /// Gets the assembly reference from the app or web config and instantiates the cache manager.
        /// </summary>
        private void SetCacheManager() {
                string cacheManagerFQN = ConfigurationManager.AppSettings[CACHE_MANAGER];

                if (cacheManagerFQN == null)
                    throw new Exception("Missing Cache Manager configuration.");

                Assembly assembly = Assembly.Load( cacheManagerFQN.Split(',')[0].ToString());
                _cacheManager = (ICacheManager)assembly.CreateInstance(cacheManagerFQN.Split(',')[1].ToString());
        }
        #endregion

    }
}
