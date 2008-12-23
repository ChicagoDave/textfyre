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

namespace Textfyre.UI.Controls.Mapping
{
    public partial class Location : UserControl
    {
        #region :: MapConnections ::
        private Entities.MapConnectionCollection _mapConnections;
        public Entities.MapConnectionCollection MapConnections
        {
            get
            {
                return _mapConnections;
            }
            set
            {
                _mapConnections = value;
            }
        }
        #endregion
        
        public Location()
        {
            InitializeComponent();
            _mapConnections = new Textfyre.UI.Entities.MapConnectionCollection();

            Current.Font.ApplyFont(Textfyre.UI.Current.Font.FontType.Main, Title);
            Title.FontSize = 12d;
           
        }
    }
}
