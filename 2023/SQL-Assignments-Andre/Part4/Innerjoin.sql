use sams;

select * from test
where TestName = 'Engine Start and run up according to AFM procedures';


SELECT TestEvent.aircraftID, Technician.firstName, technician.lastName, TestEvent.dateStart
FROM TestItem
INNER JOIN TestItemTestEvent ON TestItem.testItemCode = TestItemTestEvent.TestItemCode
INNER JOIN TestEvent ON TestItemTestEvent.testEventCode = TestEvent.testEventCode
INNER JOIN TechnicianTestItemTestEvent ON TestItemTestEvent.TestItemCode = TechnicianTestItemTestEvent.testItemCode
    AND TestItemTestEvent.testEventCode = TechnicianTestItemTestEvent.testEventCode
INNER JOIN Technician ON TechnicianTestItemTestEvent.TechnicianID = Technician.technicianID
where testItemName = 'Engine Start and run up according to AFM procedures' AND (testevent.dateStart between '2022-01-01' and '2022-01-31')
ORDER BY TestEvent.dateStart ASC;
