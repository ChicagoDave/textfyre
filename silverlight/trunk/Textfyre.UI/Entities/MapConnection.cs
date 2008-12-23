using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Linq;
using System.Linq;
using System.Collections.Generic;

namespace Textfyre.UI.Entities
{
    public class MapConnection
    {
                #region :: Name ::
        private string _name;
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
        #endregion

        #region :: StartLocation ::
        private string _startLocation;
        public string StartLocation
        {
            get
            {
                return _startLocation;
            }
            set
            {
                _startLocation = value;
            }
        }
        #endregion

        #region :: EndLocation ::
        private string _endLocation;
        public string EndLocation
        {
            get
            {
                return _endLocation;
            }
            set
            {
                _endLocation = value;
            }
        }
        #endregion

        #region :: ForwardCommand ::
        private string _forwardCommand;
        public string ForwardCommand
        {
            get
            {
                return _forwardCommand;
            }
            set
            {
                _forwardCommand = value;
            }
        }
        #endregion

        #region :: BackwardCommand ::
        private string _backwardCommand;
        public string BackwardCommand
        {
            get
            {
                return _backwardCommand;
            }
            set
            {
                _backwardCommand = value;
            }
        }
        #endregion

        #region :: IsOneWay ::
        private bool _isOneWay;
        public bool IsOneWay
        {
            get
            {
                return _isOneWay;
            }
            set
            {
                _isOneWay = value;
            }
        }
        #endregion

        #region :: ConnectionType ::
        private Entities.MapConnectionType _connectionType;
        public Entities.MapConnectionType ConnectionType
        {
            get
            {
                return _connectionType;
            }
            set
            {
                _connectionType = value;
            }
        }
        #endregion

        #region :: StartConnectionCorner ::
        private Entities.MapConnectionCorner _startConnectionCorner;
        public Entities.MapConnectionCorner StartConnectionCorner
        {
            get
            {
                return _startConnectionCorner;
            }
            set
            {
                _startConnectionCorner = value;
            }
        }
        #endregion

        #region :: EndConnectionCorner ::
        private Entities.MapConnectionCorner _endConnectionCorner;
        public Entities.MapConnectionCorner EndConnectionCorner
        {
            get
            {
                return _endConnectionCorner;
            }
            set
            {
                _endConnectionCorner = value;
            }
        }
        #endregion

        /*
            <Connection Name="C000" Start="OuterMarketRoof" End="Alley"
						Forwards="down" Backwards="up" Type="UpDown"
						Map.Top="74" Map.Left="39" DeltaX="0" DeltaY="30"/>
    
         */

        public Controls.Mapping.Connection UIControl;

        public MapConnection( XElement connection )
        {
            UIControl = new Textfyre.UI.Controls.Mapping.Connection();
            
            Name = connection.Attribute("Name").Value;
            StartLocation = connection.Attribute("Start").Value;
            EndLocation = connection.Attribute("End").Value;
            ForwardCommand = connection.Attribute("Forwards").Value;
            

            IEnumerable<XAttribute> atts = connection.Attributes();
            foreach (XAttribute att in atts)
            {
                switch (att.Name.LocalName)
                {
                    case "OneWay" :
                        IsOneWay = Boolean.Parse(connection.Attribute("OneWay").Value);
                        break;
                    
                    case "Backwards" :
                        BackwardCommand = connection.Attribute("Backwards").Value;
                        break;

                    case "Type":
                        string type = connection.Attribute("Type").Value;
                        ConnectionType = ((MapConnectionType)Enum.Parse(typeof(MapConnectionType), type, true));
                        break;
                    case "StartCorner":
                        string startCorner = connection.Attribute("StartCorner").Value;
                        StartConnectionCorner = ((MapConnectionCorner)Enum.Parse(typeof(MapConnectionCorner), startCorner, true));
                        break;
                    case "EndCorner":
                        string endCorner = connection.Attribute("EndCorner").Value;
                        EndConnectionCorner = ((MapConnectionCorner)Enum.Parse(typeof(MapConnectionCorner), endCorner, true));
                        break;
                }
            }

            UIControl.MapConnectionType = ConnectionType;
        }
    }
}
