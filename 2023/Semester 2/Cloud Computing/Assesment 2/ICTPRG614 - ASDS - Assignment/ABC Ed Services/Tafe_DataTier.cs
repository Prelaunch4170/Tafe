using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Text;

namespace ABC_Ed_Services{

    class Tafe_DataTier{

        private TafeDBDataSetTableAdapters.CourseTableAdapter courseTA;
        private TafeDBDataSetTableAdapters.EnrollmentTableAdapter enrollmentTA;
        private TafeDBDataSetTableAdapters.StudentTableAdapter studentTA;

        public Tafe_DataTier(){

            courseTA = new ABC_Ed_Services.TafeDBDataSetTableAdapters.CourseTableAdapter();
            enrollmentTA = new ABC_Ed_Services.TafeDBDataSetTableAdapters.EnrollmentTableAdapter();
            studentTA = new ABC_Ed_Services.TafeDBDataSetTableAdapters.StudentTableAdapter();
        }


        public int insertStudent(string id, string name, DateTime dateEnrolled)
        {
            int rowsUpdated;
            try
            {
                rowsUpdated = studentTA.Insert(id, name, dateEnrolled);
            }
            catch (Exception ex)
            {
                rowsUpdated = -1;
            }

            return rowsUpdated;
        }



        public int insertCourse(string id, string name, Decimal cost)
        {
            int rowsUpdated = courseTA.Insert(id, name, cost);
            return rowsUpdated;
        }



        public TafeDBDataSet.StudentDataTable viewStudents()
        {
            studentTA = new ABC_Ed_Services.TafeDBDataSetTableAdapters.StudentTableAdapter();
            TafeDBDataSet.StudentDataTable table = studentTA.GetData();
            return table;
        }

        public TafeDBDataSet.CourseDataTable viewCourses()
        {
            courseTA = new ABC_Ed_Services.TafeDBDataSetTableAdapters.CourseTableAdapter();
            TafeDBDataSet.CourseDataTable table = courseTA.GetData();
            return table;
        }


        public int enroll(String courseID, String studentID){

            int rowsUpdated = enrollmentTA.Insert(studentID, courseID, "NR");
            return rowsUpdated;
        }


        public SqlDataReader getEnrollmentsForStudent(string studentID)
        {
            //SqlConnection conn = courseTA.Connection;

            string strConn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\dalevanh\Desktop\TafeDB.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
            SqlConnection conn = new SqlConnection(strConn);
            string sql1 = "SELECT C.CourseName FROM Enrollment E JOIN Course C " +
                          "ON E.CourseID = C.CourseID " +
                          "WHERE E.StudentID = @StudentID";

            string sql2 = "SELECT C.CourseName,C.Cost FROM Course C, Enrollment E " +
                          "WHERE C.CourseID = E.CourseID " +
                          "AND E.StudentID = @StudentID";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql2, conn);
            cmd.Parameters.AddWithValue("@StudentID", studentID);

           
            SqlDataReader dr = cmd.ExecuteReader();
           
            return dr;
        }

        public SqlDataReader getStudentsEnrolledInCourse(String courseID)
        {
            string strConn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\dalevanh\Desktop\TafeDB.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
            SqlConnection conn = new SqlConnection(strConn);
            string sql1 =  "SELECT S.StudentID, S.StduentName FROM Student S, Enrollment E " +
                          "WHERE S.StudentID = E.StudentID " +
                          "AND E.courseID = @courseID";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql1, conn);
            cmd.Parameters.AddWithValue("@CourseID", courseID);

            SqlDataReader dr = cmd.ExecuteReader();

            return dr;
        }

    }
}
