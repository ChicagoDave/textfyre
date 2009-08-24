using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainBaseClass
    {
        private const string TEMPLATE_NAME = "Base";

        #region Table generation
        public static void Generate(TranslationData transData)
        {
            string template = FrameworkDriver.GetTemplate(TEMPLATE_NAME);
            string saveMethod = "";
            if (transData.Table.HasCompositePK)
                saveMethod = FrameworkDriver.GetTemplate("SaveMethodComposite");
            else {
                if (transData.Table.PrimaryKeyDataType != "string")
                    saveMethod = FrameworkDriver.GetTemplate("SaveMethodStandard");
                if (transData.Table.PrimaryKeyDataType == "string")
                    saveMethod = FrameworkDriver.GetTemplate("SaveMethodString");
            }

            string output = template.Replace(FrameworkDriver.PH_SAVE_METHOD, saveMethod);

            output = output.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, transData.RootNamespace);
            output = output.Replace(FrameworkDriver.PH_DATABASE_NAME, transData.DatabaseName);
            output = output.Replace(FrameworkDriver.PH_TABLE_NAME, transData.Table.Name);
            output = output.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());


            // Generate PK Constructor
            if (!transData.Table.HasNoPK)
                output = output.Replace(FrameworkDriver.PH_GENERATED_PK_CONSTRUCTOR, GeneratePKConstructor(transData));

            // Generate load arguments and pass the arguments to data layer
            output = output.Replace(FrameworkDriver.PH_LOAD_ARGUMENTS, GenerateLoadArguments(transData, true));
            output = output.Replace(FrameworkDriver.PH_LOAD_ARGUMENTS_NO_TYPE, GenerateLoadArguments(transData, false));

            if (transData.Table.HasCompositePK)
                output = output.Replace(FrameworkDriver.PH_INS_COMPOSITE_KEY_PROPS, GenerateInsertCompositeKeyProps(transData));
            else {
                output = output.Replace(FrameworkDriver.PH_INS_COMPOSITE_KEY_PROPS, String.Empty);
                if (transData.Table.PrimaryKeyDataType == "Guid")
                    output = output.Replace(FrameworkDriver.PH_PRIMARY_KEY_DEFAULT_VALUE, "Guid.Empty");
                if (transData.Table.PrimaryKeyDataType == "Int32")
                    output = output.Replace(FrameworkDriver.PH_PRIMARY_KEY_DEFAULT_VALUE, "-1");
            }
            
            // Generate primary key data type
            if (!transData.Table.HasCompositePK)
                output = output.Replace(FrameworkDriver.PH_PRIMARY_KEY_DATA_TYPE, transData.Table.PrimaryKeyDataType);

            // Generate arguments for deleting the recordset
            output = output.Replace(FrameworkDriver.PH_SAVE_DELETE_ARGS_NO_TYPE, GenerateDeleteArgsNoType(transData));

            // Generate if test to determine if recordset should be inserted
            if (!transData.Table.HasCompositePK)
                output = output.Replace(FrameworkDriver.PH_SAVE_IF_TEST, GenerateIfTest(transData));
            output = output.Replace(FrameworkDriver.PH_SAVE_IF_BODY, GenerateIfBody(transData));

            // Add sorting delegates
            output = output.Replace(FrameworkDriver.PH_SORT_DELEGATES, GenerateSortDelegates(transData));

            // Public Properties
            // For each column, create a public property...
            output = DatabaseFactory.SetPublicProperties(transData, DatabaseFactory.ClassType.BusinessLayer, true, output);
       
            FrameworkDriver.WriteToFile(transData.FilesPath, transData.Table.Name, TEMPLATE_NAME, output);
        }

        private static string GenerateInsertCompositeKeyProps(TranslationData transData) {
            StringBuilder sb = new StringBuilder();
            sb.Append("public virtual void InsertCompositeKeyRecord() {");
            sb.Append(Environment.NewLine);
            sb.Append("\t\t\t");
            sb.Append("_recordset.Inserted = true;");
            sb.Append(Environment.NewLine);
            sb.Append("\t\t}");

            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);

            sb.Append("\t\t");
            sb.Append("public virtual void InsertCompositeKeyRecordNow() {");
            sb.Append(Environment.NewLine);
            sb.Append("\t\t\t");
            sb.Append("_recordset.Inserted = true;");
            sb.Append(Environment.NewLine);
            sb.Append("\t\t\t");
            sb.Append("Save();");
            sb.Append(Environment.NewLine);
            sb.Append("\t\t}");

            return sb.ToString();
        }

        private static string GenerateIfTest(TranslationData transData) {
            StringBuilder sb = new StringBuilder();

            if (!transData.Table.HasCompositePK) {
                if (transData.Table.PrimaryKeyDataType == "Guid") {
                    sb.Append("_recordset.");
                    sb.Append(transData.Table.PrimaryKeyColumn);
                    sb.Append(" == Guid.Empty");
                } else {
                    sb.Append("_recordset.");
                    sb.Append(transData.Table.PrimaryKeyColumn);
                    sb.Append(" == -1");
                }
            } else {
                foreach (SqlColumn column in transData.Table.Columns) {
                    if (column.IsPrimaryKey) {
                        string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                        switch (dataType) {
                            case "string":
                                sb.Append("_recordset.");
                                sb.Append(column.Name);
                                sb.Append(" != \"\" && ");
                                break;
                            case "Guid":
                                sb.Append("_recordset.");
                                sb.Append(column.Name);
                                if (column.IsNullable)
                                    sb.Append(" != null && ");
                                else
                                    sb.Append(" != Guid.Empty && ");
                                break;
                            case "Int32":
                                sb.Append("_recordset.");
                                sb.Append(column.Name);
                                sb.Append(" != -1 && ");
                                break;
                        }
                    }
                }

                sb.Remove(sb.Length - 3, 3).Append(")");
            }

            return sb.ToString();
        }

        private static string GenerateIfBody(TranslationData transData) {
            StringBuilder sb = new StringBuilder();
                       
            if (!transData.Table.HasCompositePK) {
                if (transData.Table.PrimaryKeyDataType != "string") {
                    sb.Append("newPrimaryKey = _dataFactory.Insert");
                    sb.Append(transData.Table.Name);
                    sb.Append("(_recordset);");

                    sb.Append(Environment.NewLine);
                    sb.Append("\t\t\t\t\t");
                    sb.Append("if (newPrimaryKey != ");
                    if (transData.Table.PrimaryKeyDataType == "Guid")
                        sb.Append("Guid.Empty)");
                    else
                        sb.Append("-1)");
                    sb.Append(Environment.NewLine);
                    sb.Append("\t\t\t\t\t\t");
                    sb.Append("ReturnValue = -1;");
                    sb.Append(Environment.NewLine);
                    sb.Append("\t\t\t\t\t");
                    sb.Append("else");
                    sb.Append(Environment.NewLine);
                    sb.Append("\t\t\t\t\t\t");
                    sb.Append("ReturnValue = 0;");
                    sb.Append(";");
                } else {
                    sb.Append("ReturnValue = _dataFactory.Insert");
                    sb.Append(transData.Table.Name);
                    sb.Append("(_recordset);");

                    sb.Append(Environment.NewLine);
                }
            //} else {
            //    sb.Append("ReturnValue = _dataFactory.Insert");
            //    sb.Append(transData.Table.Name);
            //    sb.Append("(_recordset);");

            //    sb.Append(Environment.NewLine);
            //    sb.Append("\t\t\t\t\t");
            //    sb.Append("_recordset.Inserted = false;");
            }

            return sb.ToString();
        }

        private static string GenerateDeleteArgsNoType(TranslationData transData) {
            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns) {
                if (column.IsPrimaryKey) {
                    sb.Append("_recordset.");
                    sb.Append(column.Name);
                    sb.Append(", ");
                }
            }

            sb.Remove(sb.Length - 2, 2); //Remove trailing , and space
            return sb.ToString();
        }

        private static string GenerateSaveMethodReturnType(TranslationData transData) {
            if (!transData.Table.HasCompositePK)
                return transData.Table.PrimaryKeyDataType;

            return "int"; //Inserting with a composite key doesn't return an identity value just success or failure
        }

        private static string GenerateSaveMethodReturnValue(TranslationData transData) {
            if (!transData.Table.HasCompositePK) {
                switch (transData.Table.PrimaryKeyDataType) {
                    case "Guid":
                        return "Guid.NewGuid()";
                    default:
                        return "-1";
                }
            }

            return "-1";
        }

        private static string GenerateLoadArguments(TranslationData transData, bool includeType) {
            StringBuilder sb = new StringBuilder();

            if (!transData.Table.HasCompositePK) {
                if (includeType) {
                    sb.Append(transData.Table.PrimaryKeyDataType);
                    sb.Append(" ");
                }

                sb.Append(transData.Table.PrimaryKeyColumn);
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    if (includeType) {
                        sb.Append(enumerator.Current.Value);
                        sb.Append(" ");
                    }
                    sb.Append(enumerator.Current.Key);
                    sb.Append(", ");
                }

                sb.Remove(sb.Length - 2, 2); //Remove trailing , and space
            }

            return sb.ToString();
        }

        private static string GeneratePKConstructor(TranslationData transData) {
            StringBuilder sbGenCons = new StringBuilder();
            sbGenCons.Append("public ");
            sbGenCons.Append(transData.Table.Name);
            sbGenCons.Append("Base(");

            if (!transData.Table.HasCompositePK) {
                sbGenCons.Append(transData.Table.PrimaryKeyDataType);
                sbGenCons.Append(" ");
                sbGenCons.Append(transData.Table.PrimaryKeyColumn);
            } else {
                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbGenCons.Append(enumerator.Current.Value);
                    sbGenCons.Append(" ");
                    sbGenCons.Append(enumerator.Current.Key);
                    sbGenCons.Append(", ");
                }

                sbGenCons.Remove(sbGenCons.Length - 2, 2); //Remove trailing , and space
            }

            sbGenCons.Append(") : this() {");
            sbGenCons.Append(Environment.NewLine);

            bool hasGuid = true;
            foreach (SqlColumn column in transData.Table.Columns) {
                if (column.IsPrimaryKey) {
                    if (column.DataType == "Guid") {
                        hasGuid = true;
                        break;
                    }
                }
            }
            if (!transData.Table.HasCompositePK) {
                if (!hasGuid) {

                    //If line
                    sbGenCons.Append("\t\t\t");
                    sbGenCons.Append("if(!");
                    sbGenCons.Append(transData.Table.PrimaryKeyColumn);
                    sbGenCons.Append(".HasValue || (");
                    sbGenCons.Append(transData.Table.PrimaryKeyColumn);
                    sbGenCons.Append(".Value == 0))");
                    sbGenCons.Append(Environment.NewLine);

                    //If statement
                    sbGenCons.Append("\t\t\t\t");
                    sbGenCons.Append("_recordset.");
                    sbGenCons.Append(transData.Table.PrimaryKeyColumn);
                    sbGenCons.Append(" = null;");
                    sbGenCons.Append(Environment.NewLine);

                    //Else line
                    sbGenCons.Append("\t\t\t");
                    sbGenCons.Append("else");
                    sbGenCons.Append(Environment.NewLine);
                }
                //Else statement
                sbGenCons.Append("\t\t\t\t");
                sbGenCons.Append("Load(");
                sbGenCons.Append(transData.Table.PrimaryKeyColumn);
                sbGenCons.Append(");");
            } else {
                if (!hasGuid) {

                    //If line
                    sbGenCons.Append("\t\t\t");
                    sbGenCons.Append("if (");

                    foreach (SqlColumn column in transData.Table.Columns) {
                        if (column.IsPrimaryKey) {
                            string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                            if (dataType != "string") {
                                sbGenCons.Append(Environment.NewLine);
                                sbGenCons.Append("\t\t\t\t  ");
                                sbGenCons.Append("(!");
                                sbGenCons.Append(column.Name);
                                sbGenCons.Append(".HasValue || (");
                                sbGenCons.Append(column.Name);
                                sbGenCons.Append(".Value == 0)) &&");
                            } else {
                                sbGenCons.Append(Environment.NewLine);
                                sbGenCons.Append("\t\t\t\t  ");
                                sbGenCons.Append("(");
                                sbGenCons.Append(column.Name);
                                sbGenCons.Append(" != \"\") &&");
                            }
                        }
                    }

                    sbGenCons.Remove(sbGenCons.Length - 3, 3); //Remove trailing space and &&

                    sbGenCons.Append(Environment.NewLine);
                    sbGenCons.Append("\t\t\t");
                    sbGenCons.Append("   ) {");

                    //If statements                

                    foreach (SqlColumn column in transData.Table.Columns) {
                        if (column.IsPrimaryKey) {
                            string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                            if (dataType != "string") {
                                sbGenCons.Append(Environment.NewLine);
                                sbGenCons.Append("\t\t\t\t");
                                sbGenCons.Append("_recordset.");
                                sbGenCons.Append(column.Name);
                                sbGenCons.Append(" = null;");
                            } else {
                                sbGenCons.Append(Environment.NewLine);
                                sbGenCons.Append("\t\t\t\t");
                                sbGenCons.Append("_recordset.");
                                sbGenCons.Append(column.Name);
                                sbGenCons.Append(" = \"\";");
                            }
                        }
                    }
                    sbGenCons.Append(Environment.NewLine);
                    sbGenCons.Append("\t\t\t} else {");
                }
                //Else statements
                sbGenCons.Append(Environment.NewLine);
                sbGenCons.Append("\t\t\t\t");
                sbGenCons.Append("Load(");

                Dictionary<string, string>.Enumerator enumerator = transData.Table.CompositeKey.GetEnumerator();
                while (enumerator.MoveNext()) {
                    sbGenCons.Append(enumerator.Current.Key);
                    sbGenCons.Append(", ");
                }
                enumerator.Dispose();

                sbGenCons.Remove(sbGenCons.Length - 2, 2); //Remove trailing , and space
                sbGenCons.Append(");");
                if (!hasGuid) {
                    sbGenCons.Append(Environment.NewLine);
                    sbGenCons.Append("\t\t\t}");
                }
            }

            sbGenCons.Append(Environment.NewLine);
            sbGenCons.Append("\t\t}");
            return sbGenCons.ToString();
        }

        private static string GenerateSortDelegates(TranslationData transData)
        {
            StringBuilder sb = new StringBuilder();
            foreach (SqlColumn column in transData.Table.Columns)
            {
                string dataType = DatabaseFactory.SqlTypeName(column.DataType);
                if (dataType != "byte[]") // you can't sort by a byte array
                {
                    if ((column.IsNullable  || dataType == "bool" || dataType == "short" || dataType == "int" || dataType == "Int32" || dataType == "Int16" || dataType == "decimal") && dataType != "string")
                    {
                        sb.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnASC =", transData.Table.Name, column.Name));
                        sb.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", transData.Table.Name));
                        sb.AppendLine("\t\t\t\t\t{");
                        sb.AppendLine(String.Format("\t\t\t\t\t\treturn Nullable.Compare<{0}>(o1.{1}, o2.{1});", dataType, column.Name));
                        sb.AppendLine("\t\t\t\t\t};");
                        sb.AppendLine();
                        sb.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnDESC =", transData.Table.Name, column.Name));
                        sb.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", transData.Table.Name));
                        sb.AppendLine("\t\t\t\t\t{");
                        sb.AppendLine(String.Format("\t\t\t\t\t\treturn Nullable.Compare<{0}>(o2.{1}, o1.{1});", dataType, column.Name));
                        sb.AppendLine("\t\t\t\t\t};");
                        sb.AppendLine();
                    }
                    else
                    {
                        string ValueString = ".Value";
                        if (dataType == "string" || dataType == "short" || dataType == "decimal" || dataType == "DateTime" || dataType == "Guid")
                            ValueString = "";
                        sb.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnASC =", transData.Table.Name, column.Name));
                        sb.AppendLine(String.Format("\t\t\t\tdelegate({0} o1, {0} o2)", transData.Table.Name));
                        sb.AppendLine("\t\t\t\t{");
                        sb.AppendLine(String.Format("\t\t\t\t\treturn o1.{0}{1}.CompareTo(o2.{0});", column.Name, ValueString));
                        sb.AppendLine("\t\t\t\t};");
                        sb.AppendLine();
                        sb.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnDESC =", transData.Table.Name, column.Name));
                        sb.AppendLine(String.Format("\t\t\t\tdelegate({0} o1, {0} o2)", transData.Table.Name));
                        sb.AppendLine("\t\t\t\t{");
                        sb.AppendLine(String.Format("\t\t\t\t\treturn o2.{0}{1}.CompareTo(o1.{0});", column.Name, ValueString));
                        sb.AppendLine("\t\t\t\t};");
                        sb.AppendLine();
                    }
                }
            }

            return sb.ToString();
        }

        #endregion

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, bool hasFields, string saveFilePath) {
            string templateName = (hasFields) ? "EntityBase_Select" : "EntityBase_CUD";
            string template = FrameworkDriver.GetStoredProcedureTemplate(templateName);

            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;
            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());

            if (hasFields) {
                StringBuilder sbEvents = new StringBuilder();
                StringBuilder sbProps = new StringBuilder();
                StringBuilder sbSorts = new StringBuilder();
                XElement fieldList = spElement.Element(FrameworkDriver.XML_ELEMENT_FIELD_LIST);

                string fieldName = null;
                string sqlDataType = null;

                foreach (XElement field in fieldList.Elements()) {
                    fieldName = field.Element(FrameworkDriver.XML_ELEMENT_NAME).Value.Trim();
                    sqlDataType  = field.Element(FrameworkDriver.XML_ELEMENT_SQL_DATA_TYPE).Value;

                    //Generate #eventHandlers#                
                    sbEvents.Append("\t\tpublic event EventHandler ");
                    sbEvents.Append(fieldName);
                    sbEvents.Append("Changed;");
                    sbEvents.Append(Environment.NewLine);

                    string dataType = DatabaseFactory.SqlTypeName(sqlDataType);
                    if (dataType != "byte[]")
                    {
                        if (dataType == "string")
                        {
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnASC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn o1.{1}.CompareTo(o2.{1});", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnDESC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn o2.{1}.CompareTo(o1.{1});", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                        }
                        else if (dataType == "DateTime")
                        {
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnASC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn o1.{1}.Value.CompareTo(o2.{1}.Value);", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnDESC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn o2.{1}.Value.CompareTo(o1.{1}.Value);", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                        }
                        else
                        {
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnASC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn Nullable.Compare<{0}>(o1.{1}, o2.{1});", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                            sbSorts.AppendLine(String.Format("\t\t\tpublic static Comparison<{0}> {1}ColumnDESC =", spName, fieldName));
                            sbSorts.AppendLine(String.Format("\t\t\t\t\tdelegate({0} o1, {0} o2)", spName));
                            sbSorts.AppendLine("\t\t\t\t\t{");
                            sbSorts.AppendLine(String.Format("\t\t\t\t\t\treturn Nullable.Compare<{0}>(o2.{1}, o1.{1});", dataType, fieldName));
                            sbSorts.AppendLine("\t\t\t\t\t};");
                            sbSorts.AppendLine();
                        }
                    }

                    //Generate #publicProperties#
                    BuildProperty(sbProps, fieldName, sqlDataType);                          
                }

                template = template.Replace(FrameworkDriver.PH_SORT_DELEGATES, sbSorts.ToString());
                template = template.Replace(FrameworkDriver.PH_EVENT_HANDLERS, sbEvents.ToString());
                template = template.Replace(FrameworkDriver.PH_PUBLIC_PROPERTIES, sbProps.ToString());
            }
            
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }

        //public #virtual# #dataType# #columnName# {
        //  get { return _recordset.#columnName#; }
        //  set {
        //      if(_recordset.#columnName# != value) {
        //        _recordset.#columnName# = value;
        //        if(#columnName#Changed != null)
        //            #columnName#Changed(this, EventArgs.Empty);
        //      }
        //  }
        //}
        private static void BuildProperty(StringBuilder sbProps, string fieldName, string sqlDataType) {
            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\tpublic virtual ");

            string dataType = DatabaseFactory.SqlTypeName(sqlDataType);
            sbProps.Append(dataType);

            if ((dataType != "string") && (dataType != "byte[]"))
                sbProps.Append("?"); 

            sbProps.Append(" ");
            sbProps.Append(fieldName);
            sbProps.Append(" {");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\tget { return _recordset.");
            sbProps.Append(fieldName);
            sbProps.Append("; }");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\tset {");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\tif (_recordset.");
            sbProps.Append(fieldName);
            sbProps.Append(" != value) { ");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\t\t_recordset.");
            sbProps.Append(fieldName);
            sbProps.Append(" = value;");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\t\tif (");
            sbProps.Append(fieldName);
            sbProps.Append("Changed != null) {");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\t\t\t");
            sbProps.Append(fieldName);
            sbProps.Append("Changed(this, EventArgs.Empty);");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\t\t}");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t\t}");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t\t}");

            sbProps.Append(Environment.NewLine);
            sbProps.Append("\t\t}");

            sbProps.Append(Environment.NewLine);
        }
        #endregion
    }
}
