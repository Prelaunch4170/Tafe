use sams;

select * from testItem
where testItemName = 'Engine Start and run up according to AFM procedures';


SELECT testEvent.aircraftID, Technician.firstName, technician.lastName, testEvent.datestart
FROM testItem
INNER JOIN testItemtestEvent ON testItem.testItemCode = testItemtestEvent.testItemCode
INNER JOIN testEvent ON testItemtestEvent.testEventCode = testEvent.testEventCode
INNER JOIN TechniciantestItemtestEvent ON testItemtestEvent.testItemCode = TechniciantestItemtestEvent.testItemCode
    AND testItemtestEvent.testEventCode = TechniciantestItemtestEvent.testEventCode
INNER JOIN Technician ON TechniciantestItemtestEvent.TechnicianID = Technician.technicianID
where testItemName = 'Engine Start and run up according to AFM procedures' AND (testevent.datestart between '2022-01-01' and '2022-01-31')
ORDER BY testEvent.datestart ASC;
