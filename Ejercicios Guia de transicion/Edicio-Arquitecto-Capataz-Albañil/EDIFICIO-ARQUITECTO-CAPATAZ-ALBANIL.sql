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
  `cod-edificio` VARCHAR(120) NOT NULL,
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
  `cod-empleado` VARCHAR(20) NOT NULL,
  `primer-nombre` VARCHAR(45) NOT NULL,
  `segundo-nombre` VARCHAR(45) NOT NULL,
  `primer-apellido` VARCHAR(45) NOT NULL,
  `segundo-apellido` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` VARCHAR(45) NOT NULL,
  `Num-colegiado` VARCHAR(45) NOT NULL,
  `FACULTAD_Cod-facultad` INT NOT NULL,
  PRIMARY KEY (`cod-empleado`, `FACULTAD_Cod-facultad`),
  INDEX `fk_ARQUITECTO_FACULTAD1_idx` (`FACULTAD_Cod-facultad` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`CAPATAZ` (
  `cod-empleado` VARCHAR(20) NOT NULL,
  `primer-nombre` VARCHAR(45) NOT NULL,
  `segundo-nombre` VARCHAR(45) NOT NULL,
  `primer-apellido` VARCHAR(45) NOT NULL,
  `segundo-apellido` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`ALBAÑIL` (
  `cod-empleado` VARCHAR(20) NOT NULL,
  `primer-nombre` VARCHAR(45) NOT NULL,
  `segundo-nombre` VARCHAR(45) NOT NULL,
  `primer-apellido` VARCHAR(45) NOT NULL,
  `segundo-apellido` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cod-postal` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `CAPATAZ_cod-empleado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cod-empleado`, `CAPATAZ_cod-empleado`),
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
-- Table `5.8.1`.`E-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`E-A` (
  `fecha-inicio` DATE NOT NULL,
  `fecha-fin` DATE NOT NULL,
  `Cod-edificio` VARCHAR(120) NOT NULL,
  `Cod-empleado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`fecha-inicio`, `Cod-edificio`, `Cod-empleado`),
  INDEX `fk_E-A_EDIFICIO_idx` (`Cod-edificio` ASC) VISIBLE,
  INDEX `fk_E-A_ARQUITECTO1_idx` (`Cod-empleado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`E-AL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`E-AL` (
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NULL,
  `ALBAÑIL_cod-empleado` VARCHAR(20) NOT NULL,
  `EDIFICIO_cod-edificio` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`Fecha_Inicio`),
  INDEX `fk_E-AL_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  INDEX `fk_E-AL_EDIFICIO1_idx` (`EDIFICIO_cod-edificio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`A-H` (
  `` INT NOT NULL,
  `ALBAÑIL_cod-empleado` VARCHAR(20) NOT NULL,
  `HERRAMIENTA_Cod-herramienta` INT NOT NULL,
  PRIMARY KEY (``),
  INDEX `fk_A-H_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  INDEX `fk_A-H_HERRAMIENTA1_idx` (`HERRAMIENTA_Cod-herramienta` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.8.1`.`E-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.8.1`.`E-C` (
  `fecha-inicio` DATE NOT NULL,
  `fecha-fin` DATE NULL,
  `EDIFICIO_cod-edificio` VARCHAR(120) NOT NULL,
  `CAPATAZ_cod-empleado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`fecha-inicio`, `EDIFICIO_cod-edificio`, `CAPATAZ_cod-empleado`),
  INDEX `fk_E-C_EDIFICIO1_idx` (`EDIFICIO_cod-edificio` ASC) VISIBLE,
  INDEX `fk_E-C_CAPATAZ1_idx` (`CAPATAZ_cod-empleado` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
