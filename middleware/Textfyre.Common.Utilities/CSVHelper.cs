using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace Textfyre.Common.Utilities {

    public class CSVHelper {

        #region Constants
        private const char COMMA = ',';
        private const char UNDERSCORE = '_';
        private const string CSV_EXTENSION = ".csv";
        private const string DATE_APPEND_FORMAT = "MMddyyyy";
        #endregion

        #region Public Interface
        public Func<List<string>> GetCSVHeaders;
        public Func<List<string>> GetCSVBody;
        public Func<List<string>> GetCSVFooters;

        public string BaseFileName {
            get;
            set;
        }

        public void GenerateCSV() {        
            HttpResponse currentResponse = HttpContext.Current.Response;
            currentResponse.ClearHeaders();
            currentResponse.Clear();
            currentResponse.ContentType = "application/excel";
            currentResponse.AppendHeader("Content-Disposition", "attachment; filename=" + GetFileName());

            WriteHeaders(currentResponse);
            WriteBody(currentResponse);
            WriteFooters(currentResponse);


            currentResponse.Flush();
            currentResponse.End();
        }
        #endregion

        #region Private Interface
        private void WriteHeaders(HttpResponse currentResponse) {            
            if (GetCSVHeaders != null) {                
                List<string> headers = GetCSVHeaders();

                if ((headers != null) && (headers.Count > 0)) {
                    for (int i = 0; i < headers.Count; i++) {
                        currentResponse.Write(headers[i]);

                        if (i != (headers.Count - 1))
                            currentResponse.Write(COMMA);
                    }                    
                }
            }
        }

        private void WriteBody(HttpResponse currentResponse) {
            if (GetCSVBody != null) {
                List<string> fields = null;

                while ((fields = GetCSVBody()) != null) {
                    if (fields.Count > 0) {
                        currentResponse.Write(Environment.NewLine);

                        //Updated 01/16/2009 - CD - Fix issue with certain body fields having commas in them
                        string currentField = string.Empty;
                        for (int i = 0; i < fields.Count; i++) {
                            currentField = fields[i];

                            if (!string.IsNullOrEmpty(currentField)) {
                                if (currentField.IndexOf(',') == -1) {
                                    currentResponse.Write(currentField);
                                } else {
                                    currentResponse.Write('"');
                                    currentResponse.Write(currentField);
                                    currentResponse.Write('"');
                                }
                            }

                            if (i != (fields.Count - 1)) {
                                currentResponse.Write(COMMA);
                            }
                        }
                    }
                }                
            }            
        }

        private void WriteFooters(HttpResponse currentResponse) {
            if (GetCSVFooters != null) {
                List<string> footers = GetCSVFooters();

                if ((footers != null) && (footers.Count > 0)) {
                    currentResponse.Write(Environment.NewLine);

                    for (int i = 0; i < footers.Count; i++) {
                        currentResponse.Write(footers[i]);

                        if (i != (footers.Count - 1))
                            currentResponse.Write(COMMA);
                    }
                }
            }
        }        

        private string GetFileName() {
            StringBuilder fileNameBuilder = new StringBuilder();
            fileNameBuilder.Append(BaseFileName);
            fileNameBuilder.Append(UNDERSCORE);
            fileNameBuilder.Append(DateTime.Today.ToString(DATE_APPEND_FORMAT));
            fileNameBuilder.Append(CSV_EXTENSION);
            return fileNameBuilder.ToString();
        }
        #endregion
    }

}
