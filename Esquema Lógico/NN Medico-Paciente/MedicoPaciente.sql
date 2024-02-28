-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MédicoPaciente
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MédicoPaciente
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MédicoPaciente` DEFAULT CHARACTER SET utf8 ;
USE `MédicoPaciente` ;

-- -----------------------------------------------------
-- Table `MédicoPaciente`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MédicoPaciente`.`MEDICO` (
  `codmed` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`codmed`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MédicoPaciente`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MédicoPaciente`.`PACIENTE` (
  `codpac` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`codpac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MédicoPaciente`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MédicoPaciente`.`CITA` (
  `MEDICO_codmed` INT NOT NULL,
  `PACIENTE_codpac` INT NOT NULL,
  `fecha_cita` DATETIME NOT NULL,
  `hora_cita` DATETIME NOT NULL,
  PRIMARY KEY (`MEDICO_codmed`, `PACIENTE_codpac`),
  INDEX `fk_MEDICO_has_PACIENTE_PACIENTE1_idx` (`PACIENTE_codpac` ASC) VISIBLE,
  INDEX `fk_MEDICO_has_PACIENTE_MEDICO_idx` (`MEDICO_codmed` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
