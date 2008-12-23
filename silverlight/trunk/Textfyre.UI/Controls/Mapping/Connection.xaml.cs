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
    public partial class Connection : UserControl
    {
        public Connection()
        {
            InitializeComponent();
        }

        public Entities.MapConnectionType MapConnectionType
        {
            set
            {
                DoubleCollection dc = new DoubleCollection();
                switch (value)
                {
                    default:
                    case Textfyre.UI.Entities.MapConnectionType.Normal:
                        dc.Add(100d);
                        dc.Add(100d);                            
                        break;
                    case Textfyre.UI.Entities.MapConnectionType.UpDown:
                        dc.Add(1.5d);
                        dc.Add(0.5d);
                        break;
                    case Textfyre.UI.Entities.MapConnectionType.InOut:
                        dc.Add(1);
                        dc.Add(1);
                        break;
                }

                ConnectionLine.StrokeDashArray = dc;
            }
        }
    }
}
