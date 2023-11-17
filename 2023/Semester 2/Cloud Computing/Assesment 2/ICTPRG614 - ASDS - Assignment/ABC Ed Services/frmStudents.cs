using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ABC_Ed_Services
{
    public partial class frmStudents : Form
    {
        private TafeDBDataSet.StudentDataTable table;

        public frmStudents()
        {
            InitializeComponent();
        }

        private void frmStudents_Load(object sender, EventArgs e)
        {
         
            Tafe_DataTier dt = new Tafe_DataTier();
            table = dt.viewStudents();


            foreach (DataRow row in table)
            {
                lbStudents.Items.Add(row["StudentID"].ToString() + "-->" + row["StduentName"].ToString()); ;

            }
        }
    }
}
