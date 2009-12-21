using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

namespace Textfyre.Common.WebControls {

    public class CheckBoxControl : CheckBox {

        #region Constants
        private const string ON = "on";
        #endregion

        #region Protected Interface
        protected override void OnInit(EventArgs e) {
 	        base.OnInit(e);
            Page.RegisterRequiresControlState(this);
        }

        /// <summary>
        /// Save the currently selected index to control state
        /// </summary>
        /// <returns>A state object</returns>
        protected override object SaveControlState() {
            return this.Checked;
        }

        /// <summary>
        /// Restore the currently selected index from control state.
        /// </summary>
        /// <param name="savedState">The state saved in SaveControlState</param>
        protected override void LoadControlState(object savedState) {

            if (savedState != null) {
                this.Checked = (bool)savedState;
            }

        }

        /// <summary>
        /// Utilize the postDataKey to index into the postColl and determine if the state of this control has changed.
        /// </summary>
        /// <param name="postDataKey">A string key</param>
        /// <param name="postColl">A name/value collection</param>
        /// <returns></returns>
        protected override bool LoadPostData(string postDataKey, NameValueCollection postColl) {

            string postedValue;

            // Get the posted value for the HTML element with the 
            // same ID as the control		
            postedValue = postColl[postDataKey];

            // If user unchecked the checkbox, return true
            if (this.Checked && String.IsNullOrEmpty(postedValue)) {
                this.Checked = false;
                return true;
            }

            // If user checked the checkbox, return true
            if (!this.Checked && (postedValue == ON)) {
                this.Checked = true;
                return true;
            }

            return false;
        }


        /// <summary>
        /// This method is called if LoadPostData returns true.
        /// </summary>
        protected override void RaisePostDataChangedEvent() {
            OnCheckedChanged(EventArgs.Empty);
        }
        #endregion
    }
}
