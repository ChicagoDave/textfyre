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
    /// Collection class for aspnet_Profile domain class.
    /// </summary>
    [Serializable()]
    public class aspnet_ProfileCollection : List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile> {
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
        new public void Add(Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile aspnet_Profile) {
            base.Add(aspnet_Profile);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Add method to add a new record to the collection by passing a recordset.
        /// </summary>
        public void Add(Textfyre.TextfyreWeb.BusinessLayer.aspnet_ProfileRecordset recordset) {
            this.Add(new aspnet_Profile(recordset));
        }

        /// <summary>
        /// Remove method to remove a record from the collection by passing a domain object.
        /// </summary>
        new public void Remove(Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile aspnet_Profile) {
            base.Remove(aspnet_Profile);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Fill a recordset with cloned objects from internal recordset.
        /// </summary>
        public void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_ProfileRecordset> aspnet_ProfileRecs) {
            this.Clear();            
            foreach (Textfyre.TextfyreWeb.BusinessLayer.aspnet_ProfileRecordset rec in aspnet_ProfileRecs)
                Add((Textfyre.TextfyreWeb.BusinessLayer.aspnet_ProfileRecordset)rec.Clone());
        }

        public void Sort(Textfyre.TextfyreWeb.DataLayer.aspnet_ProfileFields sortField, SortDirection sortDirection)
        {
            switch (sortField)
            {
				case DataLayer.aspnet_ProfileFields.UserId:
					if (sortDirection == SortDirection.Descending)
						Sort(aspnet_Profile.SortBy.UserIdColumnDESC);
					else
						Sort(aspnet_Profile.SortBy.UserIdColumnASC);
					break;
				case DataLayer.aspnet_ProfileFields.PropertyNames:
					if (sortDirection == SortDirection.Descending)
						Sort(aspnet_Profile.SortBy.PropertyNamesColumnDESC);
					else
						Sort(aspnet_Profile.SortBy.PropertyNamesColumnASC);
					break;
				case DataLayer.aspnet_ProfileFields.PropertyValuesString:
					if (sortDirection == SortDirection.Descending)
						Sort(aspnet_Profile.SortBy.PropertyValuesStringColumnDESC);
					else
						Sort(aspnet_Profile.SortBy.PropertyValuesStringColumnASC);
					break;
				case DataLayer.aspnet_ProfileFields.LastUpdatedDate:
					if (sortDirection == SortDirection.Descending)
						Sort(aspnet_Profile.SortBy.LastUpdatedDateColumnDESC);
					else
						Sort(aspnet_Profile.SortBy.LastUpdatedDateColumnASC);
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

        public List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile> GetPage(int pageSize, int pageNumber)
        {
            int beginIndex = ((pageNumber - 1) * pageSize); // start at 0 so pages are offset -1
            int endIndex = beginIndex + pageSize - 1;

            List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile> returnCollection = new List<Textfyre.TextfyreWeb.BusinessLayer.aspnet_Profile>();

            for (int row = beginIndex; row < endIndex; row++)
            {
                returnCollection.Add(this[row]);
            }

            return returnCollection;
        }
    }

}
