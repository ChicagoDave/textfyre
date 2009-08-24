using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainFieldsClass
    {
        private const string TEMPLATE_NAME = "Fields";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            // fields
            string fieldLines = String.Empty;
            foreach (SqlColumn column in transData.Table.Columns)
            {
                fieldLines = String.Concat(fieldLines, "\r\n\t\t", column.Name, ",");
            }
            fieldLines = General.TrimEnd(fieldLines, 1);

            output = output.Replace(FrameworkDriver.PH_ENUM_FIELDS, fieldLines);
            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output);
        }
        #endregion

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, string saveFilePath) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(TEMPLATE_NAME);
            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;

            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            XElement fieldList = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);
            string fieldLines = string.Empty;
            foreach (XElement field in fieldList.Elements())
            {
                string fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value.Trim();
                fieldLines = String.Concat(fieldLines, "\r\n\t\t", fieldName, ",");
            }
            fieldLines = General.TrimEnd(fieldLines, 1);

            template = template.Replace(FrameworkDriver.PH_ENUM_FIELDS, fieldLines);
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }
        #endregion
    }
}
