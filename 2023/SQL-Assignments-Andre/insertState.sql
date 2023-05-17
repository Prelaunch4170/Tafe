

-- INSERT statements for `Country` table
INSERT INTO `sams`.`Country` (`countyID`, `countryName`)
VALUES ('AUS', 'Australia'),
       ('USA', 'United States'),
       ('CAN', 'Canada');

-- INSERT statements for `Airline` table
INSERT INTO `sams`.`Airline` (`airlineID`, `country`, `airlineName`, `street`, `suburb`, `state`, `contactPhone`, `websiteAddress`)
VALUES ('A1', 'AUS', 'Qantas Airways', '123 Main Street', 'Sydney', 'NSW', '1234567890', 'www.qantas.com'),
       ('A2', 'USA', 'American Airlines', '456 Elm Street', 'New York', 'NY', '9876543210', 'www.aa.com');

-- INSERT statements for `Manufacturer` table
INSERT INTO `sams`.`Manufacturer` (`manufacturerID`, `manufacturerName`)
VALUES (1, 'Boeing'),
       (2, 'Airbus');

-- INSERT statements for `AircraftModel` table
INSERT INTO `sams`.`AircraftModel` (`aircraftModelID`, `manufacturerID`)
VALUES (1, 1),
       (2, 2);

-- INSERT statements for `Aircraft` table
INSERT INTO `sams`.`Aircraft` (`aircraftID`,  `aircraftModelID`, `aircraftName`)
VALUES ('AC001', 1, 'Boeing 747'),
       ('AC002', 2, 'Airbus A320');

-- INSERT statements for `SubModel` table
INSERT INTO `sams`.`SubModel` (`SubModelId`, `AircraftModelID`, `length`, `height`, `wingspanArea`, `maxPayload`, `maxCrusingSpeed`, `maxRange`)
VALUES ('SM001', 1, 12.345, 9.876, 123.45, 5000, 345.67, 10000),
       ('SM002', 2, 10.987, 7.654, 98.76, 4000, 234.56, 8000),
       ('SM003', 1, 9.876, 6.543, 87.65, 3000, 123.45, 6000);

-- INSERT statements for `EngineModel` table
INSERT INTO `sams`.`EngineModel` (`engineModelName`, `manufacturer`, `thrustRange`, `dryWeight`)
VALUES ('EM001', 'General Electric', 50000, 5000.5),
       ('EM002', 'Rolls-Royce', 55000, 5200.75);

-- INSERT statements for `Engine` table
INSERT INTO `sams`.`Engine` (`engineIDNumber`, `aircraftModel`, `engineModelName`, `manufacturingDate`)
VALUES ('E001', 'AC001', 'EM001', '2022-01-01'),
       ('E002', 'AC002', 'EM002', '2022-02-01');

-- INSERT statements for `Cargo` table
INSERT INTO `sams`.`CargoModel` (`CargoCatagoryID`, `SubModelId`, `maxCargoWeight`, `mainDeckCapacity`, `lowerDeckCapacity`)
VALUES ('CC001', 'SM002', 5000, 10, 20),
       ('CC002', 'SM003', 6000, 15, 25);
       
       -- INSERT statements for `Passenger` table
INSERT INTO `sams`.`Passengermodel` (`PassengerCatagoryID`, `SubModelId`, `maxPassengers`, `maxFirstClassPassengers`, `maxEconomyPassengers`)
VALUES ('PC001', 'SM001', 200, 20, 180),
       ('PC002', 'SM002', 150, 10, 140);

-- INSERT statements for `Technician` table
INSERT INTO `sams`.`Technician` (`technicianID`, `supervisorID`, `firstName`, `lastName`, `streetAddress`, `suburb`, `postcode`, `phone`, `salary`, `loginName`, `country`)
VALUES (1, NULL, 'John', 'Smith', '789 Oak Street', 'Los Angeles', '90001', '1234567890', 5000.5, 'johnsmith', 'USA'),
       (2, 1, 'Jane', 'Doe', '456 Pine Street', 'San Francisco', '90002', '9876543210', 6000.75, 'janedoe', 'USA'),
       (3, 1, 'Sam', 'Smith', '457 Pine Street', 'San Francisco', '90002', '9876543211', 6000.75, 'SamSmith', 'USA'),
       (4, 1, 'Jake', 'jones', '457 Pine Street', 'San Francisco', '90002', '9876543211', 6000.75, 'Jakejones', 'USA');

-- INSERT statements for `Training` table
INSERT INTO `sams`.`Training` (`trainingId`, `trainingName`, `trainingDate`)
VALUES (1, 'Safety Training', '2022-01-01'),
       (2, 'Maintenance Training', '2022-02-01');

-- INSERT statements for `QualifiedTechnician` table
INSERT INTO `sams`.`QualifiedTechnician` (`technicianID`, `trainingId`, `aircraftID`, `completionStatus`)
VALUES (1, 1, 'AC001', 1),
       (2, 2, 'AC002', 0);

-- INSERT statements for `Manager` table
INSERT INTO `sams`.`Manager` (`technicianID`, `commencedManagment`)
VALUES (1, '2022-03-01'),
       (2, '2022-04-01'),
       (3, '2022-04-01');

-- INSERT statements for `Test` table
INSERT INTO `sams`.`Test` (`testID`, `TestName`)
VALUES (1, 'Electrical Test'),
       (2, 'Pressure Test'),
       (3,'Engine Start and run up according to AFM procedures');

-- INSERT statements for `TestItem` table
INSERT INTO `sams`.`TestItem` (`testItemCode`, `testID`, `technicianID`, `testResult`)
VALUES 	('TI001', 1, 1, 1),
		('TI003', 2, 1, 1),
		
        ('TI002', 1, 2, 0),
        ('TI004', 3, 2, 1),
        
		('TI005', 2, 3, 1),
		('TI006', 3, 4, 1);
       
-- INSERT statements for `TestEvent` table
INSERT INTO `sams`.`TestEvent` (`testEventCode`,`technicianID`, `dateStart`, `dateEnd`, `testResult`, `hoursSpent`, `resultComment`, `aircraftID`)
VALUES ('TE001', 1, '2022-03-01 10:00:00', '2022-03-01 12:00:00', 1, 2.5, 'Test event 1 passed', 'AC001'),
       ('TE002', 2, '2022-01-02 09:00:00', '2022-03-02 11:30:00', 0, 2.75, 'Test event 2 failed', 'AC002'),
       ('TE003', 3, '2022-01-02 09:00:00', '2022-03-02 11:30:00', 1, 2.75, 'Test event 3 passed', 'AC001');

-- INSERT statements for `TestItemTestEvent` table
INSERT INTO `sams`.`TestItemTestEvent` (`TestItemCode`, `testEventCode`,`testID`)
VALUES ('TI001', 'TE001', 1),
       ('TI002', 'TE001', 1),
       
       ('TI004', 'TE002', 3),
		
       ('TI001', 'TE002', 2),
       ('TI003', 'TE002', 2),
       
       ('TI005', 'TE003', 3),
       ('TI006', 'TE003', 2);
       

-- INSERT statements for `TechnicianTestItemTestEvent` table
INSERT INTO `sams`.`TechnicianTestItemTestEvent` (`testItemCode`, `testEventCode`, `TechnicianID`,`testID`)
VALUES ('TI001', 'TE001', 1, 1),
       ('TI002', 'TE001', 2, 1),
       ('TI001', 'TE002', 2, 2),
       ('TI003', 'TE002', 1, 3),
       
       ('TI006', 'TE003', 4, 3),
       ('TI005', 'TE003', 3, 3);
       
-- INSERT statements for `Airline_has_Aircraft` table
INSERT INTO `sams`.`Airline_has_Aircraft`(`airlineID`,  `aircraftID`,  `dateOwned`)
VALUES	('A1', 'AC001', '2021-03-01'),
		('A2', 'AC002', '2022-03-21');

