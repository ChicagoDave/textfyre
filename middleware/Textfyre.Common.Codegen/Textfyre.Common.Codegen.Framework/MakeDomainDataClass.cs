using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainDataClass
    {
        private const string TEMPLATE_NAME = "Data";        

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, transData.SystemNamespace);
            output = output.Replace(FrameworkDriver.PH_DATABASE_NAME, transData.DatabaseName);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output, transData.Overwrite);
        }
        #endregion

        #region SP generation
        public static void Generate(string systemNamespace, string rootNamespace, XElement spElement, bool hasFields, bool hasParameters, bool overWriteIfExists, string saveFilePath) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(TEMPLATE_NAME);

            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;
            string database = spElement.Attribute(FrameworkDriver.XML_ATTR_DATABASE).Value;

            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, systemNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATABASE_NAME, database);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            template = template.Replace(FrameworkDriver.PH_GENERATED_METHOD, GenerateMethod(spElement, spName, hasFields, hasParameters));
                        
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template, overWriteIfExists);
        }

        private static string GenerateMethod(XElement spElement, string spName, bool hasFields, bool hasParameters) {
            string generatedMethodName = spElement.Attribute(FrameworkDriver.XML_ATTR_GEN_METHOD_NAME).Value;
            bool singleRecord = false;
            string logicalOperation = spElement.Attribute(FrameworkDriver.XML_ATTR_LOGICAL_OPERATION).Value;
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

                if (singleRecord) {
                    sbGenMethod.Append(spName);
                    sbGenMethod.Append("Recordset ");
                } else {
                    sbGenMethod.Append("List<");
                    sbGenMethod.Append(spName);
                    sbGenMethod.Append("Recordset> ");                    
                }
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
            if (hasParameters) {
                sbGenMethod.Append(Environment.NewLine);
                sbGenMethod.Append("\t\t\tList<SqlParameter> parameters = new List<SqlParameter>();");
                
                methodArgumentName = null;
                dataType = null;
                string parameterName = null;

                sbGenMethod.Append(Environment.NewLine);
                foreach (XElement parameter in parameterList.Elements()) {
                    parameterName = FrameworkDriver.ResolveParameterName(parameter);
                    methodArgumentName = parameter.Element(FrameworkDriver.XML_ELEMENT_METHOD_ARG_NAME).Value;
                    dataType = parameter.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;
                    dataType = DatabaseFactory.SqlTypeName(dataType);
                    direction = parameter.Element(FrameworkDriver.XML_ELEMENT_PARAM_DIR).Value;

                    if (direction.ToLower() == "input") {
                        sbGenMethod.Append(Environment.NewLine);
                        sbGenMethod.Append("\t\t\t");
                        sbGenMethod.Append("if (");
                        sbGenMethod.Append(methodArgumentName);

                        if ((dataType != "string") && (dataType != "byte[]"))
                            sbGenMethod.Append(".HasValue)");
                        else
                            sbGenMethod.Append(" != null)");

                        sbGenMethod.Append(Environment.NewLine);
                        sbGenMethod.Append("\t\t\t\tparameters.Add(ParameterFactory.GetParameter(");
                        sbGenMethod.Append(spName);
                        sbGenMethod.Append("Params.");
                        sbGenMethod.Append(parameterName);
                        sbGenMethod.Append(", ");
                        sbGenMethod.Append(methodArgumentName);

                        if ((dataType != "string") && (dataType != "byte[]"))
                            sbGenMethod.Append(".Value");

                        sbGenMethod.Append("));");

                        sbGenMethod.Append(Environment.NewLine);
                        sbGenMethod.Append("\t\t\t");
                        sbGenMethod.Append("else ");

                        sbGenMethod.Append(Environment.NewLine);
                        sbGenMethod.Append("\t\t\t\tparameters.Add(ParameterFactory.GetParameter(");
                        sbGenMethod.Append(spName);
                        sbGenMethod.Append("Params.");
                        sbGenMethod.Append(parameterName);
                        sbGenMethod.Append(", DBNull.Value));");
                    } else {
                        sbGenMethod.Append(Environment.NewLine);
                        sbGenMethod.Append("\t\t\t\tparameters.Add(ParameterFactory.GetParameter(");
                        sbGenMethod.Append(spName);
                        sbGenMethod.Append("Params.");
                        sbGenMethod.Append(parameterName);
                        sbGenMethod.Append(", null));");                        
                    }
                    
                    sbGenMethod.Append(Environment.NewLine);                    
                }
            }

            sbGenMethod.Append(Environment.NewLine);
            if ((logicalOperation != "outputparameter") && (logicalOperation != "returnvalue")) {
                sbGenMethod.Append("\t\t\treturn ");
            }
            
            if (hasFields) {
                if (singleRecord) {
                    sbGenMethod.Append("ExecuteSPGetRecord");
                } else {
                    sbGenMethod.Append("ExecuteSPGetCollection");
                }
            } else {
                switch (logicalOperation) {
                    case "insert":
                        sbGenMethod.Append("ExecuteSPGetScalar");
                        break;
                    case "update":
                    case "delete":
                        sbGenMethod.Append("ExecuteSPNonScalar");
                        break;
                    case "outputparameter":
                    case "returnvalue":
                        sbGenMethod.Append("\t\t\tExecuteSPNonScalar");
                        break;
                }
            }

            sbGenMethod.Append("(SP_NAME, ");

            if (hasParameters)
                sbGenMethod.Append("parameters");
            else
                sbGenMethod.Append("null");

            sbGenMethod.Append(");");

            if ((logicalOperation == "outputparameter") || (logicalOperation == "returnvalue")) {
                sbGenMethod.Append(Environment.NewLine);
                sbGenMethod.Append("\t\t\t");
                sbGenMethod.Append(@"//TODO: Implement custom logic to utilize output or return parameter values.");
                sbGenMethod.Append(Environment.NewLine);
                sbGenMethod.Append("\t\t\treturn null;");                
            }

            #endregion

            sbGenMethod.Append(Environment.NewLine);
            sbGenMethod.Append("\t\t}");

            return sbGenMethod.ToString();
        }
        #endregion
    }
}
