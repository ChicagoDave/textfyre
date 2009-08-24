using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;

namespace Textfyre.Common.DataLayer
{

    public class SqlUtility
    {

        public SqlUtility()
        {
        }

        /// <summary>
        /// TO DO - Alter to handle nullable types.
        /// </summary>
        /// <param name="Parameter"></param>
        public void CheckParameter(ref SqlParameter Parameter)
        {
            if (Parameter.Value != DBNull.Value)
            {
                switch (Parameter.SqlDbType)
                {
                    case SqlDbType.BigInt:
                        if (Convert.ToInt64(RuntimeHelpers.GetObjectValue(Parameter.Value)) == Int64.MinValue)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.DateTime:
                        if (DateTime.Compare(Convert.ToDateTime(RuntimeHelpers.GetObjectValue(Parameter.Value)), DateTime.MinValue) == 0)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.Decimal:
                        if (decimal.Compare(Convert.ToDecimal(RuntimeHelpers.GetObjectValue(Parameter.Value)), -79228162514264337593543950335M) == 0)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.Float:
                        if (Convert.ToDouble(RuntimeHelpers.GetObjectValue(Parameter.Value)) == double.MinValue)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.Int:
                        if (Convert.ToInt32(RuntimeHelpers.GetObjectValue(Parameter.Value)) == -2147483648)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.Real:
                        if (Convert.ToSingle(RuntimeHelpers.GetObjectValue(Parameter.Value)) == float.MinValue)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.SmallInt:
                        if (Convert.ToInt16(RuntimeHelpers.GetObjectValue(Parameter.Value)) == -32768)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;

                    case SqlDbType.TinyInt:
                        if (Convert.ToByte(RuntimeHelpers.GetObjectValue(Parameter.Value)) == 0)
                        {
                            Parameter.Value = DBNull.Value;
                        }
                        break;
                }
            }
        }

        public static T ExtractColumnData<T>(SqlDataReader drData, string ColumnName, T DefaultValue)
        {
            ColumnName = ColumnName.Replace("[", "").Replace("]", "");
            bool FoundColumn = false;

            for (int ColumnIndex = 0; ColumnIndex <= drData.FieldCount - 1; ColumnIndex++)
            {
                if (drData.GetName(ColumnIndex).ToLower() == ColumnName.ToLower())
                {
                    FoundColumn = true;
                }
            }
            if (!FoundColumn)
            {
                return DefaultValue;
            }
            if (drData[ColumnName] == DBNull.Value)
            {
                return DefaultValue;
            }
            return (T)drData[ColumnName];
        }

    }
}

