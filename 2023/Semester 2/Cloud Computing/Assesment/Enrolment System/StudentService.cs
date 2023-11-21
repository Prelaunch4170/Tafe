using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Enrolment_System
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "StudentService" in both code and config file together.
    public class StudentService : IStudentService
    {
        private studentSetTableAdapters.StudentTableAdapter studentTbl;
        private courseSetTableAdapters.CourseTableAdapter courseTbl;
        private enrollmentSetTableAdapters.EnrollmentTableAdapter enrollmentTbl;

        public string addCourse(string courseID, string courseName, double cost)
        {
            throw new NotImplementedException();
        }

        public string addEnrolment(string studentID, string courseID, string grade)
        {
            throw new NotImplementedException();
        }

        public List<Student> getAllStudents()
        {
            studentTbl = new studentSetTableAdapters.StudentTableAdapter();
            studentSet.StudentDataTable table = studentTbl.GetData();
            List<Student> studentList = new List<Student>();

            foreach(DataRow row in table)
            {
                Student student = new Student();
                student.studentId = row["studentID"].ToString();
                student.studentName = row["studentName"].ToString();
                student.dateEnrolled = DateTime.ParseExact(row["dateEnrolled"].ToString(), "yyyy-MM-ddTHH:mm:ss.fffffff", System.Globalization.CultureInfo.InvariantCulture);

            }
            return studentList;
        }

        public double getCost(string courseID)
        {
            throw new NotImplementedException();
        }

        public Course getCourseDetails(string courseID)
        {
            

            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            courseSet.CourseDataTable table = courseTbl.GetDataBy(courseID);
            Course course = new Course();
            course.courseId = table.Rows[0]["corseID"].ToString();
            course.courseName = table.Rows[0]["courseName"].ToString();
            course.cost = double.Parse(table.Rows[0]["cost"].ToString());
            return course;
        }

        public List<Course> getCourseList(string studentID)
        {
            throw new NotImplementedException();
        }

        public List<Course> GetCourses()
        {
            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            courseSet.CourseDataTable table = courseTbl.GetData();
            List<Course> courseList = new List<Course>();
            foreach (DataRow row in table)
            {
                Course course = new Course();
                course.courseId = row["courseID"].ToString();
                course.courseName = row["courseName"].ToString();
                course.cost = double.Parse(row["cost"].ToString());
                courseList.Add(course);
            }

            return courseList;
        }

        public List<Enrollment> getEnrollments()
        {
            throw new NotImplementedException();
        }

        public Student getStudentDetails(string studentID)
        {
            throw new NotImplementedException();
        }

        public void newStudent(string studentID, string studentName, DateTime enrollmentDate)
        {
            throw new NotImplementedException();
        }

        public List<Enrollment> viewCourseEnrollents(string courseID)
        {
            throw new NotImplementedException();
        }

        public List<Enrollment> viewStudentEnrollents(string studentID)
        {
            throw new NotImplementedException();
        }
    }
}
