using System;
using System.Collections.Generic;
using System.IO;
using System.IO.IsolatedStorage;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Textfyre.VM;

namespace Textfyre.UI.Pages
{
    public partial class Story : UserControl
    {
        private Engine _engine;
        private Thread _engineThread;
        private string _inputLine = null;
        private AutoResetEvent inputReadyEvent = new AutoResetEvent(false);

        private DateTime _commandStartTime;
        private TimeSpan _sendToVM;
        private TimeSpan _returnFromVM;

        private AutoResetEvent _saveEvent = new AutoResetEvent(false);

        public Story(byte[] memorystream, string gameFileName)
        {
            InitializeComponent();

            BookGrid.Width = Settings.BookWidth;

            LayoutRoot.Background = Helpers.Color.SolidColorBrush(Settings.BackgroundColor);

            this.Loaded += new RoutedEventHandler(Story_Loaded);

            _tbVersion.Text = string.Concat(Settings.VersionText, " ", (Settings.IsDesktopVersion?"(Desktop)":"(Browser)"));

            TextfyreBook.TextfyreDocument.InputEntered += new EventHandler<Textfyre.UI.Controls.Input.InputEventArgs>(TextfyreDocument_InputEntered);
            TextfyreBook.SaveGameDialog.SaveRequest += new EventHandler<Textfyre.UI.Controls.IODialog.Save.SaveEventArgs>(SaveGameDialog_SaveRequest);
            TextfyreBook.RestoreGameDialog.RestoreRequest += new EventHandler<Textfyre.UI.Controls.IODialog.Restore.RestoreEventArgs>(RestoreGameDialog_RestoreRequest);

            Keyboard.KeyPress += new EventHandler<KeyEventArgs>(Keyboard_KeyPress);
            Keyboard.KeyDown += new EventHandler<KeyEventArgs>(Keyboard_KeyDown);
            Keyboard.KeyUp += new EventHandler<KeyEventArgs>(Keyboard_KeyUp);

            LoadGame(memorystream, gameFileName);
        }

        bool _keyAltPressed = false;
        bool _keyShiftPressed = false;

        void Keyboard_KeyUp(object sender, KeyEventArgs e)
        {

            switch (e.Key)
            {
                case Key.Ctrl:
                    TextfyreBook.TextfyreDocument.HideWordDefs();
                    break;
                case Key.Alt:
                    _keyAltPressed = false;
                    break;
                case Key.Shift:
                    _keyShiftPressed = false;
                    break;
            }

        }

        void Keyboard_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.Key)
            {
                case Key.Ctrl:
                    TextfyreBook.TextfyreDocument.ShowWordDefs();
                    break;
                case Key.Alt:
                    _keyAltPressed = true;
                    break;
                case Key.Shift:
                    _keyShiftPressed = true;
                    break;
                case Key.N:
                    if (_keyAltPressed && _keyShiftPressed)
                    {
                        TextfyreBook.TextfyreDocument.Input("*");
                    }
                    break;
            }
        }

        void Keyboard_KeyPress(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.PageDown)
            {
                TextfyreBook.FlipForward();
            }

            if (e.Key == Key.PageUp)
            {
                TextfyreBook.FlipBack();
            }
        }

        private void TextfyreDocument_InputEntered(object sender, Textfyre.UI.Controls.Input.InputEventArgs e)
        {
            _commandStartTime = DateTime.Now;
            _inputLine = e.TextEntered;
            inputReadyEvent.Set();
        }


        private void Story_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private void LoadGame(byte[] memorystream, string gameFileName)
        {
            Current.Game.GameFileName = gameFileName;
            MemoryStream mstr = new MemoryStream(memorystream);
            StartGame(mstr);
        }

        List<Grid> _textblocktests = new List<Grid>();

        private void StartGame(Stream mstr)
        {
            _engine = new Engine(mstr);

            _engine.KeyWanted += new KeyWantedEventHandler(engine_KeyWanted);
            _engine.LineWanted += new LineWantedEventHandler(engine_LineWanted);
            _engine.LoadRequested += new SaveRestoreEventHandler(engine_LoadRequested);
            _engine.OutputReady += new OutputReadyEventHandler(engine_OutputReady);
            _engine.SaveRequested += new SaveRestoreEventHandler(engine_SaveRequested);

            _engineThread = new Thread(new ThreadStart(delegate { _engine.Run(); }));
            _engineThread.IsBackground = true;

            _engineThread.Start();
        }

        private void engine_OutputReady(object sender, OutputReadyEventArgs e)
        {
            _returnFromVM = DateTime.Now.Subtract(_commandStartTime);
            _returnFromVM = _returnFromVM.Subtract(_sendToVM);
            if (e.Package.Count == 0)
                return;

            if (e.Package.ContainsKey(OutputChannel.Time))
            {
                int turn = -1;
                int.TryParse(e.Package[OutputChannel.Time], out turn);
                if (turn > -1)
                    Current.Game.Turn = turn;

            }

            Dispatcher.BeginInvoke(new OutputDelegate(UpdateScreen), e.Package);
        }

        private delegate void OutputDelegate(IDictionary<OutputChannel, string> output);

        private void UpdateScreen(IDictionary<OutputChannel, string> output)
        {
            Dispatcher.BeginInvoke(() =>
            {
                TextfyreBook.Wait.Hide();

                if (Current.Game.GameMode == GameModes.ExecuteRestart)
                {
                    Current.Game.TextfyreBook.RestartGame();
                }
            
            });

            TimeSpan elapsed = DateTime.Now.Subtract(_commandStartTime);

            if (Settings.Profile)
                TextfyreBook.TextfyreDocument.AddFyreXml(String.Concat(Resource.FyreXML_Paragraph_Begin, "Elapsed VM Time: ", _returnFromVM.ToString(), Resource.FyreXML_Paragraph_End));

            if (AnyOutput(output, OutputChannel.Title))
            {
                Current.Game.StoryTitle = output[OutputChannel.Title];
            }

            string location = String.Empty;
            bool updateLocAndChap = false;

            #region :: Location && Chapter ::
            if (AnyOutput(output, OutputChannel.Location))
            {
                location = output[OutputChannel.Location];
                Current.Game.Location = location;
                updateLocAndChap = true;
            }

            if (AnyOutput(output, OutputChannel.Chapter))
            {
                string chapter = output[OutputChannel.Chapter];
                Current.Game.Chapter = chapter;
                updateLocAndChap = true;
            }

            if (updateLocAndChap)
                TextfyreBook.SetLocationAndChapter();

            #endregion


            #region :: Credits ::
            if (AnyOutput(output, OutputChannel.Credits))
            {
                string credits = string.Concat("", output[OutputChannel.Credits], "");
                credits = credits.Replace("&#169;", "©");

                TextfyreBook.TranscriptDialog.AddText(credits);

                Current.Game.TextfyreBook.SetCreditsText(credits);
            }
            #endregion

            #region :: Prologue ::
            if (AnyOutput(output, OutputChannel.Prologue))
            {
                Current.Game.GameMode = GameModes.Story;

                if (Current.Game.IsStoryReady == false)
                {
                    string prologue = output[OutputChannel.Prologue];
                    TextfyreBook.TranscriptDialog.AddText(prologue);

                    if (!prologue.StartsWith(Resource.FyreXML_Paragraph_Partial_Begin))
                    {
                        prologue = String.Concat(Resource.FyreXML_Paragraph_Begin, prologue, Resource.FyreXML_Paragraph_End);
                    }

                    prologue = SpotArt.InsertSpotArt(prologue);

                    System.Text.StringBuilder leadingNewlines = new StringBuilder("");

                    if (Settings.PagingMechanism == Settings.PagingMechanismType.StaticPageCreateBackPages)
                        prologue = String.Concat(Resource.FyreXML_PrologueMode, leadingNewlines.ToString(), prologue, Resource.FyreXML_PrologueContents);
                    else if (Settings.PagingMechanism == Settings.PagingMechanismType.CreateNewPages)
                        prologue = String.Concat(Resource.FyreXML_PrologueMode, prologue, Resource.FyreXML_StoryMode);

                    prologue = DocSystem.WordDef.ParseTextForWordDefs(prologue);

                    Current.Game.GameState.FyreXmlAdd(prologue);
                    TextfyreBook.TextfyreDocument.AddFyreXml(prologue);
                }
            }
            #endregion

            #region :: Time ::
            if (AnyOutput(output, OutputChannel.Time))
            {
                TextfyreBook.SetTime(output[OutputChannel.Time]);
            }
            #endregion

            #region :: Conversation ::
            if (AnyOutput(output, OutputChannel.Conversation))
            {
                string conversation = output[OutputChannel.Conversation].Replace("\n", String.Empty);

                TextfyreBook.TranscriptDialog.AddText(conversation);
                Current.Game.GameState.FyreXmlAdd(conversation);
                TextfyreBook.TextfyreDocument.AddFyreXml(conversation);
            }
            #endregion

            #region :: Hints ::
            if (AnyOutput(output, OutputChannel.Hints))
            {
                string hints = output[OutputChannel.Hints].Replace("\n", String.Empty);
                Current.Game.Hints = hints;
            }
            #endregion

            #region :: Main ::
            if (AnyOutput(output, OutputChannel.Main))
            {
                elapsed = DateTime.Now.Subtract(_commandStartTime);

                if (Settings.Profile)
                    TextfyreBook.TextfyreDocument.AddFyreXml(String.Concat(Resource.FyreXML_Paragraph_Begin, "Elapsed Time: ", elapsed.ToString(), Resource.FyreXML_Paragraph_End));

                string[] tbs = output[OutputChannel.Main].Split('~');

                System.Text.StringBuilder sbMain = new System.Text.StringBuilder("");
                foreach (string tb in tbs)
                {
                    if (tb != "")
                    {
                        TextfyreBook.TranscriptDialog.AddText(tb);

                        string txt = SpotArt.InsertSpotArt(tb);

                        txt = Regex.Replace(txt, Resource.FyreXML_LocationName_Regex_Search, Resource.FyreXML_LocationName_Replacement);

                        txt = DocSystem.WordDef.ParseTextForWordDefs(txt);

                        sbMain.Append(txt);

                        Current.Game.GameState.FyreXmlAdd(txt);
                        TextfyreBook.TextfyreDocument.AddFyreXml(txt);
                    }
                }
                Current.User.LogCommand(sbMain.ToString());
            }
            #endregion

            #region :: Theme ::
            if (AnyOutput(output, OutputChannel.Theme))
            {
                string themeID = output[OutputChannel.Theme];

                Current.Game.ThemeID = themeID;
            }
            #endregion

            #region :: Death ::
            if (AnyOutput(output, OutputChannel.Death))
            {
                string death = output[OutputChannel.Death];
                TextfyreBook.TranscriptDialog.AddText(death);
                Current.Game.GameState.FyreXmlAdd(death);

                if (!death.StartsWith(Resource.FyreXML_Paragraph_Partial_Begin))
                {
                    death = String.Concat(Resource.FyreXML_Paragraph_Begin, death, Resource.FyreXML_Paragraph_End);
                }

                TextfyreBook.TextfyreDocument.AddFyreXml(death);
            }
            #endregion

            #region :: Prompt ::
            if (AnyOutput(output, OutputChannel.Prompt))
            {
                bool promptOnly = output.Count == 1;
                string prompt = output[OutputChannel.Prompt];

                if (Current.Game.GameMode == GameModes.Story)
                {
                    elapsed = DateTime.Now.Subtract(_commandStartTime);

                    if (Settings.Profile)
                        TextfyreBook.TextfyreDocument.AddFyreXml(String.Concat(Resource.FyreXML_Paragraph_Begin, "Elapsed Time: ", elapsed.ToString(), Resource.FyreXML_Paragraph_End));

                    prompt = String.Concat(Resource.FyreXML_Prompt_Start, prompt.Replace(">", "&gt;"), Resource.FyreXML_Prompt_End);
                    TextfyreBook.TextfyreDocument.AddFyreXml(prompt);
                }
            }
            #endregion

            Current.Game.IsStoryReady = true;
        }

        private bool AnyOutput(IDictionary<OutputChannel, string> output, OutputChannel outputChannel)
        {
            if (output.ContainsKey(outputChannel) == false)
                return false;

            return output[outputChannel] != "";
        }

        private void engine_KeyWanted(object sender, KeyWantedEventArgs e)
        {

            Dispatcher.BeginInvoke(() =>
            {
                TextfyreBook.Wait.Hide();
                TextfyreBook.TextfyreDocument.AddInputSingleChar();
                TextfyreBook.TextfyreDocument.AddInputHandler();
            });

            Current.Game.IsEngineRunning = false;
            inputReadyEvent.WaitOne();
            Current.Game.IsScrollLimitEnabled = true;
            Current.Game.IsEngineRunning = true;
            char key = (_inputLine != null && _inputLine.Length > 0) ? _inputLine[0] : ' ';
            e.Char = key;
            _inputLine = null;
        }

        private string _inputLineForTranscript;
        private void engine_LineWanted(object sender, LineWantedEventArgs e)
        {
            Current.Game.IsEngineRunning = false;

            Dispatcher.BeginInvoke(() =>
            {
                if (Current.Game.GameMode == GameModes.Restart)
                {
                    TextfyreBook.TextfyreDocument.Input("yes", String.Empty);
                    Current.Game.IsStoryChanged = false;
                }
            });

            inputReadyEvent.WaitOne();
            Current.Game.IsEngineRunning = true;

            _inputLineForTranscript = _inputLine;
            Dispatcher.BeginInvoke(() =>
            {
                TextfyreBook.Wait.Show();
                Current.Game.IsScrollLimitEnabled = true;
                TextfyreBook.TranscriptDialog.AddText(String.Concat(">", _inputLineForTranscript));
                Current.Game.GameState.FyreXmlAdd(String.Concat(Resource.FyreXML_Paragraph_Begin, "&gt;", _inputLineForTranscript, Resource.FyreXML_Paragraph_End));
            });

            e.Line = _inputLine;
            _inputLine = null;

            _sendToVM = DateTime.Now.Subtract(_commandStartTime);
        }

        private Entities.SaveFile _saveFile;
        private void engine_SaveRequested(object sender, SaveRestoreEventArgs e)
        {

            Dispatcher.BeginInvoke(() =>
            {
                TextfyreBook.Wait.Hide();
                Current.Game.TextfyreBook.SaveGameDialog.Show();

            });

            _saveEvent.WaitOne();

            Dispatcher.BeginInvoke(() =>
            {
                if (Current.Game.GameMode == GameModes.Restart)
                {
                    Current.Game.GameMode = GameModes.ExecuteRestart;
                }

            });

            if (_saveFile != null)
            {
                
                try
                {
                    string filePath = _saveFile.Save();
                    IsolatedStorageFile IsoStorageFile =
                        System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                    Stream isoStream = new IsolatedStorageFileStream(filePath,
                                    FileMode.OpenOrCreate, Entities.SaveFile.IsoFile);
                    e.Stream = new CompressingStream(isoStream);
                }
                catch( Exception exp )
                {
                    Dispatcher.BeginInvoke(() =>
                    {
                        Current.Game.TextfyreBook.TranscriptDialog.AddText(String.Concat("\n", exp.Message, "\n"));
                        Current.Game.IsStoryRunning = true;
                        TextfyreBook._toc.Refresh();
                        TextfyreBook.TranscriptDialog.Show();
                        System.Windows.Browser.HtmlPage.Window.Alert("An error occurred. Please check the transcript.");
                    });
                    return;
                }

                Dispatcher.BeginInvoke(() =>
                {
                    if (Current.Game.GameMode != GameModes.ExecuteRestart)
                    {
                        Current.Game.IsStoryChanged = false;
                        Current.Game.MaxPageIndex = 999999;
                        Current.Game.IsStoryRunning = true;
                        TextfyreBook._toc.Refresh();
                        TextfyreBook.GoTo("Story");
                        TextfyreBook.BookmarkTOC.Visibility = Visibility.Visible;
                    }
                });
            }
        }

        void SaveGameDialog_SaveRequest(object sender, Textfyre.UI.Controls.IODialog.Save.SaveEventArgs e)
        {
            _saveFile = e.SaveFile;
            _saveEvent.Set();
        }

        private void engine_LoadRequested(object sender, SaveRestoreEventArgs e)
        {
            Dispatcher.BeginInvoke(() =>
            {
                TextfyreBook.Wait.Hide();
                Current.Game.TextfyreBook.RestoreGameDialog.Show();
            });

            _saveEvent.WaitOne();

            if (_saveFile != null)
            {
                try
                {
                string filePath = _saveFile.BinaryStoryFilePath;
  
                IsolatedStorageFile IsoStorageFile =
                    System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                Stream isoStream = new IsolatedStorageFileStream(filePath,
                                FileMode.Open, Entities.SaveFile.IsoFile);
                e.Stream = new DecompressingStream(isoStream);
                }
                catch (Exception exp)
                {
                    Dispatcher.BeginInvoke(() =>
                    {
                        Current.Game.TextfyreBook.TranscriptDialog.AddText(String.Concat("\n", exp.Message, "\n"));
                        Current.Game.IsStoryRunning = true;
                        TextfyreBook._toc.Refresh();
                        TextfyreBook.TranscriptDialog.Show();
                        System.Windows.Browser.HtmlPage.Window.Alert("An error occurred. Please check the transcript.");
                    });
                    return;
                }

                Dispatcher.BeginInvoke(() =>
                {
                    Current.Game.GameState.FyreXmlClear();
                    Current.Game.GameState.FyreXmlAdd(_saveFile.FyreXml);
                    Current.Game.GameState.ActivateGameState();
                    
                    Current.Game.IsStoryChanged = false;
                    Current.Game.MaxPageIndex = 999999;
                    Current.Game.IsStoryRunning = true;
                    TextfyreBook._toc.Refresh();
                    TextfyreBook.GoTo("Story");
                    TextfyreBook.BookmarkTOC.Visibility = Visibility.Visible;

                    Current.Game.TextfyreBook.TranscriptDialog.TranscriptText.Text = _saveFile.Transcript;
                    Current.Game.StoryTitle = _saveFile.StoryTitle;
                    Current.Game.Chapter = _saveFile.Chapter;
                    Current.Game.ThemeID = _saveFile.Theme;
                    Current.Game.Hints = _saveFile.Hints;


                });
            }
        }

        void RestoreGameDialog_RestoreRequest(object sender, Textfyre.UI.Controls.IODialog.Restore.RestoreEventArgs e)
        {
            TextfyreBook.RestoreGameDialog.Hide();
            _saveFile = e.SaveFile;
            _saveEvent.Set();
        }
    }
}
