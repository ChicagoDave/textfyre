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

namespace Textfyre.UI.Controls
{
    public partial class Bookmark : UserControl
    {
        public Bookmark()
        {
            InitializeComponent();
            this.MouseLeftButtonUp += new MouseButtonEventHandler(Bookmark_MouseLeftButtonUp);
        }

        void Bookmark_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (Click != null)
            {
                Click(this, new EventArgs());
            }
        }

        public event EventHandler Click;


        public string ArtID
        {
            get
            {
                return (string)GetValue(ArtIDProperty);
            }
            set
            {
                SetValue(ArtIDProperty, value);
                BookmarkArt.ID = value;
            }
        }
        public static readonly DependencyProperty ArtIDProperty = DependencyProperty.Register("ArtID", typeof(string), typeof(Bookmark), new PropertyMetadata(""));


    }
}
