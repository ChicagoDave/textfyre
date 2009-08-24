using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainClass
    {
        private const string ENTITY = "Entity";
        private const string TEMPLATE_NAME = "";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_DATABASE_NAME, transData.DatabaseName);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);

            if (!transData.Table.HasNoPK)
                output = output.Replace(FrameworkDriver.PH_GENERATED_PK_CONSTRUCTOR, GeneratePKConstructor(transData));
            else
                output = output.Replace(FrameworkDriver.PH_GENERATED_PK_CONSTRUCTOR, String.Empty);

            output = output.Replace(FrameworkDriver.PH_GENERATED_ARGS, GenerateArgs(transData));

            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output, transData.Overwrite);
        }

        private static string GenerateArgs(TranslationData transData) {
            if (!transData.Table.HasCompositePK) {
                if ((transData.Table.PrimaryKeyDataType != "string") && (transData.Table.PrimaryKeyDataType != "byte[]" && transData.Table.PrimaryKeyDataType != "Guid"))
                    return "0";
                else {
                    if (transData.Table.PrimaryKeyDataType == "byte[]")
                        throw new Exception("Cannot have a byte array in the primary key.");
                    if (transData.Table.PrimaryKeyDataType == "Guid")
                        return "Guid.NewGuid()";
                }
                return "\"\""; // default is quote quote.
            }

            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns) {
                if (column.IsPrimaryKey) {
                    string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                    if (dataType == "Guid")
                        sb.Append("Guid.NewGuid(), ");
                    else
                        if (dataType != "string")
                            sb.Append("0, ");
                        else
                            sb.Append("\"\", ");
                }
            }

            sb.Remove(sb.Length - 2, 2); //Remove trailing command and space
            return sb.ToString();
        }

        private static string GeneratePKConstructor(TranslationData transData) {
            StringBuilder sbPKCons = new StringBuilder();
            sbPKCons.Append("public ");
            sbPKCons.Append(transData.Table.Name);
            sbPKCons.Append("(");

            if (!transData.Table.HasCompositePK) {
                sbPKCons.Append(transData.Table.PrimaryKeyDataType);
                sbPKCons.Append(" ");
                sbPKCons.Append(transData.Table.PrimaryKeyColumn);
                sbPKCons.Append(") : base(");
                sbPKCons.Append(transData.Table.PrimaryKeyColumn);                
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbPKCons.Append(enumerator.Current.Value);
                    sbPKCons.Append(" ");
                    sbPKCons.Append(enumerator.Current.Key);
                    sbPKCons.Append(", ");
                }
                enumerator.Dispose();

                sbPKCons.Remove(sbPKCons.Length - 2, 2); //Remove trailing , and space
                sbPKCons.Append(") : base(");

                enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbPKCons.Append(enumerator.Current.Key);
                    sbPKCons.Append(", ");
                }
                enumerator.Dispose();

                sbPKCons.Remove(sbPKCons.Length - 2, 2); //Remove trailing , and space                
            }

            sbPKCons.Append(") {");
            sbPKCons.Append(Environment.NewLine);
            sbPKCons.Append("\t\t}");           

            return sbPKCons.ToString();
        }
        #endregion

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, bool hasFields, bool hasParameters, bool overWriteIfExists, string saveFilePath) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(ENTITY);

            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;
            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);

            StringBuilder sbConstructors = new StringBuilder();
            sbConstructors.Append("public ");
            sbConstructors.Append(spName);
            sbConstructors.Append("() : base() {}");

            if (hasFields) {
                sbConstructors.Append(Environment.NewLine);
                sbConstructors.Append("\t\t");

                sbConstructors.Append("public ");
                sbConstructors.Append(spName);
                sbConstructors.Append("(");
                sbConstructors.Append(spName);
                sbConstructors.Append("Recordset Recordset) : base(Recordset) {}");
            }

            template = template.Replace(FrameworkDriver.PH_ENTITY_CONSTRUCTORS, sbConstructors.ToString());
            template = template.Replace(FrameworkDriver.PH_GENERATED_METHOD, GenerateMethod(spElement, spName, hasFields, hasParameters));

            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template, overWriteIfExists);
        }

        private static string GenerateMethod(XElement spElement, string spName, bool hasFields, bool hasParameters) {
            string generatedMethodName = spElement.Attribute(FrameworkDriver.XML_ATTR_GEN_METHOD_NAME).Value;
            string logicalOperation = spElement.Attribute(FrameworkDriver.XML_ATTR_LOGICAL_OPERATION).Value;
            bool singleRecord = false;            
            XElement parameterList = null;
            string methodArgumentName = null;
            string dataType = null;
            string direction = null;
            StringBuilder sbGenMethod = new StringBuilder();

            #region Create method signature
            sbGenMethod.Append("public ");
            
            //Generate return type
            // List<T>, xxxRecordset, or int
            if (hasFields) {
                singleRecord = bool.Parse(spElement.Attribute(FrameworkDriver.XML_ATTR_SINGLE_RECORD).Value);

                sbGenMethod.Append(spName);

                if (singleRecord)           
                    sbGenMethod.Append("Recordset ");
                else
                    sbGenMethod.Append("Collection ");

            } else {
                switch (logicalOperation) {
                    case "insert":
                    case "outputparameter":
                    case "returnvalue":
                        sbGenMethod.Append("object ");
                        break;
                    case "update":
                    case "delete":
                        sbGenMethod.Append("int ");
                        break;
                }                
            }

            //Generate method name
            sbGenMethod.Append(generatedMethodName);
            sbGenMethod.Append("(");

            //Create method arguments corresponding to parameters
            if (hasParameters) {
                parameterList = spElement.Element(FrameworkDriver.XML_ELEMENT_PARAMETER_LIST);
                foreach (XElement parameter in parameterList.Elements()) {
                    methodArgumentName = parameter.Element(FrameworkDriver.XML_ELEMENT_METHOD_ARG_NAME).Value;
                    dataType = parameter.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;
                    dataType = DatabaseFactory.SqlTypeName(dataType);
                    direction = parameter.Element(FrameworkDriver.XML_ELEMENT_PARAM_DIR).Value;

                    //Added 06/24/2008 - CD
                    if (direction.ToLower() == "input") {
                        sbGenMethod.Append(dataType);

                        if ((dataType != "string") && (dataType != "byte[]"))
                            sbGenMethod.Append("?");

                        sbGenMethod.Append(" ");
                        sbGenMethod.Append(methodArgumentName);
                        sbGenMethod.Append(", ");
                    }
                }

                sbGenMethod.Remove(sbGenMethod.Length - 2, 2); //Remove trailing , and space
            }

            sbGenMethod.Append(") {");
            #endregion

            #region Create method body

            sbGenMethod.Append(Environment.NewLine);
            sbGenMethod.Append("\t\t\t");

            if (hasFields) {
                if (!singleRecord) {
                    sbGenMethod.Append("Fill(DataFactory.");
                    sbGenMethod.Append(generatedMethodName);
                } else {
                    sbGenMethod.Append("this.Recordset = DataFactory.");
                    sbGenMethod.Append(generatedMethodName);
                }
            } else {
                sbGenMethod.Append("return DataFactory.");
                sbGenMethod.Append(generatedMethodName);                
            }

            sbGenMethod.Append("(");

            if (hasParameters) {
                foreach (XElement parameter in parameterList.Elements()) {
                    methodArgumentName = parameter.Element(FrameworkDriver.XML_ELEMENT_METHOD_ARG_NAME).Value;
                    direction = parameter.Element(FrameworkDriver.XML_ELEMENT_PARAM_DIR).Value;

                    //Added 06/24/2008 - CD
                    if (direction.ToLower() == "input") {
                        sbGenMethod.Append(methodArgumentName);
                        sbGenMethod.Append(", ");
                    }
                }

                sbGenMethod.Remove(sbGenMethod.Length - 2, 2); //Remove trailing , and space
            }

            if (hasFields) {                                
                if(!singleRecord) {
                    sbGenMethod.Append("));");
                    sbGenMethod.Append(Environment.NewLine);
                    sbGenMethod.Append("\t\t\treturn Items;");
                } else {
                    sbGenMethod.Append(");");
                    sbGenMethod.Append(Environment.NewLine);
                    sbGenMethod.Append("\t\t\treturn Recordset;");
                }
            } else {
                sbGenMethod.Append(");");
            }

            #endregion

            sbGenMethod.Append(Environment.NewLine);
            sbGenMethod.Append("\t\t}");

            return sbGenMethod.ToString();
        }
        #endregion
    }
}
