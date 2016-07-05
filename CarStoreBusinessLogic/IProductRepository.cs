using CarStoreDataBaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStoreBusinessLogic
{
    interface IProductRepository
    {
        void Create(Product item);
        List<Product> Read();
        void Update(Product item);
        void Destroy(Product item);
        List<ProductCategory> GetCategories();
        List<ProductMaterial> GetMaterials();
    }
}
