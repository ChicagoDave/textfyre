using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainRecordsetClass
    {
        private const string TEMPLATE_NAME = "Recordset";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output, transData.Overwrite);
        }
        #endregion

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, bool overWriteIfExists, string saveFilePath) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(TEMPLATE_NAME);
            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;

            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());
            
            XElement fields = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);
            StringBuilder sbClone = new StringBuilder();            
            string fieldName = null;
            string sqlDataType = null;

            foreach (XElement field in fields.Elements()) {
                fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value;
                sqlDataType = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;                
                BuildCloneSettings(sbClone, spName, fieldName);
            }
            template = template.Replace(FrameworkDriver.PH_CLONE_SETTINGS, sbClone.ToString());

            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template, overWriteIfExists);
        }

        //Should produce something like the following:
        //newdecode_VIN.Make_Model = _Make_Model;
        private static void BuildCloneSettings(StringBuilder sbClone, string spName, string fieldName) {            
            sbClone.Append("new");
            sbClone.Append(spName);
            sbClone.Append("RS.");
            sbClone.Append(fieldName);
            sbClone.Append(" = _");
            sbClone.Append(fieldName);
            sbClone.Append(";");
            sbClone.Append(Environment.NewLine);
            sbClone.Append("\t\t\t");
        }
        #endregion
    }
}
