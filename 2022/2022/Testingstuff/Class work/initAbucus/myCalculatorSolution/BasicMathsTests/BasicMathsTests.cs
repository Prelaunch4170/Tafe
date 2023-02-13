using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace BasicMathsTests
{
    [TestFixture]
    public class BasicMathsTests
    {
        

        [Test]
        public void AddTwoNumbers()
        {
            MyCalculator.calculator calculator = new MyCalculator.calculator();

            Assert.AreEqual(8.0, calculator.Add(3, 5));

        }
    }
}
