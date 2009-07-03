/*
 * Copyright © 2009, Textfyre, Inc. - All Rights Reserved
 * Please read the accompanying COPYRIGHT file for licensing resstrictions.
 */
using System;
using System.Collections.Generic;
using System.Text;

namespace Textfyre.VM
{
    /// <summary>
    /// Indicates a text style that may be selected.
    /// </summary>
    /// <remarks>
    /// Selecting the Roman style turns off Bold and Italic.
    /// Selecting the Fixed style turns off Variable, and vice versa.
    /// </remarks>
    internal enum OutputStyle
    {
        Roman = 1,
        Bold = 2,
        Italic = 3,
        Fixed = 4,
        Variable = 5,
    }

    /// <summary>
    /// Controls the tags for output filtering.
    /// </summary>
    /// <remarks>
    /// The default set of tags is suitable for XAML.
    /// </remarks>
    public sealed class OutputFilterTags
    {
        private string startParaTag = "<Paragraph>";
        private string endParaTag = "</Paragraph>\n";
        private string lineBreakTag = "<LineBreak/>\n";
        private string leftAngleTag = "&lt;";
        private string rightAngleTag = "&gt;";
        private string ampersandTag = "&amp;";
        private string leftDblQuoteTag = "&#8220;";
        private string rightDblQuoteTag = "&#8221;";
        private string leftQuoteTag = "&#8216;";
        private string rightQuoteTag = "&#8217;";
        private string startFixedTag = "<Span FontFamily=\"Courier New\">";
        private string endFixedTag = "</Span>";
        private string startItalicTag = "<Italic>";
        private string endItalicTag = "</Italic>";
        private string startBoldTag = "<Bold>";
        private string endBoldTag = "</Bold>";

        internal OutputFilterTags()
        {
        }

        /// <summary>
        /// Gets or sets the string that begins a paragraph.
        /// </summary>
        public string StartParagraph
        {
            get { return startParaTag; }
            set { if (value == null)throw new ArgumentNullException(); startParaTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that ends a paragraph.
        /// </summary>
        public string EndParagraph
        {
            get { return endParaTag; }
            set { if (value == null) throw new ArgumentNullException(); endParaTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that introduces a line break.
        /// </summary>
        public string LineBreak
        {
            get { return lineBreakTag; }
            set { if (value == null) throw new ArgumentNullException(); lineBreakTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes a left angle bracket (less-than sign).
        /// </summary>
        public string LeftAngleBracket
        {
            get { return leftAngleTag; }
            set { if (value == null) throw new ArgumentNullException(); leftAngleTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes a right angle bracket (greater-than sign).
        /// </summary>
        public string RightAngleBracket
        {
            get { return rightAngleTag; }
            set { if (value == null) throw new ArgumentNullException(); rightAngleTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes an ampersand.
        /// </summary>
        public string Ampersand
        {
            get { return ampersandTag; }
            set { if (value == null) throw new ArgumentNullException(); ampersandTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes an opening double-quote mark.
        /// </summary>
        public string LeftDoubleQuote
        {
            get { return leftDblQuoteTag; }
            set { if (value == null) throw new ArgumentNullException(); leftDblQuoteTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes a closing double-quote mark.
        /// </summary>
        public string RightDoubleQuote
        {
            get { return rightDblQuoteTag; }
            set { if (value == null) throw new ArgumentNullException(); rightDblQuoteTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes an opening single-quote mark.
        /// </summary>
        public string LeftSingleQuote
        {
            get { return leftQuoteTag; }
            set { if (value == null) throw new ArgumentNullException(); leftQuoteTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that encodes a closing single-quote mark (apostrophe).
        /// </summary>
        public string RightSingleQuote
        {
            get { return rightQuoteTag; }
            set { if (value == null) throw new ArgumentNullException(); rightQuoteTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that begins fixed-pitch type.
        /// </summary>
        public string StartFixedPitch
        {
            get { return startFixedTag; }
            set { if (value == null) throw new ArgumentNullException(); startFixedTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that ends fixed-pitch type.
        /// </summary>
        public string EndFixedPitch
        {
            get { return endFixedTag; }
            set { if (value == null) throw new ArgumentNullException(); endFixedTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that begins italic type.
        /// </summary>
        public string StartItalicType
        {
            get { return startItalicTag; }
            set { if (value == null) throw new ArgumentNullException(); startItalicTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that ends italic type.
        /// </summary>
        public string EndItalicType
        {
            get { return endItalicTag; }
            set { if (value == null) throw new ArgumentNullException(); endItalicTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that begins bold type.
        /// </summary>
        public string StartBoldType
        {
            get { return startBoldTag; }
            set { if (value == null) throw new ArgumentNullException(); startBoldTag = value; }
        }

        /// <summary>
        /// Gets or sets the string that ends bold type.
        /// </summary>
        public string EndBoldType
        {
            get { return endBoldTag; }
            set { if (value == null) throw new ArgumentNullException(); endBoldTag = value; }
        }
    }

    /// <summary>
    /// Collects output from the game file, on various output channels, to be
    /// delivered all at once.
    /// </summary>
    internal class OutputBuffer
    {
        private OutputChannel channel;
        private StringBuilder[] strings;
        private bool mainIsBold, mainIsItalic, mainIsFixed, mainParaOpen, mainBreakPending;
        private bool mainRightQuote;
        private bool filtering = true;
        private OutputFilterTags filterTags = new OutputFilterTags();

        /// <summary>
        /// Initializes a new output buffer.
        /// </summary>
        public OutputBuffer()
        {
            channel = OutputChannel.Main;
            strings = new StringBuilder[(int)OutputChannel._LAST]; // output channels start at 1
            for (int i = 0; i < strings.Length; i++)
                strings[i] = new StringBuilder();
        }

        /// <summary>
        /// Gets or sets the current output channel.
        /// </summary>
        /// <remarks>
        /// If the output channel is changed to any channel other than
        /// <see cref="OutputChannel.Main"/>, the channel's contents will be
        /// cleared first.
        /// </remarks>
        public OutputChannel Channel
        {
            get { return channel; }
            set
            {
                if (channel != value)
                {
                    channel = value;
                    if (value != OutputChannel.Main)
                        strings[(int)value - 1].Length = 0;
                }
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether the <see cref="OutputChannel.Main"/>
        /// output channel's text should be filtered to change line breaks, styles,
        /// and special characters to a configurable set of tags and entities.
        /// </summary>
        public bool FilterEnabled
        {
            get { return filtering; }
            set { filtering = value; }
        }

        /// <summary>
        /// Gets the object controlling the set of strings that are used when output
        /// output filtering is enabled.
        /// </summary>
        public OutputFilterTags FilterTags
        {
            get { return filterTags; }
        }

        /// <summary>
        /// Writes a string to the buffer for the currently selected
        /// output channel.
        /// </summary>
        /// <param name="s">The string to write.</param>
        public void Write(string s)
        {
            if (IsFilteredChannel(channel) && filtering)
            {
                // main channel needs char-by-char filtering
                foreach (char c in s)
                    Write(c);
            }
            else
            {
                strings[(int)channel - 1].Append(s);
            }
        }

        /// <summary>
        /// Writes a single character to the buffer for the currently selected
        /// output channel.
        /// </summary>
        /// <param name="c">The character to write.</param>
        public void Write(char c)
        {
            if (IsFilteredChannel(channel) && filtering)
            {
                StringBuilder sb = strings[(int)channel - 1];
                if (c == '\n')
                {
                    if (mainParaOpen)
                    {
                        if (mainBreakPending)
                        {
                            CloseFormattingTags(sb);
                            sb.Append(filterTags.EndParagraph);
                            mainBreakPending = false;
                            mainParaOpen = false;
                        }
                        else
                        {
                            mainBreakPending = true;
                        }
                    }

                    mainRightQuote = false;
                }
                else
                {
                    if (!mainParaOpen)
                    {
                        sb.Append(filterTags.StartParagraph);
                        OpenFormattingTags(sb);
                        mainBreakPending = false;
                        mainParaOpen = true;
                    }
                    if (mainBreakPending)
                    {
                        sb.Append(filterTags.LineBreak);
                        mainBreakPending = false;
                    }
                    switch (c)
                    {
                        case '<': sb.Append(filterTags.LeftAngleBracket); break;
                        case '>': sb.Append(filterTags.RightAngleBracket); break;
                        case '&': sb.Append(filterTags.Ampersand); break;

                        case '"':
                            if (mainRightQuote)
                                sb.Append(filterTags.RightDoubleQuote);
                            else
                                sb.Append(filterTags.LeftDoubleQuote);
                            break;
                        case '\'':
                            if (mainRightQuote)
                                sb.Append(filterTags.RightSingleQuote);
                            else
                                sb.Append(filterTags.LeftSingleQuote);
                            break;

                        default:
                            sb.Append(c);
                            mainRightQuote = !char.IsWhiteSpace(c);
                            break;
                    }
                }
            }
            else
            {
                strings[(int)channel - 1].Append(c);
            }
        }

        private static bool IsFilteredChannel(OutputChannel channel)
        {
            switch (channel)
            {
                case OutputChannel.Main:
                case OutputChannel.Prologue:
                    return true;

                default:
                    return false;
            }
        }

        private void OpenFormattingTags(StringBuilder sb)
        {
            if (mainIsFixed)
                sb.Append(filterTags.StartFixedPitch);
            if (mainIsItalic)
                sb.Append(filterTags.StartItalicType);
            if (mainIsBold)
                sb.Append(filterTags.StartBoldType);
        }

        private void CloseFormattingTags(StringBuilder sb)
        {
            if (mainIsBold)
                sb.Append(filterTags.EndBoldType);
            if (mainIsItalic)
                sb.Append(filterTags.EndItalicType);
            if (mainIsFixed)
                sb.Append(filterTags.EndFixedPitch);
        }

        /// <summary>
        /// Sets the current output style.
        /// </summary>
        /// <param name="value">The style to set.</param>
        /// <remarks>
        /// This method has no effect unless the main channel is selected and
        /// <see cref="FilterEnabled"/> is <see langword="true"/>.
        /// </remarks>
        public void SetStyle(OutputStyle style)
        {
            if (IsFilteredChannel(channel) && filtering)
            {
                StringBuilder sb = strings[(int)OutputChannel.Main - 1];
                // canonical nesting order: (fixed (italic (bold)))
                switch (style)
                {
                    case OutputStyle.Roman:
                        if (mainParaOpen)
                        {
                            if (mainIsBold)
                                sb.Append(filterTags.EndBoldType);
                            if (mainIsItalic)
                                sb.Append(filterTags.EndItalicType);
                        }
                        mainIsBold = mainIsItalic = false;
                        break;

                    case OutputStyle.Bold:
                        if (mainParaOpen && !mainIsBold)
                            sb.Append(filterTags.StartBoldType);
                        mainIsBold = true;
                        break;

                    case OutputStyle.Italic:
                        if (!mainIsItalic)
                        {
                            if (mainParaOpen)
                            {
                                if (mainIsBold)
                                {
                                    sb.Append(filterTags.EndBoldType);
                                    sb.Append(filterTags.StartItalicType);
                                    sb.Append(filterTags.StartBoldType);
                                }
                                else
                                    sb.Append(filterTags.StartItalicType);
                            }

                            mainIsItalic = true;
                        }
                        break;

                    case OutputStyle.Fixed:
                    case OutputStyle.Variable:
                        if (!mainIsFixed)
                        {
                            if (mainParaOpen)
                                CloseFormattingTags(sb);

                            mainIsFixed = (style == OutputStyle.Fixed);

                            if (mainParaOpen)
                                OpenFormattingTags(sb);
                        }
                        break;
                }
            }
        }

        /// <summary>
        /// Packages all the output that has been stored so far, returns it,
        /// and empties the buffer.
        /// </summary>
        /// <returns>A dictionary mapping each active output channel to the
        /// string of text that has been sent to it since the last flush.</returns>
        public IDictionary<OutputChannel, string> Flush()
        {
            Dictionary<OutputChannel, string> result = new Dictionary<OutputChannel, string>();

            // end tags on the main channel
            StringBuilder main = strings[(int)OutputChannel.Main - 1];
            if (main.Length > 0)
            {
                CloseFormattingTags(main);
                if (mainParaOpen)
                    main.Append(filterTags.EndParagraph);

                mainIsBold = mainIsItalic = mainIsFixed = false;
            }
            mainBreakPending = mainParaOpen = false;

            for (int i = 0; i < strings.Length; i++)
            {
                if (strings[i].Length > 0)
                {
                    result.Add((OutputChannel)(i + 1), strings[i].ToString());
                    strings[i] = new StringBuilder();
                }
            }

            return result;
        }
    }
}
