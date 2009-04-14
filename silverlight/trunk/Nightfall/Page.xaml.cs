﻿using System;
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

namespace Nightfall
{
    public partial class Page : UserControl
    {
        public Page()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }

        void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Textfyre.UI.Current.Application.GameAssembly = System.Reflection.Assembly.GetExecutingAssembly();

            //            Textfyre.UI.Current.Font.FontDefinition fd =
            //new Textfyre.UI.Current.Font.FontDefinition(
            //"GOUDR.TTF|GoudyRetrospectiveSSK|15");
            //            Textfyre.UI.Current.Font.Main = fd;

            /*
            Arial 
            Arial Black
            Comic Sans MS
            Courier New
            Georgia
            Lucide Grande / Lucida Sans Unicode
            Times New Roman
            Trebuchet MS
            Verdana
            */

            Textfyre.UI.Current.Font.FontDefinition fd =
                new Textfyre.UI.Current.Font.FontDefinition("Verdana", 14);
            Color color = new Color();
            color.A = 225;
            color.R = 0;
            color.G = 0;
            color.B = 0;
            fd.Color = new SolidColorBrush(color);
            Textfyre.UI.Current.Font.Main = fd;

            Textfyre.UI.Current.Font.FontDefinition hfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "|Verdana|18");
            Textfyre.UI.Current.Font.Headline = hfd;

            Textfyre.UI.Current.Font.FontDefinition Italicfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                    "|Verdana|14");
            Italicfd.FontStyle = FontStyles.Italic;
            Textfyre.UI.Current.Font.MainItalic = Italicfd;

            Textfyre.UI.Current.Font.FontDefinition headerfd =
                new Textfyre.UI.Current.Font.FontDefinition(
                "|Verdana|15");
            Textfyre.UI.Current.Font.Header = headerfd;

            Textfyre.UI.Current.Font.FontDefinition footerfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "|Verdana|12");
            Textfyre.UI.Current.Font.Footer = footerfd;

            Textfyre.UI.Current.Font.FontDefinition inputfd =
    new Textfyre.UI.Current.Font.FontDefinition(
    "|Verdana|18");
            Textfyre.UI.Current.Font.Input = inputfd;

            StoryPage.LoadStory(GameFiles.GameFile.Nightfall_r10, "Nightfall_r10", new StoryHandle());

        }

    }
}
