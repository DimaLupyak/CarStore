using CarStoreViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarStoreWeb.Models
{
    public class ProductListViewModel
    {
        public IEnumerable<ProductViewModel> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }
    }
}