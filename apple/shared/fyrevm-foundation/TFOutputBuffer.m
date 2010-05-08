//
//  TFOutputBuffer.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFOutputBuffer.h"

#import "TFOutputFilterTags.h"


@implementation TFOutputBuffer

- (id)init {
    self = [super init];
    
    channel = TFOutputChannelMain;
/*
    // TODO I don't know what a StringBuilder is yet. Need as many of them as we have output channels.
    strings = new StringBuilder[(int)OutputChannel._LAST]; // output channels start at 1
    for (int i = 0; i < strings.Length; ++i) {
        strings[i] = new StringBuilder();
    }
*/
    filtering = YES;
    
    filterTags = [[TFOutputFilterTags alloc] init];
    
    return self;
}

- (void)dealloc {
    [filterTags release], filterTags = nil;

    [super dealloc];
}

/*
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
*/
- (void)writeString:(NSString *)string {
/*
    if ([self isFilteredChannel:channel] && filtering) {
        // main channel needs char-by-char filtering
        foreach (char c in s)
            Write(c);
    }
    else
    {
        strings[(int)channel - 1].Append(s);
    }
*/
}

- (void)writeCharacter:(char)character {
/*
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
*/
}
/*
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
*/
@end