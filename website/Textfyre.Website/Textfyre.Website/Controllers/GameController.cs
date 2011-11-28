using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Zifmia.Model;
using Zifmia.Service.Controller;
using Textfyre.Website.Models;

namespace Textfyre.Website.Controllers
{
    public class GameController : Controller
    {
        //
        // GET: /Game/{Game}
        public ActionResult Index(string game)
        {
            ZifmiaController zController = new ZifmiaController();

            ZifmiaGame zGame = zController.GetGameByName(game);

            GameViewData viewData = new GameViewData();
            viewData.Key = zGame.Key;
            viewData.Name = game;
            viewData.Title = zGame.Title;
            viewData.Author = "anonymous";
            viewData.Platform = "Inform 7";
            viewData.ImageURL = "~/Content/cloak-tile.png";
            viewData.Keywords = "example";
            viewData.Description = "Cloak of Darkness is a simple example that demonstrates implementations using different Interactive Fiction development platforms.";

            return View(viewData);
        }

        public ActionResult Clean(string game)
        {
            ZifmiaController zController = new ZifmiaController();

            ZifmiaGame zGame = zController.GetGameByName(game);

            zGame.Clean();

            return View();
        }

    }
}
