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
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(255) NOT NULL,
  `Apellido1` VARCHAR(45) NULL,
  `Apellido2` VARCHAR(45) NULL,
  PRIMARY KEY (`Nif`));


-- -----------------------------------------------------
-- Table `mydb`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-E` (
  `Nif_esresponsable` INT NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `Empleado_Nif_tieneresponsable` INT NOT NULL,
  PRIMARY KEY (`Nif_esresponsable`),
  INDEX `fk_E-E_Empleado_idx` (`Empleado_Nif_tieneresponsable` ASC) VISIBLE);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
