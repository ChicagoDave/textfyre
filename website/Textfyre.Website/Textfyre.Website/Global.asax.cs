using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

using Textfyre.Website.Routing;

namespace Textfyre.Website
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Game", // Route name
                "Game/{game}/{tab}", // URL with parameters
                new { controller = "Game", action = "Index", game = UrlParameter.Optional, tab = "About" }, // Parameter defaults
                new { tab = new TabConstraint("About", "Details", "Related") }
            );

            routes.MapRoute(
                "Session", // Route name
                "Session/{game}/{command}", // URL with parameters
                new { controller = "Session", action = "Index", game = UrlParameter.Optional, command = UrlParameter.Optional } // Parameter defaults
            );

            // Register/{username}/{password}/{nickName}/{emailAddress}
            routes.MapRoute(
                "Register", // Route name
                "Register/{username}/{password}/{nickName}/{emailAddress}", // URL with parameters
                new { controller = "Service", action = "Register" } // Parameter defaults
            );

            // /Login/{username}/{password}
            routes.MapRoute(
                "Login", // Route name
                "Login/{username}/{password}", // URL with parameters
                new { controller = "Service", action = "Login" } // Parameter defaults
            );

            // IsAuthorized/{authKey}
            routes.MapRoute(
                "IsAuthorized", // Route name
                "IsAuthorized/{authKey}", // URL with parameters
                new { controller = "Service", action = "IsAuthorized" } // Parameter defaults
            );

            // SessionStart/{authKey}/{gameKey}
            routes.MapRoute(
                "SessionStart", // Route name
                "SessionStart/{authKey}/{gameKey}", // URL with parameters
                new { controller = "Service", action = "SessionStart" } // Parameter defaults
            );

            // Session/Get/{authKey}/{sessionKey}
            routes.MapRoute(
                "SessionGet", // Route name
                "SessionGet/{authKey}/{sessionKey}", // URL with parameters
                new { controller = "Service", action = "SessionGet" } // Parameter defaults
            );

            // SessionHistory/{authKey}/{sessionKey}/{branchid}/{turn}
            routes.MapRoute(
                "SessionHistory", // Route name
                "SessionHistory/{authKey}/{sessionKey}/{branchId}/{turn}", // URL with parameters
                new { controller = "Service", action = "SessionHistory" } // Parameter defaults
            );

            // SessionCommand/{authKey}/{sessionKey}/{branchId}/{turn}/{command}
            routes.MapRoute(
                "SessionCommand", // Route name
                "SessionCommand/{authKey}/{sessionKey}/{branchId}/{turn}/{command}", // URL with parameters
                new { controller = "Service", action = "SessionCommand" } // Parameter defaults
            );

            // UserSessionList/{authKey}
            routes.MapRoute(
                "UserSessionList", // Route name
                "UserSessionList/{authKey}", // URL with parameters
                new { controller = "Service", action = "UserSessionList" } // Parameter defaults
            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}