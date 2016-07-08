using CarStoreService;
using CarStoreViewModels;
using CarStoreWeb.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CarStoreWeb.Controllers
{
    public class CartController : Controller
    {
        private IProductService productService;
        private IOrderProcessor orderProcessor;

        public CartController()
        {
            productService = new ProductService();
            orderProcessor = new EmailOrderProcessor(new EmailSettings());
        }
        public CartController(IOrderProcessor processor)
        {
            productService = new ProductService();
            orderProcessor = processor;
        }
        public CartController(IProductService service, IOrderProcessor processor)
        {
            productService = service;
            orderProcessor = processor;
        }
        public ViewResult Index(Cart cart)
        {
            return View(new CartIndexViewModel
            {
                Cart = cart
            });
        }

        public RedirectToRouteResult AddToCart(Cart cart, int productId)
        {
            ProductViewModel product = productService.Read()
                .FirstOrDefault(p => p.ID == productId);

            if (product != null)
            {
                cart.AddItem(product, 1);
            }
            return RedirectToAction("Index");
        }

        public RedirectToRouteResult RemoveFromCart(Cart cart, int productId)
        {
            ProductViewModel product = productService.Read()
                .FirstOrDefault(p => p.ID == productId);

            if (product != null)
            {
                cart.RemoveLine(product);
            }
            return RedirectToAction("Index");
        }
        public PartialViewResult Summary(Cart cart)
        {
            return PartialView(cart);
        }

        public ViewResult Checkout()
        {
            return View(new ShippingDetails());
        }

        [HttpPost]
        public ViewResult Checkout(Cart cart, ShippingDetails shippingDetails)
        {
            if (ModelState.IsValid)
            {
                orderProcessor.ProcessOrder(cart, shippingDetails);
                cart.Clear();
                return View("Completed");
            }
            else
            {
                return View(shippingDetails);
            }
        }
    }
}
