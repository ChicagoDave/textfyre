using System;
using System.Collections.Generic;
using System.Web.Compilation;
using Textfyre.Auction.BusinessLayer;

namespace Textfyre.Common.Globalization {
    
    public class SqlDbResourceProviderFactory : ResourceProviderFactory {

        private List<StringResourcesRecordset> _masterList;

        public SqlDbResourceProviderFactory() : base() {
            //Get the master list of string resources from the database
            StringResources srBO = new StringResources();
            _masterList = srBO.GetAllStringResources();
        }

        public override IResourceProvider CreateGlobalResourceProvider(string classKey) {
            return new SqlDbResourceProvider(classKey, null, GetProviderStringResourcesRecords(classKey)); 
        }

        public override IResourceProvider CreateLocalResourceProvider(string virtualPath) {

            string temp = virtualPath;

            // The runtime will pass a virtual path to a page (e.g. ~/SubDir1/Page1.aspx)                 
            if (!string.IsNullOrEmpty(temp)) {
                temp = temp.Remove(0, 1);
                temp = temp.Remove(0, temp.IndexOf('/') + 1);
            }

            return new SqlDbResourceProvider(null, temp, GetProviderStringResourcesRecords(temp));
        }

        private List<StringResourcesRecordset> GetProviderStringResourcesRecords(string resourceType) {
            return _masterList.FindAll(match => match.resourceType == resourceType);
        }
    }
}
