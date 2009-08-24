using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Specialized;
using System.Globalization;
using System.Data;
using System.Threading;
using System.Runtime.CompilerServices;
using IAAI.Auction.BusinessLayer;

namespace IAAI.Common.Globalization
{
    /// <summary>
    /// Data access component for the StringResources table. 
    /// This type is thread safe.
    /// </summary>
    public class StringResourcesDataAccess : IDisposable {

        #region Constants
        private const string RM_DUPLICATE_RESOURCE_FOUND   = "An internal data error has occurred. A duplicate resource entry was found for {0}.";
        private const string RM_DEFAULT_RESOURCE_NOT_FOUND = "Unable to find a default resource for {0}.";
        private const string CUSTOM_RESOURCE_PROVIDER_CS   = "CustomResourceProvidersConnectionString";
        private const string CULTURE_CODE   = "cultureCode";
        private const string RESOURCE_KEY   = "resourceKey";
        private const string RESOURCE_TYPE  = "resourceType";
        private const string RESOURCE_VALUE = "resourceValue";

        private const string SQL_TYPE_CULTURE_KEY = "SELECT resourceType, cultureCode, resourceKey, resourceValue FROM StringResources WHERE (resourceType=@resourceType) AND (cultureCode=@cultureCode) AND (resourceKey=@resourceKey)";
        private const string SQL_TYPE_CULTURE     = "SELECT resourceType, cultureCode, resourceKey, resourceValue FROM StringResources WHERE (resourceType=@resourceType) AND (cultureCode=@cultureCode)";
        #endregion

        #region Members
        private string m_resourceType = String.Empty;

        private SqlConnection m_connection;
        private SqlCommand m_cmdGetResourceByCultureAndKey;
        private SqlCommand m_cmdGetResourcesByCulture;
        #endregion

        #region Constructor
        /// <summary>
        /// Constructs this instance of the data access 
        /// component supplying a resource type for the instance. 
        /// </summary>
        /// <param name="resourceType">The resource type.</param>
        public StringResourcesDataAccess(string resourceType) {

            // save the resource type for this instance
            this.m_resourceType = resourceType;

            // grab the connection string
            //m_connection = new SqlConnection(ConfigurationManager.ConnectionStrings[CUSTOM_RESOURCE_PROVIDER_CS].ConnectionString);

            //// command to retrieve the resource the matches 
            //// a specific type, culture and key
            //m_cmdGetResourceByCultureAndKey = m_connection.CreateCommand();
            //m_cmdGetResourceByCultureAndKey.CommandText = SQL_TYPE_CULTURE_KEY;
            //m_cmdGetResourceByCultureAndKey.CommandType = CommandType.Text;
            //m_cmdGetResourceByCultureAndKey.Parameters.AddWithValue(RESOURCE_TYPE, this.m_resourceType);
            //m_cmdGetResourceByCultureAndKey.Parameters.AddWithValue(CULTURE_CODE, CultureInfo.InvariantCulture.Name);
            //m_cmdGetResourceByCultureAndKey.Parameters.AddWithValue(RESOURCE_KEY, String.Empty);

            //// command to retrieve all resources for a particular culture
            //m_cmdGetResourcesByCulture = m_connection.CreateCommand();
            //m_cmdGetResourcesByCulture.CommandText = SQL_TYPE_CULTURE;
            //m_cmdGetResourcesByCulture.CommandType = CommandType.Text;
            //m_cmdGetResourcesByCulture.Parameters.AddWithValue(RESOURCE_TYPE, this.m_resourceType);
            //m_cmdGetResourcesByCulture.Parameters.AddWithValue(CULTURE_CODE, CultureInfo.InvariantCulture.Name);

        }
        #endregion

        #region Private helper method (called recursively)
        /// <summary>
        /// Uses an open database connection to recurse 
        /// looking for the resource.
        /// Retrieves a resource entry based on the 
        /// specified culture and resource 
        /// key. The resource type is based on this instance of the
        /// StringResourceDALC as passed to the constructor.
        /// Resource fallback follows the same mechanism 
        /// of the .NET 
        /// ResourceManager. Ultimately falling back to the 
        /// default resource
        /// specified in this class.
        /// </summary>
        /// <param name="culture">The culture to search with.</param>
        /// <param name="resourceKey">The resource key to find.</param>
        /// <returns>If found, the resource string is returned. 
        /// Otherwise an empty string is returned.</returns>
        private string GetResourceByCultureAndKeyInternal(CultureInfo culture, string resourceKey)
        {
            // we should only get one back, but just in case, we'll iterate reader results
            StringCollection resources = new StringCollection();
            string resourceValue = null;

            // set up the dynamic query params
            this.m_cmdGetResourceByCultureAndKey.Parameters[CULTURE_CODE].Value = culture.Name;
            this.m_cmdGetResourceByCultureAndKey.Parameters[RESOURCE_KEY].Value = resourceKey;

            // get resources from the database

            // TO DO - rewrite for DAL

            //StringResources resources = new StringResources();
            //using (SqlDataReader reader = resources.) {
            //    while (reader.Read()) {
            //        resources.Add(reader.GetString(reader.GetOrdinal(RESOURCE_VALUE)));
            //    }
            //}

            // we should only get 1 back, this is just to verify the tables aren't incorrect
            if (resources.Count == 0) {
                // is this already the fallback location?
                if (culture.Name == CultureInfo.InvariantCulture.Name) {
                    throw new InvalidOperationException(String.Format(Thread.CurrentThread.CurrentUICulture, RM_DEFAULT_RESOURCE_NOT_FOUND, resourceKey));
                }

                // try to get parent culture
                culture = culture.Parent;

                resourceValue = this.GetResourceByCultureAndKeyInternal(culture, resourceKey); //Recursive
            } else if (resources.Count == 1) {
                resourceValue = resources[0];
            }
            else {
                // if > 1 row returned, log an error, we shouldn't have > 1 value for a resourceKey!
                throw new DataException(String.Format(Thread.CurrentThread.CurrentUICulture, RM_DUPLICATE_RESOURCE_FOUND, resourceKey));
            }

            return resourceValue;
        }
        #endregion

        #region Public methods
        /// <summary>
        /// Returns a dictionary type containing all resources for a 
        /// particular resource type and culture.
        /// The resource type is based on this instance of the
        /// StringResourceDALC as passed to the constructor.
        /// </summary>
        /// <param name="culture">The culture to search for.</param>
        /// <param name="resourceKey">The resource key to 
        /// search for.</param>
        /// <returns>If found, the dictionary contains key/value 
        /// pairs for each 
        /// resource for the specified culture.</returns>
        [MethodImpl(MethodImplOptions.Synchronized)]
        public ListDictionary GetResourcesByCulture(CultureInfo culture) {

            // make sure we have a default culture at least
            if (culture == null) {
                culture = CultureInfo.InvariantCulture;
            }

            // set up dynamic query string parameters
            this.m_cmdGetResourcesByCulture.Parameters[CULTURE_CODE].Value = culture.Name;

            // create the dictionary
            ListDictionary resourceDictionary = new ListDictionary();

            // open a connection to gather resource and create the dictionary
            try {
                m_connection.Open();

                // get resources from the database
                using (SqlDataReader reader = this.m_cmdGetResourcesByCulture.ExecuteReader()) {
                    while (reader.Read()) {
                        string k = reader.GetString(reader.GetOrdinal(RESOURCE_KEY));
                        string v = reader.GetString(reader.GetOrdinal(RESOURCE_VALUE));

                        resourceDictionary.Add(k, v);
                    }
                }
            } finally {
                if(m_connection.State != ConnectionState.Closed)
                    m_connection.Close();
            }

            // TODO: check dispose results
            return resourceDictionary;
        }

        /// <summary>
        /// Retrieves a resource entry based on the specified culture and 
        /// resource key. The resource type is based on this instance of the
        /// StringResourceDALC as passed to the constructor.
        /// To optimize performance, this function opens the database connection 
        /// before calling the internal recursive function. 
        /// </summary>
        /// <param name="culture">The culture to search with.</param>
        /// <param name="resourceKey">The resource key to find.</param>
        /// <returns>If found, the resource string is returned. Otherwise an empty string is returned.</returns>
        [MethodImpl(MethodImplOptions.Synchronized)]
        public string GetResourceByCultureAndKey(CultureInfo culture, string resourceKey)
        {
            string resourceValue = string.Empty;

            try
            {
                // make sure we have a default culture at least
                if (culture == null) {
                    culture = CultureInfo.InvariantCulture;
                }

                // open the connection before we call the recursive reading function
                this.m_connection.Open();

                // recurse to find resource, includes fallback behavior
                resourceValue = this.GetResourceByCultureAndKeyInternal(culture, resourceKey);
            } finally {
                // cleanup the connection, reader won't do that if it was open prior to calling in, and that's what we wanted
                if(m_connection.State != ConnectionState.Closed)
                    this.m_connection.Close();
            }

            return resourceValue;
        }
        #endregion

        #region IDisposable Members

        public void  Dispose() {

            try {
                // TODO: add in idisposable pattern, check what we're cleaning up here
                this.m_cmdGetResourceByCultureAndKey.Dispose();
                this.m_cmdGetResourcesByCulture.Dispose();
                this.m_connection.Dispose();
            } catch {
            }
        }

        #endregion
    }    
}
