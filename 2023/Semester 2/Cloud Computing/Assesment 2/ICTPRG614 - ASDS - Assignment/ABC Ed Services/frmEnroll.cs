using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ABC_Ed_Services
{
    public partial class frmEnroll : Form
    {
        private TafeDBDataSet.StudentDataTable studTable;
        private TafeDBDataSet.CourseDataTable courseTable;
        private Tafe_DataTier dt;

        public frmEnroll()
        {
            InitializeComponent();
            dt = new Tafe_DataTier();
        }

        private void frmEnroll_Load(object sender, EventArgs e)
        {
            cbStudents.Text = "-Select Student-";
            studTable = dt.viewStudents();
            foreach (DataRow row in studTable)
            {
                cbStudents.Items.Add(row["StudentID"].ToString()); ;
            }

            cbCourses .Text = "-Select Course-";
            courseTable = dt.viewCourses();
            foreach (DataRow row in courseTable)
            {
                cbCourses.Items.Add(row["CourseID"].ToString()); ;
            }

        }


        private void btnEnroll_Click(object sender, EventArgs e)
        {
            dt = new Tafe_DataTier();
            int rowsInserted = dt.enroll(cbCourses.SelectedItem.ToString(),cbStudents.SelectedItem.ToString());
            if (rowsInserted > 0)
            {
                MessageBox.Show("New Enrollment Information Saved", "Enrollment", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("New Enrollment Information NOT Saved", "Enrollment", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cbStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
                string id = cbStudents.SelectedItem.ToString();
                this.txtStudName.Text = (studTable.FindByStudentID(id)).StduentName;
                txtDateEnrolled.Text = (studTable.FindByStudentID(id)).DateEnrolled.ToString("d");

        }

        private void cbCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = cbCourses.SelectedItem.ToString();
            txtCourseName.Text = (courseTable.FindByCourseID(id)).CourseName;
            this.txtCost.Text = (courseTable.FindByCourseID(id)).Cost.ToString("C");
        }
    }
}