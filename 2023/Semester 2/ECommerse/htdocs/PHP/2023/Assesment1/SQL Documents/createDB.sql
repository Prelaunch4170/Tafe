CREATE SCHEMA IF NOT EXISTS `oldMates` DEFAULT CHARACTER SET utf8 ;
USE `oldMates` ;

-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Address` (
  `addressID` INT NOT NULL AUTO_INCREMENT,
  `postCode` VARCHAR(45) NULL,
  `State` VARCHAR(3) NULL,
  `street` VARCHAR(45) NULL,
  PRIMARY KEY (`addressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phoneNumber` VARCHAR(12) NULL,
  `cardNumber` VARCHAR(17) NULL,
  `Address_addressID` INT NOT NULL,
  PRIMARY KEY (`customerID`),
  INDEX `fk_Customer_Address_idx` (`Address_addressID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Address`
    FOREIGN KEY (`Address_addressID`)
    REFERENCES `Address` (`addressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Provider` (
  `providerID` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `Address_addressID` INT NOT NULL,
  `Customer_customerID` INT NOT NULL,
  PRIMARY KEY (`providerID`),
  INDEX `fk_Provider_Address1_idx` (`Address_addressID` ASC) VISIBLE,
  INDEX `fk_Provider_Customer1_idx` (`Customer_customerID` ASC) VISIBLE,
  CONSTRAINT `fk_Provider_Address1`
    FOREIGN KEY (`Address_addressID`)
    REFERENCES `Address` (`addressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provider_Customer1`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Product` (
  `prodID` INT NOT NULL AUTO_INCREMENT,
  `QTY` INT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  `providerID` INT NOT NULL,
  PRIMARY KEY (`prodID`),
  INDEX `fk_Products_Provider1_idx` (`providerID` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Provider1`
    FOREIGN KEY (`providerID`)
    REFERENCES `Provider` (`providerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NULL,
  PRIMARY KEY (`orderID`, `customerID`),
  INDEX `fk_Order_Customer1_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Order_has_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order_has_Product` (
  `Order_orderID` INT NOT NULL,
  `Product_prodID` INT NOT NULL,
  `count` VARCHAR(45) NOT NULL,
  `qtyPrice` DECIMAL(6,2) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Order_orderID`, `Product_prodID`),
  INDEX `fk_Order_has_Product_Product1_idx` (`Product_prodID` ASC) VISIBLE,
  INDEX `fk_Order_has_Product_Order1_idx` (`Order_orderID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_Product_Order1`
    FOREIGN KEY (`Order_orderID`)
    REFERENCES `Order` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Product_Product1`
    FOREIGN KEY (`Product_prodID`)
    REFERENCES `Product` (`prodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)