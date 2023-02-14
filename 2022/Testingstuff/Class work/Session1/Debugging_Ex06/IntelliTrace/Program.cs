using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IntelliTrace
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("IntelliTrackerTest");
            CallTestMethod(5);
        }

        public static void CallTestMethod(int TestValue)
        {
            Console.WriteLine("In CallTestMethod : " + TestValue.ToString());
            Console.WriteLine("Last Statement....");
        }
    }

}
