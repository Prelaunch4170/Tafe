using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Client1.HelloWorldServiceReferance;

namespace Client1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            HelloWorldServiceClient service = new HelloWorldServiceClient("WSHttpBinding_IHelloWorldService");
            Name person = new Name();
            person.FirstName = "John";
            person.LastName = "Smith";

            Console.WriteLine(service.SayHello(person));
            Console.ReadLine();
        }
    }
}
