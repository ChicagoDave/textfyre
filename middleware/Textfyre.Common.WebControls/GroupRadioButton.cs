using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
using System.Text.RegularExpressions;

namespace Textfyre.Common.WebControls {

    public class GroupRadioButton : RadioButton {

        private const string DEFAULT_GROUP_NAME = "Group1";

        protected override bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection) {
            string postKey = (string.IsNullOrEmpty(this.GroupName)) ? DEFAULT_GROUP_NAME : this.GroupName;
            string postedValue = postCollection[postKey];

            if (!string.IsNullOrEmpty(postedValue) && (this.UniqueID == postedValue)) {
                this.Checked = true;
                return true;
            }

            return false;
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer) {
            //Store rendered content in a temporary stream
            HtmlTextWriter tempWriter = new HtmlTextWriter(new StringWriter());
            base.Render(tempWriter);
            
            //Get the actual rendered string (as rendered by base class)
            string adjustedRender = tempWriter.InnerWriter.ToString();

            //Adjust the rendered string to have the same group name            
            adjustedRender = Regex.Replace(adjustedRender, "name=\"[$a-zA-Z0-9]*\"",
                                           string.Concat("name=", "\"", string.IsNullOrEmpty(this.GroupName) ? DEFAULT_GROUP_NAME : this.GroupName, "\""));
           
            //Adjust the rendered string to have a unique value
            adjustedRender = Regex.Replace(adjustedRender, "value=\"[a-zA-Z]*\"",
                                           string.Concat("value=", "\"", this.UniqueID, "\""));

            //Use the passed in HtmlTextWriter instance to write out the adjusted string
            writer.Write(adjustedRender);
        } 
       
    }

}
