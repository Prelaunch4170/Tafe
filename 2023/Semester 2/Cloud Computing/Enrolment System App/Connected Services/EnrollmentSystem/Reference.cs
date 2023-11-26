﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Enrolment_System_App.EnrollmentSystem {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Student", Namespace="http://schemas.datacontract.org/2004/07/Enrolment_System")]
    [System.SerializableAttribute()]
    public partial class Student : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.DateTime dateEnrolledField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string studentIdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string studentNameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.DateTime dateEnrolled {
            get {
                return this.dateEnrolledField;
            }
            set {
                if ((this.dateEnrolledField.Equals(value) != true)) {
                    this.dateEnrolledField = value;
                    this.RaisePropertyChanged("dateEnrolled");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string studentId {
            get {
                return this.studentIdField;
            }
            set {
                if ((object.ReferenceEquals(this.studentIdField, value) != true)) {
                    this.studentIdField = value;
                    this.RaisePropertyChanged("studentId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string studentName {
            get {
                return this.studentNameField;
            }
            set {
                if ((object.ReferenceEquals(this.studentNameField, value) != true)) {
                    this.studentNameField = value;
                    this.RaisePropertyChanged("studentName");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Enrollment", Namespace="http://schemas.datacontract.org/2004/07/Enrolment_System")]
    [System.SerializableAttribute()]
    public partial class Enrollment : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string courseIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string gradeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string studentIdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string courseID {
            get {
                return this.courseIDField;
            }
            set {
                if ((object.ReferenceEquals(this.courseIDField, value) != true)) {
                    this.courseIDField = value;
                    this.RaisePropertyChanged("courseID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string grade {
            get {
                return this.gradeField;
            }
            set {
                if ((object.ReferenceEquals(this.gradeField, value) != true)) {
                    this.gradeField = value;
                    this.RaisePropertyChanged("grade");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string studentId {
            get {
                return this.studentIdField;
            }
            set {
                if ((object.ReferenceEquals(this.studentIdField, value) != true)) {
                    this.studentIdField = value;
                    this.RaisePropertyChanged("studentId");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Course", Namespace="http://schemas.datacontract.org/2004/07/Enrolment_System")]
    [System.SerializableAttribute()]
    public partial class Course : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal costField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string courseIdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string courseNameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public decimal cost {
            get {
                return this.costField;
            }
            set {
                if ((this.costField.Equals(value) != true)) {
                    this.costField = value;
                    this.RaisePropertyChanged("cost");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string courseId {
            get {
                return this.courseIdField;
            }
            set {
                if ((object.ReferenceEquals(this.courseIdField, value) != true)) {
                    this.courseIdField = value;
                    this.RaisePropertyChanged("courseId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string courseName {
            get {
                return this.courseNameField;
            }
            set {
                if ((object.ReferenceEquals(this.courseNameField, value) != true)) {
                    this.courseNameField = value;
                    this.RaisePropertyChanged("courseName");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="EnrollmentSystem.IEnrollmentService")]
    public interface IEnrollmentService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addStudent", ReplyAction="http://tempuri.org/IEnrollmentService/addStudentResponse")]
        string addStudent(string studentID, string studentName, System.DateTime enrollmentDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addStudent", ReplyAction="http://tempuri.org/IEnrollmentService/addStudentResponse")]
        System.Threading.Tasks.Task<string> addStudentAsync(string studentID, string studentName, System.DateTime enrollmentDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getAllStudents", ReplyAction="http://tempuri.org/IEnrollmentService/getAllStudentsResponse")]
        Enrolment_System_App.EnrollmentSystem.Student[] getAllStudents();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getAllStudents", ReplyAction="http://tempuri.org/IEnrollmentService/getAllStudentsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Student[]> getAllStudentsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/viewStudentEnrollents", ReplyAction="http://tempuri.org/IEnrollmentService/viewStudentEnrollentsResponse")]
        Enrolment_System_App.EnrollmentSystem.Enrollment[] viewStudentEnrollents(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/viewStudentEnrollents", ReplyAction="http://tempuri.org/IEnrollmentService/viewStudentEnrollentsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> viewStudentEnrollentsAsync(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getStudentDetails", ReplyAction="http://tempuri.org/IEnrollmentService/getStudentDetailsResponse")]
        Enrolment_System_App.EnrollmentSystem.Student getStudentDetails(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getStudentDetails", ReplyAction="http://tempuri.org/IEnrollmentService/getStudentDetailsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Student> getStudentDetailsAsync(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getAllCourses", ReplyAction="http://tempuri.org/IEnrollmentService/getAllCoursesResponse")]
        Enrolment_System_App.EnrollmentSystem.Course[] getAllCourses();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getAllCourses", ReplyAction="http://tempuri.org/IEnrollmentService/getAllCoursesResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course[]> getAllCoursesAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/viewCourseEnrollents", ReplyAction="http://tempuri.org/IEnrollmentService/viewCourseEnrollentsResponse")]
        Enrolment_System_App.EnrollmentSystem.Enrollment[] viewCourseEnrollents(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/viewCourseEnrollents", ReplyAction="http://tempuri.org/IEnrollmentService/viewCourseEnrollentsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> viewCourseEnrollentsAsync(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCost", ReplyAction="http://tempuri.org/IEnrollmentService/getCostResponse")]
        decimal getCost(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCost", ReplyAction="http://tempuri.org/IEnrollmentService/getCostResponse")]
        System.Threading.Tasks.Task<decimal> getCostAsync(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCourseList", ReplyAction="http://tempuri.org/IEnrollmentService/getCourseListResponse")]
        Enrolment_System_App.EnrollmentSystem.Course[] getCourseList(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCourseList", ReplyAction="http://tempuri.org/IEnrollmentService/getCourseListResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course[]> getCourseListAsync(string studentID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addCourse", ReplyAction="http://tempuri.org/IEnrollmentService/addCourseResponse")]
        string addCourse(string courseID, string courseName, decimal cost);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addCourse", ReplyAction="http://tempuri.org/IEnrollmentService/addCourseResponse")]
        System.Threading.Tasks.Task<string> addCourseAsync(string courseID, string courseName, decimal cost);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCourseDetails", ReplyAction="http://tempuri.org/IEnrollmentService/getCourseDetailsResponse")]
        Enrolment_System_App.EnrollmentSystem.Course getCourseDetails(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getCourseDetails", ReplyAction="http://tempuri.org/IEnrollmentService/getCourseDetailsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course> getCourseDetailsAsync(string courseID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getEnrollments", ReplyAction="http://tempuri.org/IEnrollmentService/getEnrollmentsResponse")]
        Enrolment_System_App.EnrollmentSystem.Enrollment[] getEnrollments();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/getEnrollments", ReplyAction="http://tempuri.org/IEnrollmentService/getEnrollmentsResponse")]
        System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> getEnrollmentsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addEnrolment", ReplyAction="http://tempuri.org/IEnrollmentService/addEnrolmentResponse")]
        string addEnrolment(string studentID, string courseID, string grade);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnrollmentService/addEnrolment", ReplyAction="http://tempuri.org/IEnrollmentService/addEnrolmentResponse")]
        System.Threading.Tasks.Task<string> addEnrolmentAsync(string studentID, string courseID, string grade);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IEnrollmentServiceChannel : Enrolment_System_App.EnrollmentSystem.IEnrollmentService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class EnrollmentServiceClient : System.ServiceModel.ClientBase<Enrolment_System_App.EnrollmentSystem.IEnrollmentService>, Enrolment_System_App.EnrollmentSystem.IEnrollmentService {
        
        public EnrollmentServiceClient() {
        }
        
        public EnrollmentServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public EnrollmentServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EnrollmentServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EnrollmentServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string addStudent(string studentID, string studentName, System.DateTime enrollmentDate) {
            return base.Channel.addStudent(studentID, studentName, enrollmentDate);
        }
        
        public System.Threading.Tasks.Task<string> addStudentAsync(string studentID, string studentName, System.DateTime enrollmentDate) {
            return base.Channel.addStudentAsync(studentID, studentName, enrollmentDate);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Student[] getAllStudents() {
            return base.Channel.getAllStudents();
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Student[]> getAllStudentsAsync() {
            return base.Channel.getAllStudentsAsync();
        }
        
        public Enrolment_System_App.EnrollmentSystem.Enrollment[] viewStudentEnrollents(string studentID) {
            return base.Channel.viewStudentEnrollents(studentID);
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> viewStudentEnrollentsAsync(string studentID) {
            return base.Channel.viewStudentEnrollentsAsync(studentID);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Student getStudentDetails(string studentID) {
            return base.Channel.getStudentDetails(studentID);
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Student> getStudentDetailsAsync(string studentID) {
            return base.Channel.getStudentDetailsAsync(studentID);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Course[] getAllCourses() {
            return base.Channel.getAllCourses();
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course[]> getAllCoursesAsync() {
            return base.Channel.getAllCoursesAsync();
        }
        
        public Enrolment_System_App.EnrollmentSystem.Enrollment[] viewCourseEnrollents(string courseID) {
            return base.Channel.viewCourseEnrollents(courseID);
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> viewCourseEnrollentsAsync(string courseID) {
            return base.Channel.viewCourseEnrollentsAsync(courseID);
        }
        
        public decimal getCost(string courseID) {
            return base.Channel.getCost(courseID);
        }
        
        public System.Threading.Tasks.Task<decimal> getCostAsync(string courseID) {
            return base.Channel.getCostAsync(courseID);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Course[] getCourseList(string studentID) {
            return base.Channel.getCourseList(studentID);
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course[]> getCourseListAsync(string studentID) {
            return base.Channel.getCourseListAsync(studentID);
        }
        
        public string addCourse(string courseID, string courseName, decimal cost) {
            return base.Channel.addCourse(courseID, courseName, cost);
        }
        
        public System.Threading.Tasks.Task<string> addCourseAsync(string courseID, string courseName, decimal cost) {
            return base.Channel.addCourseAsync(courseID, courseName, cost);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Course getCourseDetails(string courseID) {
            return base.Channel.getCourseDetails(courseID);
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Course> getCourseDetailsAsync(string courseID) {
            return base.Channel.getCourseDetailsAsync(courseID);
        }
        
        public Enrolment_System_App.EnrollmentSystem.Enrollment[] getEnrollments() {
            return base.Channel.getEnrollments();
        }
        
        public System.Threading.Tasks.Task<Enrolment_System_App.EnrollmentSystem.Enrollment[]> getEnrollmentsAsync() {
            return base.Channel.getEnrollmentsAsync();
        }
        
        public string addEnrolment(string studentID, string courseID, string grade) {
            return base.Channel.addEnrolment(studentID, courseID, grade);
        }
        
        public System.Threading.Tasks.Task<string> addEnrolmentAsync(string studentID, string courseID, string grade) {
            return base.Channel.addEnrolmentAsync(studentID, courseID, grade);
        }
    }
}
