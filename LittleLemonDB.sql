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
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `bookingID` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `orderID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `deliveryStatusID` INT NOT NULL,
  `staffID` INT NOT NULL,
  `orderDAte` DATE NULL,
  `quantity` INT NULL,
  `totalCost` DECIMAL NULL,
  `Orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`orderID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `menuID_idx` (`menuID` ASC) VISIBLE,
  INDEX `deliveryStatusID_idx` (`deliveryStatusID` ASC) VISIBLE,
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `mydb`.`Customers` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `mydb`.`Menu` (`menuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `deliveryStatusID`
    FOREIGN KEY (`deliveryStatusID`)
    REFERENCES `mydb`.`DeliveryStatus` (`deliveryStatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`StaffInformation` (`staffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `menuID` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `customerID` INT NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(12) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DeliveryStatus` (
  `deliveryStatusID` INT NOT NULL,
  `deliveryDate` DATE NULL,
  PRIMARY KEY (`deliveryStatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `roleID` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StaffInformation` (
  `staffID` INT NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `roleID` INT NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staffID`),
  INDEX `roleID_idx` (`roleID` ASC) VISIBLE,
  CONSTRAINT `roleID`
    FOREIGN KEY (`roleID`)
    REFERENCES `mydb`.`Roles` (`roleID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `orderID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `deliveryStatusID` INT NOT NULL,
  `staffID` INT NOT NULL,
  `orderDAte` DATE NULL,
  `quantity` INT NULL,
  `totalCost` DECIMAL NULL,
  `Orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`orderID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `menuID_idx` (`menuID` ASC) VISIBLE,
  INDEX `deliveryStatusID_idx` (`deliveryStatusID` ASC) VISIBLE,
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `mydb`.`Customers` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `mydb`.`Menu` (`menuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `deliveryStatusID`
    FOREIGN KEY (`deliveryStatusID`)
    REFERENCES `mydb`.`DeliveryStatus` (`deliveryStatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`StaffInformation` (`staffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
