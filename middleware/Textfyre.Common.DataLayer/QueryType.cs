using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Textfyre.Common.DataLayer
{
    public enum QueryType
    {
        One,
        All,
        StoredProcedure,
        SQLStatement,
        QueryName
    }
}
