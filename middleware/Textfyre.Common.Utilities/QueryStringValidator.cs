using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Web;
using System.Collections;
namespace Textfyre.Common.Utilities {
	public class QueryStringValidator {

		public List<QueryStringParameter> ValidQueryStrings = new List<QueryStringParameter>();

		public bool ValidateQueryString() {

			bool _isValid = true;

			NameValueCollection PostedQueryStrings = HttpContext.Current.Request.QueryString;

			if (PostedQueryStrings.Count > ValidQueryStrings.Count) {
				_isValid = false;
				return _isValid;
			}
			if (PostedQueryStrings != null) {

				foreach (QueryStringParameter parameter in ValidQueryStrings) {

					TypeCode parameterType = System.Type.GetTypeCode(parameter.Type);

					try {
						if (PostedQueryStrings[parameter.Name] !=null && PostedQueryStrings[parameter.Name].Trim().Length > 0) {
							object QueryStringType = Convert.ChangeType(PostedQueryStrings[parameter.Name], parameterType);

							if (!(parameterType.ToString() == QueryStringType.GetType().Name)) {
								_isValid = false;
							}
						}
					} catch (Exception exception) {
						throw;
					}
				}

			} else {
				_isValid = false;
			}
			return _isValid;
		}

		public class QueryStringParameter {
			public string Name { get; set; }
			public Type Type { get; set; }
		}
	}
}
