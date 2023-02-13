using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DebugAppn
{
    class Program
    {
        static void Main(string[] args)
        {
            // A.
            // An integer is local.
            int num = 1;
            num++;

            // B.
            // A string is local.
            string dog = "cute";
            dog = dog + " animal";

            // C.
            // An array is local.
            bool[] b = new bool[]
            {
                true,
                false,
                true,
                true
            };

            for (int i = 0; i <= 3; i++)
            {
                if (b[i] == true)
                {
                    Console.WriteLine(i.ToString() + " true");
                }
            };
            Console.ReadKey();
        }
    }
}
