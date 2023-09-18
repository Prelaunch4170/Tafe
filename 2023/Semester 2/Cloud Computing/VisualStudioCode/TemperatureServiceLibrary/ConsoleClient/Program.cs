using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using ConsoleClient.TempCalcService;
namespace ConsoleClient
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Temperature temp = new Temperature();
            ItempCalculatorClient client = new ItempCalculatorClient();

            Console.WriteLine("Do you want Celsius or Fahrenheit [1 or 2]");
            string requestType = Console.ReadLine();
            if (requestType == "1")
            {
                Console.WriteLine("Enter Fahrenheit temp");
                temp.Fahrenheit = int.Parse(Console.ReadLine());
                Console.WriteLine(temp.Fahrenheit.ToString()+ "\xB0 F in Celsius is: " + client.GetCelsius(temp)+ "\xB0 C");
                Console.ReadLine();
            }
            else 
            {
                Console.WriteLine("Enter Celsius temp");
                temp.Celsius = int.Parse(Console.ReadLine());
                Console.WriteLine(temp.Celsius.ToString()+ "\xB0 C in Fahrenheit is: " + client.GetCelsius(temp) + "\xB0 F");
                Console.ReadLine();
            }

        }
    }
}
