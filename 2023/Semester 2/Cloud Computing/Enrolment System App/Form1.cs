using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Enrolment_System_App.EnrollmentSystem;

namespace Enrolment_System_App
{
    public partial class Form1 : Form
    {
        private EnrollmentServiceClient client = new EnrollmentServiceClient();
        public Form1()
        {
            InitializeComponent();
        }
        //Student
        private void allStudentsBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Student student in client.getAllStudents())
            {
                Display.Text += student.studentName + ",    " + student.studentId + ",    " + student.dateEnrolled.ToShortDateString() + "\n";
            }

        }
        private void seachStudentBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            Student student = client.getStudentDetails(studentIDTxt.Text);

            Display.Text += student.studentName + ",    " + student.studentId + ",    " + student.dateEnrolled.ToShortDateString() + "\n";

        }
        private void sdtEnroll_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Enrollment enrollment in client.viewStudentEnrollents(studentIDTxt.Text))
            {
                Display.Text += enrollment.courseID + ",    " + enrollment.studentId + ",    " + enrollment.grade + "\n";
            }

        }
        private void addStudentBtn_Click(object sender, EventArgs e)
        {
            Display.Text = client.addStudent(studentIDTxt.Text, studentNameTxt.Text, DateTime.Now);

        }


        //Course
        private void allCoursesBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Course course in client.getAllCourses())
            {
                Display.Text += course.courseName + ",    " + course.courseId + ",    " + course.cost + "\n";
            }


        }
        private void searchCourseBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            Course course = client.getCourseDetails(courseIDTxt.Text);

            Display.Text += course.courseName + ",    " + course.courseId + ",    " + course.cost + "\n";

        }
        private void addCourseBtn_Click(object sender, EventArgs e)
        {
            Display.Text = client.addCourse(courseIDTxt.Text, courseNameTxt.Text, costTxt.Value);

        }
        private void corEnroll_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Enrollment enrollment in client.viewCourseEnrollents(courseIDTxt.Text))
            {
                Display.Text += enrollment.courseID + ",    " + enrollment.studentId + ",    " + enrollment.grade + "\n";
            }

        }
        private void courseCostBtn_Click(object sender, EventArgs e)
        {
            Display.Text = client.getCost(courseIDTxt.Text).ToString();

        }
        private void getCoursesBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Course course in client.getCourseList(studentIDTxt.Text))
            {
                Display.Text += course.courseName + ",    " + course.courseId + ",    " + course.cost + "\n";
            }
        }

        //Enroll
        private void enrollBtn_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            Display.Text = client.addEnrolment(studentIDTxt.Text, courseIDTxt.Text, gradeTxt.Text);

        }
        private void allEnroll_Click(object sender, EventArgs e)
        {
            Display.Text = "";
            foreach (Enrollment enrollment in client.getEnrollments())
            {
                Display.Text += enrollment.courseID + ",    " + enrollment.studentId + ",    " + enrollment.grade + "\n";
            }

        }


    }
}
