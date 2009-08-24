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

namespace Shadow {
    public partial class Page : UserControl {
        public Page() {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }

        void Page_Loaded(object sender, RoutedEventArgs e) {


            Textfyre.UI.Current.Application.GameAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            Textfyre.UI.Current.Application.AppResources = App.Current.Resources;

            switch (Textfyre.UI.Current.Application.Platform) {
                case Textfyre.UI.Current.Platform.Windows:
                    break;
                default:
                    break;
            }

            StoryPage.LoadStory(GameFiles.GameFile.sh_v0_62e, "sh_v0_62e", new StoryHandle());
        }
    }
}
