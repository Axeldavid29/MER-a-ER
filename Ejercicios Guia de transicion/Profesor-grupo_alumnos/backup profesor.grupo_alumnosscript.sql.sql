-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Profesor-Grupo_alumnos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Profesor-Grupo_alumnos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Profesor-Grupo_alumnos` DEFAULT CHARACTER SET utf8 ;
USE `Profesor-Grupo_alumnos` ;

-- -----------------------------------------------------
-- Table `Profesor-Grupo_alumnos`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Profesor-Grupo_alumnos`.`Profesor` (
  `Cod_profesor` INT NOT NULL,
  `Nif` VARCHAR(45) NOT NULL,
  `Primer nombre` VARCHAR(45) NOT NULL,
  `Segundo nombre` VARCHAR(45) NOT NULL,
  `Prmer apellido` VARCHAR(45) NOT NULL,
  `Segundo apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_profesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profesor-Grupo_alumnos`.`Grupos alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Profesor-Grupo_alumnos`.`Grupos alumnos` (
  `Cod-grupo` INT NOT NULL,
  `Curso` INT NOT NULL,
  PRIMARY KEY (`Cod-grupo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profesor-Grupo_alumnos`.`P-G`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Profesor-Grupo_alumnos`.`P-G` (
  `Profesor_Cod_profesor` INT NOT NULL,
  `Grupos alumnos_Cod-grupo` INT NOT NULL,
  `Año academico` INT NOT NULL,
  PRIMARY KEY (`Profesor_Cod_profesor`, `Grupos alumnos_Cod-grupo`),
  INDEX `fk_Profesor_has_Grupos alumnos_Grupos alumnos1_idx` (`Grupos alumnos_Cod-grupo` ASC) VISIBLE,
  INDEX `fk_Profesor_has_Grupos alumnos_Profesor_idx` (`Profesor_Cod_profesor` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
