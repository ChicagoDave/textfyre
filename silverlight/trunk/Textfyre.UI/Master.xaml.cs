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

namespace Textfyre.UI
{
    public partial class Master : UserControl
    {
        private double _originalWidth;
        private double _originalHeight;

        public Master()
        {
            InitializeComponent();
            _originalWidth = LayoutRoot.Width;
            _originalHeight = LayoutRoot.Height;

            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }

        private TextBlock _debugText;
        private static TextBlock _staticDebugText;
        public static string DebugText
        {
            get
            {
                if (_staticDebugText != null)
                    return _staticDebugText.Text;
                else
                    return String.Empty;
            }

            set
            {
                if (_staticDebugText != null)
                    _staticDebugText.Text = value;
            }
        }

        void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Keyboard.Init(this);

            //Application.Current.Host.Content.Resized += new EventHandler(Content_Resized);
            //Resize();
            
           
        }

        public void LoadStory(byte[] memorystream, string gameFileName)
        {
            this.Visibility = Visibility.Visible;
            this.IsTabStop = true;
            System.Windows.Browser.HtmlPage.Plugin.Focus();
            this.Focus();
            //Keyboard = new Keyboard(this);



            Pages.Story story = new Textfyre.UI.Pages.Story(memorystream, gameFileName);
            this.LayoutRoot.Children.Add(story);

            _debugText = new TextBlock();
            _debugText.FontFamily = new FontFamily("Arial");
            _debugText.FontSize = 10;
            _debugText.HorizontalAlignment = HorizontalAlignment.Left;
            _debugText.VerticalAlignment = VerticalAlignment.Top;
            this.LayoutRoot.Children.Add(_debugText);
            _staticDebugText = _debugText;
        }

        //void Content_Resized(object sender, EventArgs e)
        //{
        //    Resize();
        //}

        public void Resize()
        {
            double currentWidth = Application.Current.Host.Content.ActualWidth;
            double currentHeight = Application.Current.Host.Content.ActualHeight;

            // Scale the root Canvas to fit within the current control size
            double uniformScaleAmount = Math.Min((currentWidth / _originalWidth), (currentHeight / _originalHeight));
            RootScaleTransform.ScaleX = uniformScaleAmount;
            RootScaleTransform.ScaleY = uniformScaleAmount;

            // Translate the root Canvas to center horizontally
            //double scaledWidth = Math.Min(_originalWidth * uniformScaleAmount, currentWidth);
            //RootTranslateTransform.X = (Math.Min(LayoutRoot.ActualWidth, currentWidth) - scaledWidth) / 2d;

        }

    }
}
