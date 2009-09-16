using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using Textfyre.Common.DataLayer;
using Textfyre.TextfyreWeb.BusinessLayer;

namespace Textfyre.TextfyreWeb.DataLayer {

    /// <summary>
    /// Original base data class where custom queries are implemented. This class
    /// is generated once and is not over-written by the code generation tool.
    /// </summary>
    [DataSource("TextfyreWeb", "TextfyreWebErrors"),Serializable()]
    public class DownloadData : Textfyre.TextfyreWeb.DataLayer.DownloadDataBase {
        /// <summary>
        /// Empty default constructor.
        /// </summary>
        public DownloadData() : base() {
        }

        public static DownloadCollection LoadByUserId(Guid UserId) {
            DownloadCollection returnDownloads = new DownloadCollection();
            List<SqlParameter> parameterList = new List<SqlParameter>();
            parameterList.Add(new SqlParameter("@UserId", UserId));
            DownloadData downloadData = new DownloadData();
            List<DownloadRecordset> downloads = downloadData.ExecuteQueryNameGetCollection("GetDownloadList", parameterList);
            foreach (DownloadRecordset download in downloads) {
                returnDownloads.Add(download.Clone());
            }
            return returnDownloads;
        }
    }
}