using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Textfyre.Common.Utilities;
using System.Xml.Linq;

namespace Textfyre.Common.Codegen.Framework
{
    public class MakeDomainParamsClass
    {
        private const string TEMPLATE_NAME = "Params";

        #region SP generation
        public static void Generate(string rootNamespace, XElement spElement, string saveFilePath) {
            string template = FrameworkDriver.GetStoredProcedureTemplate(TEMPLATE_NAME);
            string spName = spElement.Attribute(FrameworkDriver.XML_ATTR_NAME).Value;

            template = template.Replace(FrameworkDriver.PH_ROOT_NAMESPACE, rootNamespace);
            template = template.Replace(FrameworkDriver.PH_SP_NAME, spName);
            template = template.Replace(FrameworkDriver.PH_DATE, DateTime.Now.ToShortDateString());
            string name = null;

            XElement parameters = spElement.Element(FrameworkDriver.XML_ELEMENT_PARAMETER_LIST);
            StringBuilder sbParams = new StringBuilder();

            //Parameters
            foreach (XElement parameter in parameters.Elements()) {
                name = FrameworkDriver.ResolveParameterName(parameter);

                sbParams.Append(Environment.NewLine);
                sbParams.Append("\t\t");
                sbParams.Append(name);
                sbParams.Append(",");                
            }
            sbParams.Remove(sbParams.Length - 1, 1); //Remove trailing comma

            template = template.Replace(FrameworkDriver.PH_ENUM_PARAMS, sbParams.ToString());            
            FrameworkDriver.WriteToFile(saveFilePath, spName, TEMPLATE_NAME, template);
        }
        #endregion
    }
}
