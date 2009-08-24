using System;
using System.Web.Compilation;
using System.Resources;
using System.Globalization;
using System.Collections.Generic;
using System.Collections.Specialized;
using IAAI.Auction.BusinessLayer;
using IAAI.Auction.DataLayer;

namespace IAAI.Common.Globalization {
    /// <summary>
    /// Resource provider accessing resources from the database.
    /// This type is thread safe.
    /// </summary>
    public class SqlDbResourceProvider : DisposableBaseType, IResourceProvider {

        #region Constants
        private const string ERROR = "error";
        private const string EN_US = "en-us";
        #endregion

        #region Members
        private string m_classKey;
        private string m_virtualPath;

        // Resource cache - map culture name to resoure name & value
        private Dictionary<string, Dictionary<string, string>> m_resourceCache = new Dictionary<string, Dictionary<string, string>>();
        #endregion

        #region Constructor
        /// <summary>
        /// Constructs this instance of the provider supplying a resource type for the instance. 
        /// </summary>
        /// <param name="resourceType">The resource type</param>
        public SqlDbResourceProvider(string classKey, string virtualPath, List<StringResourcesRecordset> stringResources) {
            this.m_classKey = classKey;
            this.m_virtualPath = virtualPath;

            ProcessProviderStringResourcesRecords(stringResources);
        }
        #endregion

        #region IResourceProvider Members

        /// <summary>
        /// Retrieves a resource entry based on the specified culture and 
        /// resource key. The resource type is based on this instance of the
        /// SqlDbResourceProvider as passed to the constructor.
        /// To optimize performance, this function caches values in a dictionary
        /// per culture.
        /// </summary>
        /// <param name="resourceKey">The resource key to find.</param>
        /// <param name="culture">The culture to search with.</param>
        /// <returns>If found, the resource string is returned.
        /// Otherwise an empty string is returned.</returns>
        public object GetObject(string resourceKey, CultureInfo culture) {

            if (Disposed) {
                throw new ObjectDisposedException("SqlDbResourceProvider object is already disposed.");
            }

            if (string.IsNullOrEmpty(resourceKey)) {
                throw new ArgumentNullException("resourceKey", "Resource key can not be null or empty.");
            }

            //Invariant culture will be passed at design time.  CurrentUICulture needs to be retrieved at run-time.
            if (culture == null) {
                culture = AssignCulture();
            }
                                    
            return LookupValueByCultureAndKey(culture.Name.ToLower(), resourceKey);            
        }

        /// <summary>
        /// Returns a resource reader.
        /// </summary>
        public IResourceReader ResourceReader {
            get {
                if (Disposed) {
                    throw new ObjectDisposedException("SqlDbResourceProvider object is already disposed.");
                }

                CultureInfo culture = AssignCulture();
                Dictionary<string, string> culturePairs = null;

                if (m_resourceCache.ContainsKey(culture.Name))
                    culturePairs = m_resourceCache[culture.Name];
                else
                    culturePairs = new Dictionary<string, string>();

                return new SqlDbResourceReader(culturePairs);
            }
        }

        #endregion

        private string LookupValueByCultureAndKey(string cultureName, string resourceKey) {
            string resourceValue = null;

            //Get the culture specific dictionary, then look to see if the key is in the dictionary
            if (m_resourceCache.ContainsKey(cultureName)) {
                Dictionary<string, string> culturePairs = m_resourceCache[cultureName];

                if (culturePairs.ContainsKey(resourceKey)) {
                    resourceValue = culturePairs[resourceKey];
                }
            }

            if (resourceValue == null) {
                if (cultureName == CultureInfo.InvariantCulture.Name) {
                    resourceValue = ERROR;
                } else {
                    return LookupValueByCultureAndKey(CultureInfo.InvariantCulture.Name, resourceKey); //Fall back to invariant culture (English)
                }
            }

            return resourceValue;
        }

        private CultureInfo AssignCulture() {
            CultureInfo cultureToUse = CultureInfo.InvariantCulture;

            if (CultureInfo.CurrentUICulture != null) {
                if (CultureInfo.CurrentUICulture.Name.ToLower() != EN_US)
                    cultureToUse = CultureInfo.CurrentUICulture;
            }

            return cultureToUse;
        }

        private string GetResourceType() {
            if (m_classKey != null)
                return m_classKey;

            return m_virtualPath;
        }        

        private void ProcessProviderStringResourcesRecords(List<StringResourcesRecordset> stringResourcesRecords) {
            if (stringResourcesRecords != null) {
                string currentCulture = null;
                Dictionary<string, string> culturePairs = null; //Map resource key to resource value

                foreach (StringResourcesRecordset stringResourcesRecord in stringResourcesRecords) {
                    //Check to see if culture code has changed
                    if (currentCulture != stringResourcesRecord.cultureCode) {
                        currentCulture = stringResourcesRecord.cultureCode;
                        culturePairs = GetCulturePairsDictionary(currentCulture);
                    }

                    //Add string resource to the culture specific dictionary
                    culturePairs.Add(stringResourcesRecord.resourceKey, stringResourcesRecord.resourceValue);
                }
            }
        }

        private Dictionary<string, string> GetCulturePairsDictionary(string cultureCode) {
            if (!m_resourceCache.ContainsKey(cultureCode)) {
                m_resourceCache.Add(cultureCode, new Dictionary<string, string>());
            }

            return m_resourceCache[cultureCode];
        }

        #region Override Cleanup Method (DisposableBaseType)
        protected override void Cleanup() {
            base.Cleanup();
            this.m_resourceCache.Clear();
        }
        #endregion
    }
}