using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ABC_Ed_Services
{
    public partial class frmBilling : Form
    {
        private TafeDBDataSet.StudentDataTable studTable;
        private Tafe_DataTier dt;

        public frmBilling()
        {
            dt = new Tafe_DataTier();
            InitializeComponent();
        }

        private void cbStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbCourses.Items.Clear();
            string id = cbStudents.SelectedItem.ToString();
            this.txtName.Text = (studTable.FindByStudentID(id)).StduentName;

            dt = new Tafe_DataTier();
            System.Data.SqlClient.SqlDataReader dr = dt.getEnrollmentsForStudent(id);

            Decimal total = 0.0M;
            if (!dr.HasRows)
            {
                lbCourses.Items.Add("--------- NO ENROLLMENTS ----------");
            }
            else
            {
                while (dr.Read())
                {
                    lbCourses.Items.Add(dr.GetString(0));
                    total = total + dr.GetDecimal(1);
                }
            }
            txtCost.Text = total.ToString("C");
        }

        private void frmBilling_Load(object sender, EventArgs e)
        {
            cbStudents.Text = "-Select Student-";
            studTable = dt.viewStudents();
            foreach (DataRow row in studTable)
            {
                cbStudents.Items.Add(row["StudentID"].ToString()); ;
            }
        }
    }
}