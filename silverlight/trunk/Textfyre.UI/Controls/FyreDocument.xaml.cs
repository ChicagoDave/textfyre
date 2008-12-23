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
using System.Windows.Media.Imaging;

namespace Textfyre.UI.Controls
{
    public partial class FyreDocument : UserControl
    {
        public FyreDocument()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(FyreDocument_Loaded);
        }

        private double _contentWidth = 300d;
        public double ContentWidth
        {
            get
            {
                return _contentWidth;
            }
            set
            {
                _contentWidth = value;
            }
        }

        void FyreDocument_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private List<Element> _elements; 
        public void Add(string text)
        {
            _elements = new List<Element>();
            string[] ts = text.Split('<');
            for (int i = 0; i < ts.Length; i++)
            {
                string[] tgs = ts[i].Split('>');
                string key = tgs[0].ToLower().Trim();
                int spaceIdx = key.IndexOf(' ');
                if( spaceIdx > -1 )
                    key = key.Substring(0,spaceIdx);
                switch (key)
                {
                    case "b":
                        _elements.Add( new Element(OpCode.BoldOn));
                        break;
                    case "/b":
                        _elements.Add(new Element(OpCode.BoldOff));
                        break;
                    case "i":
                        _elements.Add(new Element(OpCode.ItalicsOn));
                        break;
                    case "/i":
                        _elements.Add(new Element(OpCode.ItalicsOff));
                        break;
                    case "img":
                        _elements.Add(new Element(OpCode.Image));
                        break;
                }

                if (tgs.Length > 1)
                {
                    _elements.Add(new Element(OpCode.Text, tgs[1]));

                }
            }
            DisplayElements();       
        }

        private TextBlock _curTB;
        private Run _curTBRun;
        private int _bold;
        private int _italic;
        private Image _curImage;
        private void DisplayElements()
        {
            _curTB = null;
            _curTBRun = null;
            _bold = 0;
            _italic = 0;
            _curImage = null;

            foreach (Element ele in _elements)
            {
                switch (ele.OpCode)
                {
                    case OpCode.Text:
                        if (_curTB == null)
                        {
                            CreateTextBlock(ContentWidth);
                            this.ContentPanel.Children.Add(_curTB);
                        }

                        _curTBRun = null;
                        AddText(ele.Data);
                        break;

                    case OpCode.BoldOn:
                        _bold++;
                        break;
                    case OpCode.BoldOff:
                        _bold--;
                        break;

                    case OpCode.ItalicsOn:
                        _italic++;
                        break;
                    case OpCode.ItalicsOff:
                        _italic--;
                        break;

                    case OpCode.Image:
                        AddImageContainer();
                        break;
                }
                
            }
        }

        private void CreateTextBlock( double width )
        {
            _curTB = new TextBlock();
            _curTB.Width = width;
            _curTB.TextWrapping = TextWrapping.Wrap;
            _curTB.FontFamily = new FontFamily("Times New Roman");
            _curTB.FontSize = 14d;
            _curTB.Opacity = 0.9d;
        }

        private void AddText(string text)
        {
            if (_curTBRun == null)
            {
                _curTBRun = new Run();
                if (_bold > 0) _curTBRun.FontWeight = FontWeights.Bold;
                if (_italic > 0) _curTBRun.FontStyle = FontStyles.Italic;
                _curTB.Inlines.Add(_curTBRun);
            }

            if (_curImage!=null)
            {
                // Add one word at a time until ImageHeight reached.
                DoImageMode(text);
            }
            else
            {
                _curTBRun.Text = text;
            }
        }

        private void DoImageMode(string text)
        {
            if (_curTBRun == null)
                return;

            if (_curTBRun.Text == null)
                _curTBRun.Text = "";

            if (text.StartsWith(" "))
                text = text.Substring(1);

            int pointer = 0;
            bool cont = true;
            bool exceedMaxHeight = false;
            double maxHeight = _curImage.Height;
            while (cont)
            {
                int nextSpace = text.IndexOf(' ', pointer);

                if (nextSpace > -1)
                {
                    string word = text.Substring(pointer, nextSpace - pointer+1);

                    _curTBRun.Text += word;

                    if (_curTB.ActualHeight > maxHeight && exceedMaxHeight == false)
                    {
                        exceedMaxHeight = true;
                        maxHeight = _curTB.ActualHeight;
                    }

                    if (_curTB.ActualHeight > maxHeight && exceedMaxHeight)
                    {
                        _curTBRun.Text = _curTBRun.Text.Substring(0, _curTBRun.Text.Length - word.Length);
                        _curImage = null;

                        CreateTextBlock(ContentWidth);
                        this.ContentPanel.Children.Add(_curTB);
                        _curTBRun = null;
                        AddText(text.Substring(pointer));

                        cont = false;
                    }

                    pointer += word.Length;
                }
                else
                {
                    _curTBRun.Text += text.Substring(pointer);
                    cont = false;
                }
                
                

                if (pointer >= text.Length)
                    cont = false;

            }

            

        }

        private void AddImageContainer()
        {
            //TODO: Find natural line break?
            
            Grid grid = new Grid();
            grid.Width = ContentWidth;

            ColumnDefinition cd1 = new ColumnDefinition();
            cd1.Width = new GridLength(ContentWidth - 104d);
            ColumnDefinition cd2 = new ColumnDefinition();
            cd2.Width = new GridLength(104d);
            grid.ColumnDefinitions.Add(cd1);
            grid.ColumnDefinitions.Add(cd2);

            RowDefinition rd1 = new RowDefinition();
            rd1.Height = GridLength.Auto;
            grid.RowDefinitions.Add(rd1);

            CreateTextBlock(ContentWidth - 104d);
            _curTB.SetValue(Grid.ColumnProperty, 0);
            _curTB.SetValue(Grid.RowProperty, 0);
            grid.Children.Add(_curTB);

            Image img = new Image();
            img.Source = Current.Application.GetImageBitmap("Images/SpotArt/Crates.png");
            img.Width = 80d;
            img.Height = 70d;
            img.SetValue(Grid.ColumnProperty, 1);
            img.SetValue(Grid.RowProperty, 0);
            img.Stretch = Stretch.Fill;
            grid.Children.Add(img);
            _curImage = img;

            this.ContentPanel.Children.Add(grid);
        }

        private enum OpCode
        {
            Text,
            BoldOn,
            BoldOff,
            ItalicsOn,
            ItalicsOff,
            Image
        }

        private class Element
        {
            public OpCode OpCode;
            public string Data;

            public Element(OpCode opCode)
            {
                OpCode = opCode;
                Data = String.Empty;
            }

            public Element(OpCode opCode, string data)
            {
                OpCode = opCode;
                Data = data;
            }
        }
    }
}
