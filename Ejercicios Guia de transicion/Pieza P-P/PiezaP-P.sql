-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PiezaP-P
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PiezaP-P
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PiezaP-P` DEFAULT CHARACTER SET utf8 ;
USE `PiezaP-P` ;

-- -----------------------------------------------------
-- Table `PiezaP-P`.`PIEZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PiezaP-P`.`PIEZA` (
  `Cod-pieza` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-pieza`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PiezaP-P`.`P-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PiezaP-P`.`P-P` (
  `PIEZA_Cod-pieza-Continente` INT NOT NULL,
  `PIEZA_Cod-pieza-Contenido` INT NOT NULL,
  `Función` VARCHAR(45) NULL,
  PRIMARY KEY (`PIEZA_Cod-pieza-Continente`, `PIEZA_Cod-pieza-Contenido`),
  INDEX `fk_PIEZA_has_PIEZA_PIEZA1_idx` (`PIEZA_Cod-pieza-Contenido` ASC) VISIBLE,
  INDEX `fk_PIEZA_has_PIEZA_PIEZA_idx` (`PIEZA_Cod-pieza-Continente` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
