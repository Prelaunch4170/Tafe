-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sps_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sps_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sps_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sps_db` ;

-- -----------------------------------------------------
-- Table `sps_db`.`adonis_schema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sps_db`.`adonis_schema` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  `migration_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sps_db`.`adonis_schema_versions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sps_db`.`adonis_schema_versions` (
  `version` INT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sps_db`.`qualifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sps_db`.`qualifications` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `QualCode` VARCHAR(20) NULL DEFAULT NULL,
  `NationalQualCode` VARCHAR(32) NULL DEFAULT NULL,
  `TafeQualCode` VARCHAR(32) NULL DEFAULT NULL,
  `QualName` VARCHAR(100) NULL DEFAULT NULL,
  `TotalUnits` INT NULL DEFAULT NULL,
  `CoreUnits` INT NULL DEFAULT NULL,
  `ElectedUnits` INT NULL DEFAULT NULL,
  `ReqListedElectedUnits` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
