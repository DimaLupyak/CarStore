using CarStoreService;
using CarStoreViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CarStoreWeb.Controllers
{
    public class CartController : Controller
    {
        IProductService productService;
        public int pageSize = 4;

        public CartController()
        {
            productService = new ProductService();
        }

        public CartController(IProductService service)
        {
            productService = service;
        }
        public ViewResult Index(Cart cart, string returnUrl)
        {
            return View(new CartIndexViewModel
            {
                Cart = cart,
                ReturnUrl = returnUrl
            });
        }

        public RedirectToRouteResult AddToCart(Cart cart, int productId, string returnUrl)
        {
            ProductViewModel product = productService.Read()
                .FirstOrDefault(p => p.ID == productId);

            if (product != null)
            {
                cart.AddItem(product, 1);
            }
            return RedirectToAction("Index", new { returnUrl });
        }

        public RedirectToRouteResult RemoveFromCart(Cart cart, int productId, string returnUrl)
        {
            ProductViewModel product = productService.Read()
                .FirstOrDefault(p => p.ID == productId);

            if (product != null)
            {
                cart.RemoveLine(product);
            }
            return RedirectToAction("Index", new { returnUrl });
        }
        public PartialViewResult Summary(Cart cart)
        {
            return PartialView(cart);
        }
    }
}
