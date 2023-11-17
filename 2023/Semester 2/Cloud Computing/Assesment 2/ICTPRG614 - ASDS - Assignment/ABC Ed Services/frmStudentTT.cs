using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;

namespace ABC_Ed_Services
{
    public partial class frmStudentTT : Form
    {
        private TafeDBDataSet.StudentDataTable table;
        

        public frmStudentTT()
        {
            InitializeComponent();
        }

        private void frmStudentTT_Load(object sender, EventArgs e)
        {
            
            cbStudents.Text = "-Select Student-";
            Tafe_DataTier dt = new Tafe_DataTier();
            table = dt.viewStudents();
        
            
            foreach (DataRow row in table)
            {
                cbStudents.Items.Add(row["StudentID"].ToString()); ;

            }
           
        }

        private void cbStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
                lbCourses.Items.Clear();
                string id = cbStudents.SelectedItem.ToString();
                txtName.Text = (table.FindByStudentID(id)).StduentName;
                txtDateEnrolled.Text = (table.FindByStudentID(id)).DateEnrolled.ToString("d");

                Tafe_DataTier dt = new Tafe_DataTier();
                System.Data.SqlClient.SqlDataReader dr  = dt.getEnrollmentsForStudent(id);

                if (!dr.HasRows)
                {
                    lbCourses.Items.Add("--------- NO ENROLLMENTS ----------");
                }
                else
                {
                    while (dr.Read())
                    {
                        lbCourses.Items.Add(dr.GetString(0));
                    }
                }
        }

        private void lbCourses_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}