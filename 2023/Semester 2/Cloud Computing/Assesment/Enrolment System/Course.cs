using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
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
        public double cost { get; set; }
    }
}
