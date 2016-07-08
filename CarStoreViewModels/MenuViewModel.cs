using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStoreViewModels
{
    public class MenuViewModel
    {
        public IEnumerable<string> Categories { get; set; }
        public IEnumerable<string> Materials { get; set; }
    }
}
