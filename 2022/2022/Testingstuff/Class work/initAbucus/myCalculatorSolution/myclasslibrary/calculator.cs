using System;

namespace myclasslibrary
{
    public class calculator
    {
        public decimal result;

        // Addition method
        public decimal Add(decimal a, decimal b)
        {
            result = a + b;
            return result;
        }

        // Subtraction method
        public decimal Subtract(decimal a, decimal b)
        {
            result = a - b;
            return result;
        }

        //Multiplication method
        public decimal Multi(decimal a, decimal b)
        {
            result = a * b;
            return result;
        }

        //division method
        public decimal Div(decimal a, decimal b)
        {
            result = a / b;
            return result;
        }

    }
}
