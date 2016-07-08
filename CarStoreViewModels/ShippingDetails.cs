using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStoreViewModels
{
    public class ShippingDetails
    {
        [Required(ErrorMessage = "Enter your name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Enter the shipping address")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Enter city")]
        public string City { get; set; }

        [Required(ErrorMessage = "Enter country")]
        public string Country { get; set; }

        public bool GiftWrap { get; set; }
    }
}
