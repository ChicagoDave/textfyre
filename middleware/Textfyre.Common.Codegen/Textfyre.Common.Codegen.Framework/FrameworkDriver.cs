using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class FrameworkDriver {

        #region Public constants

        #region Placeholders
        public const string PH_ROOT_NAMESPACE           = "#rootNamespace#";
        public const string PH_SYSTEM_NAMESPACE         = "#systemNamespace#";
        public const string PH_TABLE_NAME               = "#tableName#";
        public const string PH_SP_NAME                  = "#spName#";
        public const string PH_SAVE_METHOD              = "#saveRecordMethod#";
        public const string PH_PRIMARY_KEY_COLUMN       = "#primaryKeyColumn#";
        public const string PH_PRIMARY_KEY_DATA_TYPE    = "#primaryKeyDataType#";
        public const string PH_PRIVATE_FIELDS           = "#privateFields#";
        public const string PH_PROTECTED_FIELDS         = "#protectedFields#";
        public const string PH_CLONE_SETTINGS           = "#cloneSettings#";
        public const string PH_PUBLIC_PROPERTIES        = "#publicProperties#";
        public const string PH_PARAMETER_FACTORY_FIELDS = "#parameterFactoryFields#";
        public const string PH_ENUM_FIELDS              = "#enumFields#";
        public const string PH_ENUM_PARAMS              = "#enumParams#";
        public const string PH_LOAD_RECORDSET           = "#loadRecordset#";
        public const string PH_DATABASE_NAME            = "#databaseName#";
        public const string PH_GENERATED_METHOD         = "#generatedMethod#";
        public const string PH_ENTITY_CONSTRUCTORS      = "#entityConstructors#";
        public const string PH_EVENT_HANDLERS           = "#eventHandlers#";
        public const string PH_SELECT_ONE_SQL           = "#selectOneSQL#";
        public const string PH_SELECT_ALL_SQL           = "#selectAllSQL#";
        public const string PH_INSERT_SQL               = "#insertSQL#";
        public const string PH_UPDATE_SQL               = "#updateSQL#";
        public const string PH_DELETE_SQL               = "#deleteSQL#";
        public const string PH_SELECT_BY_ID_TEST        = "#selectByIDTest#";
        public const string PH_INSERT_PARAMETERS        = "#insertParameters#";
        public const string PH_UPDATE_PARAMETERS        = "#updateParameters#";
        public const string PH_DELETE_PARAMETERS        = "#deleteParameters#";
        public const string PH_TO_CONVERTER             = "#toConverter#";
        public const string PH_GENERATED_PK_CONSTRUCTOR = "#generatedPKConstructor#";
        public const string PH_GENERATED_SET_IDENTITY   = "#generatedSetIdentity#";
        public const string PH_SELECT_BY_ID_ARGUMENTS   = "#selectByIdArguments#";
        public const string PH_SELECT_BY_ID_IF_TEST     = "#selectByIDTest#";
        public const string PH_DELETE_ARGUMENTS         = "#deleteArguments#";
        public const string PH_SELECT_BY_ID_PARAMETERS  = "#selectByIdParameters#";
        public const string PH_INSERT_RETURN_DATA_TYPE  = "#insertReturnDataType#";
        public const string PH_INSERT_RETURN_LINE       = "#insertReturnLine#";
        public const string PH_LOAD_ARGUMENTS           = "#loadArguments#";
        public const string PH_LOAD_ARGUMENTS_NO_TYPE   = "#loadArgumentsNoType#";
        public const string PH_PRIMARY_KEY_DEFAULT_VALUE= "#primaryKeyDefaultValue#";
        public const string PH_SAVE_RETURN_DATA_VALUE   = "#saveReturnValue#";
        public const string PH_SAVE_DELETE_ARGS_NO_TYPE = "#saveDeleteArgumentsNoType#";
        public const string PH_SAVE_IF_TEST             = "#saveIfTest#";
        public const string PH_SAVE_IF_BODY             = "#saveIfBody#";
        public const string PH_GENERATED_ARGS           = "#generatedArgs#";
        public const string PH_INS_COMPOSITE_KEY_PROPS  = "#insertCompositeKeyProps#";
        public const string PH_INS_FIELD_AND_PROPERTY   = "#insertFieldAndProperty#";
        public const string PH_SP_PARM_FACTORY_MEMBER   = "#spParmFactoryMember#";
        public const string PH_SP_PARM_FACTORY_PROPERTY = "#spParmFactoryProperty#";
        public const string PH_FLUSH_METHOD             = "#flushMethod#";
        public const string PH_DATE                     = "#date#";
        public const string PH_SORT_DELEGATES           = "#sortDelegates#";
        public const string PH_SORTING_CASES            = "#sortingCases#";
        #endregion

        #region Stored Procedure XML constants
        public const string XML_ELEMENT_SP              = "storedProcedure";
        public const string XML_ELEMENT_NAME            = "name";
        public const string XML_ELEMENT_FIELD_LIST      = "fieldList";
        public const string XML_ELEMENT_PARAMETER_LIST  = "parameterList";
        public const string XML_ELEMENT_FIELD           = "field";
        public const string XML_ELEMENT_PARAMETER       = "parameter";
        public const string XML_ELEMENT_SQL_DATA_TYPE   = "sqlDataType";
        public const string XML_ELEMENT_PARAM_DIR       = "parameterDirection";
        public const string XML_ELEMENT_METHOD_ARG_NAME = "methodArgumentName";

        public const string XML_ATTR_DATABASE           = "database";
        public const string XML_ATTR_MAX_LENGTH         = "maxLength";
        public const string XML_ATTR_NAME               = "name";
        public const string XML_ATTR_GEN_METHOD_NAME    = "generatedMethodName";
        public const string XML_ATTR_SINGLE_RECORD      = "singleRecord";
        public const string XML_ATTR_LOGICAL_OPERATION  = "logicalOperation";
        public const string XML_ATTR_PARAM_ALIAS        = "paramAlias";
        #endregion

        #endregion

        public FrameworkDriver() {}

        public void GenerateClasses(string rootNamespace, 
                                    string editFilesPath, 
                                    string edit2FilesPath,
                                    string genFilesPath,
                                    List<string> tableList, 
                                    string databaseName, 
                                    string connectionString, 
                                    bool overWrite)
        {
            DatabaseFactory _dbFactory = new DatabaseFactory(databaseName, connectionString);

            string databaseNamespace = String.Concat(rootNamespace, ".", databaseName);
            string systemNamespace = rootNamespace;

            // Iterate through list of table names and create classes.
            foreach (string tableName in tableList)
            {
                SqlTable table = _dbFactory.LoadTable(tableName);

                TranslationData transData = new TranslationData(databaseName, systemNamespace, databaseNamespace, table, editFilesPath, overWrite);

                // These classes are editable by the developer. If major changes are moved into the templates,
                // the developers will need to mitigate their classes with the new templated version. It's
                // not recommended that we do this often.
                MakeDomainClass.Generate(transData);

                transData.FilesPath = edit2FilesPath;

                MakeDomainDataClass.Generate(transData);
                MakeDomainRecordsetClass.Generate(transData);

                transData.FilesPath = genFilesPath; // These files go somewhere else.

                // These classes are always generated and should never be edited.
                MakeDomainCollectionClass.Generate(transData);                
                MakeDomainDataBaseClass.Generate(transData);
                MakeDomainBaseClass.Generate(transData);
                MakeDomainFieldsClass.Generate(transData);
                MakeDomainParameterFactoryClass.Generate(transData);
                MakeDomainRecordsetBaseClass.Generate(transData);
            }
        }

        public void GenerateClasses(string systemNamespace,
                                    string editFilesPath,
                                    string lessEditFilesPath,
                                    string noEditFilesPath,                                    
                                    bool overWrite,
                                    string spXMLFilePath) {


            XDocument xdoc = XDocument.Load(spXMLFilePath);            
            XElement spElement = xdoc.Root.Element(XML_ELEMENT_SP);

            string databaseNamespace = String.Concat(systemNamespace, ".", spElement.Attribute(FrameworkDriver.XML_ATTR_DATABASE).Value);

            //Check to see if the stored procedure has fields, parameters, or both
            XElement fieldListElement = spElement.Element(XML_ELEMENT_FIELD_LIST);
            XElement parameterListElement = spElement.Element(XML_ELEMENT_PARAMETER_LIST);
            bool hasFields = ((fieldListElement != null) && (fieldListElement.HasElements));
            bool hasParameters = ((parameterListElement != null) && (parameterListElement.HasElements));

            MakeDomainBaseClass.Generate(databaseNamespace, spElement, hasFields, noEditFilesPath); //Non-Editable (business)
            MakeDomainClass.Generate(databaseNamespace, spElement, hasFields, hasParameters, overWrite, editFilesPath); //Editable (business)           

            MakeDomainDataBaseClass.Generate(systemNamespace, databaseNamespace, spElement, hasFields, hasParameters, noEditFilesPath); //Non-Editable (data)
            MakeDomainDataClass.Generate(systemNamespace, databaseNamespace, spElement, hasFields, hasParameters, overWrite, lessEditFilesPath); //Editable (data)

            if (hasParameters) {
                MakeDomainParamsClass.Generate(databaseNamespace, spElement, noEditFilesPath); //Non-Editable (data)
                MakeDomainParameterFactoryClass.Generate(databaseNamespace, spElement, noEditFilesPath); //Non-Editable (data)
            }

            if (hasFields) {
                MakeDomainFieldsClass.Generate(databaseNamespace, spElement, noEditFilesPath); //Non-Editable (data)
                MakeDomainCollectionClass.Generate(systemNamespace, databaseNamespace, spElement, noEditFilesPath, hasFields); //Non-Editable (business)
                MakeDomainRecordsetClass.Generate(databaseNamespace, spElement, overWrite, lessEditFilesPath); //Editable (data)
                MakeDomainRecordsetBaseClass.Generate(databaseNamespace, spElement, noEditFilesPath); //Non-Editable (data)
            }
        }

        /// <summary>
        /// Command line sproc interface.
        /// </summary>
        /// <param name="mainPath"></param>
        /// <param name="detailsPath"></param>
        /// <param name="generatedPath"></param>
        /// <param name="database"></param>
        /// <param name="?"></param>
        public void GenerateClassBatch(string systemNamespace,
                                    string editFilesPath,
                                    string lessEditFilesPath,
                                    string noEditFilesPath,
                                    bool overWrite,
                                    string spXMLFilePath) {

            XDocument xdoc = XDocument.Load(spXMLFilePath);            
            XElement spElement = xdoc.Root.Element(XML_ELEMENT_SP);

            //Check to see if the stored procedure has fields, parameters, or both
            XElement fieldListElement = spElement.Element(XML_ELEMENT_FIELD_LIST);
            XElement parameterListElement = spElement.Element(XML_ELEMENT_PARAMETER_LIST);
            bool hasFields = ((fieldListElement != null) && (fieldListElement.HasElements));
            bool hasParameters = ((parameterListElement != null) && (parameterListElement.HasElements));
           
            string rootNamespace = String.Concat(systemNamespace, ".", spElement.Attribute(FrameworkDriver.XML_ATTR_DATABASE).Value);

            MakeDomainBaseClass.Generate(rootNamespace, spElement, hasFields, noEditFilesPath); //Non-Editable (business)
            MakeDomainClass.Generate(rootNamespace, spElement, hasFields, hasParameters, overWrite, editFilesPath); //Editable (business)           

            MakeDomainDataBaseClass.Generate(systemNamespace, rootNamespace, spElement, hasFields, hasParameters, noEditFilesPath); //Non-Editable (data)
            MakeDomainDataClass.Generate(systemNamespace, rootNamespace, spElement, hasFields, hasParameters, overWrite, lessEditFilesPath); //Editable (data)

            if (hasParameters) {
                MakeDomainFieldsClass.Generate(rootNamespace, spElement, noEditFilesPath); //Non-Editable (data)
                MakeDomainParameterFactoryClass.Generate(rootNamespace, spElement, noEditFilesPath); //Non-Editable (data)
            }

            if (hasFields) {
                MakeDomainCollectionClass.Generate(systemNamespace, rootNamespace, spElement, noEditFilesPath, hasFields); //Non-Editable (business)
                MakeDomainRecordsetClass.Generate(rootNamespace, spElement, overWrite, lessEditFilesPath); //Editable (data)
                MakeDomainRecordsetBaseClass.Generate(rootNamespace, spElement, noEditFilesPath); //Non-Editable (data)
            }
        }

        public static string GetTemplate(string templateKey)
        {
            string templateName = "Textfyre.Common.Codegen.Framework.Templates.domain#key#.cs".Replace("#key#", templateKey);
            return LoadTemplate(templateName);
        }

        public static string GetStoredProcedureTemplate(string templateKey) {
            string templateName = "Textfyre.Common.Codegen.Framework.Templates.StoredProcedure.SP_#key#.cs";
            templateName = templateName.Replace("#key#", templateKey);
            return LoadTemplate(templateName);
        }

        public static void WriteToFile(string filePath, string name, string templateName, string content) {
            File.WriteAllText(string.Concat(filePath, @"\", name, templateName, ".cs"), content);
        }        

        public static void WriteToFile(string filePath, string name, string templateName, string content, bool overwrite) {
            if (File.Exists(string.Concat(filePath, @"\", name, templateName, ".cs"))) {
                if (!overwrite)
                    return;
            }

            WriteToFile(filePath, name, templateName, content);
        }

        private static string LoadTemplate(string templateName)
        {
            Assembly assembly = Assembly.GetCallingAssembly();
            Stream stream = assembly.GetManifestResourceStream(templateName);
            using (StreamReader reader = new StreamReader(stream))
            {
                return reader.ReadToEnd();
            }
        }

        //Method added 09/29/2008 to handle the case where parameter names to stored procedures conflict with reserved words.
        public static string ResolveParameterName(XElement parameterElement) {
            XElement nameElement = parameterElement.Element(XML_ELEMENT_NAME);

            string parameterName = nameElement.Value;
            XAttribute parameterAliasAttribute = nameElement.Attribute(XML_ATTR_PARAM_ALIAS);
            if (parameterAliasAttribute != null)
                parameterName = parameterAliasAttribute.Value;

            return parameterName;
        }
    }
}
