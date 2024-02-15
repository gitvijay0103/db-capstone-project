-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Booking` (
  `Booking_Id` INT NOT NULL AUTO_INCREMENT,
  `Booking_Date` DATE NULL,
  `Booking_Description` VARCHAR(200) NULL,
  PRIMARY KEY (`Booking_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `Menu_Id` INT NOT NULL AUTO_INCREMENT,
  `Menu_type` VARCHAR(200) NULL,
  `Menu_SubType` VARCHAR(200) NULL,
  `Active` BLOB NULL,
  PRIMARY KEY (`Menu_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery_Status` (
  `Delivery_id` INT NOT NULL AUTO_INCREMENT,
  `Delivery_Date` DATE NULL,
  `Status` VARCHAR(200) NULL,
  PRIMARY KEY (`Delivery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(200) NULL,
  `Last_name` VARCHAR(200) NULL,
  `Mobile_Number` VARCHAR(10) NULL,
  `Email_id` VARCHAR(200) NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `Staff_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Department` VARCHAR(100) NULL,
  `Designation` VARCHAR(100) NULL,
  `Salary` DECIMAL NULL,
  PRIMARY KEY (`Staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `Order_id` INT NOT NULL AUTO_INCREMENT,
  `Order_date` DATE NULL,
  `Quantity` INT NULL,
  `Total Cost` DECIMAL NULL,
  `Booking_id` INT NULL,
  `Customer_id` INT NULL,
  `Order_Status_id` INT NULL,
  `Staff_id` INT NULL,
  `Menu_id` INT NULL,
  PRIMARY KEY (`Order_id`),
  INDEX `booking_id_frn_idx` (`Booking_id` ASC) VISIBLE,
  INDEX `menu_id_frn_idx` (`Menu_id` ASC) VISIBLE,
  INDEX `delivery_id_frn_idx` (`Order_Status_id` ASC) VISIBLE,
  INDEX `customer_id_frn_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `staff_id_frn_idx` (`Staff_id` ASC) VISIBLE,
  CONSTRAINT `booking_id_frn`
    FOREIGN KEY (`Booking_id`)
    REFERENCES `LittleLemonDB`.`Booking` (`Booking_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_frn`
    FOREIGN KEY (`Menu_id`)
    REFERENCES `LittleLemonDB`.`Menu` (`Menu_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_id_frn`
    FOREIGN KEY (`Order_Status_id`)
    REFERENCES `LittleLemonDB`.`Delivery_Status` (`Delivery_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_frn`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_frn`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `LittleLemonDB`.`Staff` (`Staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
