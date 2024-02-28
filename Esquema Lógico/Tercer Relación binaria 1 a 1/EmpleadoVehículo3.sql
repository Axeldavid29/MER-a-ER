-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EmpleadoVehiculo3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EmpleadoVehiculo3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EmpleadoVehiculo3` DEFAULT CHARACTER SET utf8 ;
USE `EmpleadoVehiculo3` ;

-- -----------------------------------------------------
-- Table `EmpleadoVehiculo3`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpleadoVehiculo3`.`EMPLEADO` (
  `codemp` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  PRIMARY KEY (`codemp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpleadoVehiculo3`.`VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpleadoVehiculo3`.`VEHICULO` (
  `matricula` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpleadoVehiculo3`.`CONDUCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpleadoVehiculo3`.`CONDUCE` (
  `fecha_inicio` INT NULL,
  `EMPLEADO_codemp` INT NOT NULL,
  `VEHICULO_matricula` INT NOT NULL,
  INDEX `fk_CONDUCE_EMPLEADO_idx` (`EMPLEADO_codemp` ASC) VISIBLE,
  INDEX `fk_CONDUCE_VEHICULO1_idx` (`VEHICULO_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
