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

namespace Textfyre.UI.DocSystem
{
    public class Document
    {
        public event EventHandler<Controls.Input.InputEventArgs> InputEntered;
        public event EventHandler<TopicListEventArgs> TopicListRequest;

        private bool _topicListWanted = false;
        private FyreXmlElementTopicList _topics;
        private FyreXmlElementCollection _fyreXmlElements;
        private SectionCollection _sections = new SectionCollection();
        private BackPages _backPages;
        private StoryPage _storyPage;
        private Textfyre.UI.Controls.TextfyreBookPage _storyAidPage;
        private Controls.StoryAid _storyAid = new Textfyre.UI.Controls.StoryAid();
        private bool _isInputAdded = false;
        private Controls.Input _input;
        private bool _addInput = false;
        private InputTypes _inputType;

        public Document()
        {
            InitInput();
            _backPages = new BackPages();
            _storyPage = new StoryPage();
            _storyPage.InputWant += new EventHandler<StoryPage.InputWantEventArgs>(_storyPage_InputWant);
            _storyPage.TopicListWant += new EventHandler<StoryPage.TopicListWantEventArgs>(_storyPage_TopicListWant);
            
        }

        public void ClearAll()
        {
            _storyPage.Reset();
            _sections.Clear();
        }

        private void _storyPage_TopicListWant(object sender, StoryPage.TopicListWantEventArgs e)
        {
            _topics = e.TopicList;
            _topicListWanted = true;
        }

        private void _storyPage_InputWant(object sender, StoryPage.InputWantEventArgs e)
        {
            RemoveInput();
            AddInput();
            AddInputHandler();
        }

        public FyreXmlElementCollection AddStml(string fyreXml)
        {
            return AddFyreXml(fyreXml);
        }

        public FyreXmlElementCollection AddFyreXml( string fyreXml )
        {
            _fyreXmlElements = new FyreXmlElementCollection(fyreXml, _fyreXmlElements);
            ProcessElementsIntoSections();
            DisplaySections();
            return _fyreXmlElements;
        }

        private void ProcessElementsIntoSections()
        {
            while (_fyreXmlElements.Count > 0)
            {
                Section section = new Section();
                _fyreXmlElements = section.Process(_fyreXmlElements);
                if (
                    (section.SectionType == SectionType.Content && section.IsEmpty == false) ||
                    section.SectionType != SectionType.Content
                    )
                {
                    section.Sequence = _sections.Count;
                    _sections.Add(section);
                }
            }
        }

        private void DisplaySections()
        {
            _backPages.Do(_sections);
            _storyPage.Do(_sections);
        }

        public Controls.StoryAid StoryAid
        {
            get
            {
                return _storyAid;
            }
        }
        public void AddStoryAidPage(Textfyre.UI.Controls.TextfyreBookPage page)
        {
            _storyAid = page.PageScrollViewer.Content as Controls.StoryAid;
            _storyAid.TopicChosen += new EventHandler<Textfyre.UI.Controls.Topic.TopicEventArgs>(_topicChosen);
            _storyAidPage = page;
            TopicListRequest += new EventHandler<TopicListEventArgs>(Document_TopicListRequest);
        }

        #region :: Input Handle ::
        private enum InputTypes {
            Normal,
            KeyPress
        }
        private void InitInput()
        {
            _input = new Controls.Input();
            _input.AnyKeyPress += new EventHandler(_input_AnyKeyPress);
            _input.InputEntered += new EventHandler<Controls.Input.InputEventArgs>(_input_InputEntered);
            _input.Foreground = new SolidColorBrush(Colors.Gray);
        }

        public void InputFocus()
        {
            if (_input != null)
                _input.SetFocus();
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
            }

            Current.Game.IsStoryChanged = true;

            if (addNotesText)
            {
                if (text.Length == 0)
                {
                    _input._tbInput.Text = String.Empty;
                    AddFyreXml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
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
                AddFyreXml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
                RemoveInput();
                AddInput();
                AddInputHandler();
                return;
            }

            RemoveInput();
            if (transcriptText.Length > 0)
                AddFyreXml("<Italic>&gt;" + transcriptText + "</Italic><LineBreak/>");
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
                //_processElements = true;
                DisplayElements();
            }
        }

        private void RemoveInput()
        {
            if (_isInputAdded)
            {
                _isInputAdded = false;
                _input.RemoveInputFromStackPanel();
            }
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
            _storyPage.ResetLastScrollingHeight();
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

                _input.AddInputToStackPanel(_storyPage);

                IsInputEnable = IsInputVisible;
                _input.SetFocus();
            }
        }

        #endregion :: Input Handle ::

        #region :: DisplayElements ::
        private void DisplayElements()
        {
            DisplaySections();
        }
        #endregion :: DisplayElements ::

        #region :: WordDefs Handle ::
        public void HideWordDefs()
        {
            foreach (Section section in _sections)
            {
                section.HideWordDefs();
            }
        }

        public void ShowWordDefs()
        {
            foreach (Section section in _sections)
            {
                section.ShowWordDefs();
            }
        }
        #endregion :: WordDefs Handle ::

        #region :: Hints Handle ::
        public void AddHints(string channelData)
        {
            _storyAid.AddHints(channelData);
        }
        #endregion :: Hints Handle ::

        #region :: Topics Handler ::

        public class TopicListEventArgs : EventArgs
        {
            public FyreXmlElementTopicList TopicList;
        }

        private void Document_TopicListRequest(object sender, Document.TopicListEventArgs e)
        {
            _storyAid.ShowTopics(e.TopicList);
        }

        private void _topicChosen(object sender, Textfyre.UI.Controls.Topic.TopicEventArgs e)
        {
            //Input(e.Topic.ID, String.Empty);
            Input(e.Topic.ID, e.Topic.Text);
        }
        #endregion :: Topics Handler ::
    }
}
