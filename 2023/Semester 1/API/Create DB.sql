drop database if exists StudentEnrolmentSystem;
create database StudentEnrolmentSystem;
use StudentEnrolmentSystem;

create table student(
	StudentID int primary key not null,
    GivenName varchar(64) not null,
    LastName varchar(64) not null,
    EmailAddress varchar(64) not null
);
