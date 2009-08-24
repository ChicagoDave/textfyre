using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainDataBaseClass
    {
        private const string TEMPLATE_NAME = "DataBase";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);

            string output = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, transData.SystemNamespace);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            string rsName = "new" + transData.Table.Name + "Recordset";
            string drName = "dr" + transData.Table.Name;

            StringBuilder sbLoadRS = new StringBuilder();            
            foreach (SqlColumn column in transData.Table.Columns) {
                //if (fieldMap.ContainsKey("PersonId")) {
                sbLoadRS.Append("\t\t\t\tif (fieldMap.ContainsKey(\"");                                
                sbLoadRS.Append(column.Name);
                sbLoadRS.Append("\")) {");
                sbLoadRS.Append(Environment.NewLine);

                //o = drPerson[fields["PersonId"]];
                sbLoadRS.Append("\t\t\t\t\to = ");
                sbLoadRS.Append(drName);
                sbLoadRS.Append("[fieldMap[\"");
                sbLoadRS.Append(column.Name);
                sbLoadRS.Append("\"]];");
                sbLoadRS.Append(Environment.NewLine);

                //if (o != DBNull.Value)
                sbLoadRS.Append("\t\t\t\t\tif (o != DBNull.Value)");
                sbLoadRS.Append(Environment.NewLine);

                //newPersonRecordset.PersonId = (Int32)o;
                sbLoadRS.Append("\t\t\t\t\t\t");
                sbLoadRS.Append(rsName);
                sbLoadRS.Append(".");
                sbLoadRS.Append(column.Name);
                if (DatabaseFactory.SqlTypeName(column.DataType) == "string") {
                    sbLoadRS.Append(" = ((");
                    sbLoadRS.Append(DatabaseFactory.SqlTypeName(column.DataType));
                    sbLoadRS.Append(")o).Trim();");
                } else {
                    sbLoadRS.Append(" = (");
                    sbLoadRS.Append(DatabaseFactory.SqlTypeName(column.DataType));
                    sbLoadRS.Append(")o;");
                }
                sbLoadRS.Append(Environment.NewLine);
                
                sbLoadRS.Append("\t\t\t\t}");
                sbLoadRS.Append(Environment.NewLine);

                sbLoadRS.Append(Environment.NewLine);
            }

            string arguments = String.Empty;
            string parameters = String.Empty;

            #region Select
            //Generate SELECT sql            
            output = output.Replace(FrameworkDriver.PH_SELECT_ALL_SQL, GenerateSelectSQL(transData, false, out arguments, out parameters));
            output = output.Replace(FrameworkDriver.PH_SELECT_ONE_SQL, GenerateSelectSQL(transData, true, out arguments, out parameters));
            output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_IF_TEST, GenerateSelectSQLIFTest(transData, arguments));
            output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_ARGUMENTS, arguments);
            if (!transData.Table.HasCompositePK)
                output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_PARAMETERS, GenerateSelectOneParameter(transData));
            else
                output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_PARAMETERS, GenerateSelectCompositeParameters(transData));
            #endregion

            #region Insert
            //Generate INSERT sql
            parameters = String.Empty;

            if (transData.Table.HasCompositePK || transData.Table.PrimaryKeyDataType == "string")
                output = output.Replace(FrameworkDriver.PH_INSERT_RETURN_DATA_TYPE, "int");
            else {
                output = output.Replace(FrameworkDriver.PH_INSERT_RETURN_DATA_TYPE, transData.Table.PrimaryKeyDataType);

                if (transData.Table.PrimaryKeyDataType == "Guid")
                    output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_TEST, string.Concat(transData.Table.PrimaryKeyColumn, " == Guid.Empty"));
                else
                    output = output.Replace(FrameworkDriver.PH_SELECT_BY_ID_TEST, string.Concat(transData.Table.PrimaryKeyColumn, " < 1"));
            }

            output = output.Replace(FrameworkDriver.PH_INSERT_SQL, GenerateInsertSQL(transData, out parameters));
            output = output.Replace(FrameworkDriver.PH_INSERT_PARAMETERS, parameters);
            //output = output.Replace(FrameworkDriver.PH_PRIMARY_KEY_DATA_TYPE, transData.Table.PrimaryKeyDataType);

            StringBuilder returnLine = new StringBuilder();
            returnLine.Append("\t\t\treturn ");

            if (!transData.Table.HasCompositePK && transData.Table.PrimaryKeyDataType != "string") {
                if (transData.Table.PrimaryKeyDataType == "Guid")
                    returnLine.Append("(Guid)");
                else {
                    returnLine.Append("Convert.ToInt32");
                }
                returnLine.Append("(ExecuteSqlGetScalar(sql, parameters));");
            } else {
                returnLine.Append("ExecuteSqlGetNonScalar(sql, parameters);");
            }
            output = output.Replace(FrameworkDriver.PH_INSERT_RETURN_LINE, returnLine.ToString());
            #endregion

            #region Update
            //Generate UPDATE sql
            parameters = String.Empty;

            output = output.Replace(FrameworkDriver.PH_UPDATE_SQL, GenerateUpdateSQL(transData, out parameters));
            output = output.Replace(FrameworkDriver.PH_UPDATE_PARAMETERS, parameters);
            #endregion

            #region Delete
            //Generate DELETE sql
            parameters = String.Empty;
            arguments = String.Empty;
            output = output.Replace(FrameworkDriver.PH_DELETE_SQL, GenerateDeleteSQL(transData, out arguments, out parameters));
            output = output.Replace(FrameworkDriver.PH_DELETE_ARGUMENTS, arguments);
            output = output.Replace(FrameworkDriver.PH_DELETE_PARAMETERS, parameters);
            #endregion
            
            output = output.Replace(FrameworkDriver.PH_LOAD_RECORDSET, sbLoadRS.ToString());                                 
            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output);
        }
        #endregion

        #region SP generation
        public static void Generate(string systemNamespace, string rootNamespace, XElement spElement, bool hasFields, bool hasParameters, string saveFilePath) {
            string templateName = TEMPLATE_NAME;
            templateName += (hasFields) ? "_Select" : "_CUD";
            string template = FrameworkDriver.GetStoredProcedureTemplate(templateName);

            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;
            template = template.Replace(FrameworkDriver.PH_SYSTEM_NAMESPACE, systemNamespace);
            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            //Set #spParmFactoryMember# and #spParmFactoryProperty# strings
            if (hasParameters) {
                template = template.Replace(FrameworkDriver.PH_SP_PARM_FACTORY_MEMBER, GetParmFactoryMemberString(spName));
                template = template.Replace(FrameworkDriver.PH_SP_PARM_FACTORY_PROPERTY, GetParmFactoryPropertyString(spName));
            } else {
                template = template.Replace(FrameworkDriver.PH_SP_PARM_FACTORY_MEMBER, String.Empty);
                template = template.Replace(FrameworkDriver.PH_SP_PARM_FACTORY_PROPERTY, String.Empty);
            }

            //Build #loadRecordset# section
            if (hasFields) {
                string rsName = "new" + spName + "Recordset";
                string drName = "dr" + spName;
                StringBuilder sbLoadRS = new StringBuilder();

                XElement fieldList = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);
                string fieldName = null;
                string sqlDataType = null;
                int currentFieldIndex = 0;

                foreach(XElement field in fieldList.Elements())
                {
                    fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value;
                    sqlDataType  = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;

                    sbLoadRS.Append("\t\t\t\tif(!");
                    sbLoadRS.Append(drName);
                    sbLoadRS.Append(".IsDBNull(");
                    sbLoadRS.Append(currentFieldIndex);
                    sbLoadRS.Append("))");
                    sbLoadRS.Append(Environment.NewLine);

                    if (DatabaseFactory.SqlTypeName(sqlDataType) == "string") {
                        sbLoadRS.Append("\t\t\t\t\t");
                        sbLoadRS.Append(rsName);
                        sbLoadRS.Append(".");
                        sbLoadRS.Append(fieldName);
                        sbLoadRS.Append(" = ((");
                        sbLoadRS.Append(DatabaseFactory.SqlTypeName(sqlDataType));
                        sbLoadRS.Append(")");
                        sbLoadRS.Append(drName);
                        sbLoadRS.Append("[");
                        sbLoadRS.Append(currentFieldIndex);
                        sbLoadRS.Append("]).Trim();");
                    } else {
                        sbLoadRS.Append("\t\t\t\t\t");
                        sbLoadRS.Append(rsName);
                        sbLoadRS.Append(".");
                        sbLoadRS.Append(fieldName);
                        sbLoadRS.Append(" = (");
                        sbLoadRS.Append(DatabaseFactory.SqlTypeName(sqlDataType));
                        sbLoadRS.Append(")");
                        sbLoadRS.Append(drName);
                        sbLoadRS.Append("[");
                        sbLoadRS.Append(currentFieldIndex);
                        sbLoadRS.Append("];");
                    }

                    sbLoadRS.Append(Environment.NewLine);
                    ++currentFieldIndex;
                }

                template = template.Replace(FrameworkDriver.PH_LOAD_RECORDSET, sbLoadRS.ToString());
            }
            
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }

        private static string GetParmFactoryMemberString(string spName) {
            return String.Format("private {0}ParameterFactory _parameterFactory = new {0}ParameterFactory();", spName);
        }

        private static string GetParmFactoryPropertyString(string spName) {
            StringBuilder sb = new StringBuilder();
            sb.Append("\t\t");
            sb.Append("protected ");
            sb.Append(spName);
            sb.Append("ParameterFactory ParameterFactory {");
            sb.Append(Environment.NewLine);

            sb.Append("\t\t\t");
            sb.Append("get { return _parameterFactory; }");
            sb.Append(Environment.NewLine);

            sb.Append("\t\t");
            sb.Append("}");

            return sb.ToString();
        }
        #endregion

        #region Table SQL Generation
        private static string GenerateSelectSQLIFTest(TranslationData transData, string arguments) {
            StringBuilder sbTest = new StringBuilder();

            string[] fields = arguments.Split(new char[] { ',' });

            foreach (string field in fields) {
                if (field.Contains("Int32")) {
                    sbTest.Append(field.Replace("Int32 ", ""));
                    sbTest.Append(" < 1");
                }
                if (field.Contains("Guid")) {
                    sbTest.Append(field.Replace("Guid ", ""));
                    sbTest.Append(" == Guid.Empty");
                }
                if (field.Contains("string")) {
                    sbTest.Append(field.Replace("string ", ""));
                    sbTest.Append(" == \"\"");
                }
                sbTest.Append(" &&");
            }

            sbTest.Remove(sbTest.Length - 3, 3);

            return sbTest.ToString();
        }

        private static string GenerateSelectSQL(TranslationData transData, bool selectById, out string arguments, out string parameters) {
            StringBuilder sbSQL = new StringBuilder();
            StringBuilder sbArguments = new StringBuilder();
            StringBuilder sbParameters = new StringBuilder();

            //Build select portion of query           
            sbSQL.Append("SELECT ");

            foreach (SqlColumn column in transData.Table.Columns) {
                sbSQL.Append("[");
                sbSQL.Append(column.Name);
                sbSQL.Append("]");
                sbSQL.Append(", ");
            }

            sbSQL.Remove(sbSQL.Length - 2, 2); //Remove trailing , and space
            sbSQL.Append(" FROM ");
            sbSQL.Append(transData.Table.Name);


            //Build where portion of query
            if (selectById) {
                sbSQL.Append(" WHERE ");

                if (!transData.Table.HasCompositePK) {
                    sbSQL.Append("[");
                    sbSQL.Append(transData.Table.PrimaryKeyColumn);
                    sbSQL.Append("] = @");
                    sbSQL.Append(transData.Table.PrimaryKeyColumn);

                    sbArguments.Append(transData.Table.PrimaryKeyDataType);
                    sbArguments.Append(" ");
                    sbArguments.Append(transData.Table.PrimaryKeyColumn);

                    BuildParameter(sbParameters, transData,
                                   transData.Table.Columns.Find(sqlColumn => sqlColumn.Name == transData.Table.PrimaryKeyColumn),
                                   false);
                } else {
                    Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                    while (enumerator.MoveNext()) {
                        sbSQL.Append("[");
                        sbSQL.Append(enumerator.Current.Key);
                        sbSQL.Append("] = @");
                        sbSQL.Append(enumerator.Current.Key);
                        sbSQL.Append(" AND ");

                        sbArguments.Append(enumerator.Current.Value);
                        sbArguments.Append(" ");
                        sbArguments.Append(enumerator.Current.Key);
                        sbArguments.Append(", ");

                        BuildParameter(sbParameters, transData,
                                       transData.Table.Columns.Find(sqlColumn => sqlColumn.Name == enumerator.Current.Key),
                                       false);
                    }
                    enumerator.Dispose();

                    sbArguments.Remove(sbArguments.Length - 2, 2); //Remove trailing , and space
                    sbSQL.Remove(sbSQL.Length - 5, 5); //Remove trailing space AND space
                }
            }

            arguments = sbArguments.ToString();
            parameters = sbParameters.ToString();
            return sbSQL.ToString();
        }

        private static string GenerateInsertSQL(TranslationData transData, out string parameters) {
            StringBuilder sbSQL = new StringBuilder();
            StringBuilder sbParms = new StringBuilder();

            //Insert Into Person ([FirstName], [LastName], [Gender], [DOB]) Values (@FirstName, @LastName, @Gender, @DOB)
            sbSQL.Append("INSERT INTO ");
            sbSQL.Append(transData.Table.Name);
            sbSQL.Append("(");

            foreach (SqlColumn column in transData.Table.Columns) {
                if ((!transData.Table.HasCompositePK && !column.IsPrimaryKey) || transData.Table.HasCompositePK) {
                    sbSQL.Append("[");
                    sbSQL.Append(column.Name);
                    sbSQL.Append("], ");
                }
            }

            sbSQL.Remove(sbSQL.Length - 2, 2); //Remove trailing , and space
            sbSQL.Append(") VALUES (");

            foreach (SqlColumn column in transData.Table.Columns) {
                if ((!transData.Table.HasCompositePK && !column.IsPrimaryKey) || transData.Table.HasCompositePK) {
                    sbSQL.Append("@");
                    sbSQL.Append(column.Name);
                    sbSQL.Append(", ");

                    BuildParameter(sbParms, transData, column, true);
                } //end outer if block
            }

            sbParms.Remove(sbParms.Length - 2, 2); //Remove trailing \r\n
            sbSQL.Remove(sbSQL.Length - 2, 2); //Remove trailing , and space
            sbSQL.Append(")");

            if (!transData.Table.HasCompositePK)
                sbSQL.Append("; SELECT SCOPE_IDENTITY() as ID;");

            parameters = sbParms.ToString();
            return sbSQL.ToString();
        }

        private static string GenerateUpdateSQL(TranslationData transData, out string parameters) {
            StringBuilder sbSQL = new StringBuilder();
            StringBuilder sbParms = new StringBuilder();

            //Update Person Set [FirstName] = @FirstName, [LastName] = @LastName, [Gender] = @Gender, [DOB] = @DOB Where [PersonId] = @PersonId
            sbSQL.Append("UPDATE ");
            sbSQL.Append(transData.Table.Name);
            sbSQL.Append(" SET ");

            foreach (SqlColumn column in transData.Table.Columns) {
                if (!column.IsPrimaryKey) {
                    sbSQL.Append("[");
                    sbSQL.Append(column.Name);
                    sbSQL.Append("] = @");
                    sbSQL.Append(column.Name);
                    sbSQL.Append(", ");
                }

                BuildParameter(sbParms, transData, column, true);
            }

            sbParms.Remove(sbParms.Length - 2, 2); //Remove trailing \r\n
            sbSQL.Remove(sbSQL.Length - 2, 2); //Remove trailing , and space

            sbSQL.Append(" WHERE ");

            if (!transData.Table.HasCompositePK) {
                sbSQL.Append("[");
                sbSQL.Append(transData.Table.PrimaryKeyColumn);
                sbSQL.Append("] = @");
                sbSQL.Append(transData.Table.PrimaryKeyColumn);
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbSQL.Append("[");
                    sbSQL.Append(enumerator.Current.Key);
                    sbSQL.Append("] = @");
                    sbSQL.Append(enumerator.Current.Key);
                    sbSQL.Append(" AND ");
                }
                enumerator.Dispose();

                sbSQL.Remove(sbSQL.Length - 5, 5); //Remove trailing space AND space
            }

            parameters = sbParms.ToString();
            return sbSQL.ToString();
        }

        private static string GenerateDeleteSQL(TranslationData transData, out string arguments, out string parameters) {
            StringBuilder sbSQL = new StringBuilder();
            StringBuilder sbArgs = new StringBuilder();
            StringBuilder sbParams = new StringBuilder();

            //Delete From Person Where [PersonId] = @PersonId
            sbSQL.Append("DELETE FROM ");
            sbSQL.Append(transData.Table.Name);
            sbSQL.Append(" WHERE ");

            if (!transData.Table.HasCompositePK) {
                sbSQL.Append("[");
                sbSQL.Append(transData.Table.PrimaryKeyColumn);
                sbSQL.Append("] = @");
                sbSQL.Append(transData.Table.PrimaryKeyColumn);

                sbArgs.Append(transData.Table.PrimaryKeyDataType);
                sbArgs.Append(" ");
                sbArgs.Append(transData.Table.PrimaryKeyColumn);

                BuildParameter(sbParams, transData,
                               transData.Table.Columns.Find(sqlColumn => sqlColumn.Name == transData.Table.PrimaryKeyColumn),
                               false);
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbSQL.Append("[");
                    sbSQL.Append(enumerator.Current.Key);
                    sbSQL.Append("] = @");
                    sbSQL.Append(enumerator.Current.Key);
                    sbSQL.Append(" AND ");

                    sbArgs.Append(enumerator.Current.Value);
                    sbArgs.Append(" ");
                    sbArgs.Append(enumerator.Current.Key);
                    sbArgs.Append(", ");

                    BuildParameter(sbParams, transData,
                                   transData.Table.Columns.Find(sqlColumn => sqlColumn.Name == enumerator.Current.Key),
                                   false);
                }
                enumerator.Dispose();

                sbArgs.Remove(sbArgs.Length - 2, 2); //Remove trailing , and space
                sbSQL.Remove(sbSQL.Length - 5, 5); //Remove trailing space AND space
            }

            arguments = sbArgs.ToString();
            parameters = sbParams.ToString();
            return sbSQL.ToString();
        }

        private static string GenerateSelectOneParameter(TranslationData transData) {
            StringBuilder sbParams = new StringBuilder();

            sbParams.Append("\t\t\tparameters.Add(ParameterFactory.GetParameter(");
            sbParams.Append(transData.Table.Name);
            sbParams.Append("Fields.");
            sbParams.Append(transData.Table.PrimaryKeyColumn);
            sbParams.Append(", ");
            sbParams.Append(transData.Table.PrimaryKeyColumn);
            sbParams.Append("));");

            return sbParams.ToString();
        }

        private static string GenerateSelectCompositeParameters(TranslationData transData) {
            StringBuilder sbParams = new StringBuilder();

            Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
            while (enumerator.MoveNext()) {
                sbParams.Append("\t\t\tparameters.Add(ParameterFactory.GetParameter(");
                sbParams.Append(transData.Table.Name);
                sbParams.Append("Fields.");
                sbParams.Append(enumerator.Current.Key);
                sbParams.Append(", ");
                sbParams.Append(enumerator.Current.Key);
                sbParams.Append("));");
                sbParams.Append(Environment.NewLine);
            }

            return sbParams.ToString();
        }

        private static void BuildParameter(StringBuilder sbParms, TranslationData transData, SqlColumn curColumn, bool fromRecord) {
            string dataType = DatabaseFactory.SqlTypeName(curColumn.DataType);

            if (curColumn.IsPrimaryKey) {
                sbParms.Append("\t\t\t");
                sbParms.Append("parameters.Add(ParameterFactory.GetParameter(");
                sbParms.Append(transData.Table.Name);
                sbParms.Append("Fields.");
                sbParms.Append(curColumn.Name);
                sbParms.Append(", ");
                if (fromRecord)
                    sbParms.Append("record.");

                sbParms.Append(curColumn.Name);

                sbParms.Append("));");
                sbParms.Append(Environment.NewLine);
                return;
            }
            if (curColumn.IsNullable) {
                sbParms.Append("\t\t\tif(");

                if (fromRecord)
                    sbParms.Append("record.");

                sbParms.Append(curColumn.Name);

                if ((dataType != "byte[]") && (dataType != "string") && (dataType != "Guid"))
                    sbParms.Append(".HasValue");
                else
                    sbParms.Append(" != null");

                sbParms.Append(")");
                sbParms.Append(Environment.NewLine);
                sbParms.Append("\t");
            }
            

            sbParms.Append("\t\t\t");
            sbParms.Append("parameters.Add(ParameterFactory.GetParameter(");
            sbParms.Append(transData.Table.Name);
            sbParms.Append("Fields.");
            sbParms.Append(curColumn.Name);
            sbParms.Append(", ");

            if (fromRecord)
                sbParms.Append("record.");

            sbParms.Append(curColumn.Name);

            if (curColumn.IsPrimaryKey || curColumn.IsNullable) {
                if ((dataType != "byte[]") && (dataType != "string"))
                    sbParms.Append(".Value");
            }

            sbParms.Append("));");
            sbParms.Append(Environment.NewLine);

            if (curColumn.IsPrimaryKey || curColumn.IsNullable) {
                sbParms.Append("\t\t\telse");
                sbParms.Append(Environment.NewLine);

                sbParms.Append("\t\t\t\t");
                sbParms.Append("parameters.Add(ParameterFactory.GetParameter(");
                sbParms.Append(transData.Table.Name);
                sbParms.Append("Fields.");
                sbParms.Append(curColumn.Name);
                sbParms.Append(", DBNull.Value));");
                sbParms.Append(Environment.NewLine);
            }

            sbParms.Append(Environment.NewLine);
        }
        #endregion

    }
}
