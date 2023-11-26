namespace Enrolment_System_App
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Display = new System.Windows.Forms.RichTextBox();
            this.allStudentsBtn = new System.Windows.Forms.Button();
            this.studentIDTxt = new System.Windows.Forms.TextBox();
            this.seachStudentBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.courseIDTxt = new System.Windows.Forms.TextBox();
            this.searchCourseBtn = new System.Windows.Forms.Button();
            this.allCoursesBtn = new System.Windows.Forms.Button();
            this.studentNameTxt = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.addStudentBtn = new System.Windows.Forms.Button();
            this.courseNameTxt = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.costTxt = new System.Windows.Forms.NumericUpDown();
            this.enrollBtn = new System.Windows.Forms.Button();
            this.allEnroll = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.sdtEnroll = new System.Windows.Forms.Button();
            this.corEnroll = new System.Windows.Forms.Button();
            this.gradeTxt = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.addCourseBtn = new System.Windows.Forms.Button();
            this.courseCostBtn = new System.Windows.Forms.Button();
            this.getCoursesBtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.costTxt)).BeginInit();
            this.SuspendLayout();
            // 
            // Display
            // 
            this.Display.Location = new System.Drawing.Point(156, 95);
            this.Display.Name = "Display";
            this.Display.ReadOnly = true;
            this.Display.Size = new System.Drawing.Size(455, 251);
            this.Display.TabIndex = 1;
            this.Display.Text = "";
            // 
            // allStudentsBtn
            // 
            this.allStudentsBtn.Location = new System.Drawing.Point(265, 12);
            this.allStudentsBtn.Name = "allStudentsBtn";
            this.allStudentsBtn.Size = new System.Drawing.Size(125, 23);
            this.allStudentsBtn.TabIndex = 2;
            this.allStudentsBtn.Text = "Display All Students";
            this.allStudentsBtn.UseVisualStyleBackColor = true;
            this.allStudentsBtn.Click += new System.EventHandler(this.allStudentsBtn_Click);
            // 
            // studentIDTxt
            // 
            this.studentIDTxt.Location = new System.Drawing.Point(12, 137);
            this.studentIDTxt.Name = "studentIDTxt";
            this.studentIDTxt.Size = new System.Drawing.Size(112, 20);
            this.studentIDTxt.TabIndex = 3;
            // 
            // seachStudentBtn
            // 
            this.seachStudentBtn.Location = new System.Drawing.Point(12, 95);
            this.seachStudentBtn.Name = "seachStudentBtn";
            this.seachStudentBtn.Size = new System.Drawing.Size(112, 23);
            this.seachStudentBtn.TabIndex = 4;
            this.seachStudentBtn.Text = "Search Student";
            this.seachStudentBtn.UseVisualStyleBackColor = true;
            this.seachStudentBtn.Click += new System.EventHandler(this.seachStudentBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 121);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Student ID";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(614, 121);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(54, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Course ID";
            // 
            // courseIDTxt
            // 
            this.courseIDTxt.Location = new System.Drawing.Point(617, 136);
            this.courseIDTxt.Name = "courseIDTxt";
            this.courseIDTxt.Size = new System.Drawing.Size(108, 20);
            this.courseIDTxt.TabIndex = 7;
            // 
            // searchCourseBtn
            // 
            this.searchCourseBtn.Location = new System.Drawing.Point(617, 95);
            this.searchCourseBtn.Name = "searchCourseBtn";
            this.searchCourseBtn.Size = new System.Drawing.Size(108, 23);
            this.searchCourseBtn.TabIndex = 8;
            this.searchCourseBtn.Text = "Search Course";
            this.searchCourseBtn.UseVisualStyleBackColor = true;
            this.searchCourseBtn.Click += new System.EventHandler(this.searchCourseBtn_Click);
            // 
            // allCoursesBtn
            // 
            this.allCoursesBtn.Location = new System.Drawing.Point(406, 12);
            this.allCoursesBtn.Name = "allCoursesBtn";
            this.allCoursesBtn.Size = new System.Drawing.Size(122, 23);
            this.allCoursesBtn.TabIndex = 9;
            this.allCoursesBtn.Text = "Display All Courses";
            this.allCoursesBtn.UseVisualStyleBackColor = true;
            this.allCoursesBtn.Click += new System.EventHandler(this.allCoursesBtn_Click);
            // 
            // studentNameTxt
            // 
            this.studentNameTxt.Location = new System.Drawing.Point(12, 180);
            this.studentNameTxt.Name = "studentNameTxt";
            this.studentNameTxt.Size = new System.Drawing.Size(112, 20);
            this.studentNameTxt.TabIndex = 11;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 163);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(75, 13);
            this.label3.TabIndex = 12;
            this.label3.Text = "Student Name";
            // 
            // addStudentBtn
            // 
            this.addStudentBtn.Location = new System.Drawing.Point(12, 207);
            this.addStudentBtn.Name = "addStudentBtn";
            this.addStudentBtn.Size = new System.Drawing.Size(75, 23);
            this.addStudentBtn.TabIndex = 13;
            this.addStudentBtn.Text = "Add Student";
            this.addStudentBtn.UseVisualStyleBackColor = true;
            this.addStudentBtn.Click += new System.EventHandler(this.addStudentBtn_Click);
            // 
            // courseNameTxt
            // 
            this.courseNameTxt.Location = new System.Drawing.Point(617, 180);
            this.courseNameTxt.Name = "courseNameTxt";
            this.courseNameTxt.Size = new System.Drawing.Size(108, 20);
            this.courseNameTxt.TabIndex = 14;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(618, 162);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(35, 13);
            this.label4.TabIndex = 16;
            this.label4.Text = "Name";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(618, 207);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(28, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "Cost";
            // 
            // costTxt
            // 
            this.costTxt.DecimalPlaces = 2;
            this.costTxt.Location = new System.Drawing.Point(617, 223);
            this.costTxt.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.costTxt.Name = "costTxt";
            this.costTxt.Size = new System.Drawing.Size(108, 20);
            this.costTxt.TabIndex = 18;
            // 
            // enrollBtn
            // 
            this.enrollBtn.Location = new System.Drawing.Point(342, 368);
            this.enrollBtn.Name = "enrollBtn";
            this.enrollBtn.Size = new System.Drawing.Size(96, 23);
            this.enrollBtn.TabIndex = 19;
            this.enrollBtn.Text = "Enroll Student";
            this.enrollBtn.UseVisualStyleBackColor = true;
            this.enrollBtn.Click += new System.EventHandler(this.enrollBtn_Click);
            // 
            // allEnroll
            // 
            this.allEnroll.Location = new System.Drawing.Point(342, 41);
            this.allEnroll.Name = "allEnroll";
            this.allEnroll.Size = new System.Drawing.Size(96, 23);
            this.allEnroll.TabIndex = 20;
            this.allEnroll.Text = "Get Enrollments";
            this.allEnroll.UseVisualStyleBackColor = true;
            this.allEnroll.Click += new System.EventHandler(this.allEnroll_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 265);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(45, 13);
            this.label6.TabIndex = 21;
            this.label6.Text = "Uses ID";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(618, 308);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(45, 13);
            this.label7.TabIndex = 22;
            this.label7.Text = "Uses ID";
            // 
            // sdtEnroll
            // 
            this.sdtEnroll.Location = new System.Drawing.Point(12, 236);
            this.sdtEnroll.Name = "sdtEnroll";
            this.sdtEnroll.Size = new System.Drawing.Size(112, 23);
            this.sdtEnroll.TabIndex = 23;
            this.sdtEnroll.Text = "Student Enrollments";
            this.sdtEnroll.UseVisualStyleBackColor = true;
            this.sdtEnroll.Click += new System.EventHandler(this.sdtEnroll_Click);
            // 
            // corEnroll
            // 
            this.corEnroll.Location = new System.Drawing.Point(617, 279);
            this.corEnroll.Name = "corEnroll";
            this.corEnroll.Size = new System.Drawing.Size(108, 23);
            this.corEnroll.TabIndex = 24;
            this.corEnroll.Text = "Course Enrollments";
            this.corEnroll.UseVisualStyleBackColor = true;
            this.corEnroll.Click += new System.EventHandler(this.corEnroll_Click);
            // 
            // gradeTxt
            // 
            this.gradeTxt.Location = new System.Drawing.Point(342, 421);
            this.gradeTxt.Name = "gradeTxt";
            this.gradeTxt.Size = new System.Drawing.Size(96, 20);
            this.gradeTxt.TabIndex = 25;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(342, 398);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(36, 13);
            this.label8.TabIndex = 26;
            this.label8.Text = "Grade";
            // 
            // addCourseBtn
            // 
            this.addCourseBtn.Location = new System.Drawing.Point(617, 250);
            this.addCourseBtn.Name = "addCourseBtn";
            this.addCourseBtn.Size = new System.Drawing.Size(108, 23);
            this.addCourseBtn.TabIndex = 27;
            this.addCourseBtn.Text = "Add Course";
            this.addCourseBtn.UseVisualStyleBackColor = true;
            this.addCourseBtn.Click += new System.EventHandler(this.addCourseBtn_Click);
            // 
            // courseCostBtn
            // 
            this.courseCostBtn.Location = new System.Drawing.Point(732, 95);
            this.courseCostBtn.Name = "courseCostBtn";
            this.courseCostBtn.Size = new System.Drawing.Size(56, 23);
            this.courseCostBtn.TabIndex = 28;
            this.courseCostBtn.Text = "Get Cost";
            this.courseCostBtn.UseVisualStyleBackColor = true;
            this.courseCostBtn.Click += new System.EventHandler(this.courseCostBtn_Click);
            // 
            // getCoursesBtn
            // 
            this.getCoursesBtn.Location = new System.Drawing.Point(12, 282);
            this.getCoursesBtn.Name = "getCoursesBtn";
            this.getCoursesBtn.Size = new System.Drawing.Size(75, 23);
            this.getCoursesBtn.TabIndex = 29;
            this.getCoursesBtn.Text = "Get Courses";
            this.getCoursesBtn.UseVisualStyleBackColor = true;
            this.getCoursesBtn.Click += new System.EventHandler(this.getCoursesBtn_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.getCoursesBtn);
            this.Controls.Add(this.courseCostBtn);
            this.Controls.Add(this.addCourseBtn);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.gradeTxt);
            this.Controls.Add(this.corEnroll);
            this.Controls.Add(this.sdtEnroll);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.allEnroll);
            this.Controls.Add(this.enrollBtn);
            this.Controls.Add(this.costTxt);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.courseNameTxt);
            this.Controls.Add(this.addStudentBtn);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.studentNameTxt);
            this.Controls.Add(this.allCoursesBtn);
            this.Controls.Add(this.searchCourseBtn);
            this.Controls.Add(this.courseIDTxt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.seachStudentBtn);
            this.Controls.Add(this.studentIDTxt);
            this.Controls.Add(this.allStudentsBtn);
            this.Controls.Add(this.Display);
            this.Name = "Form1";
            this.Text = "Main Form";
            ((System.ComponentModel.ISupportInitialize)(this.costTxt)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.RichTextBox Display;
        private System.Windows.Forms.Button allStudentsBtn;
        private System.Windows.Forms.TextBox studentIDTxt;
        private System.Windows.Forms.Button seachStudentBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox courseIDTxt;
        private System.Windows.Forms.Button searchCourseBtn;
        private System.Windows.Forms.Button allCoursesBtn;
        private System.Windows.Forms.TextBox studentNameTxt;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button addStudentBtn;
        private System.Windows.Forms.TextBox courseNameTxt;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.NumericUpDown costTxt;
        private System.Windows.Forms.Button enrollBtn;
        private System.Windows.Forms.Button allEnroll;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button sdtEnroll;
        private System.Windows.Forms.Button corEnroll;
        private System.Windows.Forms.TextBox gradeTxt;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button addCourseBtn;
        private System.Windows.Forms.Button courseCostBtn;
        private System.Windows.Forms.Button getCoursesBtn;
    }
}

