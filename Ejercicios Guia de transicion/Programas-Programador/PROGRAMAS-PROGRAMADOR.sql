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
-- Table `mydb`.`PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROGRAMA` (
  `cod_programa` INT NOT NULL,
  `lenguaje` VARCHAR(20) NULL,
  `sistema-operativo` VARCHAR(15) NULL,
  `fecha-terminacion` DATETIME NULL,
  PRIMARY KEY (`cod_programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROGRAMADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROGRAMADOR` (
  `nombre_programador` VARCHAR(30) NOT NULL,
  `nombre_2` VARCHAR(15) NULL,
  `apellido_1` VARCHAR(15) NULL,
  `apellido_2` VARCHAR(15) NULL,
  `PROGRAMA_cod_programa` INT NOT NULL,
  PRIMARY KEY (`nombre_programador`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
