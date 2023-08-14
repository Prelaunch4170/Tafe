using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    [DataContract]
    public class Name
    {
        [DataMember]
        public string FirstName;
        [DataMember]
        public string LastName;

    }
}
