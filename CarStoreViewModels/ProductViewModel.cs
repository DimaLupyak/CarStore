using System.ComponentModel.DataAnnotations;

namespace CarStoreViewModels
{
    public class ProductViewModel
    {
        [ScaffoldColumn(false)]
        public int ID { get; set; }

        [Required]
        public string Model { get; set; }

        [Required]
        public string Brand { get; set; }

        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public ProductCategoryViewModel Category { get; set; }

        [Required]
        [Display(Name = "Category")]
        [UIHint("Category")]
        public int CategoryID { get; set; }
        
        public ProductMaterialViewModel Material { get; set; }

        [Required]
        [Display(Name = "Scale")]
        [UIHint("Material")]
        public int MaterialID { get; set; }

        [Required]
        public double Price { get; set; }

        [Display(Name = "Image")]
        [UIHint("Image")]
        public string ImageGUID { get; set; }
    }
}
