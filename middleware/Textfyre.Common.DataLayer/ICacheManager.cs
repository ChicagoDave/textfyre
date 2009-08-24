using System;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Textfyre.Common.DataLayer {
    /// <summary>
    /// Interface for a cache manager object.
    /// </summary>
    public interface ICacheManager {
        //New methTextfyre.s
        string CreateCacheKey(string entityName, List<SqlParameter> parameters);
        void Set2(string cacheKey, object value, string expiration);
        void Remove2(string cacheKey);
        T Get2<T>(string cacheKey);
        bool Exists2(string cacheKey);
    }
}
