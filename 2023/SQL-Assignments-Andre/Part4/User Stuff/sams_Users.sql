drop user if exists 'Jake'@'%';
drop user if exists 'Jim'@'%';

drop role if exists 'Human Resources'@'%';
drop role if exists 'Technician'@'%';

CREATE USER 'Jake'@'%' IDENTIFIED BY 'Green';
CREATE USER 'Jim'@'%' IDENTIFIED BY 'White';

CREATE ROLE 'Human Resources'@'%';
CREATE ROLE 'Technician'@'%';

Use mysql;
Select *
from user;