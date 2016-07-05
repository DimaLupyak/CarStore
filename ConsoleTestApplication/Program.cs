using System;
using CarStoreDataBaseEntities;
using CarStoreBusinessLogic;
namespace ConsoleTestApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            using (CarStoreDBEntities entities = new CarStoreDBEntities())
            {
                foreach (Product item in ProductRepository.Instance.Read())
                {
                    Console.WriteLine("{0}", item.Model);
                }
            }
            Console.ReadLine();
        }
    }
}
