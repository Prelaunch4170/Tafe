use sams;

select * from testevent;
update testevent
set dateStart = <{dateStart: }>
where testevent.testEventCode = <{testEventCode: }>/*[entered testeventcode]*/;
select * from testevent;

select concat(`technician`.`firstName`," " ,`technician`.`lastName`) as "Manager Name"
from technician
where `technician`.`technicianID` = <{TechnicianID: }>/*[entered technicianID]*/;
