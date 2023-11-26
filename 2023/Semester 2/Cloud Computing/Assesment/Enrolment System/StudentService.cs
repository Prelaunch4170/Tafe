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

        //Student Methods
        public List<Student> getAllStudents()
        {
            studentTbl = new studentSetTableAdapters.StudentTableAdapter();
            studentSet.StudentDataTable table = studentTbl.GetData();
            List<Student> studentList = new List<Student>();

            foreach (DataRow row in table)
            {
                Student student = new Student();
                student.studentId = row["studentID"].ToString();
                student.studentName = row["studentName"].ToString();
                student.dateEnrolled = DateTime.Parse(row["dateEnrolled"].ToString());
                studentList.Add(student);
            }
            return studentList;
        }
        public Student getStudentDetails(string studentID)
        {
            studentTbl = new studentSetTableAdapters.StudentTableAdapter();
            studentSet.StudentDataTable table = studentTbl.GetDataBy(studentID);

            Student student = new Student();
            student.studentId = table.Rows[0]["studentID"].ToString();
            student.studentName = table.Rows[0]["studentName"].ToString();
            student.dateEnrolled = DateTime.Parse(table.Rows[0]["dateEnrolled"].ToString());

            return student;

        }

        public string addStudent(string studentID, string studentName, DateTime enrollmentDate)
        {
            try
            {
                studentTbl = new studentSetTableAdapters.StudentTableAdapter();
                studentTbl.Insert(studentID, studentName, enrollmentDate);
                studentSet.StudentDataTable table = studentTbl.GetDataBy(studentID);
                return "Added " + table.Rows[0]["studentID"].ToString();
            }catch (Exception ex)
            {
               return ex.Message.ToString();
            }
            

            
        }

        public List<Enrollment> viewStudentEnrollents(string studentID)
        {
            enrollmentTbl = new enrollmentSetTableAdapters.EnrollmentTableAdapter();
            enrollmentSet.EnrollmentDataTable table = enrollmentTbl.GetDataByStudent(studentID);
            List<Enrollment> enrollList = new List<Enrollment>();
            foreach (DataRow row in table)
            {
                Enrollment enroll = new Enrollment();
                enroll.courseID = row["courseID"].ToString();
                enroll.studentId = row["studentID"].ToString();
                enroll.grade = row["grade"].ToString();
                enrollList.Add(enroll);
            }

            return enrollList;
        }

        //----------------------------------------------------------------
        //Course Methods

        public string addCourse(string courseID, string courseName, decimal cost)
        {
            try
            {
                courseTbl = new courseSetTableAdapters.CourseTableAdapter();
                courseTbl.Insert(courseID, courseName, cost);
                courseSet.CourseDataTable table = courseTbl.GetDataBy(courseID);
                return "Added " + table.Rows[0]["courseID"].ToString();
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
        public List<Enrollment> viewCourseEnrollents(string courseID)
        {
            enrollmentTbl = new enrollmentSetTableAdapters.EnrollmentTableAdapter();
            enrollmentSet.EnrollmentDataTable table = enrollmentTbl.GetDataByCourse(courseID);
            List<Enrollment> enrollList = new List<Enrollment>();
            foreach (DataRow row in table)
            {
                Enrollment enroll = new Enrollment();
                enroll.courseID = row["courseID"].ToString();
                enroll.studentId = row["studentID"].ToString();
                enroll.grade = row["grade"].ToString();
                enrollList.Add(enroll);
            }

            return enrollList;
        }

        public decimal getCost(string courseID)
        {
            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            courseSet.CourseDataTable table = courseTbl.GetDataBy(courseID);
            Course course = new Course();
            return decimal.Parse(table.Rows[0]["cost"].ToString());
        }

        public Course getCourseDetails(string courseID)
        {
            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            courseSet.CourseDataTable table = courseTbl.GetDataBy(courseID);
            Course course = new Course();
            course.courseId = table.Rows[0]["courseID"].ToString();
            course.courseName = table.Rows[0]["courseName"].ToString();
            course.cost = decimal.Parse(table.Rows[0]["cost"].ToString());
            return course;
        }

        public List<Course> getCourseList(string studentID)
        {

            enrollmentTbl = new enrollmentSetTableAdapters.EnrollmentTableAdapter();
            enrollmentSet.EnrollmentDataTable table = enrollmentTbl.GetDataByStudent(studentID);
            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            
            List<Course> courseList = new List<Course>();
            foreach (DataRow row in table)
            {
                Course course = new Course();
                courseSet.CourseDataTable courseTable = courseTbl.GetDataBy(row["courseID"].ToString());
                course.courseId = courseTable.Rows[0]["courseID"].ToString();
                course.courseName = courseTable.Rows[0]["courseName"].ToString();
                course.cost = decimal.Parse(courseTable.Rows[0]["cost"].ToString());
                courseList.Add(course);
            }
            return courseList;
        }

        public List<Course> getAllCourses()
        {
            courseTbl = new courseSetTableAdapters.CourseTableAdapter();
            courseSet.CourseDataTable table = courseTbl.GetData();
            List<Course> courseList = new List<Course>();
            foreach (DataRow row in table)
            {
                Course course = new Course();
                course.courseId = row["courseID"].ToString();
                course.courseName = row["courseName"].ToString();
                course.cost = decimal.Parse(row["cost"].ToString());
                courseList.Add(course);
            }

            return courseList;
        }
        //----------------------------------------------------------------
        //Enrollment Methods
        public List<Enrollment> getEnrollments()
        {
            enrollmentTbl = new enrollmentSetTableAdapters.EnrollmentTableAdapter();
            enrollmentSet.EnrollmentDataTable table = enrollmentTbl.GetData();
            List<Enrollment> enrollList = new List<Enrollment>();
            foreach (DataRow row in table)
            {
                Enrollment enroll = new Enrollment();
                enroll.courseID = row["courseID"].ToString();
                enroll.studentId = row["studentID"].ToString();
                enroll.grade = row["grade"].ToString();
                enrollList.Add(enroll);
            }

            return enrollList;

        }
        public string addEnrolment(string studentID, string courseID, string grade)
        {
            try
            {
                enrollmentTbl = new enrollmentSetTableAdapters.EnrollmentTableAdapter();
                enrollmentTbl.Insert(courseID, studentID, grade);
                enrollmentSet.EnrollmentDataTable table = enrollmentTbl.GetData();
                return "Added " + studentID + " " + courseID;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
    }
}
