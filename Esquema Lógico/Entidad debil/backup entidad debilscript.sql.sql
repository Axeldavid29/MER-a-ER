-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema entidad_debil
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entidad_debil
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entidad_debil` DEFAULT CHARACTER SET utf8 ;
USE `entidad_debil` ;

-- -----------------------------------------------------
-- Table `entidad_debil`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entidad_debil`.`Empleado` (
  `num_empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_ingreso` VARCHAR(45) NULL,
  `num_depto` INT NULL,
  PRIMARY KEY (`num_empleado`),
  INDEX `num_depto_idx` (`num_depto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entidad_debil`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entidad_debil`.`Departamento` (
  `num_departamento` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `presupuesto` DOUBLE NOT NULL,
  `Departamentocol` VARCHAR(45) NULL,
  `Empleado_num_empleado` INT NOT NULL,
  PRIMARY KEY (`num_departamento`),
  INDEX `fk_Departamento_Empleado_idx` (`Empleado_num_empleado` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
