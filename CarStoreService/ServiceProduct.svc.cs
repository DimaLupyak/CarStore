using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CarStoreService
{
    public class ServiceProduct : IServiceProduct
    {
        public string GetData(int id)
        {
            return string.Format("You entered: {0}", id);
        }
    }
}
