


CREATE USER 'Jake'@'%' IDENTIFIED BY 'Green';
CREATE USER 'Jim'@'%' IDENTIFIED BY 'White';

CREATE ROLE 'Human Resources';
CREATE ROLE 'Technician';

GRANT ALL on sams.aircraftmodelqualifiedtechnician TO 'Human Resources';
GRANT ALL on sams.technician TO 'Human Resources';
GRANT ALL on sams.qualifiedtechnician TO 'Human Resources';
GRANT ALL on sams.training TO 'Human Resources';


GRANT INSERT, UPDATE, select on sams.aircraftmodel TO 'Technician';
GRANT select on sams.training TO 'Technician';

GRANT 'Human Resources' TO 'Jake'@'%';

GRANT 'Technician' TO 'Jim'@'%';

FLUSH PRIVILEGES;


Use mysql;
Select *
from user;