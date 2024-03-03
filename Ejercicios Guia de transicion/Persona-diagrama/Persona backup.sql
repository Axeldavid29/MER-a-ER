-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Persona
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Persona
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Persona` DEFAULT CHARACTER SET utf8 ;
USE `Persona` ;

-- -----------------------------------------------------
-- Table `Persona`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Persona`.`PERSONA` (
  `nombre` VARCHAR(20) NOT NULL,
  `apellido_1` VARCHAR(20) NOT NULL,
  `apellido_2` VARCHAR(20) NULL,
  `dni` INT NOT NULL,
  `edad` INT NOT NULL,
  `FECHA DE NACIMIENTO_dia_nacimiento` DATE NOT NULL,
  `fecha de nacimiento mes` DATE NOT NULL,
  `fecha de nacimineto año` DATE NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
