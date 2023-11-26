using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
namespace Enrolment_System
{
    [DataContract]

    public class Enrollment
    {
        [DataMember]
        public string studentId { get; set; }
        [DataMember]
        public string courseID { get; set; }
        [DataMember]
        public string grade { get; set; }

    }
}