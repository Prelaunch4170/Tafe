using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Enrolment_System
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IEnrollmentService" in both code and config file together.
    [ServiceContract]
    public interface IEnrollmentService
    {
        //Student Methods
        [OperationContract]
        string addStudent(string studentID, string studentName, DateTime enrollmentDate);
        [OperationContract]
        List<Student> getAllStudents();
        [OperationContract]
        List<Enrollment> viewStudentEnrollents(string studentID);
        [OperationContract]
        Student getStudentDetails(string studentID);




        //----------------------------------------------------
        //Course methods
        [OperationContract]
        List<Course> getAllCourses();
        [OperationContract]
        List<Enrollment> viewCourseEnrollents(string courseID);
        [OperationContract]
        decimal getCost(string courseID);
        [OperationContract]
        List<Course> getCourseList(string studentID);
        [OperationContract]
        string addCourse(string courseID, string courseName, decimal cost);

        [OperationContract]
        Course getCourseDetails(string courseID);

        //----------------------------------------------------
        //enrollment methods
        [OperationContract]
        List<Enrollment> getEnrollments();

        [OperationContract]
        string addEnrolment(string studentID, string courseID, string grade);
    }
}
