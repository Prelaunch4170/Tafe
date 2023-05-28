drop database if exists encryption_db;
create database encryption_db;

use encryption_db;


create table AircraftModelQualifiedTechnician_SEC(`aircraftModelID` INT NOT NULL,
  `trainingID` INT NOT NULL,
  `technicianID` VARBINARY(255) NOT NULL);
  
  create table TestEvent_SEC(`testEventCode` VARCHAR(5) NOT NULL,
  `technicianSupervisorID` INT NOT NULL,
  `dateStart` DATETIME NOT NULL,
  `dateEnd` DATETIME NULL,
  `testResult`  VARBINARY(255) NULL,
  `resultComment` VARBINARY(255) NULL,
  `aircraftID` VARCHAR(6) NOT NULL);
  
