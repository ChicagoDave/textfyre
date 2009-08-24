using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.ComponentModel;

namespace Textfyre.Common.DataLayer
{

    public class SqlDataReaderAdapter : DbDataAdapter
    {

        protected override RowUpdatedEventArgs CreateRowUpdatedEvent(DataRow dataRow, IDbCommand command, StatementType statementType, DataTableMapping tableMapping)
        {
            return new SqlRowUpdatedEventArgs(dataRow, command, statementType, tableMapping);
        }

        protected override RowUpdatingEventArgs CreateRowUpdatingEvent(DataRow dataRow, IDbCommand command, StatementType statementType, DataTableMapping tableMapping)
        {
            return new SqlRowUpdatingEventArgs(dataRow, command, statementType, tableMapping);
        }

        public new int Fill(System.Data.DataTable dataTable, IDataReader dataReader)
        {
            return base.Fill(dataTable, dataReader);
        }

        public new int Fill(System.Data.DataSet dataSet)
        {
            return base.Fill(dataSet);
        }

        public new System.Data.DataTable[] FillSchema(System.Data.DataSet dataSet, System.Data.SchemaType schemaType)
        {
            return base.FillSchema(dataSet, schemaType);
        }

        public override System.Data.IDataParameter[] GetFillParameters()
        {
            return base.GetFillParameters();
        }

        protected override void OnRowUpdated(RowUpdatedEventArgs value)
        {
            base.OnRowUpdated(value);
        }

        protected override void OnRowUpdating(RowUpdatingEventArgs value)
        {
            base.OnRowUpdating(value);
        }

        public new int Update(System.Data.DataSet dataSet)
        {
            return base.Update(dataSet);
        }
    }
}