using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IAAI.Common.WebControls {
    public class CustomValidatorControlForCheckBox : System.Web.UI.WebControls.BaseValidator {
        private CheckBoxControl _targetCheckbox = null;
        protected CheckBoxControl CheckBoxControlToValidate {
            get {
                if (_targetCheckbox == null)
                    _targetCheckbox = FindControl(this.ControlToValidate) as CheckBoxControl;

                return _targetCheckbox;
            }

        }
        public CustomValidatorControlForCheckBox() {
            base.EnableClientScript = false;
        }
       
        protected override bool ControlPropertiesValid() {
            if (this.ControlToValidate.Length == 0)
                throw new System.Web.HttpException();

            if (CheckBoxControlToValidate == null)
                throw new System.Web.HttpException();

            return true;   
        }

        protected override bool EvaluateIsValid() {
            return CheckBoxControlToValidate.Checked == true;
        }
    }
}



    
