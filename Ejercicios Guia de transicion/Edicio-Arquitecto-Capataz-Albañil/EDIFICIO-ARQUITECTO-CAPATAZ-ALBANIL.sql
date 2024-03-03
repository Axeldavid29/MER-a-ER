-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 5.8.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 5.8.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `5.8.1` DEFAULT CHARACTER SET utf8 ;
USE `5.8.1` ;

-- -----------------------------------------------------
-- Table `5.8.1`.`EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`EDIFICIO` (
  `cod-edificio` INT NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-edificio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`FACULTAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`FACULTAD` (
  `Cod-facultad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod-facultad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`ARQUITECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`ARQUITECTO` (
  `cod-empleado` INT NOT NULL,
  `primer-nombre` VARCHAR(20) NOT NULL,
  `segundo-nombre` VARCHAR(20) NULL,
  `primer-apellido` VARCHAR(20) NOT NULL,
  `segundo-apellido` VARCHAR(20) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` INT NOT NULL,
  `Num-colegiado` INT NOT NULL,
  `FACULTAD_Cod-facultad` INT NOT NULL,
  PRIMARY KEY (`cod-empleado`),
  INDEX `fk_ARQUITECTO_FACULTAD1_idx` (`FACULTAD_Cod-facultad` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`CAPATAZ` (
  `cod-empleado` INT NOT NULL,
  `primer-nombre` VARCHAR(20) NOT NULL,
  `segundo-nombre` VARCHAR(20) NULL,
  `primer-apellido` VARCHAR(20) NOT NULL,
  `segundo-apellido` VARCHAR(20) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` INT NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`ALBAÑIL` (
  `cod-empleado` INT NOT NULL,
  `primer-nombre` VARCHAR(20) NOT NULL,
  `segundo-nombre` VARCHAR(20) NULL,
  `primer-apellido` VARCHAR(20) NOT NULL,
  `segundo-apellido` VARCHAR(20) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` INT NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `CAPATAZ_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`cod-empleado`),
  INDEX `fk_ALBAÑIL_CAPATAZ1_idx` (`CAPATAZ_cod-empleado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`HERRAMIENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`HERRAMIENTA` (
  `Cod-herramienta` INT NOT NULL,
  `Nombre-herramienta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod-herramienta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`E-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`E-C` (
  `EDIFICIO_cod-edificio` INT NOT NULL,
  `CAPATAZ_cod-empleado` INT NOT NULL,
  `Fecha inicio dia` DATE NOT NULL,
  `Fecha inicio mes` DATE NOT NULL,
  `Fecha inicio año` DATE NOT NULL,
  `Fecha fin dia` DATE NOT NULL,
  `Fecha fin mes` DATE NOT NULL,
  `Fecha fin año` DATE NOT NULL,
  PRIMARY KEY (`EDIFICIO_cod-edificio`, `CAPATAZ_cod-empleado`),
  INDEX `fk_EDIFICIO_has_CAPATAZ_CAPATAZ1_idx` (`CAPATAZ_cod-empleado` ASC) VISIBLE,
  INDEX `fk_EDIFICIO_has_CAPATAZ_EDIFICIO1_idx` (`EDIFICIO_cod-edificio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`A-H` (
  `ALBAÑIL_cod-empleado` INT NOT NULL,
  `HERRAMIENTA_Cod-herramienta` INT NOT NULL,
  PRIMARY KEY (`ALBAÑIL_cod-empleado`, `HERRAMIENTA_Cod-herramienta`),
  INDEX `fk_ALBAÑIL_has_HERRAMIENTA_HERRAMIENTA1_idx` (`HERRAMIENTA_Cod-herramienta` ASC) VISIBLE,
  INDEX `fk_ALBAÑIL_has_HERRAMIENTA_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`E-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`E-A` (
  `EDIFICIO_cod-edificio` INT NOT NULL,
  `ALBAÑIL_cod-empleado` INT NOT NULL,
  `Fecha inicio dia` DATE NOT NULL,
  `Fecha inicio mes` DATE NOT NULL,
  `Fecha inicio año` DATE NOT NULL,
  `Fecha fin dia` DATE NOT NULL,
  `Fecha fin mes` DATE NOT NULL,
  `Fecha fin año` DATE NOT NULL,
  PRIMARY KEY (`EDIFICIO_cod-edificio`, `ALBAÑIL_cod-empleado`),
  INDEX `fk_EDIFICIO_has_ALBAÑIL_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  INDEX `fk_EDIFICIO_has_ALBAÑIL_EDIFICIO1_idx` (`EDIFICIO_cod-edificio` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
