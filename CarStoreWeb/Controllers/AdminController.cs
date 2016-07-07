using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarStoreService;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using CarStoreViewModels;
using System.IO;

namespace CarStoreWeb.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        IProductService productService;

        public AdminController()
        {
            productService = new ProductService();
        }

        public AdminController(IProductService service)
        {
            productService = service;
        }

        public ActionResult Products()
        {
            ViewData["categories"] = productService.GetCategories();
            ViewData["defaultCategory"] = productService.GetCategories().First();
            ViewData["materials"] = productService.GetMaterials();
            ViewData["defaultMaterial"] = productService.GetMaterials().First();
            return View();
        }

        public ActionResult Read([DataSourceRequest] DataSourceRequest request)
        {
            return Json(productService.Read().ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([DataSourceRequest] DataSourceRequest request, ProductViewModel product, string filename)
        {
            if (product != null && ModelState.IsValid)
            {
                if (filename != null)
                {
                    product.ImageGUID = filename;
                }
                productService.Create(product);
            }

            return Json(new[] { product }.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update([DataSourceRequest] DataSourceRequest request, ProductViewModel product, string filename)
        {
            if (product != null && ModelState.IsValid)
            {
                if (filename != null)
                {
                    product.ImageGUID = filename;
                }
                productService.Update(product);
            }

            return Json(new[] { product }.ToDataSourceResult(request, ModelState));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Destroy([DataSourceRequest] DataSourceRequest request, ProductViewModel product)
        {
            if (product != null)
            {
                productService.Destroy(product);
            }

            return Json(new[] { product }.ToDataSourceResult(request, ModelState));
        }
        
        public ActionResult Save(IEnumerable<HttpPostedFileBase> files)
        {
            HttpPostedFileBase file = files.First();
            if (file != null)
            {
                var fileName = Path.GetFileName(Guid.NewGuid().ToString() + ".jpg");
                var physicalPath = Path.Combine(Server.MapPath("~/Content/Images"), fileName);

                file.SaveAs(physicalPath);

                return Json(new { fileName = fileName }, "text/plain");
            }
            return Content("");
        }

        public ActionResult Remove(string[] fileNames)
        {
            if (fileNames != null)
            {
                foreach (var fullName in fileNames)
                {
                    var fileName = Path.GetFileName(fullName);
                    var physicalPath = Path.Combine(Server.MapPath("~/Content/Images"), fileName);

                    if (System.IO.File.Exists(physicalPath))
                    {
                        System.IO.File.Delete(physicalPath);
                    }
                }
            }
            // Return an empty string to signify success
            return Content("");
        }
    }
}