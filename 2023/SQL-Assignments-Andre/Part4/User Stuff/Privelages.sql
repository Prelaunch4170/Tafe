GRANT ALL on sams.aircraftmodelqualifiedtechnician TO 'Human Resources';
GRANT ALL on sams.technician TO 'Human Resources';
GRANT ALL on sams.qualifiedtechnician TO 'Human Resources';
GRANT ALL on sams.training TO 'Human Resources';


GRANT INSERT, UPDATE, select on sams.aircraftmodel TO 'Technician';
GRANT select on sams.training TO 'Technician';


GRANT 'Human Resources' to 'Jake'@'localhost';

GRANT 'Technician' TO 'Jim'@'localhost';


Use mysql;
Select *
from user;