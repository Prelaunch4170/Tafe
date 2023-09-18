using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using System.ServiceModel.Description;
using blogging;


namespace BlogServiceHost
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Uri baseAddress = new Uri("http://localhost:8733/blogging");

            ServiceHost selfHost = new ServiceHost(typeof(BloggingService) ,baseAddress);

            try
            {
                selfHost.AddServiceEndpoint(typeof(IBloggingService), new WSHttpBinding(), "blogging.BloggingService");

                ServiceMetadataBehavior smb = new ServiceMetadataBehavior();
                smb.HttpGetEnabled = true;
                selfHost.Description.Behaviors.Add(smb);

                selfHost.Open();
                Console.WriteLine("The Service is ready");
                Console.WriteLine("Press <Enter> to terminate the service.");
                Console.WriteLine("");
                Console.ReadLine();
            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                selfHost.Abort();
            }
        }
    }
}
