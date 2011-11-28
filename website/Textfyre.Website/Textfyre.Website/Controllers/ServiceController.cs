using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

using Zifmia.Service.Controller;
using Zifmia.Model;

namespace Textfyre.Website.Controllers
{
    public class ServiceController : Controller
    {
        private ZifmiaController _controller = new ZifmiaController();

        // Register/{username}/{password}/{nickName}/{emailAddress}
        public JsonResult Register(string username, string password, string nickName, string emailAddress)
        {
            ZifmiaRegistrationViewModel viewModel = null;
            try
            {
                viewModel = _controller.Register(username.ToLower(), password, nickName, emailAddress);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // Login/{username}/{password}
        public JsonResult Login(string username, string password)
        {
            ZifmiaLoginViewModel viewModel = null;
            try
            {
                viewModel = _controller.Login(username.ToLower(), password);
            }
            catch (Exception ex)
            {
                WriteException(ex);
                viewModel = new ZifmiaLoginViewModel();
                viewModel.Message = ex.Message;
                viewModel.Status = ZifmiaStatus.Failure;
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // IsAuthorized/{authKey}
        public JsonResult IsAuthorized(string authKey)
        {
            ZifmiaLoginViewModel viewModel = null;
            try
            {
                viewModel = _controller.IsAuthorized(authKey);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel,JsonRequestBehavior.AllowGet);
        }

        public JsonResult ValidatePlayer(string validationId)
        {
            ZifmiaStatus status = ZifmiaStatus.Failure;
            try
            {
                status = _controller.ValidatePlayer(validationId);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(status, JsonRequestBehavior.AllowGet);
        }

        // SessionStart/{authKey}/{gameKey}
        public JsonResult SessionStart(string authKey, string gameKey)
        {
            ZifmiaViewModel viewModel = null;
            try
            {
                viewModel = _controller.StartSession(authKey, gameKey);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // SessionGet/{authKey}/{sessionKey}
        public JsonResult SessionGet(string authKey, string sessionKey)
        {
            ZifmiaViewModel viewModel = null;
            try
            {
                viewModel = _controller.GetSession(authKey, sessionKey);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // SessionHistory/{authKey}/{sessionKey}/{branchid}/{turn}
        public JsonResult SessionHistory(string authKey, string sessionKey, string branchId, string turn)
        {
            ZifmiaViewModel viewModel = null;
            try
            {
                viewModel = _controller.GetSession(authKey, sessionKey, Convert.ToInt32(branchId), Convert.ToInt32(turn));
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // SessionCommand/{authKey}/{sessionKey}/{branchId}/{turn}/{command}
        public JsonResult SessionCommand(string authKey, string sessionKey, string branchId, string turn, string command)
        {
            ZifmiaViewModel viewModel = null;
            try
            {
                viewModel = _controller.SendCommand(authKey, sessionKey, Convert.ToInt64(branchId), Convert.ToInt32(turn), command);
                viewModel.BranchesViewHtml = RenderPartialViewToString("Branches", viewModel.Branches);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        // UserSessionList/{authKey}
        public JsonResult UserSessionList(string authKey)
        {
            ZifmiaSessionsViewModel viewModel = null;
            try
            {
                viewModel = _controller.GetSessionsByPlayer(authKey);
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return Json(viewModel, JsonRequestBehavior.AllowGet);
        }

        public ZifmiaGamesViewModel Games()
        {
            ZifmiaGamesViewModel viewModel = null;
            try
            {
                viewModel = _controller.GetInstalledGames();
            }
            catch (Exception ex)
            {
                WriteException(ex);
            }

            return viewModel;
        }

        protected string RenderPartialViewToString(string viewName, object model)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");

            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                ViewContext viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }
        
        private void WriteException(Exception ex)
        {
            System.Diagnostics.EventLog ev = new System.Diagnostics.EventLog();
            if (!System.Diagnostics.EventLog.SourceExists("Zifmia"))
                System.Diagnostics.EventLog.CreateEventSource(
                   "Zifmia", "Application");

            ev.Source = "Zifmia";
            ev.WriteEntry(string.Concat("Database: ", ex.Message));
        }

    }
}
