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

namespace Textfyre.UI.Storage
{
    public static class Settings
    {
        private const string SettingFileName = "SecretLetterSettings";

        #region :: Get, Set ::
        public static string Get(string key)
        {
            SettingsInit();

            if (_storageSetting.ContainsKey(key) == false)
                return String.Empty;

            return _storageSetting[key];
        }

        public static bool GetBoolean(string key, bool defaultValue)
        {
            string val = Get(key);
            if (val.Length == 0)
                return defaultValue;

            if (val == "1")
                return true;

            return false;

        }

        public static bool GetBoolean(string key)
        {
            return GetBoolean(key, false);
        }

        public static void Set(string key, bool value)
        {
            if (value)
                Set(key, "1");
            else
                Set(key, "0");
        }

        public static void Set(string key, string value)
        {
            SettingsInit();

            if (_storageSetting.ContainsKey(key) == false)
                _storageSetting.Add(key, value);
            else
            {
                _storageSetting[key] = value;
            }
            WriteStorageSetting();
        }
        #endregion

        #region :: Private Methods ::
        private static System.Collections.Generic.Dictionary<string, string> _storageSetting;
        private static void SettingsInit()
        {
            if (_storageSetting == null)
            {
                _storageSetting = new System.Collections.Generic.Dictionary<string, string>();
                string setFile = Storage.StorageHandler.ReadTextFile(SettingFileName);
                string[] sets = setFile.Split('#');
                foreach (string set in sets)
                {
                    string[] oneSet = set.Split('=');
                    if (oneSet.Length == 2 && oneSet[0].Trim().Length > 0)
                    {
                        _storageSetting.Add(oneSet[0].Trim(), oneSet[1]);
                    }
                }
            }
        }

        private static void WriteStorageSetting()
        {
            string data = String.Empty;
            foreach (string key in _storageSetting.Keys)
            {
                data += key + "=" + _storageSetting[key] + "#";
            }
            Storage.StorageHandler.WriteTextFile(SettingFileName, data);
        }
        #endregion
    }
}
