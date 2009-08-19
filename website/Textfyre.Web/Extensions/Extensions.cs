using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Textfyre.Web.Extensions {
    public static class Extensions {

        public static string ToSafeString(this object field) {
            if (field == null)
                return "";
            return (string)field;
        }

        public static bool ToSafeBoolean(this object field) {
            if (field == null)
                return false;
            return (bool)field;
        }

    }
}
