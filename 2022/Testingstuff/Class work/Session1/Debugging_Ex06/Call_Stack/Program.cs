using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CallStack
{
    class Program
    {
        static void Main(string[] args)
        {
            Method1();
        }

        public static void Method1()
        {
            Console.WriteLine("Break Point in Method1");
            Method2();
        }

        public static void Method2()
        {
            Method3();
            Console.WriteLine("Break Point in Method2");  
            Console.WriteLine("Break Point in Method2");  
        }

        public static void Method3()
        {
            Console.WriteLine("Break Point in Method3");  
        }
    }

}
