using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainParameterFactoryClass
    {        
        private const string TEMPLATE_NAME = "ParameterFactory";
        private const string FORMAT_STRING = "\r\n\t\t\t\t";
        private const string INPUT_PARAM = "input";
        private const string OUTPUT_PARAM = "output";
        private const string RETURN_PARAM = "returnvalue";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            // params            
            StringBuilder sbFields = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns)
            {   
                int? maxLength = null;
                if (column.MaxLength != null)
                    maxLength = column.MaxLength;

                BuildParameterFactoryFields(sbFields,
                                            transData.Table.Name, column.Name, column.DataType,
                                            maxLength, "input", column.IsNullable, false, column.Name);
            }

            output = output.Replace(FrameworkDriver.PH_PARAMETER_FACTORY_FIELDS, sbFields.ToString());
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

            XElement parms = spElement.Element(FrameworkDriver.XML_ELEMENT_PARAMETER_LIST);
            StringBuilder sbParams = new StringBuilder();
            string paramName   = null;
            string paramAlias  = null;
            string sqlDataType = null;
            string direction   = null;
            int? maxLength     = 0;

            foreach (XElement parameter in parms.Elements()) {
                //Get parameter name
                paramName  = parameter.Element(FrameworkDriver.XML_ELEMENT_NAME).Value;
                paramAlias = FrameworkDriver.ResolveParameterName(parameter);

                //Get the sql data type
                XElement sqlDataTypeEle = parameter.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE);
                sqlDataType = sqlDataTypeEle.Value;

                //Get the maxLength if it exists
                XAttribute maxLengthAttr = sqlDataTypeEle.Attribute(FrameworkDriver.XML_ATTR_MAX_LENGTH);
                if (maxLengthAttr != null)
                    maxLength = int.Parse(maxLengthAttr.Value);

                //Get the parameter direction
                direction = parameter.Element(FrameworkDriver.XML_ELEMENT_PARAM_DIR).Value;
                BuildParameterFactoryFields(sbParams, spName, paramAlias, sqlDataType, maxLength, direction, true, true, paramName);

                maxLength = null;
            }

            template = template.Replace(FrameworkDriver.PH_PARAMETER_FACTORY_FIELDS, sbParams.ToString());
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }
        #endregion

        #region Helper method
        private static void BuildParameterFactoryFields(StringBuilder sbParamsFields, 
                                                        string tableOrSPName, string enumName, string sqlDataType, 
                                                        int? maxLength, string direction, bool isNullable, bool isSP,
                                                        string paramName) {
            //Build case line
            sbParamsFields.Append(FORMAT_STRING);
            sbParamsFields.Append("case ");
            sbParamsFields.Append(tableOrSPName);
            sbParamsFields.Append(isSP ? "Params" : "Fields");
            sbParamsFields.Append(".");
            sbParamsFields.Append(enumName);
            sbParamsFields.Append(":");
                       
            //Build sql parameter
            sbParamsFields.Append(FORMAT_STRING);
            sbParamsFields.Append("\tparam = new SqlParameter(");

            //Parameter name
            sbParamsFields.Append("\"@");
            sbParamsFields.Append(paramName);
            sbParamsFields.Append("\", ");

            //Sql Data Type
            sbParamsFields.Append(DatabaseFactory.SqlDbTypeName(sqlDataType));                        

            //If there is a maxLength specified, then supply it.
            if (maxLength.HasValue && (sqlDataType != "xml")) {
                sbParamsFields.Append(", ");
                sbParamsFields.Append(maxLength.Value); 
            }

            sbParamsFields.Append(");");

            //Set parameter value
            if (direction == INPUT_PARAM) {
                sbParamsFields.Append(FORMAT_STRING);
                sbParamsFields.Append("\tparam.Value = ");
                sbParamsFields.Append(isSP ? "Param" : "Field");
                sbParamsFields.Append("Value;");
            }
            
            //Set parameter direction
            sbParamsFields.Append(FORMAT_STRING);
            sbParamsFields.Append("\tparam.Direction = ");
            switch (direction) {
                case INPUT_PARAM:
                    sbParamsFields.Append("ParameterDirection.Input;");
                    break;
                case OUTPUT_PARAM:
                    sbParamsFields.Append("ParameterDirection.Output;");
                    break;
                case RETURN_PARAM:
                    sbParamsFields.Append("ParameterDirection.ReturnValue;");
                    break;
            }

            //Set nullable
            if (direction == INPUT_PARAM) {
                sbParamsFields.Append(FORMAT_STRING);
                sbParamsFields.Append("\tparam.IsNullable = ");
                sbParamsFields.Append(isNullable.ToString().ToLower());
                sbParamsFields.Append(";");
            }

            //Set source column
            if (!isSP) {
                sbParamsFields.Append(FORMAT_STRING);
                sbParamsFields.Append("\tparam.SourceColumn = \"");
                sbParamsFields.Append(enumName);
                sbParamsFields.Append("\";");
            }

            //Return
            sbParamsFields.Append(FORMAT_STRING);
            sbParamsFields.Append("\tbreak;");
        }
        #endregion
    }
}
