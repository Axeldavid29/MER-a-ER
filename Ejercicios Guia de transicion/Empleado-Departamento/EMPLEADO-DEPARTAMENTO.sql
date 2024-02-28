-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EJEMPLOS.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EJEMPLOS.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EJEMPLOS.1` DEFAULT CHARACTER SET utf8 ;
USE `EJEMPLOS.1` ;

-- -----------------------------------------------------
-- Table `EJEMPLOS.1`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLOS.1`.`EMPLEADO` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLOS.1`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLOS.1`.`DEPARTAMENTO` (
  `Cod-dpto` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLOS.1`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLOS.1`.`EMPLEADO` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLOS.1`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLOS.1`.`DEPARTAMENTO` (
  `Cod-dpto` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLOS.1`.`EMP-DPTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLOS.1`.`EMP-DPTO` (
  `EMPLEADO_Nif` INT NOT NULL,
  `DEPARTAMENTO_Cod-dpto` INT NOT NULL,
  PRIMARY KEY (`EMPLEADO_Nif`, `DEPARTAMENTO_Cod-dpto`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
