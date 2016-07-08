using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CarStoreWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(null,
                "",
                new
                {
                    controller = "Home",
                    action = "Index"
                }
            );

            routes.MapRoute(null,
                "Admin",
                new
                {
                    controller = "Admin",
                    action = "Products"
                }
            );

            routes.MapRoute(null,
                "Product/List/",
                new
                {
                    controller = "Product",
                    action = "List",
                    category = (string)null,
                    page = 1
                }
            );

            routes.MapRoute(
                name: null,
                url: "Product/List/Page{page}",
                defaults: new { controller = "Product", action = "List", category = (string)null },
                constraints: new { page = @"\d+" }
            );

            routes.MapRoute(null,
                "Product/List/{category}",
                new { controller = "Product", action = "List", page = 1 }
            );

            routes.MapRoute(null,
                "Product/List/{category}/Page{page}",
                new { controller = "Product", action = "List" },
                new { page = @"\d+" }
            );

            routes.MapRoute(null, "{controller}/{action}");
        }
    }
}
