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

namespace Textfyre.UI.Current
{
    public static class Game
    {
        #region :: StoryHandle ::
        private static StoryHandle _storyHandle;
        public static StoryHandle StoryHandle
        {
            get
            {
                return _storyHandle;
            }

            set
            {
                _storyHandle = value;
            }
        }

        #endregion

        #region :: GameFileName ::
        private static string _gameFileName;
        public static string GameFileName
        {
            get
            {
                return _gameFileName;

                //System.Resources.ResourceManager rm = Resource.ResourceManager;

                //System.Globalization.CultureInfo ci = System.Globalization.CultureInfo.CurrentCulture;

                //System.Resources.ResourceSet rs =
                //    rm.GetResourceSet(ci, true, true);

                //foreach (DictionaryEntry entry in rs)
                //{
                //    if (entry.Key is string)
                //    {
                //        string key = entry.Key.ToString();
                //        if (key.StartsWith("output"))
                //            return key;
                //    }
                //}

                //return String.Empty;
            }

            set
            {
                _gameFileName = value;
            }
        }
        #endregion

        #region :: IsInputFocusActive ::
        private static bool _isInputFocusActive = true;
        public static bool IsInputFocusActive
        {
            get
            {
                return _isInputFocusActive;
            }

            set
            {
                _isInputFocusActive = value;
            }
        }
        #endregion

        #region :: LeftPageIndex & RightPageIndex ::
        private static int _leftPageIndex;
        public static int LeftPageIndex
        {
            get
            {
                return _leftPageIndex;
            }
            set
            {
                _leftPageIndex = value;
            }
        }
        private static int _rightPageIndex;
        public static int RightPageIndex
        {
            get
            {
                return _rightPageIndex;
            }
            set
            {
                _rightPageIndex = value;
            }
        }
        #endregion

        #region :: TextfyreBook ::
        private static Controls.TextfyreBook _textfyreBook;
        public static Controls.TextfyreBook TextfyreBook
        {
            get
            {
                return _textfyreBook;
            }
            set
            {
                _textfyreBook = value;
            }
        }
        #endregion

        #region :: Location ::
        private static string _locaton = String.Empty;
        public static string Location
        {
            get
            {
                return _locaton;
            }
            set
            {
                _locaton = value;
            }
        }
        #endregion

        #region :: Chapter ::
        private static string _chapter = String.Empty;
        public static string Chapter
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

        #region :: StoryReady && IsStoryReady ::
        public static event EventHandler StoryReady;
        private static bool _isStoryReady = false;
        public static bool IsStoryReady
        {
            get
            {
                return _isStoryReady;
            }
            set
            {
                if (value == true && _isStoryReady == false)
                {
                    _isStoryReady = true;
                    if (StoryReady != null)
                    {
                        StoryReady(TextfyreBook, new EventArgs());
                    }
                }
                else
                    _isStoryReady = value;
            }
        }
        #endregion

        #region :: IsEngineRunning ::
        private static bool _isEngineRunning = false;
        public static bool IsEngineRunning
        {
            get
            {
                return _isEngineRunning;
            }
            set
            {
                _isEngineRunning = value;
            }
        }
        #endregion

        #region :: IsStoryRunning ::
        private static bool _isStoryRunning = false;
        public static bool IsStoryRunning
        {
            get
            {
                return _isStoryRunning;
            }
            set
            {
                _isStoryRunning = value;
            }
        }
        #endregion

        #region :: MaxPageIndex ::
        private static int _maxPageIndex = -1;
        public static int MaxPageIndex
        {
            get
            {
                return _maxPageIndex;
            }
            set
            {
                _maxPageIndex = value;
            }
        }
        #endregion

        #region :: CanPageFlipForward ::
        public static bool CanPageFlipForward
        {
            get
            {
                return RightPageIndex < MaxPageIndex;
            }
        }
        #endregion

        #region :: Turn ::
        private static int _turn;
        public static int Turn
        {
            get
            {
                return _turn;
            }
            set
            {
                _turn = value;
            }
        }
        #endregion

        #region :: LastCommand ::
        private static string _lastCommand = String.Empty;
        public static string LastCommand
        {
            get
            {
                return _lastCommand;
            }
            set
            {
                _lastCommand = value;
            }
        }
        #endregion



        #region :: IsStoryChanged ::
        private static bool _isStoryChanged = false;
        public static bool IsStoryChanged
        {
            get
            {
                return _isStoryChanged;
            }

            set
            {
                _isStoryChanged = value;
            }
        }
        #endregion

        #region :: GameMode ::
        private static GameModes _gameMode = GameModes.Story;
        public static GameModes GameMode
        {
            get
            {
                return _gameMode;
            }

            set
            {
                _gameMode = value;
            }
        }
        #endregion

    }
}
