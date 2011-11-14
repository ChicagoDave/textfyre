using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Textfyre.Website.Models;

namespace Textfyre.Website.Controllers
{
    public class GameController : Controller
    {
        //
        // GET: /Game/Cloak/{Game}/{Tab}
        public ActionResult Index(string game, string tab)
        {
            GameViewData viewData = new GameViewData();
            viewData.Key = "Shadow";
            viewData.Title = "The Shadow in the Cathedral";
            viewData.Author = "Ian Finley and Jon Ingold";
            viewData.Platform = "Inform 7";
            viewData.ImageURL = "~/Content/shadow-tile.png";
            viewData.Keywords = "steampunk, adventure, edwardian, clocks";
            viewData.Description = "Klockwerk is a steampunk adventure set in an Edwardian world where Newtonian devices, specifically clocks, are worshipped.";

            return View(viewData);
        }

    }
}
