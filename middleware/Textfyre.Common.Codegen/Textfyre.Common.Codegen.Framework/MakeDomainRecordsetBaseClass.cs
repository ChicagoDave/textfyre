using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Codegen.Framework;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainRecordsetBaseClass {

        #region Constants
        private const string TEMPLATE_NAME = "RecordsetBase";
        private const string FORMAT_STRING = "\r\n\t\t";
        #endregion

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());
                        
            //Protected Fields
            output = output.Replace(FrameworkDriver.PH_PRIVATE_FIELDS, GeneratePrivateFields(transData));

            //Set Identity Method
            if (!transData.Table.HasNoPK)
                output = output.Replace(FrameworkDriver.PH_GENERATED_SET_IDENTITY, GenerateSetIdentity(transData));
            else
                output = output.Replace(FrameworkDriver.PH_GENERATED_SET_IDENTITY, String.Empty);

           //Public Properties
            output = DatabaseFactory.SetPublicProperties(transData, DatabaseFactory.ClassType.Recordset, false, output);

            // Clone settings
            // newPerson.PersonId = this.PersonId;
            StringBuilder sbClone = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns) {
                sbClone.Append("new");
                sbClone.Append(transData.Table.Name);
                sbClone.Append("RS.");
                sbClone.Append(column.Name);
                sbClone.Append(" = _");
                sbClone.Append(column.Name);
                sbClone.Append(";");
                sbClone.Append(Environment.NewLine);
                sbClone.Append("\t\t\t\t\t");
            }
            output = output.Replace(FrameworkDriver.PH_CLONE_SETTINGS, sbClone.ToString());

            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output);
        }

        private static string GeneratePrivateFields(TranslationData transData) {
            // Private Fields
            StringBuilder fieldList = new StringBuilder();
            string dataType = null;

            foreach (SqlColumn column in transData.Table.Columns) {
                bool nullable = false;

                fieldList.Append(Environment.NewLine);
                fieldList.Append("\t\t\t/// <summary>");
                fieldList.Append(Environment.NewLine);
                fieldList.Append("\t\t\t/// ");
                fieldList.Append(column.Name);
                fieldList.Append(" field.");
                fieldList.Append(Environment.NewLine);
                fieldList.Append("\t\t\t/// </summary>");
                fieldList.Append(Environment.NewLine);
                fieldList.Append("\t\t\tprivate ");

                dataType = DatabaseFactory.SqlTypeName(column.DataType);
                fieldList.Append(dataType);

                if (!column.IsPrimaryKey) {
                    if (column.IsNullable) {
                        if ((dataType != "string") && (dataType != "byte[]")) {
                            fieldList.Append("?");
                            nullable = true;
                        }
                    }
                }

                fieldList.Append(" _");
                fieldList.Append(column.Name);

                // Set default value for ints and guids.
                if (dataType == "Guid")
                    if (!nullable)
                        fieldList.Append(" = Guid.Empty");

                if (dataType == "int")
                    fieldList.Append(" = -1");

                if (nullable)
                    fieldList.Append(" = null");

                fieldList.Append(";");
            }

            return fieldList.ToString();
        }

        private static string GenerateSetIdentity(TranslationData transData) {
            StringBuilder sbSI = new StringBuilder();
            sbSI.Append("\t\tpublic void SetIdentity(");

            if (!transData.Table.HasCompositePK) {
                sbSI.Append(transData.Table.PrimaryKeyDataType);
                sbSI.Append(" IdentityValue) {");
                sbSI.Append(Environment.NewLine);
                sbSI.Append("\t\t\t_");
                sbSI.Append(transData.Table.PrimaryKeyColumn);
                sbSI.Append(" = IdentityValue;");                
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbSI.Append(enumerator.Current.Value);
                    sbSI.Append(" ");
                    sbSI.Append(enumerator.Current.Key);
                    sbSI.Append(", ");
                }
                enumerator.Dispose();

                sbSI.Remove(sbSI.Length - 2, 2); //Remove trailing , and space
                sbSI.Append(") {");
                sbSI.Append(Environment.NewLine);

                enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbSI.Append("\t\t\t_");
                    sbSI.Append(enumerator.Current.Key);
                    sbSI.Append(" = ");
                    sbSI.Append(enumerator.Current.Key);
                    sbSI.Append(";");
                    sbSI.Append(Environment.NewLine);
                }
                enumerator.Dispose();                
            }

            sbSI.Append(Environment.NewLine);
            sbSI.Append("\t\t}");

            return sbSI.ToString();
        }
        #endregion

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, string saveFilePath) {           
            string template = FrameworkDriver.GetStoredProcedureTemplate(TEMPLATE_NAME);
            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;

            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            XElement fields = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);
            StringBuilder sbFields  = new StringBuilder();            
            StringBuilder sbPubProp = new StringBuilder();
            string fieldName = null;
            string sqlDataType = null;

            foreach (XElement field in fields.Elements()) {
                fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value;
                sqlDataType = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;

                BuildPrivateFields(sbFields, fieldName, sqlDataType);
                BuildPublicProperties(sbPubProp, fieldName, sqlDataType);               
            }

            template = template.Replace(FrameworkDriver.PH_PROTECTED_FIELDS, sbFields.ToString());
            template = template.Replace(FrameworkDriver.PH_PUBLIC_PROPERTIES, sbPubProp.ToString());

            // Clone settings
            // newPerson.PersonId = this.PersonId;
            StringBuilder sbClone = new StringBuilder();
            foreach (XElement field in fields.Elements()) {
                fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value;
                sqlDataType = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;

                sbClone.Append("new");
                sbClone.Append(spName);
                sbClone.Append("RS.");
                sbClone.Append(fieldName);
                sbClone.Append(" = _");
                sbClone.Append(fieldName);
                sbClone.Append(";");
                sbClone.Append(Environment.NewLine);
                sbClone.Append("\t\t\t\t\t");
            }
            template = template.Replace(FrameworkDriver.PH_CLONE_SETTINGS, sbClone.ToString());

            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }
        
        //Should produce something like the following
        //private string _Make_Model;
        private static void BuildPrivateFields(StringBuilder sbFields, string fieldName, string sqlDataType) {
            bool nullableType = false;
             
            sbFields.Append(FORMAT_STRING);
            sbFields.Append("protected ");

            string dataType = DatabaseFactory.SqlTypeName(sqlDataType);
            sbFields.Append(dataType);

            if ((dataType != "string") && (dataType != "byte[]")) {
                sbFields.Append("?");
                nullableType = true;
            }

            sbFields.Append(" _");
            sbFields.Append(fieldName);

            if (nullableType)
                sbFields.Append(" = null");

            sbFields.Append(";");
        }

        //Should produce something like the following
        //public #dataType# #columnName# {
        //  get { return #columnName#; }
        //  set { 
        //      if(#columnName# != value) {
        //        #columnName# = value;
        //        _isDirty = true;
        //      }
        //  }
        //}
        private static void BuildPublicProperties(StringBuilder sbPubProp, string fieldName, string sqlDataType) {            
            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("public ");

            string dataType = DatabaseFactory.SqlTypeName(sqlDataType);
            sbPubProp.Append(dataType);
            
            if ((dataType != "string") && (dataType != "byte[]"))
                sbPubProp.Append("?");          

            sbPubProp.Append(" ");
            sbPubProp.Append(fieldName);
            sbPubProp.Append(" {");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\tget { return _");
            sbPubProp.Append(fieldName);
            sbPubProp.Append("; }");                

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\tset {");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\t\tif (_");
            sbPubProp.Append(fieldName);
            sbPubProp.Append(" != value) {");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\t\t\t_");
            sbPubProp.Append(fieldName);
            sbPubProp.Append(" = value; ");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\t\t\t_isDirty = true;");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\t\t}");

            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("\t}");
            sbPubProp.Append(FORMAT_STRING);
            sbPubProp.Append("}");
            sbPubProp.Append(Environment.NewLine);            
        }       
        #endregion
    }
}
