use StudentEnrolmentSystem;
truncate students;
insert into students (given_name, last_name, email_address, created_at, updated_at)
Values("John", "James", "John.James@School.edu.au","2023-04-15T10:58:55+00:00","2023-04-15T10:58:55+00:00"),
("Sam", "Smith", "Sam.Smith@School.edu.au","2023-04-15T10:58:55+00:00","2023-04-15T10:58:55+00:00"),
("Alex", "Alphonso", "Alex.Alphonso@School.edu.au","2023-04-15T10:58:55+00:00","2023-04-15T10:58:55+00:00"),
("Peter", "Patrics", "Peter.Patrics@School.edu.au","2023-04-15T10:58:55+00:00","2023-04-15T10:58:55+00:00");