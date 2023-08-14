using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Project1
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "HelloWorldService" in both code and config file together.
    public class HelloWorldService : IHelloWorldService
    {
        public String SayHello(Name person)
        {
            return string.Format("Hello {0} {1}", person.FirstName, person.LastName);
        }
    }
}
