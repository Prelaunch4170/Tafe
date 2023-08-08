  INSERT INTO `encryption_db`.`TestEvent_SEC` (`testEventCode`,`technicianSupervisorID`, `dateStart`, `dateEnd`, `testResult`, `resultComment`, `aircraftID`)
VALUES ('TE001', 1, '2022-03-01 10:00:00', '2022-03-01 12:00:00', AES_ENCRYPT(1,'TestResult'), AES_ENCRYPT('Test event 1 passed','resultComment'), 'AC001'),
       ('TE002', 2, '2022-01-02 09:00:00', '2022-03-02 11:30:00', AES_ENCRYPT(0,'TestResult'),AES_ENCRYPT('Test event 2 failed','resultComment'), 'AC002'),
       ('TE003', 3, '2022-01-02 09:00:00', '2022-03-02 11:30:00', AES_ENCRYPT(1,'TestResult'), AES_ENCRYPT('Test event 3 passed','resultComment'), 'AC001');
       
INSERT INTO `encryption_db`.`AircraftModelQualifiedTechnician_SEC`(`aircraftModelID`, `technicianID`, `trainingID`)
values	(1, AES_ENCRYPT(1,'technicianID'), 1),
		(1, AES_ENCRYPT(2,'technicianID'), 1),
		(2, AES_ENCRYPT(2,'technicianID'), 2);
        
select * from `encryption_db`.`AircraftModelQualifiedTechnician_SEC`;
select * from `encryption_db`.`TestEvent_SEC`;