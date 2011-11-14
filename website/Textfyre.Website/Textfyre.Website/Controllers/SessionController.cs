using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Textfyre.Website.Controllers
{
    /// <summary>
    /// /{game name}/           - This will determine if the user has already a session running. If so, that session will be loaded, otherwise a new session will be started.
    /// /{game name}/{command}  - This will send a command to current session.
    /// </summary>
    public class SessionController : Controller
    {
        //
        // GET: /Session/

        public ActionResult Index(string game, string command)
        {
            return View();
        }

    }
}
