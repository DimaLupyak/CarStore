using CarStoreViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStoreViewModels
{
    public class Cart
    {
        private List<CartLine> lineCollection = new List<CartLine>();

        public void AddItem(ProductViewModel product, int quantity)
        {
            CartLine line = lineCollection
                .Where(g => g.Product.ID == product.ID)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartLine
                {
                    Product = product,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
            }
        }

        public void RemoveLine(ProductViewModel product)
        {
            lineCollection.RemoveAll(l => l.Product.ID == product.ID);
        }

        public double ComputeTotalValue()
        {
            return lineCollection.Sum(p => p.Product.Price * p.Quantity);

        }
        public void Clear()
        {
            lineCollection.Clear();
        }

        public IEnumerable<CartLine> Lines
        {
            get { return lineCollection; }
        }
    }

    public class CartLine
    {
        public ProductViewModel Product { get; set; }
        public int Quantity { get; set; }
    }
}
