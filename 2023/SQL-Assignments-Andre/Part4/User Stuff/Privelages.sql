GRANT ALL on sams.aircraftmodelqualifiedtechnician TO 'Human Resources'@'%';
GRANT ALL on sams.technician TO 'Human Resources'@'%';
GRANT ALL on sams.qualifiedtechnician TO 'Human Resources'@'%';
GRANT ALL on sams.training TO 'Human Resources'@'%';


GRANT INSERT, UPDATE, select on sams.aircraftmodel TO 'Technician'@'%';
GRANT select on sams.training TO 'Technician'@'%';


GRANT 'Human Resources'@'%' to 'Jake'@'%';
SET DEFAULT ROLE 'Human Resources'@'%' to 'Jake'@'%';

GRANT 'Technician'@'%' TO 'Jim'@'%';
SET DEFAULT ROLE 'Technician'@'%' TO 'Jim'@'%';

Use mysql;
Select *
from user;

show grants for 'Jake'@'%';
show grants for 'Jim'@'%';
show grants for 'Human Resources'@'%';
