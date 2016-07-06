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
            productsRepository.Create(item);
        }
        public List<ProductViewModel> Read()
        {
            return productsRepository.Read();
        }
        public void Update(ProductViewModel item)
        {
            productsRepository.Update(item);
        }

        public void Destroy(ProductViewModel item)
        {
            productsRepository.Destroy(item);
        }

        public List<ProductCategoryViewModel> GetCategories()
        {
            return productsRepository.GetCategories();
        }

        public List<ProductMaterialViewModel> GetMaterials()
        {
            return productsRepository.GetMaterials();
        }
    }
}
