using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainCollectionClass
    {
        private const string ENTITY = "Entity";
        private const string TEMPLATE_NAME = "Collection";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, transData.SystemNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());
            output = output.Replace(FrameworkDriver.PH_SORTING_CASES, GenerateSortingCases(transData));
            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output);
        }

        private static string GenerateSortingCases(TranslationData transData)
        {
            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns)
            {
                if (DatabaseFactory.SqlTypeName(column.DataType) != "byte[]")
                {
                    sb.AppendLine(String.Format("\t\t\t\tcase DataLayer.{0}Fields.{1}:", transData.Table.Name, column.Name));
                    sb.AppendLine("\t\t\t\t\tif (sortDirection == SortDirection.Descending)");
                    sb.AppendLine(String.Format("\t\t\t\t\t\tSort({0}.SortBy.{1}ColumnDESC);", transData.Table.Name, column.Name));
                    sb.AppendLine("\t\t\t\t\telse");
                    sb.AppendLine(String.Format("\t\t\t\t\t\tSort({0}.SortBy.{1}ColumnASC);", transData.Table.Name, column.Name));
                    sb.AppendLine("\t\t\t\t\tbreak;");
                }
            }

            return sb.ToString();
        }

        #endregion

        #region SP generation
        public static void Generate(string systemNamespace, string rootNamespace, XElement spElement, string saveFilePath, bool hasFields) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(ENTITY + TEMPLATE_NAME);

            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;
            template = template.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, systemNamespace);
            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            if (hasFields)
            {
                StringBuilder sbSorts = new StringBuilder();
                XElement fieldList = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);

                string fieldName = null;
                string sqlDataType = null;

                foreach (XElement field in fieldList.Elements())
                {
                    fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value.Trim();
                    sqlDataType = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;

                    if (sqlDataType != "image")
                    {
                        sbSorts.AppendLine(String.Format("\t\t\t\tcase {0}.DataLayer.{1}Fields.{2}:", rootNamespace, spName, fieldName));
                        sbSorts.AppendLine("\t\t\t\t\tif (sortDirection == SortDirection.Descending)");
                        sbSorts.AppendLine(String.Format("\t\t\t\t\t\tSort({0}.SortBy.{1}ColumnDESC);", spName, fieldName));
                        sbSorts.AppendLine("\t\t\t\t\telse");
                        sbSorts.AppendLine(String.Format("\t\t\t\t\t\tSort({0}.SortBy.{1}ColumnASC);", spName, fieldName));
                        sbSorts.AppendLine("\t\t\t\t\tbreak;");
                    }
                }

                template = template.Replace(FrameworkDriver.PH_SORTING_CASES, sbSorts.ToString());
            } 
            
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }
        #endregion
    }
}
