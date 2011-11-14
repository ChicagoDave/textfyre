using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Textfyre.Website.Routing
{
    public class GameConstraint : IRouteConstraint
    {
        public GameConstraint(params string[] values)
        {
            this._values = values;
        }

        private string[] _values;

        public bool Match(HttpContextBase httpContext,
          Route route,
          string parameterName,
          RouteValueDictionary values,
          RouteDirection routeDirection)
        {
            // Get the value called "parameterName" from the 
            // RouteValueDictionary called "value"
            string value = values[parameterName].ToString();

            // Case insensitive
            for (int i = 0; i < _values.Length; i++)
                _values[i] = _values[i].ToLower();

            // Return true is the list of allowed values contains 
            // this value.
            return _values.Contains(value);
        }
    }
}