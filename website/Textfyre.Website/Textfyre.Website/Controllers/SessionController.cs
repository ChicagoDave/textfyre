using System;
using System.Collections.Generic;
using System.Globalization;
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
        public ActionResult Index(string gameKey, string sessionKey, string command)
        {
            ZifmiaController zController = new ZifmiaController();

            //
            //  1. Validate Game Key
            //
            ZifmiaGamesViewModel gamesData = zController.GetInstalledGames();
            if (gamesData.Status == ZifmiaStatus.Failure)
            {
                return View("NoGames", "_SessionLayout");
            }

            long gameId = Int64.Parse(gameKey, NumberStyles.AllowHexSpecifier);
            if (!zController.VerifyGame(gameId))
            {
                return View("BadGameKey", "_SessionLayout");
            }

            //
            //  2. Get cookies, these tell us what's up with the player's status with the requested game.
            //
            ZifmiaState state = new ZifmiaState(Request);

            //
            //  3. If the player is not authorized, login as guest. This allows limited demo play.
            //
            if (state.AuthKey == "")
            {
                ZifmiaLoginViewModel loginData = zController.Login("guest", "guest");

                Response.Cookies.Add(new HttpCookie("zifmiaAuthKey", loginData.AuthKey));
                state.AuthKey = loginData.AuthKey;
                state.LoginData = loginData;

                // Guests cannot save sessions. When starting a game, all data is reset.
                state.SessionKey = "";
                state.BranchId = 1;
                state.Turn = 1;
            }
            else
            {
                ZifmiaPlayer player = zController.GetPlayerByAuth(state.AuthKey);

                if (player.Username == "guest")
                {
                    ZifmiaLoginViewModel loginData = zController.Login("guest", "guest");

                    Response.Cookies.Add(new HttpCookie("zifmiaAuthKey", loginData.AuthKey));
                    state.AuthKey = loginData.AuthKey;
                    state.LoginData = loginData;

                    // Guests cannot save sessions. When starting a game, all data is reset.
                    state.SessionKey = "";
                    state.BranchId = 1;
                    state.Turn = 1;
                }
            }

            ZifmiaViewModel viewData = new ZifmiaViewModel();

            if (state.SessionKey == "")
            {
                //
                //  4. If the user does not have a working session, start a new session.
                //
                viewData = zController.StartSession(state.AuthKey, gameKey);

                Response.Cookies.Add(new HttpCookie(gameKey + "_zifmiaSessionKey", viewData.SessionKey));
                Response.Cookies.Add(new HttpCookie(gameKey + "_zifmiaBranchId", viewData.BranchId.ToString()));
                Response.Cookies.Add(new HttpCookie(gameKey + "_zifmiaTurn", viewData.Turn.ToString()));
            }
            else
            {
                //
                //  5. Otherwise, send the given command into the current session.
                //
                viewData = zController.SendCommand(state.AuthKey, state.SessionKey, state.BranchId, state.Turn, command);
            }

            if (viewData.Status == ZifmiaStatus.Failure)
            {
                return View("SessionError", viewData);
            }

            return View("Index", "_SessionLayout", viewData);
        }

    }
}
