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
-- Table `mydb`.`Piloto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Piloto` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudad` (
  `Nombre-Ciudad` INT NOT NULL,
  `País` VARCHAR(45) NOT NULL,
  `Número-habitantes` INT NOT NULL,
  PRIMARY KEY (`Nombre-Ciudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avión`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avión` (
  `Cod-avión` INT NOT NULL,
  `nombre-avión` VARCHAR(45) NOT NULL,
  `número-motores` INT NOT NULL,
  PRIMARY KEY (`Cod-avión`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`P-C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`P-C-A` (
  `Piloto_Nif` INT NOT NULL,
  `Ciudad_Nombre-Ciudad` INT NOT NULL,
  `Avión_Cod-avión` INT NOT NULL,
  `Fecha` DATETIME NOT NULL,
  PRIMARY KEY (`Piloto_Nif`, `Ciudad_Nombre-Ciudad`, `Avión_Cod-avión`),
  INDEX `fk_Piloto_has_Ciudad_Ciudad1_idx` (`Ciudad_Nombre-Ciudad` ASC) VISIBLE,
  INDEX `fk_Piloto_has_Ciudad_Piloto_idx` (`Piloto_Nif` ASC) VISIBLE,
  INDEX `fk_Piloto_has_Ciudad_Avión1_idx` (`Avión_Cod-avión` ASC) VISIBLE,
  CONSTRAINT `fk_Piloto_has_Ciudad_Piloto`
    FOREIGN KEY (`Piloto_Nif`)
    REFERENCES `mydb`.`Piloto` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piloto_has_Ciudad_Ciudad1`
    FOREIGN KEY (`Ciudad_Nombre-Ciudad`)
    REFERENCES `mydb`.`Ciudad` (`Nombre-Ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piloto_has_Ciudad_Avión1`
    FOREIGN KEY (`Avión_Cod-avión`)
    REFERENCES `mydb`.`Avión` (`Cod-avión`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
