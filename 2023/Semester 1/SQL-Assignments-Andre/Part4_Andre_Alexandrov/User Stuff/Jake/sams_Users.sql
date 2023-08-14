drop user if exists 'Jake'@'%';

drop user if exists 'Jim'@'%';

drop role if exists 'Human Resources'@'%';
drop role if exists 'Technician'@'%';

CREATE USER 'Jake'@'%' IDENTIFIED BY 'Green';
CREATE USER 'Jim'@'%' IDENTIFIED BY 'White';

CREATE ROLE 'Human Resources'@'%';
CREATE ROLE 'Technician'@'%';

GRANT 'Human Resources'@'%' to 'Jake'@'%';
SET DEFAULT ROLE 'Human Resources'@'%' to 'Jake'@'%';

GRANT 'Technician'@'%' TO 'Jim'@'%';
SET DEFAULT ROLE 'Technician'@'%' TO 'Jim'@'%';

Use mysql;
Select *
from user;