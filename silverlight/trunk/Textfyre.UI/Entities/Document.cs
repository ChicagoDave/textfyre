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
using System.Collections.Generic;
using System.Windows.Media.Imaging;
using System.Windows.Browser;

namespace Textfyre.UI.Entities
{
    public class Document
    {

        public enum Modes
        {
            Story,
            Prologue
        }

        private Modes _mode = Modes.Story;
        public Modes Mode
        {
            get
            {
                return _mode;
            }
            set
            {
                _mode = value;
            }
        }

        private string GetModePageID()
        {
            switch (_mode)
            {
                case Modes.Prologue:
                    return "Prologue";
                default:
                    return "Story";
            }
        }

        public event EventHandler<Controls.Input.InputEventArgs> InputEntered;

        public class TopicListEventArgs : EventArgs
        {
            public Entities.TopicListColumnElement TopicList;
        }
        public event EventHandler<TopicListEventArgs> TopicListRequest;

        private Entities.DocumentColumnCollection _docColumns = new DocumentColumnCollection();
        private Entities.ColumnElementCollection _elements;
        private Entities.DocumentTextBlock _txtBlk;

        private bool _isInputAdded = false;
        private Controls.Input _input;

        private Textfyre.UI.Controls.TextfyreBookPage _storyAidPage;

        private bool _topicListWanted = false;
        private TopicListColumnElement _topics;

        private Controls.StoryAid _storyAid;
        public Controls.StoryAid StoryAid
        {
            get
            {
                return _storyAid;
            }
        }

        private bool _addInput = false;
        private InputTypes _inputType;
        private enum InputTypes
        {
            Normal,
            KeyPress
        }

        public Document()
        {
            _input = new Controls.Input();
            _input.AnyKeyPress += new EventHandler(_input_AnyKeyPress);
            _input.InputEntered += new EventHandler<Controls.Input.InputEventArgs>(_input_InputEntered);

            _input.Foreground = new SolidColorBrush(Colors.Gray);
            _txtBlk = new DocumentTextBlock();
        }

        public void InputFocus()
        {
            if (_input != null)
                _input.SetFocus();
        }

        public void HideWordDefs()
        {
            _txtBlk.HideWordDefs();
        }

        public void ShowWordDefs()
        {
            _txtBlk.ShowWordDefs();
        }

        public void AddHints(string channelData)
        {
            _storyAid.AddHints(channelData);
        }

        private void Document_TopicListRequest(object sender, Document.TopicListEventArgs e)
        {
            _storyAid.ShowTopics(e.TopicList);
        }

        private void _topicChosen(object sender, Textfyre.UI.Controls.Topic.TopicEventArgs e)
        {
            Input(e.Topic.ID, String.Empty);
        }

        public bool IsInputVisible
        {
            get
            {
                if (_input == null)
                    return false;

                return _input.IsInputVisible;
            }
        }

        public bool IsInputEnable
        {
            get
            {
                if (_input == null)
                    return false;

                return _input.EnableInput;
            }
            set
            {
                _input.EnableInput = value;
            }
        }

        public void Input(string inputText)
        {
            Input(inputText, inputText);
        }
        public void Input(string inputText, string transcriptText)
        {
            bool addNotesText = false;
            string notesText = String.Empty;

            string text = inputText;
            int mulPos = text.IndexOf("*");
            if (mulPos > -1)
            {
                text = inputText.Substring(0, mulPos);
                addNotesText = true;
                notesText = inputText.Substring(mulPos);

                //if (inputText == transcriptText)
                //    transcriptText = text;

            }

            Current.Game.IsStoryChanged = true;
            
            if (addNotesText)
            {
                if (text.Length == 0)
                {
                    _input._tbInput.Text = String.Empty;
                    this.AddStml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
                    Current.Game.TextfyreBook.NotesDialog.AddNotes(notesText);
                    return;
                }
                Current.Game.TextfyreBook.NotesDialog.AddNotes(notesText);
            }

            StoryHandle.ParseInputArgs parseInputArgs = new StoryHandle.ParseInputArgs();
            parseInputArgs.Input = text;
            parseInputArgs.TranscriptText = transcriptText;
            parseInputArgs.ContinueWithInput = true;
            parseInputArgs = Current.Game.StoryHandle.ParseInput(parseInputArgs);
            text = parseInputArgs.Input;
            transcriptText = parseInputArgs.TranscriptText;
            if (parseInputArgs.ContinueWithInput == false)
            {
                _input._tbInput.Text = String.Empty;
                this.AddStml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
                return;                
            }

            RemoveInput();
            if (transcriptText.Length > 0)
                this.AddStml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
            //this.AddStml("<Paragraph><Italic>&gt;" + transcriptText + "</Italic></Paragraph>");


            Current.Game.LastCommand = text;

            if (InputEntered != null)
            {
                Controls.Input.InputEventArgs args = new Textfyre.UI.Controls.Input.InputEventArgs();
                args.TextEntered = text;
                InputEntered(this, args);
            }

        }

        private void _input_InputEntered(object sender, Controls.Input.InputEventArgs e)
        {
            Input(e.TextEntered);
        }


        private void _input_AnyKeyPress(object sender, EventArgs e)
        {
            if (_isInputAdded)
            {
                RemoveInput();
                _processElements = true;
                DisplayElements();
            }
        }

        private void RemoveInput()
        {
            if (_isInputAdded)
            {
                _isInputAdded = false;
                _input.RemoveInputFromColumn();
                _docColumns.ActiveDocumentColumn.PageHeightReset();
                _txtBlk.Clear();
            }
        }

        /// <summary>
        /// Add a new document to act as an additional column.
        /// </summary>
        /// <param name="stackPanel"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        public void AddDocumentColumn(Textfyre.UI.Controls.TextfyreBookPage page, Entities.DocumentColumnBehaviour columnBehaviour)
        {
            Entities.DocumentColumn dc = new DocumentColumn(page, columnBehaviour);
            page.ctrlMore.Press += new EventHandler(ctrlMore_Press);
            _docColumns.Add(dc);
        }

        public void AddStoryAidPage(Textfyre.UI.Controls.TextfyreBookPage page)
        {
            _storyAid = page.PageScrollViewer.Content as Controls.StoryAid;
            _storyAid.TopicChosen += new EventHandler<Textfyre.UI.Controls.Topic.TopicEventArgs>(_topicChosen);
            _storyAidPage = page;
            TopicListRequest += new EventHandler<TopicListEventArgs>(Document_TopicListRequest);
        }

        void ctrlMore_Press(object sender, EventArgs e)
        {
            int bookPageIndex = _docColumns.ActiveDocumentColumn.TextfyreBookPage.BookPageIndex;
            if (bookPageIndex == Current.Game.LeftPageIndex || bookPageIndex == Current.Game.RightPageIndex)
            {
                // Only use if the More is on the Current canvas.
                _docColumns.ActiveDocumentColumn.PageHeightReset();
                _txtBlk.Clear();
                (sender as Controls.More).Hide();
                _processElements = true;
                DisplayElements();
            }
        }

        /// <summary>
        /// Add STML (Simple Text Markup Language) to the current document.
        /// </summary>
        /// <param name="stml"></param>
        public void AddStml(string stml)
        {            
            _elements = new ColumnElementCollection(stml, _elements);
            DisplayElements();
        }

        public void AddInput()
        {
            _inputType = InputTypes.Normal;
            _addInput = true;

            if (_topicListWanted && TopicListRequest != null)
            {
                _topicListWanted = false;
                TopicListEventArgs args = new TopicListEventArgs();
                args.TopicList = _topics;
                TopicListRequest(this, args);
            }
        }

        public void AddInputSingleChar()
        {
            _inputType = InputTypes.KeyPress;
            _addInput = true;
        }

        public void AddInputHandler()
        {
            if (_addInput)
            {
                if (_isInputAdded)
                {
                    RemoveInput();
                }

                _isInputAdded = true;
                if (_inputType == InputTypes.KeyPress)
                {
                    _input.SetModeKeyPress();
                }
                else
                {
                    _input.SetModeNormal();
                }

                _input.AddInputToColumn(_docColumns.ActiveDocumentColumn);
                IsInputEnable = IsInputVisible;
                _input.SetFocus();
            }
        }


        #region :: Elements ::
        private bool IsPageHeightReached(double elementHeight)
        {
            return ((_docColumns.ActiveDocumentColumn.PageHeightSinceLastInput + elementHeight) >= _docColumns.ActiveDocumentColumn.Height);
        }

        private void PageHeightReached()
        {
            Entities.DocumentColumnBehaviour columnBehavior
                = _docColumns.ActiveDocumentColumn.ColumnBehaviour;

            if ( columnBehavior == DocumentColumnBehaviour.Flip)
            {
                _docColumns.ActiveDocumentColumn.PageHeightInc(_txtBlk.Height);
                _txtBlk.Clear();


                if (_docColumns.IsActiveColumnLastColumn)
                {
                    Current.Game.TextfyreBook.AddColumnPage(GetModePageID(),
                                _docColumns.ActiveDocumentColumn.ColumnBehaviour);
                }

                _docColumns.NextColumn();

            }
            else if ( columnBehavior == DocumentColumnBehaviour.Scroll )
            {
                _docColumns.ActiveDocumentColumn.TextfyreBookPage.ctrlMore.Show();
                _processElements = false;
            }

            //else if ( _docColumns.Count == 1 )
            //{
            //    // Only one column. Insert <More>.
            //    if (!_isInputAdded)
            //    {
            //        _isInputAdded = true;
            //        _input.SetModeStallScroll();
            //        //_input.AddInputToColumn(_docColumns.ActiveDocumentColumn);
            //        //_input.SetFocus();
            //        _processElements = false;
            //    }
            //}
            //else
            //{
            //    // Multiply columns. Insert <More> and prepare for Page Flip.
            //    if (!_isInputAdded)
            //    {
            //        _isInputAdded = true;
            //        _input.SetModeStallScroll();
            //        //_input.AddInputToColumn(_docColumns.ActiveDocumentColumn);
            //        //_input.SetFocus();
            //        _processElements = false;
            //    }
            //}
        }

        private Image _curImage;
        private bool _curImageExceedMaxHeight = false;
        private bool _processElements = true;
        private bool _isParagraphEnd = false;
        private bool _isParagraphBegin = false;
        private void DisplayElements()
        {
            bool addInput = false;
            if (_processElements)
            {
                addInput = _isInputAdded;
                RemoveInput();
            }
            //_bold = 0;
            //_italic = 0;
            _curImage = null;
            _curImageExceedMaxHeight = false;

            while (_elements.Count > 0 && _processElements)
            {
                Entities.ColumnElement ele = _elements[0];
                _elements.RemoveAt(0);
                switch (ele.OpCode)
                {
                    case OpCode.PromptBegin:
                        break;

                    case OpCode.PromptEnd:
                        RemoveInput();
                        AddInput();
                        AddInputHandler();
                        break;
                    
                    case OpCode.HeaderBegin:
                        _txtBlk.FontType = Textfyre.UI.Current.Font.FontType.Headline;
                        CreateTextBlock(_docColumns.ActiveDocumentColumn.Width);
                        _docColumns.ActiveDocumentColumn.Add(_txtBlk.TextBlock);
                        _txtBlk.ClearRun();
                        _txtBlk.TextAlignment = TextAlignment.Center;
                        _txtBlk.Margin = new Thickness(0, 15, 0, 2);
                        break;

                    case OpCode.HeaderEnd:
                        _txtBlk.FontType = Textfyre.UI.Current.Font.FontType.Main;
                        CreateTextBlock(_docColumns.ActiveDocumentColumn.Width);
                        _docColumns.ActiveDocumentColumn.Add(_txtBlk.TextBlock);
                        _txtBlk.ClearRun();
                        break;
                    
                    case OpCode.ParagraphBegin:
                        _isParagraphBegin = true;
                        break;

                    case OpCode.ParagraphEnd:
                        _isParagraphEnd = true;
                        break;

                    case OpCode.Text:

                        string text = ele.Data;

                        if (text == null || text.Length == 0)
                            break;

                        if (_isParagraphBegin)
                        {
                            _isParagraphBegin = false;

                            if (Settings.UseIndents)
                                text = "    " + text;
                        }

                        if (_txtBlk.IsClear)
                        {
                            CreateTextBlock(_docColumns.ActiveDocumentColumn.Width);
                            _docColumns.ActiveDocumentColumn.Add(_txtBlk.TextBlock);
                        }
                        else
                        {
                            if (_isParagraphEnd)
                            {
                                _isParagraphEnd = false;

                                if (_curImage != null)
                                {
                                    text = Environment.NewLine + text;
                                }
                                else
                                {
                                    if (Settings.UseNewLineAfterParagraph)
                                        text = Environment.NewLine + Environment.NewLine + text;
                                    else

                                        text = Environment.NewLine + text;
                                }
                            }
                        }

                        _txtBlk.ClearRun();
                        AddText(text);
                        break;

                    case OpCode.WordDefOn:
                        _txtBlk.IsWordDefMode = true;
                        _txtBlk.ClearRun();
                        break;
                    case OpCode.WordDefOff:
                        _txtBlk.IsWordDefMode = false;
                        _txtBlk.ClearRun();
                        break;

                    case OpCode.BoldOn:
                        _txtBlk.BoldOn();
                        //_bold++;
                        break;
                    case OpCode.BoldOff:
                        _txtBlk.BoldOff();
                        //_bold--;
                        break;

                    case OpCode.ItalicsOn:
                        _txtBlk.ItalicOn();
                        //_italic++;
                        break;
                    case OpCode.ItalicsOff:
                        _txtBlk.ItalicOff();
                        //_italic--;
                        break;

                    case OpCode.Image:
                        AddImageContainer();
                        break;

                    case OpCode.TopicList:
                        _topics = ele as TopicListColumnElement;
                        _topicListWanted = true;
                        break;

                    case OpCode.PageBreak:
                        if (!_docColumns.ActiveDocumentColumn.IsEmpty)
                        {
                            Current.Game.TextfyreBook.AddColumnPage(GetModePageID(),
                                _docColumns.ActiveDocumentColumn.ColumnBehaviour);
                            _txtBlk.Clear();
                            _docColumns.NextColumn();
                        }
                        break;

                    case OpCode.FullPageBreak:
                        if (!_docColumns.ActiveDocumentColumn.IsEmpty)
                        {
                            Current.Game.TextfyreBook.AddColumnPage(GetModePageID(), _docColumns.ActiveDocumentColumn.ColumnBehaviour);
                            _txtBlk.Clear();
                            _docColumns.NextColumn();
                        }

                        if (_docColumns.ActiveDocumentColumn.TextfyreBookPage.BookPageIndex % 2 == 1)
                        {
                            Current.Game.TextfyreBook.AddColumnPage(GetModePageID(), _docColumns.ActiveDocumentColumn.ColumnBehaviour);
                            _txtBlk.Clear();
                            _docColumns.NextColumn();

                        }
                        break;

                    case OpCode.ColumnFlip:
                        _docColumns.ActiveDocumentColumn.ColumnBehaviour
                            = DocumentColumnBehaviour.Flip;
                        break;

                    case OpCode.ColumnScroll:
                        _docColumns.ActiveDocumentColumn.ColumnBehaviour
                            = DocumentColumnBehaviour.Scroll;
                        break;

                    case OpCode.PrologueMode:
                        _mode = Modes.Prologue;
                        break;

                    case OpCode.StoryMode:
                        _mode = Modes.Story;
                        break;

                    case OpCode.AddImagePage:
                        Current.Game.TextfyreBook.AddStoryAidPage();
                        break;

                }
            }

            if (addInput)
                AddInputHandler();

            //if (_processElements)
            //{
                //AddInputHandler();
            //}

        }


        private void CreateTextBlock(double width)
        {
            _isParagraphEnd = false;

            if (!_txtBlk.IsClear)
            {
                // Remove last TB if it was empty
                if (_txtBlk.IsTextBlockEmpty)
                {
                    _docColumns.ActiveDocumentColumn.Remove(_txtBlk.TextBlock);
                }
                else
                {
                    _docColumns.ActiveDocumentColumn.PageHeightInc(_txtBlk.Height);
                }
            }

            _txtBlk.Create(width);

        }



        private void AddText(string text)
        {
            if (_txtBlk.IsRunClear)
            {
                _txtBlk.CreateRun();
            }

            if (_curImage != null)
            {
                DoImageMode(text);
            }
            else
            {
                DoTextMode(text);
            }
        }



        /// <summary>
        /// Returns true if height was reached.
        /// </summary>
        /// <param name="text"></param>
        /// <param name="height"></param>
        /// <returns></returns>
        private bool AddWordsUntilCertainHeightReached(string text, double height)
        {
            int pointer = 0;
            bool cont = true;
            double maxHeight = height + 0.1d;

            string word = String.Empty;
            while (cont)
            {
                int nextSpace = text.IndexOf(' ', pointer);

                if (nextSpace > -1)
                {
                    // More words

                    word = text.Substring(pointer, nextSpace - pointer + 1);
                    if (_txtBlk.AddWordBegin(word))
                    {   // New Line
                        if (_txtBlk.Height > maxHeight && _curImageExceedMaxHeight == false)
                        {
                            _curImageExceedMaxHeight = true;

                            if (_curImage != null)
                            {   // If we are wrapping around an image, make
                                // sure we are free by more than one line.
                                maxHeight = _txtBlk.Height;
                            }   
                        }

                        if (_txtBlk.Height > maxHeight && _curImageExceedMaxHeight)
                        {
                            // Buffer remaining text.
                            string newText = text.Substring(pointer);
                            _elements.Insert(0, new Entities.ColumnElement(OpCode.Text, newText));
                            return true;
                        }
                        else
                        {
                            _txtBlk.AddWordCommit();
                        }

                        
                    }
                    else
                    {
                        _txtBlk.AddWordCommit();
                    }

                    pointer += word.Length;

                }
                else
                {   // One word
                    
                    word = text.Substring(pointer);
                    _txtBlk.AddWordBegin(word);
                    _txtBlk.AddWordCommit();
                    cont = false;
                }
            
           
                //    _txtBlk.Text += word;

                //    if (_txtBlk.Height > maxHeight && _curImageExceedMaxHeight == false)
                //    {
                //        _curImageExceedMaxHeight = true;

                //        if (_curImage != null)
                //        {   // If we are wrapping around an image, make
                //            // sure we are free by more than one line.
                //            maxHeight = _txtBlk.Height;
                //        }
                //    }

                //    if (_txtBlk.Height > maxHeight && _curImageExceedMaxHeight)
                //    {
                //        _txtBlk.Text = _txtBlk.Text.Substring(0, _txtBlk.Text.Length - word.Length);
                //        // Buffer remaining text.
                //        string newText = text.Substring(pointer);
                //        _elements.Insert(0, new Entities.ColumnElement(OpCode.Text, newText));
                //        return true;
                //    }
                //    pointer += word.Length;
                //}
                //else
                //{   // One word

                //    word = text.Substring(pointer);
                //    _txtBlk.Text += word;

                //    cont = false;
                //}

                _txtBlk.DoWordDef(word);

                if (pointer >= text.Length)
                    cont = false;
            }

            return false;
        }

        private void DoTextMode(string text)
        {
            if (AddWordsUntilCertainHeightReached(text, _docColumns.ActiveDocumentColumn.Height - _docColumns.ActiveDocumentColumn.PageHeightSinceLastInput))
            {
                PageHeightReached();
                CreateTextBlock(_docColumns.ActiveDocumentColumn.Width);
                _docColumns.ActiveDocumentColumn.Add(_txtBlk.TextBlock);
                _txtBlk.ClearRun();
            }

        }

        private void DoImageMode(string text)
        {
            if (AddWordsUntilCertainHeightReached(text, _curImage.Height))
            {
                _curImage = null;
                _curImageExceedMaxHeight = false;
                CreateTextBlock(_docColumns.ActiveDocumentColumn.Width);
                _docColumns.ActiveDocumentColumn.Add(_txtBlk.TextBlock);
                _txtBlk.ClearRun();
            }

        }

        private void AddImageContainer()
        {
            if (IsPageHeightReached(70d))
            {

            }

            //TODO: Find natural line break?
            // Fill old TB until line break?


            Grid grid = new Grid();
            //grid.Background = new SolidColorBrush(Colors.Orange);
            grid.Width = _docColumns.ActiveDocumentColumn.Width;

            ColumnDefinition cd1 = new ColumnDefinition();
            cd1.Width = new GridLength(_docColumns.ActiveDocumentColumn.Width - 104d);
            ColumnDefinition cd2 = new ColumnDefinition();
            cd2.Width = new GridLength(104d);
            grid.ColumnDefinitions.Add(cd1);
            grid.ColumnDefinitions.Add(cd2);

            RowDefinition rd1 = new RowDefinition();
            rd1.Height = GridLength.Auto;
            grid.RowDefinitions.Add(rd1);

            CreateTextBlock(_docColumns.ActiveDocumentColumn.Width - 104d);
            _txtBlk.TextBlock.SetValue(Grid.ColumnProperty, 0);
            _txtBlk.TextBlock.SetValue(Grid.RowProperty, 0);
            grid.Children.Add(_txtBlk.TextBlock);

            Image img = new Image();
            img.Source = Current.Application.GetImageBitmap("Images/SpotArt/Crates.png");
            img.Width = 80d;
            img.Height = 70d;
            img.SetValue(Grid.ColumnProperty, 1);
            img.SetValue(Grid.RowProperty, 0);
            img.Stretch = Stretch.Fill;
            img.VerticalAlignment = VerticalAlignment.Top;
            img.Margin = new Thickness(0, 2, 0, 0);
            grid.Children.Add(img);
            _curImage = img;

            _docColumns.ActiveDocumentColumn.Add(grid);
        }
        #endregion

    }
}
