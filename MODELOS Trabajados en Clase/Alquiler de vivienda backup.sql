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
-- Table `mydb`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietario` (
  `ID-propietario` INT NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `Nombre2` VARCHAR(20) NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `apellido 2` VARCHAR(20) NOT NULL,
  `Tel` INT NULL,
  `Edad` INT NOT NULL,
  `FolioDeEscritura` INT NOT NULL,
  `Domicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID-propietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inquilino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inquilino` (
  `idInquilino` INT NOT NULL,
  `nombre` VARCHAR(15) NOT NULL,
  `Nombre2` VARCHAR(15) NULL,
  `apellido` VARCHAR(15) NOT NULL,
  `apellido 2` VARCHAR(15) NOT NULL,
  `edad` INT NOT NULL,
  `comprabante nomina` VARCHAR(45) NOT NULL,
  `No.telefonico` INT NULL,
  PRIMARY KEY (`idInquilino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vivienda` (
  `IdVivienda` INT NOT NULL,
  `Calle` VARCHAR(25) NOT NULL,
  `Colonia` VARCHAR(20) NOT NULL,
  `CP` INT NOT NULL,
  `metros` INT NOT NULL,
  `no.habitaciones` INT NOT NULL,
  `Propietario_ID-propietario` INT NOT NULL,
  PRIMARY KEY (`IdVivienda`),
  INDEX `fk_Vivienda_Propietario1_idx` (`Propietario_ID-propietario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `idAlquiler` INT NOT NULL,
  `Edo.Contrato` VARCHAR(12) NOT NULL,
  `fecha dia inicio` DATETIME NOT NULL,
  `fecha mes inicio` DATETIME NOT NULL,
  `fecha año inicio` DATETIME NOT NULL,
  `fecha dia fin` DATETIME NOT NULL,
  `fecha mes fin` DATETIME NOT NULL,
  `fecha año fin` DATETIME NOT NULL,
  `ine inquilino` INT NOT NULL,
  `Vivienda_IdVivienda` INT NOT NULL,
  `Inquilino_idInquilino` INT NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `fk_Alquiler_Vivienda1_idx` (`Vivienda_IdVivienda` ASC) VISIBLE,
  INDEX `fk_Alquiler_Inquilino1_idx` (`Inquilino_idInquilino` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
