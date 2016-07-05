using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CarStoreDataBaseEntities;
using CarStoreBusinessLogic;
namespace CarStoreService
{
    public class ProductService : IProductService
    {
        public List<Product> GetAllProducts()
        {
            return ProductRepository.Instance.Read();
        }

        public string GetData(int id)
        {
            return string.Format("You entered: {0}", id);
        }

        public Product GetProduct(int id)
        {
            return ProductRepository.Instance.Read().Where(e => e.ID == id).SingleOrDefault();
        }
    }
}
