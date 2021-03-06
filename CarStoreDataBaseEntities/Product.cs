//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarStoreDataBaseEntities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.Purchases = new HashSet<Purchase>();
        }
    
        public int ID { get; set; }
        public string Model { get; set; }
        public string Brand { get; set; }
        public string Description { get; set; }
        public int CategoryID { get; set; }
        public int MaterialID { get; set; }
        public double Price { get; set; }
        public string ImageGUID { get; set; }
    
        public virtual ProductCategory ProductCategory { get; set; }
        public virtual ProductMaterial ProductMaterial { get; set; }
        public virtual ICollection<Purchase> Purchases { get; set; }
    }
}
