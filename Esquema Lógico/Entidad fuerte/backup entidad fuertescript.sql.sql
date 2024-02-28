-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejemplo-entidad-D
-- -----------------------------------------------------
-- ejemplo de transoformación de esquema ER

-- -----------------------------------------------------
-- Schema Ejemplo-entidad-D
--
-- ejemplo de transoformación de esquema ER
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejemplo-entidad-D` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Ejemplo-entidad-D` ;

-- -----------------------------------------------------
-- Table `Ejemplo-entidad-D`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo-entidad-D`.`Libro` (
  `ISBN` INT NOT NULL,
  `Título_principal` VARCHAR(30) NOT NULL,
  `Subtítulo` VARCHAR(45) NULL,
  `Editorial` VARCHAR(10) NULL,
  `Idioma` VARCHAR(15) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejemplo-entidad-D`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo-entidad-D`.`Autor` (
  `autor` VARCHAR(40) NOT NULL,
  `Libro_ISBN` INT NOT NULL,
  PRIMARY KEY (`autor`),
  INDEX `fk_Autor_Libro1_idx` (`Libro_ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejemplo-entidad-D`.`Edición`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo-entidad-D`.`Edición` (
  `Número` INT NOT NULL,
  `Año` VARCHAR(9999) NOT NULL,
  `Libro_ISBN` INT NOT NULL,
  INDEX `fk_Edición_Libro_idx` (`Libro_ISBN` ASC) VISIBLE)
ENGINE = InnoDB;

USE `Ejemplo-entidad-D` ;

-- -----------------------------------------------------
-- Placeholder table for view `Ejemplo-entidad-D`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo-entidad-D`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `Ejemplo-entidad-D`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ejemplo-entidad-D`.`view1`;
USE `Ejemplo-entidad-D`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
