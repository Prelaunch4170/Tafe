use sams;

select * from test
where TestName = 'Engine Start and run up according to AFM procedures';

select TestEvent.aircraftID, Technician.firstName, technician.lastName
from TestEvent
inner join testitemtestevent on testevent.testEventCode = testitemtestevent.testEventCode
inner join techniciantestitemtestevent on testitemtestevent.testEventCode = techniciantestitemtestevent.testEventCode
inner join technician on techniciantestitemtestevent.technicianID = technician.technicianID
inner join testitem on technician.technicianID = testitem.technicianID
inner join test on testitem.testID = test.testID
where TestName = 'Engine Start and run up according to AFM procedures' AND (testevent.dateStart between '2022-01-01' and '2022-01-31');