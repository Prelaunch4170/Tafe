using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BreakPoints
{
    class Program
    {
        static void Main(string[] args)
        {
            int num1 = 0;
            Method1();
            Console.WriteLine("We are in Main Windows");
        }

        public static void Method1()
        {
            Console.WriteLine("Break Point in Method1");
            Method1();
        }

    }
}
