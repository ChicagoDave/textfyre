﻿using System;
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

namespace Textfyre.UI.DocSystem
{
    public class FyreXmlElementTopicList: FyreXmlElement
    {
        public FyreXmlElementTopicList( FyreXml.OpCode opCode, string data) : base(opCode,data)
        {
            Topics = new List<Topic>();
        }
        public FyreXmlElementTopicList(FyreXml.OpCode opCode)
            : base(opCode)
        {
            Topics = new List<Topic>();
        }

        public List<Topic> Topics;
    }   
}
