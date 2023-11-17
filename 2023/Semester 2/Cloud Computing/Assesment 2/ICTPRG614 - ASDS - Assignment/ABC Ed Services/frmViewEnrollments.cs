using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ABC_Ed_Services
{
    public partial class frmViewEnrollments : Form
    {
        TafeDBDataSet.CourseDataTable table;
        public frmViewEnrollments()
        {
            InitializeComponent();
        }

        private void frmViewEnrollments_Load(object sender, EventArgs e)
        {
            cbCourses.Text = "-Select Courset-";
            Tafe_DataTier dt = new Tafe_DataTier();
            table = dt.viewCourses();


            foreach (DataRow row in table)
            {
                cbCourses.Items.Add(row["CourseID"].ToString()); ;

            }
        }

        private void cbCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbStudents.Items.Clear();
            string id = cbCourses.SelectedItem.ToString();
            this.txtName.Text = (table.FindByCourseID(id)).CourseName;
            this.txtCost.Text = (table.FindByCourseID(id)).Cost.ToString("C");

            Tafe_DataTier dt = new Tafe_DataTier();
            System.Data.SqlClient.SqlDataReader dr = dt.getStudentsEnrolledInCourse(id);
            if (!dr.HasRows)
            {
                lbStudents.Items.Add("--------- NO ENROLLMENTS ----------");
            }
            else
            {
                while (dr.Read())
                {
                    this.lbStudents.Items.Add(dr.GetString(0) + "-->" + dr.GetString(1));
                }
            }
        }
    }
}