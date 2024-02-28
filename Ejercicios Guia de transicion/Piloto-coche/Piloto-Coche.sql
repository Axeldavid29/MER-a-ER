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
  `matricula` INT NOT NULL,
  `asientos` INT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `nif` INT NOT NULL,
  PRIMARY KEY (`matricula`, `nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Piloto-coche`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Piloto-coche`.`PILOTO` (
  `nif` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(30) NULL,
  `matricula` INT NOT NULL,
  PRIMARY KEY (`nif`, `matricula`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
