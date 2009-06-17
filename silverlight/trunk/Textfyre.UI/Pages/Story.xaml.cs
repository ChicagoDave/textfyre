using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Textfyre.VM;
using System.Threading;
using System.IO;
using System.Windows.Markup;
using System.IO.IsolatedStorage;
using System.Text.RegularExpressions;
using System.Text;

namespace Textfyre.UI.Pages
{
    public partial class Story : UserControl
    {
        private Engine _engine;
        private Thread _engineThread;
        private string _inputLine = null;
        private AutoResetEvent inputReadyEvent = new AutoResetEvent(false);

        private AutoResetEvent _saveEvent = new AutoResetEvent(false);

        public Story(byte[] memorystream, string gameFileName)
        {
            InitializeComponent();

            BookGrid.Width = Settings.BookWidth;

            LayoutRoot.Background = Helpers.Color.SolidColorBrush(Settings.BackgroundColor);

            this.Loaded += new RoutedEventHandler(Story_Loaded);

            _tbVersion.Text = Settings.VersionText; //Current.Application.IsLatestGameFileVersion ? "Latest Version" : "Old Version";

            TextfyreBook.TextfyreDocument.InputEntered += new EventHandler<Textfyre.UI.Controls.Input.InputEventArgs>(TextfyreDocument_InputEntered);
            TextfyreBook.SaveGameDialog.SaveRequest += new EventHandler<Textfyre.UI.Controls.IODialog.Save.SaveEventArgs>(SaveGameDialog_SaveRequest);
            TextfyreBook.RestoreGameDialog.RestoreRequest += new EventHandler<Textfyre.UI.Controls.IODialog.Restore.RestoreEventArgs>(RestoreGameDialog_RestoreRequest);

            Keyboard.KeyPress += new EventHandler<KeyEventArgs>(Keyboard_KeyPress);
            Keyboard.KeyDown += new EventHandler<KeyEventArgs>(Keyboard_KeyDown);
            Keyboard.KeyUp += new EventHandler<KeyEventArgs>(Keyboard_KeyUp);

            //Entities.SaveFile.DeleteOldSaveFiles();

            LoadGame(memorystream, gameFileName);
        }

        bool _keyCtrlPressed = false;
        bool _keyAltPressed = false;
        bool _keyShiftPressed = false;

        void Keyboard_KeyUp(object sender, KeyEventArgs e)
        {

            switch (e.Key)
            {
                case Key.Ctrl:
                    TextfyreBook.TextfyreDocument.HideWordDefs();
                    _keyCtrlPressed = false;
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
                    _keyCtrlPressed = true;
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

        //public void StopEngine()
        //{
        //    if (_saveEvent != null)
        //        _saveEvent.Close();

        //    if (_engineThread != null
        //        && _engineThread.ThreadState != ThreadState.Stopped)
        //    {
        //        while (_isEngineRunning)
        //            Thread.Sleep(10);

        //        try
        //        {
        //            _engineThread.Abort();
        //        }
        //        catch
        //        { }
        //    }


        //    if( _engine != null )
        //        _engine.Stop();

        //    _engineThread = null;
        //    _engine = null;
        //}

        private void engine_OutputReady(object sender, OutputReadyEventArgs e)
        {
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
            });


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
                TextfyreBook.Map.SetLocation(location);
            }

            if (AnyOutput(output, OutputChannel.Chapter))
            {
                string chapter = output[OutputChannel.Chapter];
                Current.Game.Chapter = chapter;
                updateLocAndChap = true;
            }
            #endregion

            if (updateLocAndChap)
                TextfyreBook.SetLocationAndChapter();

            #region :: Credits ::
            if (AnyOutput(output, OutputChannel.Credits))
            {
                string credits = "" + output[OutputChannel.Credits] + "";
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

                    if (!prologue.StartsWith("<Paragraph"))
                    {
                        prologue = "<Paragraph>" + prologue + "</Paragraph>";
                    }

                    System.Text.StringBuilder leadingNewlines = new StringBuilder("");
                    //int i = Settings.PrologueNewLines;
                    //while(i > 0 )
                    //{
                    //    leadingNewlines.Append(" " + System.Environment.NewLine);
                    //    i--;
                    //}

                    if (Settings.PagingMechanism == Settings.PagingMechanismType.StaticPageCreateBackPages)
                        prologue = "<PrologueMode/>" + leadingNewlines.ToString() + prologue + "<StoryMode/><FullPageBreak/><ColumnScroll/><AddImagePage/>";
                    else if (Settings.PagingMechanism == Settings.PagingMechanismType.CreateNewPages)
                        prologue = "<PrologueMode/>" + prologue + "<StoryMode/>";

                    prologue = DocSystem.WordDef.ParseTextForWordDefs(prologue);

                    //TextfyreBook.TextfyreDocument.AddStml(prologue);
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
                //TextfyreBook.TextfyreDocument.AddStml(conversation);
                TextfyreBook.TextfyreDocument.AddFyreXml(conversation);
            }
            #endregion

            #region :: Hints ::
            if (AnyOutput(output, OutputChannel.Hints))
            {
                string hints = output[OutputChannel.Hints].Replace("\n", String.Empty);
                /*
                hints = @"<hints title=""Chapter I Hints"">
<topic title=""What do I do?"">
<hint id=""1"">You hear voices nearby.</hint>    
<hint id=""2"">Listen to the voices.</hint>    
<hint id=""3"">You need to get a better angle.</hint>    
<hint id=""4"">Notice those crates?</hint>    
<hint id=""5"">Climb up the crates to get to the roof.</hint>   
</topic>   
<topic title=""How do I escape the mercenaries?"">    
<hint id=""1"">Run!</hint>   
</topic>   
<topic title=""There's nowhere to go!"">    
<hint id=""1"">You can try to lose them in the marketplace.</hint>    
<hint id=""2"">But they know what you look like.</hint>   
</topic>   
<topic title=""Can I get a disguise?"">    
<hint id=""1"">The mercenaries have a picture of you. Can you change your appearance?</hint>    
<hint id=""2"">Take off something you're wearing and maybe that will fool them.</hint>    
<hint id=""3"">Remove your hat.</hint>    
<hint id=""4"">Can you disguise yourself in some other way?</hint>    
<hint id=""5"">Try looking at what's available in the silk tent.</hint>    
<hint id=""6"">You might need a cloak to cover yourself.</hint>    
<hint id=""7"">Ask Teisha about the green silk cloak.</hint>   
</topic>   
<topic title=""What can I do in the market?"">    
<hint id=""1"">Browse around.</hint>   
</topic>   
<topic title=""Teisha won't trade me unless I have jewelry."">    
<hint id=""1"">Maybe you could find some.</hint>    
<hint id=""2"">Someone around here has something valuable.</hint>   
</topic>   
<topic title=""What is that brown furry thing?"">    
<hint id=""1"">See if you can find it sitting in one place.</hint>    
<hint id=""2"">Have you noticed that big post behind some of the tents?</hint>    
<hint id=""3"">There's a way to get to it.</hint>    
<hint id=""4"">You'll have to let one of the merchants let you through the back of their tent.</hint>    
<hint id=""5"">Is there a merchant you're friends with who will do you a favor?</hint>    
<hint id=""6"">Try the silk tent.</hint>   
</topic>   
<topic title=""How do I get the necklace from the monkey?"">    
<hint id=""1"">Maybe if you give the monkey something else he likes better.</hint>    
<hint id=""2"">What's available in the market that a monkey likes?</hint>    
<hint id=""3"">Have you been to the fruit stall?</hint>    
<hint id=""4"">Monkeys like a banana.</hint>    
<hint id=""5"">Take a banana from the fruit stall and show it to the monkey.</hint>   
</topic>   
<topic title=""How do I buy things in the market?"">    
<hint id=""1"">You need money to buy things.</hint>    
<hint id=""2"">You don't have any money.</hint>    
<hint id=""3"">Well, how about a trade?</hint>    
<hint id=""4"">You don't have anything to trade, either.</hint>    
<hint id=""5"">How about stealing?</hint>   
</topic>   
<topic title=""Help, the mercenaries are after me again!"">    
<hint id=""1"">You'd better escape!</hint>    
<hint id=""2"">Go out the back way (north).</hint>    
<hint id=""3"">Better go back up the post.</hint>   
</topic>   
<topic title=""I'm trapped on top of the pole."">    
<hint id=""1"">Remember how the monkey got away?</hint>    
<hint id=""2"">You can't swing on the jewelry, but...</hint>    
<hint id=""3"">Have you got anything else you can loop over the wire?</hint>    
<hint id=""4"">Something big enough to hold onto?</hint>    
<hint id=""5"">Try your gray cloak.</hint>    
<hint id=""6"">Loop the cloak over the wire, and you'll slide to safety.</hint>    
<hint id=""7"">Now you need to find a better place to hide.</hint>    
<hint id=""8"">Escape to Commerce Street, east of the marketplace.</hint>   
</topic>   
<topic title=""They still catch me when I try to leave!"">    
<hint id=""1"">Better wear your new disguise first.</hint>    
<hint id=""2"">Put on the green silk cloak.</hint>    
<hint id=""3"">Now you can leave the market and enter Commerce Street.</hint>   
</topic>  
</hints>"; 
                */
                Current.Game.Hints = hints;
            }
            #endregion

            #region :: Main ::
            if (AnyOutput(output, OutputChannel.Main))
            {
                string[] tbs = output[OutputChannel.Main].Split('~');

                System.Text.StringBuilder sbMain = new System.Text.StringBuilder("");
                foreach (string tb in tbs)
                {
                    if (tb != "")
                    {
                        TextfyreBook.TranscriptDialog.AddText(tb);

                        //string txt = tb.Replace("Several crates are", "<img>Several crates are");
                        //string txt = tb.Replace("bother you here", @"<Image ID=""SpotArtCrates"" />bother you here");
                        string txt = tb.Replace("bother you here", @"<Art ID=""SpotArtCrates"" />bother you here");

                        //txt = Regex.Replace(txt, @"\bmercenaries\b", "<WordDef>mercenaries</WordDef>");
                        //if (location.Length > 0)
                        //{
                        //    txt = txt.Replace("<Paragraph><Bold>" + location + "</Bold><LineBreak/>", "<Header>" + location + "</Header><Paragraph>");
                        //}


                        txt = Regex.Replace(txt, "(<Paragraph><Bold>)(.*?)(</Bold><LineBreak/>)", "<Header>$2</Header><Paragraph>");
                        //txt = Regex.Replace(txt, "(<Paragraph><Bold>)(.+)(</Bold><LineBreak/>)", "<Header>$2</Header><Paragraph>");
                        //txt = Regex.Replace(txt, "(<Bold>)(.+)(</Bold><LineBreak/>)", "<Header>$2</Header>");

                        txt = DocSystem.WordDef.ParseTextForWordDefs(txt);

                        sbMain.Append(txt);
                        //TextfyreBook.TextfyreDocument.AddStml(txt);
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

                if (!death.StartsWith("<Paragraph"))
                {
                    death = "<Paragraph>" + death + "</Paragraph>";
                }

                //TextfyreBook.TextfyreDocument.AddStml(death);
                TextfyreBook.TextfyreDocument.AddFyreXml(death);
            }
            #endregion

            #region :: Prompt ::
            if (AnyOutput(output, OutputChannel.Prompt))
            {
                bool promptOnly = output.Count == 1;
                string prompt = output[OutputChannel.Prompt];
                //TextfyreBook.TranscriptDialog.AddText(prompt);


                if (Current.Game.GameMode == GameModes.Story)
                {
                    prompt = "<Prompt>" + prompt.Replace(">", "&gt;") + "</Prompt>";
                    //TextfyreBook.TextfyreDocument.AddStml(prompt);
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
                TextfyreBook.TranscriptDialog.AddText(">" + _inputLineForTranscript);
                Current.Game.GameState.FyreXmlAdd("<Paragraph>&gt;" + _inputLineForTranscript + "</Paragraph>");
            });

            e.Line = _inputLine;
            _inputLine = null;
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

            if (_saveFile != null)
            {
                
                string filePath = _saveFile.Save();

                IsolatedStorageFile IsoStorageFile =
                    System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                e.Stream = new IsolatedStorageFileStream(filePath,
                                FileMode.OpenOrCreate, Entities.SaveFile.IsoFile);

                Dispatcher.BeginInvoke(() =>
                {
                    if (Current.Game.GameMode == GameModes.Restart)
                    {
                        TextfyreBook.RestartGame();
                    }
                    else
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
                string filePath = _saveFile.BinaryStoryFilePath;
  
                IsolatedStorageFile IsoStorageFile =
                    System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                e.Stream = new IsolatedStorageFileStream(filePath,
                                FileMode.Open, Entities.SaveFile.IsoFile);

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

                //    IsolatedStorageFile IsoStorageFile =
                //        System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();

                //    e.Stream = new IsolatedStorageFileStream("SecretLetter.save",
                //FileMode.OpenOrCreate, IsoStorageFile);
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
