use sps_db;
INSERT INTO students (student_id, given_name, last_name, email_address, created_at, updated_at)
VALUES
    (16, 'Emma', 'Parker', 'emma.parker@example.com', '2023-05-13 14:30:00', '2023-05-13 15:45:00'),
    (17, 'William', 'Gonzalez', 'william.gonzalez@example.com', '2023-05-12 12:10:00', '2023-05-12 13:20:00'),
    (18, 'Samantha', 'Young', 'samantha.young@example.com', '2023-05-11 10:50:00', '2023-05-11 12:00:00'),
    (19, 'Joseph', 'Walker', 'joseph.walker@example.com', '2023-05-10 09:40:00', '2023-05-10 10:50:00'),
    (20, 'Grace', 'Hall', 'grace.hall@example.com', '2023-05-09 08:30:00', '2023-05-09 09:40:00'),
    (21, 'Daniel', 'Gomez', 'daniel.gomez@example.com', '2023-05-08 14:00:00', '2023-05-08 15:10:00'),
    (22, 'Lily', 'Hernandez', 'lily.hernandez@example.com', '2023-05-07 11:40:00', '2023-05-07 12:50:00'),
    (23, 'Alexander', 'Kelly', 'alexander.kelly@example.com', '2023-05-06 09:20:00', '2023-05-06 10:30:00'),
    (24, 'Sophia', 'Carter', 'sophia.carter@example.com', '2023-05-05 08:10:00', '2023-05-05 09:20:00'),
    (25, 'Samuel', 'Wright', 'samuel.wright@example.com', '2023-05-04 14:50:00', '2023-05-04 16:00:00'),
    (26, 'Avery', 'Roberts', 'avery.roberts@example.com', '2023-05-03 12:30:00', '2023-05-03 13:40:00'),
    (27, 'Elizabeth', 'Price', 'elizabeth.price@example.com', '2023-05-02 10:10:00', '2023-05-02 11:20:00'),
    (28, 'David', 'Flores', 'david.flores@example.com', '2023-05-01 09:00:00', '2023-05-01 10:10:00'),
    (29, 'Charlotte', 'Morgan', 'charlotte.morgan@example.com', '2023-04-30 13:20:00', '2023-04-30 14:30:00'),
    (30, 'Andrew', 'Turner', 'andrew.turner@example.com', '2023-04-29 11:00:00', '2023-04-29 12:10:00');

select * from students;