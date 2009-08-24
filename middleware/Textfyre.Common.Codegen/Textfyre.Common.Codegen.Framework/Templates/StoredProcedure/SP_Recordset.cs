using System;

namespace #rootNamespace#.BusinessLayer {

    [Serializable()]
    public class #spName#Recordset : #spName#RecordsetBase {
        public #spName#Recordset() {
        }

        public override #spName#Recordset Clone() { 
            #spName#Recordset new#spName#RS = new #spName#Recordset(); 
            #cloneSettings#
            new#spName#RS.IsDirty = _isDirty;
            return new#spName#RS; 
        } 
    }

}
