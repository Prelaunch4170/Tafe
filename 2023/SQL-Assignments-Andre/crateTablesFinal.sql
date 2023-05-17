-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sams
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sams
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sams` DEFAULT CHARACTER SET utf8 ;
USE `sams` ;

-- -----------------------------------------------------
-- Table `sams`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Country` ;

CREATE TABLE IF NOT EXISTS `sams`.`Country` (
  `countyID` VARCHAR(3) NOT NULL,
  `countryName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`countyID`),
  UNIQUE INDEX `countryName_UNIQUE` (`countryName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Airline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Airline` ;

CREATE TABLE IF NOT EXISTS `sams`.`Airline` (
  `airlineID` VARCHAR(2) NOT NULL,
  `country` VARCHAR(3) NOT NULL,
  `airlineName` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `suburb` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `contactPhone` VARCHAR(45) NOT NULL,
  `websiteAddress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airlineID`),
  INDEX `fk_Airline_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `sams`.`Country` (`countyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Manufacturer` ;

CREATE TABLE IF NOT EXISTS `sams`.`Manufacturer` (
  `manufacturerID` INT NOT NULL,
  `manufacturerName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`manufacturerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`AircraftModel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`AircraftModel` ;

CREATE TABLE IF NOT EXISTS `sams`.`AircraftModel` (
  `aircraftModelID` INT NOT NULL,
  `manufacturerID` INT NOT NULL,
  PRIMARY KEY (`aircraftModelID`),
  INDEX `fk_AircraftModel_Manufacturer1_idx` (`manufacturerID` ASC) VISIBLE,
  CONSTRAINT `fk_AircraftModel_Manufacturer`
    FOREIGN KEY (`manufacturerID`)
    REFERENCES `sams`.`Manufacturer` (`manufacturerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Aircraft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Aircraft` ;

CREATE TABLE IF NOT EXISTS `sams`.`Aircraft` (
  `aircraftID` VARCHAR(6) NOT NULL,
  `aircraftModelID` INT NOT NULL,
  `aircraftName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`aircraftID`),
  INDEX `fk_Aircraft_AircraftModel2_idx` (`aircraftModelID` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft_AircraftModel`
    FOREIGN KEY (`aircraftModelID`)
    REFERENCES `sams`.`AircraftModel` (`aircraftModelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`SubModel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`SubModel` ;

CREATE TABLE IF NOT EXISTS `sams`.`SubModel` (
  `SubModelId` VARCHAR(10) NOT NULL,
  `AircraftModelID` INT NOT NULL,
  `length` DECIMAL(6,3) UNSIGNED NOT NULL,
  `height` DECIMAL(6,3) UNSIGNED NOT NULL,
  `wingspanArea` DECIMAL(6,2) UNSIGNED NOT NULL,
  `maxPayload` INT UNSIGNED NOT NULL,
  `maxCrusingSpeed` DECIMAL(6,2) UNSIGNED NOT NULL,
  `maxRange` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`SubModelId`),
  INDEX `AircraftModel_idx` (`AircraftModelID` ASC) VISIBLE,
  CONSTRAINT `AircraftModel`
    FOREIGN KEY (`AircraftModelID`)
    REFERENCES `sams`.`AircraftModel` (`aircraftModelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`EngineModel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`EngineModel` ;

CREATE TABLE IF NOT EXISTS `sams`.`EngineModel` (
  `engineModelName` VARCHAR(30) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `thrustRange` INT UNSIGNED NOT NULL,
  `dryWeight` DECIMAL(6,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`engineModelName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Engine` ;

CREATE TABLE IF NOT EXISTS `sams`.`Engine` (
  `engineIDNumber` VARCHAR(30) NOT NULL,
  `aircraftModel` VARCHAR(6) NOT NULL,
  `engineModelName` VARCHAR(30) NOT NULL,
  `manufacturingDate` DATE NOT NULL,
  PRIMARY KEY (`engineIDNumber`),
  INDEX `fk_Engine_Aircraft1_idx` (`aircraftModel` ASC) VISIBLE,
  INDEX `fk_Engine_EngineModel2_idx` (`engineModelName` ASC) VISIBLE,
  CONSTRAINT `fk_Engine_Aircraft1`
    FOREIGN KEY (`aircraftModel`)
    REFERENCES `sams`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engine_EngineModel2`
    FOREIGN KEY (`engineModelName`)
    REFERENCES `sams`.`EngineModel` (`engineModelName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`CargoModel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`CargoModel` ;

CREATE TABLE IF NOT EXISTS `sams`.`CargoModel` (
  `CargoCatagoryID` VARCHAR(10) NOT NULL,
  `SubModelId` VARCHAR(10) NOT NULL,
  `maxCargoWeight` INT UNSIGNED NOT NULL,
  `mainDeckCapacity` INT UNSIGNED NOT NULL,
  `lowerDeckCapacity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`CargoCatagoryID`, `SubModelId`),
  INDEX `fk_CargoModel_SubModel1_idx` (`SubModelId` ASC) VISIBLE,
  CONSTRAINT `fk_CargoModel_SubModel1`
    FOREIGN KEY (`SubModelId`)
    REFERENCES `sams`.`SubModel` (`SubModelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`PassengerModel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`PassengerModel` ;

CREATE TABLE IF NOT EXISTS `sams`.`PassengerModel` (
  `PassengerCatagoryID` VARCHAR(10) NOT NULL,
  `SubModelId` VARCHAR(10) NOT NULL,
  `maxPassengers` INT UNSIGNED NOT NULL,
  `maxFirstClassPassengers` INT UNSIGNED NOT NULL,
  `maxEconomyPassengers` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PassengerCatagoryID`, `SubModelId`),
  INDEX `fk_PassengerModel_SubModel1_idx` (`SubModelId` ASC) VISIBLE,
  CONSTRAINT `fk_PassengerModel_SubModel1`
    FOREIGN KEY (`SubModelId`)
    REFERENCES `sams`.`SubModel` (`SubModelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Technician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Technician` ;

CREATE TABLE IF NOT EXISTS `sams`.`Technician` (
  `technicianID` INT NOT NULL AUTO_INCREMENT,
  `supervisorID` INT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `streetAddress` VARCHAR(45) NOT NULL,
  `suburb` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(15) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `salary` DECIMAL(12,3) UNSIGNED NOT NULL,
  `loginName` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`technicianID`),
  INDEX `fk_Technician_Technician1_idx` (`supervisorID` ASC) VISIBLE,
  CONSTRAINT `fk_Technician_Technician`
    FOREIGN KEY (`supervisorID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Training` ;

CREATE TABLE IF NOT EXISTS `sams`.`Training` (
  `trainingId` INT NOT NULL,
  `trainingName` VARCHAR(45) NOT NULL,
  `trainingDate` DATE NOT NULL,
  PRIMARY KEY (`trainingId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`QualifiedTechnician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`QualifiedTechnician` ;

CREATE TABLE IF NOT EXISTS `sams`.`QualifiedTechnician` (
  `technicianID` INT NOT NULL,
  `trainingId` INT NOT NULL,
  `aircraftID` VARCHAR(6) NOT NULL,
  `completionStatus` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`trainingId`, `technicianID`),
  INDEX `fk_QualifiedTechnician_Technician1_idx` (`technicianID` ASC) VISIBLE,
  INDEX `fk_QualifiedTechnician_Training1_idx` (`trainingId` ASC) VISIBLE,
  INDEX `fk_QualifiedTechnician_Aircraft2_idx` (`aircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_QualifiedTechnician_Technician`
    FOREIGN KEY (`technicianID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QualifiedTechnician_Training`
    FOREIGN KEY (`trainingId`)
    REFERENCES `sams`.`Training` (`trainingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QualifiedTechnician_Aircraft`
    FOREIGN KEY (`aircraftID`)
    REFERENCES `sams`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Manager` ;

CREATE TABLE IF NOT EXISTS `sams`.`Manager` (
  `technicianID` INT NOT NULL,
  `commencedManagment` DATE NOT NULL,
  PRIMARY KEY (`technicianID`),
  INDEX `fk_Manager_Technician1_idx1` (`technicianID` ASC) VISIBLE,
  CONSTRAINT `fk_Manager_Technician`
    FOREIGN KEY (`technicianID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Test` ;

CREATE TABLE IF NOT EXISTS `sams`.`Test` (
  `testID` INT NOT NULL,
  `TestName` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`testID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`TestItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`TestItem` ;

CREATE TABLE IF NOT EXISTS `sams`.`TestItem` (
  `testItemCode` VARCHAR(5) NOT NULL,
  `technicianID` INT NOT NULL,
  `testResult` TINYINT NOT NULL,
  `testID` INT NOT NULL,
  PRIMARY KEY (`testItemCode`, `testID`),
  INDEX `fk_TestItem_Technician1_idx` (`technicianID` ASC) VISIBLE,
  INDEX `fk_TestItem_Test1_idx` (`testID` ASC) VISIBLE,
  CONSTRAINT `fk_TestItem_Technician`
    FOREIGN KEY (`technicianID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_Test1`
    FOREIGN KEY (`testID`)
    REFERENCES `sams`.`Test` (`testID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`TestEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`TestEvent` ;

CREATE TABLE IF NOT EXISTS `sams`.`TestEvent` (
  `testEventCode` VARCHAR(5) NOT NULL,
  `technicianID` INT NOT NULL,
  `dateStart` DATETIME NOT NULL,
  `dateEnd` DATETIME NOT NULL,
  `testResult` TINYINT NULL,
  `hoursSpent` DECIMAL(6,2) NOT NULL,
  `resultComment` VARCHAR(150) NOT NULL,
  `aircraftID` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`testEventCode`),
  INDEX `fk_TestEvent_Technician_id` (`technicianID` ASC) INVISIBLE,
  INDEX `fk_TestEvent_Aircraft1_idx` (`aircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_TestEvent_Technician`
    FOREIGN KEY (`technicianID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_Aircraft`
    FOREIGN KEY (`aircraftID`)
    REFERENCES `sams`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`TestItemTestEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`TestItemTestEvent` ;

CREATE TABLE IF NOT EXISTS `sams`.`TestItemTestEvent` (
  `testItemCode` VARCHAR(5) NOT NULL,
  `testID` INT NOT NULL,
  `testEventCode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`testItemCode`, `testID`, `testEventCode`),
  INDEX `fk_TestItemTestEvent_TestItem1_idx` (`testItemCode` ASC, `testID` ASC) VISIBLE,
  INDEX `fk_TestItemTestEvent_TestEvent1_idx` (`testEventCode` ASC) INVISIBLE,
  CONSTRAINT `fk_TestItemTestEvent_TestItem1`
    FOREIGN KEY (`testItemCode` , `testID`)
    REFERENCES `sams`.`TestItem` (`testItemCode` , `testID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItemTestEvent_TestEvent1`
    FOREIGN KEY (`testEventCode`)
    REFERENCES `sams`.`TestEvent` (`testEventCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`TechnicianTestItemTestEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`TechnicianTestItemTestEvent` ;

CREATE TABLE IF NOT EXISTS `sams`.`TechnicianTestItemTestEvent` (
  `TechnicianID` INT NOT NULL,
  `testItemCode` VARCHAR(5) NOT NULL,
  `testID` INT NOT NULL,
  `testEventCode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`TechnicianID`, `testItemCode`, `testID`, `testEventCode`),
  INDEX `fk_TestItemTestEvent_has_Technician_Technician1_idx` (`TechnicianID` ASC) VISIBLE,
  INDEX `fk_TechnicianTestItemTestEvent_TestItemTestEvent1_idx` (`testItemCode` ASC, `testID` ASC, `testEventCode` ASC) VISIBLE,
  CONSTRAINT `fk_Technician`
    FOREIGN KEY (`TechnicianID`)
    REFERENCES `sams`.`Technician` (`technicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TechnicianTestItemTestEvent_TestItemTestEvent1`
    FOREIGN KEY (`testItemCode` , `testID` , `testEventCode`)
    REFERENCES `sams`.`TestItemTestEvent` (`testItemCode` , `testID` , `testEventCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sams`.`Airline_has_Aircraft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sams`.`Airline_has_Aircraft` ;

CREATE TABLE IF NOT EXISTS `sams`.`Airline_has_Aircraft` (
  `airlineID` VARCHAR(2) NOT NULL,
  `aircraftID` VARCHAR(6) NOT NULL,
  `dateOwned` DATE NOT NULL,
  PRIMARY KEY (`airlineID`, `aircraftID`),
  INDEX `fk_Airline_has_Aircraft_Aircraft1_idx` (`aircraftID` ASC) VISIBLE,
  INDEX `fk_Airline_has_Aircraft_Airline1_idx` (`airlineID` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_has_Aircraft_Airline1`
    FOREIGN KEY (`airlineID`)
    REFERENCES `sams`.`Airline` (`airlineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airline_has_Aircraft_Aircraft1`
    FOREIGN KEY (`aircraftID`)
    REFERENCES `sams`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
