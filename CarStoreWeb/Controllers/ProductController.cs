using CarStoreService;
using CarStoreWeb.Models;
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
        public int pageSize = 4;

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

        public ActionResult List(string category, int page = 1)
        {
            ProductListViewModel model = new ProductListViewModel
            {
                Products = productService.Read()
                    .Where(product => category == null || product.Category.Name == category)
                    .OrderBy(product => product.ID)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize),
                PagingInfo = new PagingInfo
                {
                    CurrentPage = page,
                    ItemsPerPage = pageSize,
                    TotalItems = category == null ?
                        productService.Read().Count() :
                        productService.Read().Where(p => p.Category.Name == category).Count()
                },
                CurrentCategory = category
            };
            return View(model);
        }
    }
}