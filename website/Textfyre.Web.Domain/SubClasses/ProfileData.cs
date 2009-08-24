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
    public class ProfileData : Textfyre.TextfyreWeb.DataLayer.ProfileDataBase {
        /// <summary>
        /// Empty default constructor.
        /// </summary>
        public ProfileData() : base() {
        }
    }
}