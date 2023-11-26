using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Enrolment_System
{
    [DataContract]
    public class Student
    {
        [DataMember]
        public string studentId { get; set; }
        [DataMember]
        public string studentName { get; set; }
        [DataMember]
        public DateTime dateEnrolled { get; set; }
    }
}