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
using System.Collections.Generic;

namespace Textfyre.UI.Entities
{
    public class MapLocationCollection : List<MapLocation>
    {
        public MapLocation GetMapLocationByName(string name)
        {
            foreach (MapLocation location in this)
            {
                if (location.Name == name)
                    return location;
            }

            return null;
        }

        public MapLocation GetMapLocationByLocationName(string locationName)
        {
            foreach (MapLocation location in this)
            {
                if (location.LocationName == locationName)
                    return location;
            }

            return null;
        }
    }
}
