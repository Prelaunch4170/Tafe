use sams;
SELECT
	TestEvent.dateStart,
	TestEvent.Aircraft_AircraftID,
	CONCAT(Technician.lastName, ', ', Technician.firstName) AS fullName
FROM
	TestEvent
		INNER JOIN
	TestItemTestEvent
			ON TestItemTestEvent.testEventCode = TestEvent.testEventCode
		INNER JOIN
	TestItem
			ON TestItem.testItemCode = TestItemTestEvent.testItemCode
		INNER JOIN
	TestItemTestEvent_has_Technician
			ON TestItemTestEvent_has_Technician.testEventCode = TestItemTestEvent.testEventCode AND TestItemTestEvent_has_Technician.testItemCode = TestItemTestEvent.testItemCode
		INNER JOIN
	Technician
			ON Technician.TechnicianID = TestItem.Technician_TechnicianID
WHERE
	TestItem.TestName = "Engine start and run up according to AFM procedures " AND TestEvent.dateStart BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY TestEvent.dateStart ASC;