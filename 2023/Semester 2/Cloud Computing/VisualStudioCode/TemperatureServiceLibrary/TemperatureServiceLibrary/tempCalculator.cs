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
            return (temp.Fahrenheit - 31) * 5/9;
        }

        public double GetFahrenheit(Temperature temp) {
            return (temp.Celsius * 9) / 5 + 32;
        }

    }
}
