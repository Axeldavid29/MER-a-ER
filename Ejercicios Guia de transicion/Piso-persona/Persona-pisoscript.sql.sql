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
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Piso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Piso` (
  `Cod-Piso` INT NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `Número` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NULL,
  `Puerta` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-Piso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`P-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`P-P` (
  `Persona_Nif` INT NOT NULL,
  `Piso_Cod-Piso` INT NOT NULL,
  `Precio_Alquiler` VARCHAR(45) NULL,
  PRIMARY KEY (`Persona_Nif`, `Piso_Cod-Piso`),
  INDEX `fk_Persona_has_Piso_Piso1_idx` (`Piso_Cod-Piso` ASC) VISIBLE,
  INDEX `fk_Persona_has_Piso_Persona_idx` (`Persona_Nif` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Piso_Persona`
    FOREIGN KEY (`Persona_Nif`)
    REFERENCES `mydb`.`Persona` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Piso_Piso1`
    FOREIGN KEY (`Piso_Cod-Piso`)
    REFERENCES `mydb`.`Piso` (`Cod-Piso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
