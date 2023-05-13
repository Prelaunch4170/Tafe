-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `countyID` VARCHAR(3) NOT NULL,
  `countryName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`countyID`),
  UNIQUE INDEX `countryName_UNIQUE` (`countryName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airline` (
  `AirlineID` VARCHAR(2) NOT NULL,
  `Country` VARCHAR(3) NOT NULL,
  `airlineName` VARCHAR(45) NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `Suburb` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `contactPhone` VARCHAR(45) NOT NULL,
  `websiteAddress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AirlineID`),
  INDEX `fk_Airline_Country1_idx` (`Country` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_Country1`
    FOREIGN KEY (`Country`)
    REFERENCES `mydb`.`Country` (`countyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Manufacturer` (
  `ManufacturerID` INT NOT NULL,
  `manufacturerName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ManufacturerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AircraftModel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AircraftModel` (
  `AircraftModelID` INT NOT NULL,
  `Manufacturer_ManufacturerID` INT NOT NULL,
  PRIMARY KEY (`AircraftModelID`),
  INDEX `fk_AircraftModel_Manufacturer1_idx` (`Manufacturer_ManufacturerID` ASC) VISIBLE,
  CONSTRAINT `fk_AircraftModel_Manufacturer1`
    FOREIGN KEY (`Manufacturer_ManufacturerID`)
    REFERENCES `mydb`.`Manufacturer` (`ManufacturerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aircraft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aircraft` (
  `AircraftID` VARCHAR(6) NOT NULL,
  `Airline_AirlineID` VARCHAR(2) NOT NULL,
  `AircraftModelID` INT NOT NULL,
  `aircraftName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AircraftID`),
  INDEX `fk_Aircraft_Airline1_idx` (`Airline_AirlineID` ASC) VISIBLE,
  INDEX `fk_Aircraft_AircraftModel2_idx` (`AircraftModelID` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft_Airline1`
    FOREIGN KEY (`Airline_AirlineID`)
    REFERENCES `mydb`.`Airline` (`AirlineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_AircraftModel`
    FOREIGN KEY (`AircraftModelID`)
    REFERENCES `mydb`.`AircraftModel` (`AircraftModelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SubModel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SubModel` (
  `SubModelId` VARCHAR(10) NOT NULL,
  `AircraftModel_AircraftModelID` INT NOT NULL,
  `length` DECIMAL(3,3) NULL,
  `height` DECIMAL(3,3) NULL,
  `wingspanArea` DECIMAL(4,2) NULL,
  `maxPayload` INT NULL,
  `maxCrusingSpeed` DECIMAL(4,2) NULL,
  `maxRange` INT NULL,
  PRIMARY KEY (`SubModelId`),
  INDEX `fk_SubModel_AircraftModel1_idx` (`AircraftModel_AircraftModelID` ASC) VISIBLE,
  CONSTRAINT `fk_SubModel_AircraftModel1`
    FOREIGN KEY (`AircraftModel_AircraftModelID`)
    REFERENCES `mydb`.`AircraftModel` (`AircraftModelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EngineModel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EngineModel` (
  `EngineModelName` VARCHAR(30) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `thrustRange` INT NULL,
  `dryWeight` DECIMAL(4,2) NULL,
  PRIMARY KEY (`EngineModelName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Engine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Engine` (
  `engineIDNumber` VARCHAR(30) NOT NULL,
  `Aircraft_AircraftModel` VARCHAR(6) NOT NULL,
  `EngineModelName` VARCHAR(30) NOT NULL,
  `manufacturingDate` DATE NOT NULL,
  PRIMARY KEY (`engineIDNumber`),
  INDEX `fk_Engine_Aircraft1_idx` (`Aircraft_AircraftModel` ASC) VISIBLE,
  INDEX `fk_Engine_EngineModel2_idx` (`EngineModelName` ASC) VISIBLE,
  CONSTRAINT `fk_Engine_Aircraft1`
    FOREIGN KEY (`Aircraft_AircraftModel`)
    REFERENCES `mydb`.`Aircraft` (`AircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engine_EngineModel2`
    FOREIGN KEY (`EngineModelName`)
    REFERENCES `mydb`.`EngineModel` (`EngineModelName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `CargoCatagoryID` VARCHAR(10) NOT NULL,
  `SubModel_SubModelId1` VARCHAR(10) NOT NULL,
  `maxCargoWeight` INT NOT NULL,
  `mainDeckCapacity` INT NOT NULL,
  `lowerDeckCapacity` INT NOT NULL,
  PRIMARY KEY (`CargoCatagoryID`, `SubModel_SubModelId1`),
  INDEX `fk_Cargo_SubModel2_idx` (`SubModel_SubModelId1` ASC) VISIBLE,
  CONSTRAINT `fk_Cargo_SubModel2`
    FOREIGN KEY (`SubModel_SubModelId1`)
    REFERENCES `mydb`.`SubModel` (`SubModelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passanger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passanger` (
  `PassangerCatagoryID` VARCHAR(10) NOT NULL,
  `SubModel_SubModelId1` VARCHAR(10) NOT NULL,
  `maxPassagers` INT NULL,
  `maxFirstClassPassangers` INT NULL,
  `maxEconomyPassangers` INT NULL,
  PRIMARY KEY (`PassangerCatagoryID`, `SubModel_SubModelId1`),
  INDEX `fk_Passanger_SubModel2_idx` (`SubModel_SubModelId1` ASC) VISIBLE,
  CONSTRAINT `fk_Passanger_SubModel2`
    FOREIGN KEY (`SubModel_SubModelId1`)
    REFERENCES `mydb`.`SubModel` (`SubModelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Technician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Technician` (
  `TechnicianID` INT NOT NULL AUTO_INCREMENT,
  `supervisorID` INT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `streetAddress` VARCHAR(45) NOT NULL,
  `suburb` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(15) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `salary` DECIMAL(9,3) NOT NULL,
  `loginName` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TechnicianID`),
  INDEX `fk_Technician_Technician1_idx` (`supervisorID` ASC) VISIBLE,
  CONSTRAINT `fk_Technician_Technician1`
    FOREIGN KEY (`supervisorID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Training` (
  `TrainingId` INT NOT NULL,
  `trainingName` VARCHAR(45) NOT NULL,
  `trainingDate` DATE NOT NULL,
  PRIMARY KEY (`TrainingId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`QualifiedTechnician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`QualifiedTechnician` (
  `TechnicianID` INT NOT NULL,
  `TrainingId` INT NOT NULL,
  `AircraftID` VARCHAR(6) NOT NULL,
  `completionStatus` TINYINT NOT NULL,
  PRIMARY KEY (`TrainingId`, `TechnicianID`),
  INDEX `fk_QualifiedTechnician_Technician1_idx` (`TechnicianID` ASC) VISIBLE,
  INDEX `fk_QualifiedTechnician_Training1_idx` (`TrainingId` ASC) VISIBLE,
  INDEX `fk_QualifiedTechnician_Aircraft2_idx` (`AircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_QualifiedTechnician_Technician1`
    FOREIGN KEY (`TechnicianID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QualifiedTechnician_Training1`
    FOREIGN KEY (`TrainingId`)
    REFERENCES `mydb`.`Training` (`TrainingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QualifiedTechnician_Aircraft2`
    FOREIGN KEY (`AircraftID`)
    REFERENCES `mydb`.`Aircraft` (`AircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Manager` (
  `Technician_TechnicianID` INT NOT NULL,
  `commencedManagment` DATE NOT NULL,
  PRIMARY KEY (`Technician_TechnicianID`),
  INDEX `fk_Manager_Technician1_idx1` (`Technician_TechnicianID` ASC) VISIBLE,
  CONSTRAINT `fk_Manager_Technician1`
    FOREIGN KEY (`Technician_TechnicianID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Test` (
  `TestID` INT NOT NULL,
  PRIMARY KEY (`TestID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TestItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TestItem` (
  `TestItemCode` VARCHAR(5) NOT NULL,
  `Test_TestID1` INT NOT NULL,
  `Technician_TechnicianID` INT NOT NULL,
  `testResult` TINYINT NOT NULL,
  PRIMARY KEY (`TestItemCode`),
  INDEX `fk_TestItem_Test2_idx` (`Test_TestID1` ASC) VISIBLE,
  INDEX `fk_TestItem_Technician1_idx` (`Technician_TechnicianID` ASC) VISIBLE,
  CONSTRAINT `fk_TestItem_Test2`
    FOREIGN KEY (`Test_TestID1`)
    REFERENCES `mydb`.`Test` (`TestID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_Technician1`
    FOREIGN KEY (`Technician_TechnicianID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TestEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TestEvent` (
  `testEventCode` VARCHAR(5) NOT NULL,
  `Technician_TechnicianID` INT NOT NULL,
  `dateStart` DATETIME NOT NULL,
  `dateEnd` DATETIME NOT NULL,
  `testResult` TINYINT NULL,
  `hoursSpent` DECIMAL(3,2) NOT NULL,
  `resultComment` VARCHAR(150) NOT NULL,
  `Aircraft_AircraftID` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`testEventCode`),
  INDEX `fk_TestEvent_Technician_id` (`Technician_TechnicianID` ASC) INVISIBLE,
  INDEX `fk_TestEvent_Aircraft1_idx` (`Aircraft_AircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_TestEvent_Technician`
    FOREIGN KEY (`Technician_TechnicianID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_Aircraft1`
    FOREIGN KEY (`Aircraft_AircraftID`)
    REFERENCES `mydb`.`Aircraft` (`AircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TestItemTestEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TestItemTestEvent` (
  `TestItemCode` VARCHAR(5) NOT NULL,
  `testEventCode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`TestItemCode`, `testEventCode`),
  INDEX `fk_TestItem_has_TestEvent_TestEvent1_idx` (`testEventCode` ASC) VISIBLE,
  INDEX `fk_TestItem_has_TestEvent_TestItem1_idx` (`TestItemCode` ASC) VISIBLE,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestItem1`
    FOREIGN KEY (`TestItemCode`)
    REFERENCES `mydb`.`TestItem` (`TestItemCode`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestEvent1`
    FOREIGN KEY (`testEventCode`)
    REFERENCES `mydb`.`TestEvent` (`testEventCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TestItemTestEvent_has_Technician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TestItemTestEvent_has_Technician` (
  `testItemCode` VARCHAR(5) NOT NULL,
  `testEventCode` VARCHAR(5) NOT NULL,
  `TechnicianID` INT NOT NULL,
  PRIMARY KEY (`testItemCode`, `testEventCode`, `TechnicianID`),
  INDEX `fk_TestItemTestEvent_has_Technician_Technician1_idx` (`TechnicianID` ASC) VISIBLE,
  INDEX `fk_TestItemTestEvent_has_Technician_TestItemTestEvent1_idx` (`testItemCode` ASC, `testEventCode` ASC) VISIBLE,
  CONSTRAINT `fk_TestItemTestEvent_has_Technician_TestItemTestEvent1`
    FOREIGN KEY (`testItemCode` , `testEventCode`)
    REFERENCES `mydb`.`TestItemTestEvent` (`TestItemCode` , `testEventCode`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItemTestEvent_has_Technician_Technician1`
    FOREIGN KEY (`TechnicianID`)
    REFERENCES `mydb`.`Technician` (`TechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
