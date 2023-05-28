GRANT ALL on sams.aircraftmodelqualifiedtechnician TO 'Human Resources'@'%';
GRANT ALL on sams.technician TO 'Human Resources'@'%';
GRANT ALL on sams.qualifiedtechnician TO 'Human Resources'@'%';
GRANT ALL on sams.training TO 'Human Resources'@'%';


GRANT INSERT, UPDATE, select on sams.aircraftmodel TO 'Technician'@'%';
GRANT select on sams.AircraftModelQualifiedTechnician TO 'Technician'@'%';




Use mysql;
Select *
from user;

show grants for 'Jake'@'%';
show grants for 'Jim'@'%';
show grants for 'Human Resources'@'%';
