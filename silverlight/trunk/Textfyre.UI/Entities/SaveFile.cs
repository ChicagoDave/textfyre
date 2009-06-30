using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO;
using System.Text;
using System.IO.IsolatedStorage;
using System.Collections.Generic;
using System.Windows.Threading;

namespace Textfyre.UI.Entities
{
    public class SaveFile
    {
        #region :: Title ::
        private string _title;
        public string Title {
            get {
                return _title;
            }
            set {
                _title = value;
            }
        }
        #endregion

        #region :: Description ::
        private string _description;
        public string Description {
            get {
                return _description;
            }
            set {
                _description = value;
            }
        }
        #endregion

        #region :: SaveTime ::
        public DateTime _saveTime;
		public DateTime SaveTime {
			get {
                return _saveTime;
			}
			set {
                _saveTime = value;
			}
        }
        #endregion

        #region :: Filename ::
        private string _filename = string.Empty; 
        public string Filename
        {
            get
            {
                return _filename;
            }
            set
            {
                _filename = value;
            }
        }
        #endregion

        #region :: GameFileVersion ::
        private string _gameFileVersion = String.Empty;
        public string GameFileVersion
        {
            get
            {
                return _gameFileVersion;
            }
            set
            {
                _gameFileVersion = value;
            }
        }
        #endregion

        #region :: FyreXml ::
        private string _fyreXml = String.Empty;
        public string FyreXml
        {
            get
            {
                return _fyreXml;
            }
            set
            {
                _fyreXml = value;
            }
        }
        #endregion

        #region :: Transcript ::
        //[System.Xml.Serialization.XmlIgnore()]
        private string _transcript = String.Empty;
        public string Transcript
        {
            get
            {
                return _transcript;
            }
            set
            {
                _transcript = value;
            }
        }




        #endregion

        #region :: Chapter ::
        private string _chapter = String.Empty;
        public string Chapter
        {
            get
            {
                return _chapter;
            }
            set
            {
                _chapter = value;
            }
        }
        #endregion

        #region :: Theme ::
        private string _theme = String.Empty;
        public string Theme
        {
            get
            {
                return _theme;
            }
            set
            {
                _theme = value;
            }
        }
        #endregion

        #region :: StoryTitle ::
        private string _storyTitle = String.Empty;
        public string StoryTitle
        {
            get
            {
                return _storyTitle;
            }
            set
            {
                _storyTitle = value;
            }
        }
        #endregion

        #region :: Hints ::
        private string _hints = String.Empty;
        public string Hints
        {
            get
            {
                return _hints;
            }
            set
            {
                _hints = value;
            }
        }
        #endregion

        public void Delete()
        {
            if (_filename.Length == 0)
                return;

            IsolatedStorageFile isoFile = IsoFile;
            string filepath = _dir + @"\" + _filename;

            if (isoFile.FileExists(filepath + ".fvt"))
                isoFile.DeleteFile(filepath + ".fvt");

            if (isoFile.FileExists(filepath + ".fvq"))
                isoFile.DeleteFile(filepath + ".fvq");
            
        }

        /// <summary>
        /// Returns filepath to store binary story file.
        /// </summary>
        /// <returns></returns>
        public string Save()
        {

            if (_filename.Length == 0)
            {
                _filename = FindFilename();
            }
            
            Init();
            string filepath = _dir + @"\" + _filename;

            using (IsolatedStorageFile isoFile = IsoFile)
            {
                using (IsolatedStorageFileStream stream =
                new IsolatedStorageFileStream( filepath + ".fvt", FileMode.Create, isoFile))
                {
                    using (StreamWriter writer = new StreamWriter(stream))
                    {
                        writer.Write( Serialize(this) );
                    }
                }
            }

            return filepath + ".fvq";

        }

        private string FindFilename()
        {
            List<SaveFile> sfs = SaveFiles;

            foreach (SaveFile sf in sfs)
            {
                if (sf.Title == _title && sf.Filename.Length > 0)
                    return sf.Filename;
            }

            return Guid.NewGuid().ToString() + Current.Game.GameFileName;
        }

        public string BinaryStoryFilePath
        {
            get
            {
                return _dir + @"\" + _filename + ".fvq";
            }
        }

        public static int SaveFilesCount
        {
            get
            {
                IsolatedStorageFile iso = IsoFile;

                if (iso.DirectoryExists(_dir) == false)
                    return 0;

                string[] files = iso.GetFileNames(_dir + @"\*" + Current.Game.GameFileName + ".fvt");
                return files.Length;
            }
        }

        public static void DeleteOldSaveFiles()
        {
            string currentGameFileName = Current.Game.GameFileName;
            List<SaveFile> files = SaveFiles;
            foreach (SaveFile file in files)
            {
                if (file.GameFileVersion != currentGameFileName)
                {
                    file.Delete();
                }
            }
        }
        
        public static List<SaveFile> SaveFiles
        {
            get
            {
                List<SaveFile> saveFiles = new List<SaveFile>();
                IsolatedStorageFile iso = IsoFile;

                if (iso.DirectoryExists(_dir) == false)
                    return saveFiles;

                string[] files = iso.GetFileNames(_dir + @"\*" + Current.Game.GameFileName + ".fvt");
                foreach (string file in files)
                {
                    using (IsolatedStorageFile isoFile = IsoFile)
                    {
                        using (IsolatedStorageFileStream stream =
                        new IsolatedStorageFileStream(_dir + @"\" +file, FileMode.Open, isoFile))
                        {
                            using (StreamReader reader = new StreamReader(stream))
                            {
                                string js = reader.ReadToEnd();
                                SaveFile sf = SaveFile.Deserialize(js);
                                saveFiles.Add(sf);
                            }
                        }
                    }
                }

                return saveFiles;
            }
        }

        public static string Serialize( SaveFile saveFile)
        {
            //System.Runtime.Serialization.DataContractSerializer
            //    serializer = new System.Runtime.Serialization.DataContractSerializer(saveFile.GetType());
            //MemoryStream ms = new MemoryStream();
            //serializer.WriteObject(ms, saveFile);
            //string json = Encoding.Unicode.GetString(ms.ToArray(), 0, (int)ms.Length);

            //return json;

            System.Text.StringBuilder sb = new StringBuilder();
            sb.Append(ToParam(saveFile.Filename) + "|");
            sb.Append(ToParam(saveFile.Title) + "|");
            sb.Append(ToParam(saveFile.Description) + "|");
            sb.Append(ToParam(saveFile.SaveTime.ToString()) + "|");
            sb.Append(ToParam(saveFile.GameFileVersion.ToString()) + "|");
            sb.Append(ToParam(saveFile.FyreXml) + "|");
            sb.Append(ToParam(saveFile.Transcript) + "|");
            sb.Append(ToParam(saveFile.StoryTitle) + "|");
            sb.Append(ToParam(saveFile.Chapter) + "|");
            sb.Append(ToParam(saveFile.Theme) + "|");
            sb.Append(ToParam(saveFile.Hints) + "");


            return sb.ToString();
        }

        public static SaveFile Deserialize(string json)
        {
            //SaveFile saveFile = new SaveFile();
            //MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            //System.Runtime.Serialization.DataContractSerializer serializer = new System.Runtime.Serialization.DataContractSerializer(saveFile.GetType());
            //saveFile = serializer.ReadObject(ms) as SaveFile;
            //ms.Close();
            //return saveFile;

            SaveFile saveFile = new SaveFile();
            string[] parts = json.Split('|');
            if (parts.Length >= 4)
            {
                saveFile.Filename = FromParam(parts[0]);
                saveFile.Title = FromParam(parts[1]);
                saveFile.Description = FromParam(parts[2]);
                try
                {
                    saveFile.SaveTime = DateTime.Parse(FromParam(parts[3]));
                }
                catch
                {
                    saveFile.SaveTime = DateTime.Now;
                }
            }

            if (parts.Length >= 5)
            {
                saveFile.GameFileVersion = FromParam(parts[4]);
            }

            if (parts.Length >= 6)
            {
                saveFile.FyreXml = FromParam(parts[5]);
            }

            if (parts.Length >= 7)
            {
                saveFile.Transcript = FromParam(parts[6]);
            }

            if (parts.Length >= 8)
            {
                saveFile.StoryTitle = FromParam(parts[7]);
            }

            if (parts.Length >= 9)
            {
                saveFile.Chapter = FromParam(parts[8]);
            }

            if (parts.Length >= 10)
            {
                saveFile.Theme = FromParam(parts[9]);
            }

            if (parts.Length >= 11)
            {
                saveFile.Hints = FromParam(parts[10]);
            }

            return saveFile;
        }

        private static string ToParam(string value)
        {
            return value.Replace("|", "&#124;");
        }

        private static string FromParam(string value)
        {
            return value.Replace("&#124;", "|");
        }

        private static string _dir = Settings.SaveGameDirectory;
        
        public static System.IO.IsolatedStorage.IsolatedStorageFile IsoFile
        {
            get
            {
                return System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();
            }
        }
        
        public static long FreeSpace
        {
            get
            {             
                return IsoFile.AvailableFreeSpace;
            }
        }

        public static long TotalSpace
        {
            get
            {
                return IsoFile.Quota;
            }
        }

        private static void Init()
        {
            System.IO.IsolatedStorage.IsolatedStorageFile isoFile = IsoFile;

            if (isoFile.DirectoryExists(_dir) == false)
            {
                isoFile.CreateDirectory(_dir);
            }
        }



    }
}
