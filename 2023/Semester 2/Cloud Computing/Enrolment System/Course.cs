using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Enrolment_System
{
    [DataContract]
    public class Course
    {
        [DataMember]
        public string courseId { get; set; }
        [DataMember]
        public string courseName { get; set; }
        [DataMember]
        public decimal cost { get; set; }
    }
}