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
    public class FyreXml
    {
        public static string[] Tags = { "TopicList", "Topic", "CharacterList", "Character" };

        public enum OpCode
        {
            Text,
            BoldOn,
            BoldOff,
            ItalicOn,
            ItalicOff,
            Image,
            ParagraphBegin,
            ParagraphEnd,
            TopicList,
            PageBreak,
            FullPageBreak,
            HeaderBegin,
            HeaderEnd,
            PromptBegin,
            PromptEnd,
            ColumnFlip,
            ColumnScroll,
            AddImagePage,
            WordDefOn,
            WordDefOff,
            PrologueMode,
            StoryMode,
            LineBreak,
            Art,
            SpanBegin,
            SpanEnd,
            TextBlockBegin,
            TextBlockEnd
        }
    }
}
