-- Create existing MySQL ShoppingCartDB database and create tables statements

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shoppingCartDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `shoppingCartDB` ;

-- -----------------------------------------------------
-- Schema shoppingCartDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shoppingCartDB` DEFAULT CHARACTER SET utf8 ;
USE `shoppingCartDB` ;

-- -----------------------------------------------------
-- Table `shoppingCartDB`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`customer` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`customer` (
  `customerID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `annualSpend` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`customer_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`customer_address` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`customer_address` (
  `customerAddressID` INT NOT NULL,
  `addressType` ENUM('Business', 'Personal', 'Postal') NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` VARCHAR(10) NOT NULL,
  `state` VARCHAR(25) NOT NULL,
  `country` VARCHAR(25) NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`customerAddressID`),
  INDEX `fk_address_customer1_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_address_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `shoppingCartDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`phone` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`phone` (
  `phoneID` INT NOT NULL,
  `phoneNumber` VARCHAR(14) NOT NULL,
  `phoneType` VARCHAR(10) NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`phoneID`),
  INDEX `fk_phone_customer1_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_phone_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `shoppingCartDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`interest` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`interest` (
  `interestID` INT NOT NULL,
  `interestName` VARCHAR(45) NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`interestID`),
  INDEX `fk_interest_customer1_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_interest_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `shoppingCartDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`cart` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`cart` (
  `cartID` INT NOT NULL,
  `cartDateTime` DATETIME NOT NULL,
  `deliveryInstruction` VARCHAR(45) NULL,
  `deliveredOrNot` TINYINT NULL DEFAULT 0,
  `deliveryDate` DATE NULL DEFAULT NULL,
  `ratingFromCustomer` INT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`cartID`),
  INDEX `fk_cart_customer1_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_cart_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `shoppingCartDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`supplier` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`supplier` (
  `supplierID` INT NOT NULL,
  `supplierName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `contactPhoneNo` VARCHAR(15) NULL,
  PRIMARY KEY (`supplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`item` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`item` (
  `itemID` INT NOT NULL,
  `itemName` VARCHAR(45) NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `qtyOnHand` INT NOT NULL,
  `supplierID` INT NOT NULL,
  PRIMARY KEY (`itemID`),
  INDEX `fk_item_supplier1_idx` (`supplierID` ASC) VISIBLE,
  CONSTRAINT `fk_item_supplier1`
    FOREIGN KEY (`supplierID`)
    REFERENCES `shoppingCartDB`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`cart_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`cart_item` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`cart_item` (
  `cartID` INT NOT NULL,
  `itemID` INT NOT NULL,
  `qtyOrdered` INT NOT NULL,
  PRIMARY KEY (`cartID`, `itemID`),
  INDEX `fk_cartitem_item1_idx` (`itemID` ASC) VISIBLE,
  INDEX `fk_cartitem_cart1_idx` (`cartID` ASC) VISIBLE,
  CONSTRAINT `fk_cartitem_cart1`
    FOREIGN KEY (`cartID`)
    REFERENCES `shoppingCartDB`.`cart` (`cartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartitem_item1`
    FOREIGN KEY (`itemID`)
    REFERENCES `shoppingCartDB`.`item` (`itemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shoppingCartDB`.`supplier_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoppingCartDB`.`supplier_address` ;

CREATE TABLE IF NOT EXISTS `shoppingCartDB`.`supplier_address` (
  `supplierAddressID` INT NOT NULL,
  `addressType` ENUM('Business', 'Postal') NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` VARCHAR(10) NOT NULL,
  `state` VARCHAR(25) NOT NULL,
  `country` VARCHAR(25) NOT NULL,
  `supplierID` INT NOT NULL,
  PRIMARY KEY (`supplierAddressID`),
  INDEX `fk_supplier_address_supplier1_idx` (`supplierID` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address_supplier1`
    FOREIGN KEY (`supplierID`)
    REFERENCES `shoppingCartDB`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



Appendix 3: Insert statements of the sample data from the existing relational tables.  

USE shoppingCartDB;


INSERT INTO supplier
VALUES (1, 'Garden Grower', 'business@gardensupplier.com.au', '08-27732420');

INSERT INTO supplier
VALUES (2, 'Home Improvement', 'office@homeimprovement.com.au', '08-82544665');


INSERT INTO supplier_address
VALUES (1, 'Business', '1 King Street', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO supplier_address
VALUES (2, 'Postal', 'Box 100 Grote Street Mail Center', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO supplier_address
VALUES (3, 'Business', '2 Queen Street', 'Melbourne', '3000', 'VIC', 'Australia', 2);

INSERT INTO supplier_address
VALUES (4, 'Postal', 'Box 200 Bourke Street Post Office', 'Melbourne', '3000', 'VIC', 'Australia', 2);


INSERT INTO item
VALUES (1, 'Slow release fertiliser 20kg', 40.00, 10, 1);

INSERT INTO item
VALUES (2, 'Organic fertiliser 20kg', 50.00, 20, 1);

INSERT INTO item
VALUES (3, 'METHOD wall cabinet', 400.00, 30, 2);

INSERT INTO item
VALUES (4, 'Applaro outdoor sofa set', 1500.00, 40,  2);


INSERT INTO customer
VALUES (1, 'John', 'Brown', 'jbrown100@yahoo.com', 100.00);

INSERT INTO customer
VALUES (2, 'Jack', 'White', 'jwhite200@yahoo.com', 200.00);

INSERT INTO customer
VALUES (3, 'Jill', 'Black', 'jblack300@yahoo.com', 300.00); 


INSERT INTO phone
VALUES (1, '0427788128', 'Personal', 1);

INSERT INTO phone
VALUES (2, '0414237921', 'Personal', 2);

INSERT INTO phone
VALUES (3, '08-81091122', 'Business', 2);

INSERT INTO phone
VALUES (4, '08-85678888', 'Business', 3);


INSERT INTO customer_address
VALUES (1, 'Business', '1st Street', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO customer_address
VALUES (2, 'Personal', '2nd Street', 'Melbourne', '3001', 'VIC', 'Australia', 2);  

INSERT INTO customer_address
VALUES (3, 'Postal', 'Box 300 Richmond Post Office', 'Richmond', '3121', 'VIC', 'Australia', 2);  

INSERT INTO customer_address
VALUES (4, 'Business', '10 Main Street', 'Blackwood', '5051', 'SA', 'Australia', 3);  

INSERT INTO customer_address
VALUES (5, 'Postal', 'Box 400 Blackwood Post Office', 'Blackwood', '5051', 'SA', 'Australia', 3);

INSERT INTO customer_address
VALUES (6, 'Personal', '5 High street', 'Belair', '5052', 'SA', 'Australia', 3);


INSERT INTO interest
VALUES (1, 'Furniture', 1);

INSERT INTO interest
VALUES (2, 'Electrical', 1);

INSERT INTO interest
VALUES (3, 'Gardening', 2);

INSERT INTO interest
VALUES (4, 'Electronic', 2);

INSERT INTO interest
VALUES (5, 'Furniture', 2);


INSERT INTO cart
VALUES (1 , '2022-02-20 12:00:00', 'Deliver to business address', 1, '2022-02-22', 5, 1);

Insert INTO cart
VALUES (2 , '2022-02-20 14:30:00', 'Deliver to personal address', 1, '2022-02-23', 4, 2);

Insert INTO cart
VALUES (3 , '2022-02-22 16:00:00', null, 0, null, null, 2);

Insert INTO cart
VALUES (4 , '2022-02-23 09:30:00', 'Deliver to delivery address', 0, null, null, 3);


INSERT INTO cart_item
VALUES (1, 1, 2);

INSERT INTO cart_item
VALUES (1, 2, 3);

INSERT INTO cart_item
VALUES (2, 3, 1);

INSERT INTO cart_item
VALUES (2, 4, 1);

INSERT INTO cart_item
VALUES (2, 1, 3);

INSERT INTO cart_item
VALUES (3, 1, 4);

INSERT INTO cart_item
VALUES (4, 2, 2);


