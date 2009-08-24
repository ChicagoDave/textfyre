using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Web;
namespace Textfyre.Common.Utilities {
    public class Navigator : UriBuilder {

        #region Members
        public StringDictionary urls { get; set; }
        public StringDictionary queryString { get; set; }

        public enum Page {
            VehicleDetailsPage = 1
        }
        #endregion

        #region Properties

        public StringDictionary QueryString {
            get {
                if (queryString == null) {
                    queryString = new StringDictionary();
                   
                }
                return queryString;
            }
        }
        private string PageName {
            get {
                string path = base.Path;
                return path.Substring(path.LastIndexOf("/") + 1);
            }
            set {
                string path = base.Path;
                path = path.Substring(0, path.LastIndexOf("/"));
                base.Path = string.Concat(path, "/", value);
            }
        }
        public int NavigateToPage {
            set { base.Path = GetPageUrl(value); }
        }
        #endregion

        #region Constructor overloads
        public Navigator()
            : base() {
            urls = new StringDictionary();
            urls.Add("1", "~/Vehicles/VehicleDetails.aspx");
            queryString = new StringDictionary();
        }
        public Navigator(string uri)
            : base(uri) {
            PopulateQueryString();
        }

        public Navigator(Uri uri)
            : base(uri) {
            PopulateQueryString();
        }

        public Navigator(string schemeName, string hostName)
            : base(schemeName, hostName) {
        }

        public Navigator(string scheme, string host, int portNumber)
            : base(scheme, host, portNumber) {
        }

        public Navigator(string scheme, string host, int port, string pathValue)
            : base(scheme, host, port, pathValue) {
        }

        public Navigator(string scheme, string host, int port, string path, string extraValue)
            : base(scheme, host, port, path, extraValue) {
        }

        public Navigator(System.Web.UI.Page page)
            : base(page.Request.Url.AbsoluteUri) {
            PopulateQueryString();
        }
        #endregion

        #region Public methods
        public new string ToString() {
            GetQueryString();
            return base.Uri.AbsoluteUri;
        }

        public void Navigate() {
            _Navigate(true);
        }

        public void Navigate(bool endResponse) {
            _Navigate(endResponse);
        }

        private void _Navigate(bool endResponse) {
            GetQueryString();
            string uri = base.Path.Substring(0);
            if (base.Query.Length > 1) {
                uri = uri + base.Query.Substring(0, base.Query.Length - 1);
            }
            if (HttpContext.Current != null) {
                HttpContext.Current.Response.Redirect(uri, endResponse);
            } else{

            }
        }

        public string GetPageUrl(int pageId) {
            return urls[pageId.ToString()];       
        }

        #endregion

        #region Private methods
        private void PopulateQueryString() {
            string query = base.Query;
            if (object.ReferenceEquals(query, string.Empty) | query == null) {
                return;
            }
            if (queryString == null) {
                queryString = new StringDictionary();
            }
            queryString.Clear();
            query = query.Substring(1);

            string[] pairs = query.Split(new char[] { '&' });

            foreach (string s in pairs) {
                string[] pair = s.Split(new char[] { '=' });
                queryString[pair[0]] = (pair.Length > 1 ? pair[1] : string.Empty);
            }
        }

        private void GetQueryString() {
            int count = 0;
            if (queryString != null) {
                count = queryString.Count;
            }

            if (count == 0) {
                base.Query = string.Empty;
                return;
            }
            string[] keys = new string[count + 1];
            string[] values = new string[count + 1];
            string[] pairs = new string[count + 1];
            queryString.Keys.CopyTo(keys, 0);
            queryString.Values.CopyTo(values, 0);
            int i;
            for (i = 0; i <= count - 1; i += i + 1) {
                pairs[i] = string.Concat(keys[i], "=", values[i]);
            }
            base.Query = string.Join("&", pairs);
        }

        #endregion
    }
}
