using System.Collections.Generic;
using System.Linq;
using CarStoreDataBaseEntities;
using System.Data;
using CarStoreViewModels;

namespace CarStoreBusinessLogic
{
    public class ProductRepository : IProductRepository
    {
        #region Singleton
        protected static ProductRepository instance = null;
        public static ProductRepository Instance
        {
            get
            {
                if (instance == null)
                    instance = new ProductRepository();
                return instance;

            }
        }
        #endregion
        #region Constructors
        protected ProductRepository() { }
        #endregion
        #region IChallengeRepository CRUD Methods
        public void Create(ProductViewModel item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var product = new Product();
                product.Brand = item.Brand;
                product.Model = item.Model;
                product.Price = item.Price;
                product.Description = item.Description;
                product.ImageGUID = item.ImageGUID;
                product.CategoryID = item.CategoryID;
                product.MaterialID = item.MaterialID;
                entities.Products.Add(product);
                entities.SaveChanges();
                item.ID = product.ID;
            }
        }
        public List<ProductViewModel> Read()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var products = (from a in entities.Products
                                select new ProductViewModel
                                {
                                    ID = a.ID,
                                    Model = a.Model,
                                    Price = a.Price,
                                    Description = a.Description,
                                    ImageGUID = a.ImageGUID,
                                    CategoryID = a.CategoryID,
                                    MaterialID = a.MaterialID,
                                    Category = new ProductCategoryViewModel()
                                    {
                                        ID = a.ProductCategory.CategoryID,
                                        Name = a.ProductCategory.CategoryName
                                    },
                                    Material = new ProductMaterialViewModel()
                                    {
                                        ID = a.ProductMaterial.MaterialID,
                                        Name = a.ProductMaterial.MaterialName
                                    }
                                }).ToList();
                return products;
            }
        }

        public void Update(ProductViewModel item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var product = new Product();
                product.ID = item.ID;
                product.Brand = item.Brand;
                product.Model = item.Model;
                product.Price = item.Price;
                product.Description = item.Description;
                product.ImageGUID = item.ImageGUID;
                product.CategoryID = item.CategoryID;
                product.MaterialID = item.MaterialID;
                entities.Products.Attach(product);
                entities.Entry(product).State = EntityState.Modified;
                entities.SaveChanges();
            }
        }

        public void Destroy(ProductViewModel item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var product = new Product();
                product.ID = item.ID;
                entities.Products.Attach(product);
                entities.Products.Remove(product);
                entities.SaveChanges();
            }
        }
        #endregion

        public List<ProductCategoryViewModel> GetCategories()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var categories = (from a in entities.ProductCategories
                                  select new ProductCategoryViewModel
                                  {
                                      ID = a.CategoryID,
                                      Name = a.CategoryName,
                                  }).ToList();
                return categories;
            }
        }
        public List<ProductMaterialViewModel> GetMaterials()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                var materials = (from a in entities.ProductMaterials
                                  select new ProductMaterialViewModel
                                  {
                                      ID = a.MaterialID,
                                      Name = a.MaterialName,
                                  }).ToList();
                return materials;
            }
        }
    }
}
