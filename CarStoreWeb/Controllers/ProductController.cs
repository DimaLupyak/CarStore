using CarStoreService;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CarStoreWeb.Controllers
{
    public class ProductController : Controller
    {
        IProductService productService;

        public ProductController()
        {
            productService = new ProductService();
        }

        public ProductController(IProductService service)
        {
            productService = service;
        }

        // GET: Product
        public ActionResult Gallery()
        {
            return View(productService.Read());
        }
        public ActionResult Products_Read([DataSourceRequest] DataSourceRequest request)
        {
            return Json(productService.Read().ToDataSourceResult(request));
        }

        public ActionResult List()
        {
            return View(productService.Read());
        }
    }
}