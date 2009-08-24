/*
 *  DO NOT EDIT THIS CLASS.
 * 
 *  This class is generated by a tool and should not be edited. If you need to change the functionality of 
 *  this class, you should discuss your changes with the team and they should be implemented in the
 *  appropriate template.
 *  
 */
using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using Textfyre.Common.BusinessLayer;

namespace Textfyre.TextfyreWeb.BusinessLayer {

    /// <summary>
    /// Collection class for RawData domain class.
    /// </summary>
    [Serializable()]
    public class RawDataCollection : List<Textfyre.TextfyreWeb.BusinessLayer.RawData> {
        /// <summary>
        /// Flag identifies when collection has been modified (updated record, added record, deleted record).
        /// </summary>
        private bool _isCollectionDirty;
        /// <summary>
        /// Public property for _isCollectionDirty.
        /// </summary>
        public bool IsCollectionDirty { get { return _isCollectionDirty; } set { _isCollectionDirty = value; } }

        /// <summary>
        /// Add method to add a new record to the collection by passing a domain object.
        /// </summary>
        new public void Add(Textfyre.TextfyreWeb.BusinessLayer.RawData RawData) {
            base.Add(RawData);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Add method to add a new record to the collection by passing a recordset.
        /// </summary>
        public void Add(Textfyre.TextfyreWeb.BusinessLayer.RawDataRecordset recordset) {
            this.Add(new RawData(recordset));
        }

        /// <summary>
        /// Remove method to remove a record from the collection by passing a domain object.
        /// </summary>
        new public void Remove(Textfyre.TextfyreWeb.BusinessLayer.RawData RawData) {
            base.Remove(RawData);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Fill a recordset with cloned objects from internal recordset.
        /// </summary>
        public void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.RawDataRecordset> RawDataRecs) {
            this.Clear();            
            foreach (Textfyre.TextfyreWeb.BusinessLayer.RawDataRecordset rec in RawDataRecs)
                Add((Textfyre.TextfyreWeb.BusinessLayer.RawDataRecordset)rec.Clone());
        }

        public void Sort(Textfyre.TextfyreWeb.DataLayer.RawDataFields sortField, SortDirection sortDirection)
        {
            switch (sortField)
            {
				case DataLayer.RawDataFields.RawDataId:
					if (sortDirection == SortDirection.Descending)
						Sort(RawData.SortBy.RawDataIdColumnDESC);
					else
						Sort(RawData.SortBy.RawDataIdColumnASC);
					break;
				case DataLayer.RawDataFields.RawData:
					if (sortDirection == SortDirection.Descending)
						Sort(RawData.SortBy.RawDataColumnDESC);
					else
						Sort(RawData.SortBy.RawDataColumnASC);
					break;

            }
        }

        public int PageCount(int pageSize)
        {
            int pageCount = this.Count / pageSize;
            if ((int)(this.Count / pageSize * pageSize) == this.Count)
                return pageCount;
            else
                return pageCount + 1;
        }

        public List<Textfyre.TextfyreWeb.BusinessLayer.RawData> GetPage(int pageSize, int pageNumber)
        {
            int beginIndex = ((pageNumber - 1) * pageSize); // start at 0 so pages are offset -1
            int endIndex = beginIndex + pageSize - 1;

            List<Textfyre.TextfyreWeb.BusinessLayer.RawData> returnCollection = new List<Textfyre.TextfyreWeb.BusinessLayer.RawData>();

            for (int row = beginIndex; row < endIndex; row++)
            {
                returnCollection.Add(this[row]);
            }

            return returnCollection;
        }
    }

}
