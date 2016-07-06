using System;
using System.Collections.Generic;
using CarStoreBusinessLogic;
using CarStoreViewModels;

namespace CarStoreService
{
    public class ProductService : IProductService
    {
        IProductRepository productsRepository;

        public ProductService()
        {
            productsRepository = ProductRepository.Instance;
        }

        public ProductService(IProductRepository repository)
        {
            productsRepository = repository;
        }

        public void Create(ProductViewModel item)
        {
            throw new NotImplementedException();
        }

        public void Destroy(ProductViewModel item)
        {
            throw new NotImplementedException();
        }

        public List<ProductCategoryViewModel> GetCategories()
        {
            throw new NotImplementedException();
        }

        public List<ProductMaterialViewModel> GetMaterials()
        {
            throw new NotImplementedException();
        }

        public List<ProductViewModel> Read()
        {
            throw new NotImplementedException();
        }

        public void Update(ProductViewModel item)
        {
            throw new NotImplementedException();
        }
    }
}
