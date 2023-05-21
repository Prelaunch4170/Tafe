use sams;

select * from test
where TestName = 'Engine Start and run up according to AFM procedures';

select TestEvent.aircraftID, Technician.firstName, technician.lastName
from TestEvent
inner join testitemtestevent on testevent.testEventCode = testitemtestevent.testEventCode
inner join techniciantestitemtestevent on testitemtestevent.testEventCode = techniciantestitemtestevent.testEventCode
inner join technician on techniciantestitemtestevent.technicianID = technician.technicianID
inner join testitem on technician.technicianID = testitem.technicianID
where testItemName = 'Engine Start and run up according to AFM procedures' AND (testevent.dateStart between '2022-01-01' and '2022-01-31');

SELECT TestEvent.aircraftID, Technician.firstName, technician.lastName, TestEvent.dateStart
FROM TestItem
INNER JOIN TestItemTestEvent ON TestItem.testItemCode = TestItemTestEvent.TestItemCode
INNER JOIN TestEvent ON TestItemTestEvent.testEventCode = TestEvent.testEventCode
INNER JOIN TechnicianTestItemTestEvent ON TestItemTestEvent.TestItemCode = TechnicianTestItemTestEvent.testItemCode
    AND TestItemTestEvent.testEventCode = TechnicianTestItemTestEvent.testEventCode
INNER JOIN Technician ON TechnicianTestItemTestEvent.TechnicianID = Technician.technicianID
where testItemName = 'Engine Start and run up according to AFM procedures' AND (testevent.dateStart between '2022-01-01' and '2022-01-31')
ORDER BY TestEvent.dateStart ASC;
