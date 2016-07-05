using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CarStoreDataBaseEntities;
using System.Data;

namespace CarStoreBusinessLogic
{
    class ProductRepository : IProductRepository
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
        public void Create(Product item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                entities.Products.Add(item);
                entities.SaveChanges();
            }
        }
        public List<Product> Read()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                return entities.Products.ToList();
            }
        }
        public void Update(Product item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                entities.Products.Attach(item);
                entities.Entry(item).State = EntityState.Modified;
                entities.SaveChanges();
            }
        }
        
        public void Destroy(Product item)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                entities.Products.Attach(item);
                entities.Products.Remove(item);
                entities.SaveChanges();
            }
        }
        #endregion

        public List<ProductCategory> GetCategories()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                return entities.ProductCategories.ToList();
            }
        }
        public List<ProductMaterial> GetMaterials()
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                return entities.ProductMaterials.ToList();
            }
        } 
    }
}
