using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Zifmia.Service.Controller;
using Zifmia.Model;

namespace Textfyre.Website.Controllers
{
    public class ValidationController : Controller
    {
        //
        // GET: /Validation/

        public ActionResult Index(string validationId)
        {
            ZifmiaController controller = new ZifmiaController();
            ZifmiaStatus status = controller.ValidatePlayer(validationId);

            return View(status);
        }

    }
}
