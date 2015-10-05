-- MySQL Script generated by MySQL Workbench
-- 10/04/15 12:14:23
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cart
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `cart` ;

-- -----------------------------------------------------
-- Table `cart`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(60) NOT NULL COMMENT '',
  `money` DECIMAL(15,2) NOT NULL COMMENT '',
  `role` VARCHAR(45) NOT NULL COMMENT '',
  `banned` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `Userscol_UNIQUE` (`username` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`.`Promotions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`Promotions` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `discount` INT NOT NULL COMMENT '',
  `promotion_start` DATETIME(3) NOT NULL COMMENT '',
  `promotion_end` DATETIME(3) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`Products` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `Price` DECIMAL(15,2) NOT NULL COMMENT '',
  `Quantity` INT NOT NULL COMMENT '',
  `CategoryId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Products_Categories1_idx` (`CategoryId` ASC)  COMMENT '',
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`CategoryId`)
    REFERENCES `cart`.`Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`.`UserProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`UserProducts` (
  `UserId` INT NOT NULL COMMENT '',
  `ProductId` INT NOT NULL COMMENT '',
  INDEX `fk_Users_has_Products_Products1_idx` (`ProductId` ASC)  COMMENT '',
  INDEX `fk_Users_has_Products_Users1_idx` (`UserId` ASC)  COMMENT '',
  CONSTRAINT `fk_Users_has_Products_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `cart`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Products_Products1`
    FOREIGN KEY (`ProductId`)
    REFERENCES `cart`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`.`PromotionProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cart`.`PromotionProducts` (
  `Promotions_id` INT NOT NULL COMMENT '',
  `Products_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Promotions_id`, `Products_id`)  COMMENT '',
  INDEX `fk_Promotions_has_Products_Products1_idx` (`Products_id` ASC)  COMMENT '',
  INDEX `fk_Promotions_has_Products_Promotions1_idx` (`Promotions_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Promotions_has_Products_Promotions1`
    FOREIGN KEY (`Promotions_id`)
    REFERENCES `cart`.`Promotions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promotions_has_Products_Products1`
    FOREIGN KEY (`Products_id`)
    REFERENCES `cart`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Food');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Clothing');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Sports');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Computers');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Parfumes');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Health and Beauty');
INSERT INTO `cart`.`categories` (`id`, `Name`) VALUES (NULL, 'Appliances');

INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Musaka', '2.50', '200', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Beef steak', '7.20', '529', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Lamb chops', '8.60', '1021', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'French fries', '2.89', '132', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Tarator', '1.60', '892', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Chicken soup', '2.10',  '91', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Ham', '4.50','92', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Cheese', '1.39', '311', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Toast', '0.20', '2020', '1');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Ice cream', '1.20', '1819', '1');

INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Jeans', '40.00', '120', '2');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Jackets', '69.00', '235', '2');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Shoes', '45.29', '567', '2');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Hats', '12.50','912', '2');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'T-shirts', '21.99', '782', '2');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Hoodies', '56.79', '917', '2');

INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Baseball', '40.00', '120', '3');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Basketball', '69.00', '235', '3');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Weights', '45.29', '567', '3');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Football', '12.50', '912', '3');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Golfball', '21.99', '782', '3');
INSERT INTO `cart`.`products` (`id`, `Name`, `Price`, `Quantity`, `CategoryId`) VALUES (NULL, 'Golf clubs', '56.79', '917', '3');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;