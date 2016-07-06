using CarStoreViewModels;
using System.Collections.Generic;

namespace CarStoreBusinessLogic
{
    public interface IProductRepository
    {
        void Create(ProductViewModel item);
        List<ProductViewModel> Read();
        void Update(ProductViewModel item);
        void Destroy(ProductViewModel item);
        List<ProductCategoryViewModel> GetCategories();
        List<ProductMaterialViewModel> GetMaterials();
    }
}
