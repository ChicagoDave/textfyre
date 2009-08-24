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
    /// Collection class for Download domain class.
    /// </summary>
    [Serializable()]
    public class DownloadCollection : List<Textfyre.TextfyreWeb.BusinessLayer.Download> {
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
        new public void Add(Textfyre.TextfyreWeb.BusinessLayer.Download Download) {
            base.Add(Download);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Add method to add a new record to the collection by passing a recordset.
        /// </summary>
        public void Add(Textfyre.TextfyreWeb.BusinessLayer.DownloadRecordset recordset) {
            this.Add(new Download(recordset));
        }

        /// <summary>
        /// Remove method to remove a record from the collection by passing a domain object.
        /// </summary>
        new public void Remove(Textfyre.TextfyreWeb.BusinessLayer.Download Download) {
            base.Remove(Download);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Fill a recordset with cloned objects from internal recordset.
        /// </summary>
        public void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.DownloadRecordset> DownloadRecs) {
            this.Clear();            
            foreach (Textfyre.TextfyreWeb.BusinessLayer.DownloadRecordset rec in DownloadRecs)
                Add((Textfyre.TextfyreWeb.BusinessLayer.DownloadRecordset)rec.Clone());
        }

        public void Sort(Textfyre.TextfyreWeb.DataLayer.DownloadFields sortField, SortDirection sortDirection)
        {
            switch (sortField)
            {
				case DataLayer.DownloadFields.DownloadId:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.DownloadIdColumnDESC);
					else
						Sort(Download.SortBy.DownloadIdColumnASC);
					break;
				case DataLayer.DownloadFields.ItemNumber:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.ItemNumberColumnDESC);
					else
						Sort(Download.SortBy.ItemNumberColumnASC);
					break;
				case DataLayer.DownloadFields.ItemDescription:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.ItemDescriptionColumnDESC);
					else
						Sort(Download.SortBy.ItemDescriptionColumnASC);
					break;
				case DataLayer.DownloadFields.Version:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.VersionColumnDESC);
					else
						Sort(Download.SortBy.VersionColumnASC);
					break;
				case DataLayer.DownloadFields.AvailableDate:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.AvailableDateColumnDESC);
					else
						Sort(Download.SortBy.AvailableDateColumnASC);
					break;
				case DataLayer.DownloadFields.IsLocked:
					if (sortDirection == SortDirection.Descending)
						Sort(Download.SortBy.IsLockedColumnDESC);
					else
						Sort(Download.SortBy.IsLockedColumnASC);
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

        public List<Textfyre.TextfyreWeb.BusinessLayer.Download> GetPage(int pageSize, int pageNumber)
        {
            int beginIndex = ((pageNumber - 1) * pageSize); // start at 0 so pages are offset -1
            int endIndex = beginIndex + pageSize - 1;

            List<Textfyre.TextfyreWeb.BusinessLayer.Download> returnCollection = new List<Textfyre.TextfyreWeb.BusinessLayer.Download>();

            for (int row = beginIndex; row < endIndex; row++)
            {
                returnCollection.Add(this[row]);
            }

            return returnCollection;
        }
    }

}
