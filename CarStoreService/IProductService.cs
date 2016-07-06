using CarStoreViewModels;
using System.Collections.Generic;
using System.ServiceModel;

namespace CarStoreService
{
    [ServiceContract]
    public interface IProductService
    {
        [OperationContract]
        void Create(ProductViewModel item);

        [OperationContract]
        List<ProductViewModel> Read();

        [OperationContract]
        void Update(ProductViewModel item);

        [OperationContract]
        void Destroy(ProductViewModel item);

        [OperationContract]
        List<ProductCategoryViewModel> GetCategories();

        [OperationContract]
        List<ProductMaterialViewModel> GetMaterials();
    }
}
