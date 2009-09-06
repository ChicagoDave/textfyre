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
    /// Collection class for Transaction domain class.
    /// </summary>
    [Serializable()]
    public class TransactionCollection : List<Textfyre.TextfyreWeb.BusinessLayer.Transaction> {
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
        new public void Add(Textfyre.TextfyreWeb.BusinessLayer.Transaction Transaction) {
            base.Add(Transaction);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Add method to add a new record to the collection by passing a recordset.
        /// </summary>
        public void Add(Textfyre.TextfyreWeb.BusinessLayer.TransactionRecordset recordset) {
            this.Add(new Transaction(recordset));
        }

        /// <summary>
        /// Remove method to remove a record from the collection by passing a domain object.
        /// </summary>
        new public void Remove(Textfyre.TextfyreWeb.BusinessLayer.Transaction Transaction) {
            base.Remove(Transaction);
            _isCollectionDirty = true;
        }

        /// <summary>
        /// Fill a recordset with cloned objects from internal recordset.
        /// </summary>
        public void Fill(List<Textfyre.TextfyreWeb.BusinessLayer.TransactionRecordset> TransactionRecs) {
            this.Clear();            
            foreach (Textfyre.TextfyreWeb.BusinessLayer.TransactionRecordset rec in TransactionRecs)
                Add((Textfyre.TextfyreWeb.BusinessLayer.TransactionRecordset)rec.Clone());
        }

        public void Sort(Textfyre.TextfyreWeb.DataLayer.TransactionFields sortField, SortDirection sortDirection)
        {
            switch (sortField)
            {
				case DataLayer.TransactionFields.TransactionId:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.TransactionIdColumnDESC);
					else
						Sort(Transaction.SortBy.TransactionIdColumnASC);
					break;
				case DataLayer.TransactionFields.PayerEmail:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.PayerEmailColumnDESC);
					else
						Sort(Transaction.SortBy.PayerEmailColumnASC);
					break;
				case DataLayer.TransactionFields.EJTransactionId:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.EJTransactionIdColumnDESC);
					else
						Sort(Transaction.SortBy.EJTransactionIdColumnASC);
					break;
				case DataLayer.TransactionFields.FirstName:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.FirstNameColumnDESC);
					else
						Sort(Transaction.SortBy.FirstNameColumnASC);
					break;
				case DataLayer.TransactionFields.LastName:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.LastNameColumnDESC);
					else
						Sort(Transaction.SortBy.LastNameColumnASC);
					break;
				case DataLayer.TransactionFields.MCGross:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.MCGrossColumnDESC);
					else
						Sort(Transaction.SortBy.MCGrossColumnASC);
					break;
				case DataLayer.TransactionFields.Shipping:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.ShippingColumnDESC);
					else
						Sort(Transaction.SortBy.ShippingColumnASC);
					break;
				case DataLayer.TransactionFields.Tax:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.TaxColumnDESC);
					else
						Sort(Transaction.SortBy.TaxColumnASC);
					break;
				case DataLayer.TransactionFields.InvoiceId:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.InvoiceIdColumnDESC);
					else
						Sort(Transaction.SortBy.InvoiceIdColumnASC);
					break;
				case DataLayer.TransactionFields.Street:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.StreetColumnDESC);
					else
						Sort(Transaction.SortBy.StreetColumnASC);
					break;
				case DataLayer.TransactionFields.City:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.CityColumnDESC);
					else
						Sort(Transaction.SortBy.CityColumnASC);
					break;
				case DataLayer.TransactionFields.State:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.StateColumnDESC);
					else
						Sort(Transaction.SortBy.StateColumnASC);
					break;
				case DataLayer.TransactionFields.ZipCode:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.ZipCodeColumnDESC);
					else
						Sort(Transaction.SortBy.ZipCodeColumnASC);
					break;
				case DataLayer.TransactionFields.CountryCode:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.CountryCodeColumnDESC);
					else
						Sort(Transaction.SortBy.CountryCodeColumnASC);
					break;
				case DataLayer.TransactionFields.Phone:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.PhoneColumnDESC);
					else
						Sort(Transaction.SortBy.PhoneColumnASC);
					break;
				case DataLayer.TransactionFields.PayerPhone:
					if (sortDirection == SortDirection.Descending)
						Sort(Transaction.SortBy.PayerPhoneColumnDESC);
					else
						Sort(Transaction.SortBy.PayerPhoneColumnASC);
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

        public List<Textfyre.TextfyreWeb.BusinessLayer.Transaction> GetPage(int pageSize, int pageNumber)
        {
            int beginIndex = ((pageNumber - 1) * pageSize); // start at 0 so pages are offset -1
            int endIndex = beginIndex + pageSize - 1;

            List<Textfyre.TextfyreWeb.BusinessLayer.Transaction> returnCollection = new List<Textfyre.TextfyreWeb.BusinessLayer.Transaction>();

            for (int row = beginIndex; row < endIndex; row++)
            {
                returnCollection.Add(this[row]);
            }

            return returnCollection;
        }
    }

}