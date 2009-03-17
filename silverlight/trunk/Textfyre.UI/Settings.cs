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
using System.Xml.Linq;
using System.Linq;
using System.Reflection;

namespace Textfyre.UI
{
    public class Settings
    {
        public static string BackgroundColor = String.Empty;
        public static double BookWidth = 0;
        public static double BookPageWidth = 0;
        public static double BookPageHeight = 0;
        public static double BookPageOffsetLeft = 0;
        public static double BookPageOffsetTop = 0;
        public static double BookPageInnerContentWidth = 0;
        public static double BookPageInnerContentHeight = 0;
        public static double BookPageInnerContentOffsetLeft = 0;
        public static double BookPageInnerContentOffsetTop = 0;
        public static string VersionText = "10-Dec-2008";
        public static bool LogEnabled = true;
        public static int StoryID = 1;
        public static bool UseIndents = true;
        public static bool UseNewLineAfterParagraph = false;
        public static double ScrollSpeed = 50d;
        public static bool AutoOpenBookCover = true;
        public static double PageGripSize = 40d;
        public static string TOCs = String.Empty;
        public static bool ResizingEnabled = true;
        public static int PrologueNewLines = 0;
        public static PagingMechanismType PagingMechanism = PagingMechanismType.StaticPageCreateBackPages;
        public static string WaitMessages = String.Empty;
        public static bool CenterHeadline = true;

        // Calculated from the other settings
        public static double BookPageInnerInnerContentWidth = 0;
        public static double BookPageInnerInnerContentHeight = 0;

        public enum PagingMechanismType
        {
            StaticPageCreateBackPages,
            CreateNewPages
        }

        public static void Init()
        {
            XDocument x = XDocument.Load(Current.Application.GetResPath("GameFiles/Settings.xml"));

            var settings = from setting in x.Descendants("Setting") select setting;

            foreach (var setting in settings)
            {
                string key = setting.Attribute("Key").Value;
                string value = setting.Attribute("Value").Value;

                FieldInfo fi = typeof(Settings).GetField(key);

                if (fi.FieldType == typeof(int))
                {
                    Settings set = new Settings();
                    fi.SetValue(set, int.Parse(value));
                }
                else if (fi.FieldType == typeof(double))
                {
                    Settings set = new Settings();
                    fi.SetValue(set, double.Parse(value));
                }
                else if (fi.FieldType == typeof(bool))
                {
                    Settings set = new Settings();
                    fi.SetValue(set, bool.Parse(value));
                }
                else if (fi.FieldType == typeof(string))
                {
                    Settings set = new Settings();
                    fi.SetValue(set, value);
                }
                else if (fi.FieldType == typeof(PagingMechanismType))
                {
                    Settings set = new Settings();
                    fi.SetValue( set, Enum.Parse( typeof(PagingMechanismType), value, true ) );
                }


            }

            // Calculated from the other settings
            BookPageInnerInnerContentWidth = BookPageInnerContentWidth - 35d;
            BookPageInnerInnerContentHeight = BookPageInnerContentHeight - 35d;

        }
    }
}
