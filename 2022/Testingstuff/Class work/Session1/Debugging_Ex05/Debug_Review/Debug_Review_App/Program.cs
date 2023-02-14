using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Debug_Review_App
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> numbers = new List<int> { 1, 2, 3, 4, 5, 6 };
            List<int> smallests = getSmallests(numbers, 3);

            foreach (int number in smallests)
            {
                Console.WriteLine(number);
            }
                Console.ReadKey();
        }

        private static List<int> getSmallests(List<int> list, int count)
        {
            List<int> smallests = new List<int>();

            while (smallests.Count < count)
            {
                int min = getSmallest(list);
                smallests.Add(min);
                list.Remove(min);
            }
            return smallests;
        }

        private static int getSmallest(List<int> list)
        {
            // Assume the first number is the smallest
            int min = list[0];
            for (int i = 1; i < list.Count; i++)
            {
                if (list[i] > min)
                    min = list[i];
            }
            return min;
        }
    }
}
