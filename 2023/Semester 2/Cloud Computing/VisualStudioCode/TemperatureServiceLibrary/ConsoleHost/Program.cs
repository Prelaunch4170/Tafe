using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.Text;
using System.Threading.Tasks;
using TemperatureServiceLibrary;

namespace ConsoleHost
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Uri baseAdddress = new Uri("http://localhost:8733/tempCalculatorTest");
            ServiceHost selfHost = new ServiceHost(typeof(tempCalculator), baseAdddress);

            try
            {
                selfHost.AddServiceEndpoint(typeof(ItempCalculator), new WSHttpBinding(), "tempCalculator");

                ServiceMetadataBehavior smb = new ServiceMetadataBehavior();
                smb.HttpGetEnabled = true;
                selfHost.Description.Behaviors.Add(smb);

                selfHost.Open();
                Console.WriteLine("The Service is Reddy");


                Console.ReadLine();
                selfHost.Close();
            }catch (Exception ex)
            {
                Console.WriteLine("Exception occured: ",ex.ToString());
                selfHost.Abort();
            }
        }
    }
}
