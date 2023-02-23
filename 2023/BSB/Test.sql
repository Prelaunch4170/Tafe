use session02db;

create table Department
(DepartmentID varchar(10) primary key,
DepartmentName varchar(45));

create table Employee
(EmployeeID varchar(10) primary key,
EmployeeName varchar(45),
DepartmentID varchar(10),
foreign key(DepartmentID) references Department(DepartmentID));

create table Project
(ProjectID varchar(10) primary key,
ProjectTitle varchar(45) not null)
;
