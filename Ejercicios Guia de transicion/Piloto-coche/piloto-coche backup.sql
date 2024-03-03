-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Piloto-coche
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Piloto-coche
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Piloto-coche` DEFAULT CHARACTER SET utf8 ;
USE `Piloto-coche` ;

-- -----------------------------------------------------
-- Table `Piloto-coche`.`COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Piloto-coche`.`COCHE` (
  `asientos` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `matricula` VARCHAR(10) NOT NULL,
  `PILOTO_Nif` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_COCHE_PILOTO1_idx` (`PILOTO_Nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Piloto-coche`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Piloto-coche`.`PILOTO` (
  `nombre` VARCHAR(15) NOT NULL,
  `nombre2` VARCHAR(15) NULL,
  `Apellido1` VARCHAR(15) NOT NULL,
  `Apellido2` VARCHAR(15) NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `Nif` INT NOT NULL,
  `COCHE_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Nif`),
  INDEX `fk_PILOTO_COCHE_idx` (`COCHE_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
