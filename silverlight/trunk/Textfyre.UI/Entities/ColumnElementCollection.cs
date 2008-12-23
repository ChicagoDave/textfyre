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
using System.Xml.Linq;

namespace Textfyre.UI.Entities
{
    public class ColumnElementCollection : List<ColumnElement>
    {
        #region :: Constructor / Parsing Elements ::
        public ColumnElementCollection(string stml) : this( stml, null )
        {
        }

        public ColumnElementCollection(string stml, ColumnElementCollection previousElements)
        {
            List<Entities.ColumnElement> elements = this;

            if (previousElements != null && previousElements.Count > 0)
            {
                foreach (ColumnElement prevCE in previousElements)
                {
                    elements.Add(prevCE);
                }

                previousElements.Clear();
            }


            TopicListColumnElement topicList = null;
            Topic topic = null;

            bool hasParagraphContentChildren = false;
            int lastParagraphIndex = -1;

            // TODO: Remove the replace when Topic tag fixed.
            //string stmlFormatted = stml;//.Replace("&lt;", "<").Replace("&gt;", ">");

            string stmlFormatted = CorrectTags(
                            stml,
                            Entities.TextfyreTagList.Tags
                            );

            string[] ts = stmlFormatted.Split('<');
            for (int i = 0; i < ts.Length; i++)
            {
                string[] tgs = ts[i].Split('>');
                string key = tgs[0].Trim();

                string newKey = String.Empty;
                while (newKey != key)
                {
                    newKey = key;
                    key = key.Replace(" /", "/");
                }
                
                string attributes = String.Empty;
                int spaceIdx = key.IndexOf(" ");
                if (spaceIdx > -1)
                {
                    if (key.Length > spaceIdx)
                        attributes = key.Substring(spaceIdx + 1);

                    key = key.Substring(0, spaceIdx);

                }

                switch (key.ToLower())
                {
                    case "addimagepage":
                    case "addimagepage/":
                        elements.Add(new Entities.ColumnElement(OpCode.AddImagePage));
                        break;
                    case "columnflip":
                    case "columnflip/":
                        elements.Add(new Entities.ColumnElement(OpCode.ColumnFlip));
                        break;
                    case "columnscroll":
                    case "columnscroll/":
                        elements.Add(new Entities.ColumnElement(OpCode.ColumnScroll));
                        break;
                    case "prologuemode":
                    case "prologuemode/":
                        elements.Add(new Entities.ColumnElement(OpCode.PrologueMode));
                        break;
                    case "storymode":
                    case "storymode/":
                        elements.Add(new Entities.ColumnElement(OpCode.StoryMode));
                        break;
                    case "pagebreak":
                    case "pagebreak/":
                        elements.Add(new Entities.ColumnElement(OpCode.PageBreak));
                        break;
                    case "fullpagebreak":
                    case "fullpagebreak/":
                        elements.Add(new Entities.ColumnElement(OpCode.FullPageBreak));
                        break;
                    case "header":
                        elements.Add(new Entities.ColumnElement(OpCode.HeaderBegin));
                        break;
                    case "/header":
                        elements.Add(new Entities.ColumnElement(OpCode.HeaderEnd));
                        break;
                    case "prompt":
                        elements.Add(new Entities.ColumnElement(OpCode.PromptBegin));
                        break;
                    case "/prompt":
                        elements.Add(new Entities.ColumnElement(OpCode.PromptEnd));
                        break;
                    case "worddef":
                        elements.Add(new Entities.ColumnElement(OpCode.WordDefOn));
                        break;
                    case "/worddef":
                        elements.Add(new Entities.ColumnElement(OpCode.WordDefOff));
                        break;
                    case "bold":
                        elements.Add(new Entities.ColumnElement(OpCode.BoldOn));
                        break;
                    case "/bold":
                        elements.Add(new Entities.ColumnElement(OpCode.BoldOff));
                        break;
                    case "italic":
                        elements.Add(new Entities.ColumnElement(OpCode.ItalicsOn));
                        break;
                    case "/italic":
                        elements.Add(new Entities.ColumnElement(OpCode.ItalicsOff));
                        break;
                    case "img":
                        hasParagraphContentChildren = true;
                        elements.Add(new Entities.ColumnElement(OpCode.Image));
                        break;
                    case "paragraph":
                        hasParagraphContentChildren = false;
                        elements.Add(new Entities.ColumnElement(OpCode.ParagraphBegin));
                        lastParagraphIndex = elements.Count - 1;
                        break;
                    case "/paragraph":
                        if (hasParagraphContentChildren)
                        {
                            elements.Add(new Entities.ColumnElement(OpCode.ParagraphEnd));
                        }
                        else
                        {
                            if (lastParagraphIndex > -1)
                            {
                                elements.RemoveAt(lastParagraphIndex);
                                lastParagraphIndex = -1;
                            }
                        }
                        break;
                    case "linebreak":
                    case "linebreak/":
                        if (topicList == null)
                        {
                            hasParagraphContentChildren = true;
                            elements.Add(new Entities.ColumnElement(OpCode.Text, Environment.NewLine));
                        }
                        break;

                    case "topiclist/":
                        // No Topics.
                        elements.Add( new TopicListColumnElement(OpCode.TopicList));
                        topicList = null;
                        break;
                    case "topiclist":
                        topicList = new TopicListColumnElement(OpCode.TopicList, GetAttribute("Character", attributes));
                        break;
                    case "/topiclist":
                        elements.Add(topicList);
                        topicList = null;
                        break;
                    case "topic":
                        topic = new Topic();
                        topic.ID = GetAttribute("ID", attributes);
                        break;
                    case "/topic":
                        if (topicList != null && topic != null)
                            topicList.Topics.Add(topic);
                        topic = null;
                        break;

                    default:
                        //if (key.Length > 0)
                        //    elements.Add(new Entities.ColumnElement(OpCode.Text, "UNKNOWN TAG: <" + key + ">" + Environment.NewLine));
                        break;

                }

                if (tgs.Length > 1)
                {
                    string text = tgs[1];
                    text = text.Replace("&lt;", "<").Replace("&gt;", ">");

                    if (topic != null)
                    {
                        topic.Text = text;
                    }
                    else
                    {
                        hasParagraphContentChildren = true;
                        elements.Add(new Entities.ColumnElement(OpCode.Text, text));
                    }
                }
            }
        }
        #endregion

        #region :: Attributes ::
        private string GetAttribute(string attribute, string attributes)
        {
            Dictionary<string, string> dic = GetAttributes(attributes);
            if (dic.ContainsKey(attribute))
            {
                return dic[attribute];
            }

            return String.Empty;
        }

        private Dictionary<string, string> GetAttributes(string attributes)
        {
            string atts = attributes.Trim();
            if( atts.Length == 0 || atts == "/" )
                return new Dictionary<string, string>();

            string tag = "<TAG " + atts + "/>";
            XDocument xDoc = XDocument.Parse(tag);

            Dictionary<string, string> dic = new Dictionary<string, string>();
            foreach (XAttribute att in xDoc.Root.Attributes())
            {
                dic.Add(att.Name.LocalName, att.Value);
            }

            return dic;
        }

        #endregion

        #region :: CorrectTags ::
        private string CorrectTags(string stml, params string[] tags)
        {
            string newStml = stml;
            foreach (string tag in tags)
            {
                newStml = CorrectTag(newStml, "", tag);
                newStml = CorrectTag(newStml, "/", tag);
            }
            return newStml;
        }

        private string CorrectTag(string stml, string prefix, string tag)
        {
            string newStml = stml;

            int idx = newStml.IndexOf("&lt;" + prefix + tag);
            while (idx > -1)
            {
                int idxEnd = newStml.IndexOf("&gt;", idx);
                if (idxEnd > -1)
                {
                    string pre = newStml.Substring(0, idx);
                    string tg = newStml.Substring(idx, (idxEnd - idx) + 4);
                    string post = newStml.Substring(idxEnd + 4);

                    tg = tg.Replace("&lt;", "<").Replace("&gt;", ">");

                    newStml = pre + tg + post;
                }

                idx = newStml.IndexOf("&lt;" + prefix + tag);
            }

            return newStml;

        }
        #endregion

    }
}
