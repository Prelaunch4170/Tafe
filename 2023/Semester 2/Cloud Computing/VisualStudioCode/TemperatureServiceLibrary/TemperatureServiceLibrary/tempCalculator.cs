using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Security.Permissions;
using System.ServiceModel;
using System.Text;

namespace TemperatureServiceLibrary
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "tempCalculator" in both code and config file together.
    public class tempCalculator : ItempCalculator
    {

        public double GetCelsius(Temperature temp)
        {
            return Math.Round(((temp.Fahrenheit - 32) * 5/9), 2);
        }

        public double GetFahrenheit(Temperature temp) {
            return Math.Round(((temp.Celsius ) * (9/5) + 32), 2);
        }

    }
}
