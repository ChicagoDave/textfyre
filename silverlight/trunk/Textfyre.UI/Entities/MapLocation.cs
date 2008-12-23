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
    public class MapLocation
    {
        #region :: MapConnections ::
        private MapConnectionCollection _mapConnections;
        public MapConnectionCollection MapConnections
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

        #region :: LocationName ::
        private string _locationName;
        public string LocationName
        {
            get
            {
                return _locationName;
            }
            set
            {
                _locationName = value;
                UIControl.Title.Text = _locationName;
            }
        }
        #endregion

        #region :: MapLeft ::
        private double _mapLeft;
        public double MapLeft
        {
            get
            {
                return _mapLeft;
            }
            set
            {
                _mapLeft = value;
                Canvas.SetLeft(UIControl, _mapLeft);
            }
        }
        #endregion

        #region :: MapTop ::
        private double _mapTop;
        public double MapTop
        {
            get
            {
                return _mapTop;
            }
            set
            {
                _mapTop = value;
                Canvas.SetTop(UIControl, _mapTop);
            }
        }
        #endregion

        #region :: Width ::
        private double _width;
        public double Width
        {
            get
            {
                return _width;
            }
            set
            {
                _width = value;
                UIControl.Width = _width;
            }
        }
        #endregion

        #region :: Height ::
        private double _height;
        public double Height
        {
            get
            {
                return _height;
            }
            set
            {
                _height = value;
                UIControl.Height = _height;
            }
        }
        #endregion

        public Controls.Mapping.Location UIControl;

        public MapLocation( XElement location, MapConnectionCollection connections )
        {
            UIControl = new Textfyre.UI.Controls.Mapping.Location();
            _mapConnections = new MapConnectionCollection();
            
            Name = location.Attribute("Name").Value;
            LocationName = location.Attribute("LocationName").Value;

            double width = 80d;
            double height = 70d;

            IEnumerable<XAttribute> atts = location.Attributes();
            foreach (XAttribute att in atts)
            {
                if (att.Name == "Width")
                    width = Convert.ToDouble(location.Attribute("Width").Value);
                if (att.Name == "Height")
                    height = Convert.ToDouble(location.Attribute("Height").Value);
            }

            Width = width;
            Height = height;
            MapLeft = Convert.ToDouble(location.Attribute("Map.Left").Value)+ 200;
            MapTop = Convert.ToDouble(location.Attribute("Map.Top").Value) + 200;

            AddRelevantConnections(connections);
            UIControl.MapConnections = _mapConnections;
        }

        private void AddRelevantConnections( MapConnectionCollection connections )
        {
            foreach (MapConnection connection in connections)
            {
                if (connection.StartLocation == Name)
                {
                    _mapConnections.Add(connection);
                }
            }
        }

    }
}
