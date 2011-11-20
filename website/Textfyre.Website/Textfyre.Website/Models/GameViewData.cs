using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Textfyre.Website.Models
{
    public class GameViewData
    {
        public string Key { get; set; }
        public string Title { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public string Platform { get; set; }
        public string ImageURL { get; set; }
        public string Keywords { get; set; }
        public string Description { get; set; }
    }
}