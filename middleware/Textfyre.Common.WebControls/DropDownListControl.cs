using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

namespace IAAI.Common.WebControls {

    public class DropDownListControl : DropDownList  {

        #region Protected Interface
        protected override void  OnInit(EventArgs e) {
 	        base.OnInit(e);
            Page.RegisterRequiresControlState(this);
        }

        /// <summary>
        /// Save the currently selected index to control state
        /// </summary>
        /// <returns>A state object</returns>
        protected override object SaveControlState() {
            object obj = base.SaveControlState();

            if (obj != null) {
                if(this.Items != null)
                    obj = new Pair(obj, this.SelectedIndex);
            } else {
                obj = this.SelectedIndex;
            } 

            return obj;
        }

        /// <summary>
        /// Restore the currently selected index from control state.
        /// </summary>
        /// <param name="savedState">The state saved in SaveControlState</param>
        protected override void LoadControlState(object savedState) {

            if (savedState != null) {

                Pair p = savedState as Pair;
                if (p != null) {
                    base.LoadControlState(p.First);
                    this.SelectedIndex = (int)p.Second; //Assumes data is already populated in the ddl
                } else {
                    this.SelectedIndex = (int)savedState;                    
                }

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

            // Compare the posted value with SelectedValue and updates if needed
            if(postedValue != null) {
                if (this.SelectedValue != postedValue) {
                    this.SelectedValue = postedValue;
                    return true;
                }
            }

            return false;
        }
        

        /// <summary>
        /// This method is called if LoadPostData returns true.
        /// </summary>
        protected override void RaisePostDataChangedEvent(){
            OnSelectedIndexChanged(EventArgs.Empty);
        }

        #endregion

    }
}
       
