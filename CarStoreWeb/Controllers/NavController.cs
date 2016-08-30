using CarStoreService;
using CarStoreViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CarStoreWeb.Controllers
{
    public class NavController : Controller
    {
        IProductService productService;
        public int pageSize = 4;

        public NavController()
        {
            productService = new ProductService();
        }

        public NavController(IProductService service)
        {
            productService = service;
        }

        public PartialViewResult Menu(string category = null, string material = null)
        {
            MenuViewModel menu = new MenuViewModel
            {
                Categories = productService.Read().
                    Where(p => (material == null) ? true : p.Material.Name == material).
                    Select(p => p.Category.Name).Distinct(),
                Materials = productService.Read().
                    Where(p => (category == null) ? true : p.Category.Name == category).
                    Select(p => p.Material.Name).Distinct().Reverse(),
            };
            ViewBag.SelectedCategory = category;
            ViewBag.SelectedMaterial = material;
            return PartialView(menu);
        }
    }
}
