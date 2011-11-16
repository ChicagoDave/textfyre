using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Zifmia.Model;
using Zifmia.Service.Controller;

namespace Textfyre.Website.Controllers
{
    /// <summary>
    /// /{game name}/           - This will determine if the user has already a session running. If so, that session will be loaded, otherwise a new session will be started.
    /// /{game name}/{command}  - This will send a command to current session.
    /// </summary>
    public class SessionController : Controller
    {
        //
        // GET: /Session/GameKey
        //
        public ActionResult Index(string gameKey, string command)
        {
            ZifmiaController zController = new ZifmiaController();

            //
            //  1. Validate Game Key
            //
            ZifmiaGamesViewModel gamesData = zController.GetInstalledGames();
            ZifmiaGame game = (from ZifmiaGame g in gamesData.Games where g.Key == gameKey select g).FirstOrDefault<ZifmiaGame>();
            if (game == null)
            {
                return View("BadGameKey");
            }

            //
            //  2. Get cookies, these tell us what's up with the player's status with the requested game.
            //
            ZifmiaState state = new ZifmiaState(Request);

            //
            //  3. If the player is not authorized, login as guest. This allows limited demo play.
            //
            if (state.AuthKey == "") {
                ZifmiaLoginViewModel loginData = zController.Login("guest","guest");

                Response.Cookies.Add(new HttpCookie("zifmiaAuthKey", loginData.AuthKey));
                state.AuthKey = loginData.AuthKey;
                state.LoginData = loginData;
            }

            ZifmiaViewModel viewData = new ZifmiaViewModel();

            if (state.SessionKey == "")
            {
                //
                //  4. If the user does not have a working session, start a new session.
                //
                viewData = zController.StartSession(state.AuthKey, gameKey);
            }
            else
            {
                //
                //  5. Otherwise, send the given command into the current session.
                //
                viewData = zController.SendCommand(state.AuthKey, state.SessionKey, state.BranchId, state.Turn, command);
            }

            return View(viewData);
        }

    }
}
