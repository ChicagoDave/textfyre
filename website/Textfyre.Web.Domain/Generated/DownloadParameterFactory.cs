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
using System.Data.SqlClient;

namespace Textfyre.TextfyreWeb.DataLayer { 
    /// <summary>
    /// Factory class that auto-builds SqlParameters.
    /// </summary>
    [Serializable()]
    public class DownloadParameterFactory {
        /// <summary>
        /// GetParameter method returns a SqlParameter.
        /// </summary>
        public SqlParameter GetParameter(Textfyre.TextfyreWeb.DataLayer.DownloadFields FieldIdentity, object FieldValue) { 
            SqlParameter param = null;
            switch (FieldIdentity) {
				case DownloadFields.DownloadId:
					param = new SqlParameter("@DownloadId", SqlDbType.Int);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = false;
					param.SourceColumn = "DownloadId";
					break;
				case DownloadFields.ProductId:
					param = new SqlParameter("@ProductId", SqlDbType.Int);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "ProductId";
					break;
				case DownloadFields.PlatformId:
					param = new SqlParameter("@PlatformId", SqlDbType.Int);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "PlatformId";
					break;
				case DownloadFields.Version:
					param = new SqlParameter("@Version", SqlDbType.NVarChar, 10);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "Version";
					break;
				case DownloadFields.AvailableDate:
					param = new SqlParameter("@AvailableDate", SqlDbType.DateTime);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "AvailableDate";
					break;
				case DownloadFields.IsLocked:
					param = new SqlParameter("@IsLocked", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "IsLocked";
					break;
				case DownloadFields.IntelMac:
					param = new SqlParameter("@IntelMac", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "IntelMac";
					break;
				case DownloadFields.PowerPCMac:
					param = new SqlParameter("@PowerPCMac", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "PowerPCMac";
					break;
				case DownloadFields.WindowsXP:
					param = new SqlParameter("@WindowsXP", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "WindowsXP";
					break;
				case DownloadFields.WindowsVista:
					param = new SqlParameter("@WindowsVista", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "WindowsVista";
					break;
				case DownloadFields.Windows7:
					param = new SqlParameter("@Windows7", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "Windows7";
					break;
				case DownloadFields.Linux:
					param = new SqlParameter("@Linux", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "Linux";
					break;
				case DownloadFields.Unix:
					param = new SqlParameter("@Unix", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "Unix";
					break;
				case DownloadFields.WindowsMobile:
					param = new SqlParameter("@WindowsMobile", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "WindowsMobile";
					break;
				case DownloadFields.iPhone:
					param = new SqlParameter("@iPhone", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "iPhone";
					break;
				case DownloadFields.ScreenReader:
					param = new SqlParameter("@ScreenReader", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "ScreenReader";
					break;
				case DownloadFields.RequiresSilverlight:
					param = new SqlParameter("@RequiresSilverlight", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "RequiresSilverlight";
					break;
				case DownloadFields.RequiresFlash:
					param = new SqlParameter("@RequiresFlash", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "RequiresFlash";
					break;
				case DownloadFields.RequiresDotNet:
					param = new SqlParameter("@RequiresDotNet", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "RequiresDotNet";
					break;
				case DownloadFields.DotNetVersion:
					param = new SqlParameter("@DotNetVersion", SqlDbType.Char, 10);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "DotNetVersion";
					break;
				case DownloadFields.RequiresMono:
					param = new SqlParameter("@RequiresMono", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "RequiresMono";
					break;
				case DownloadFields.RequiresMoonlight:
					param = new SqlParameter("@RequiresMoonlight", SqlDbType.Bit);
					param.Value = FieldValue;
					param.Direction = ParameterDirection.Input;
					param.IsNullable = true;
					param.SourceColumn = "RequiresMoonlight";
					break;
            }

            if(param == null)
                throw new Exception("Unknown parameter identifier.");

            return param;
        }
    }
}