-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GestionBiblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GestionBiblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GestionBiblioteca` DEFAULT CHARACTER SET utf8 ;
USE `GestionBiblioteca` ;

-- -----------------------------------------------------
-- Table `GestionBiblioteca`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GestionBiblioteca`.`Libros` (
  `ISBN` INT NOT NULL,
  `IdLibro` INT NOT NULL,
  `Título` VARCHAR(30) NOT NULL,
  `Nombre1 Autor` VARCHAR(20) NOT NULL,
  `Nombre2 Autor` VARCHAR(20) NULL,
  `Apellido1 Autor` VARCHAR(20) NOT NULL,
  `Apellido2 Autor` VARCHAR(20) NULL,
  `Editorial` VARCHAR(20) NOT NULL,
  `Clasificación` VARCHAR(15) NOT NULL,
  `Paginas` INT NOT NULL,
  `Condicion` VARCHAR(20) NOT NULL,
  `Estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ISBN`, `IdLibro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GestionBiblioteca`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GestionBiblioteca`.`Prestamos` (
  `Folio` INT NOT NULL,
  `Estado` VARCHAR(20) NOT NULL,
  `FechaContratoDia` DATE NOT NULL,
  `FechaContratoMes` DATE NOT NULL,
  `FechaContratoAño` DATE NOT NULL,
  `FechaTerminoDia` DATE NOT NULL,
  `FechaTerminoMes` DATE NOT NULL,
  `FechaTerminoAño` DATE NOT NULL,
  `FechaDevolucionDia` DATE NOT NULL,
  `FechaDevolucionMes` DATE NOT NULL,
  `FechaDevolucionAño` DATE NOT NULL,
  PRIMARY KEY (`Folio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GestionBiblioteca`.`Socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GestionBiblioteca`.`Socios` (
  `IdSocio` INT NOT NULL,
  `Nombre1` VARCHAR(20) NOT NULL,
  `Nombre2` VARCHAR(20) NULL,
  `Apellido1` VARCHAR(20) NOT NULL,
  `Apellido2` VARCHAR(20) NOT NULL,
  `Telefono` INT NULL,
  `Historial` VARCHAR(45) NOT NULL,
  `Edad` INT NULL,
  PRIMARY KEY (`IdSocio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GestionBiblioteca`.`Vincula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GestionBiblioteca`.`Vincula` (
  `Libros_ISBN` INT NOT NULL,
  `Libros_IdLibro` INT NOT NULL,
  `Prestamos_Folio` INT NOT NULL,
  PRIMARY KEY (`Libros_ISBN`, `Libros_IdLibro`, `Prestamos_Folio`),
  INDEX `fk_Libros_has_Prestamos_Prestamos1_idx` (`Prestamos_Folio` ASC) VISIBLE,
  INDEX `fk_Libros_has_Prestamos_Libros_idx` (`Libros_ISBN` ASC, `Libros_IdLibro` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GestionBiblioteca`.`Pide`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GestionBiblioteca`.`Pide` (
  `Prestamos_Folio` INT NOT NULL,
  `Socios_IdSocio` INT NOT NULL,
  PRIMARY KEY (`Prestamos_Folio`, `Socios_IdSocio`),
  INDEX `fk_Prestamos_has_Socios_Socios1_idx` (`Socios_IdSocio` ASC) VISIBLE,
  INDEX `fk_Prestamos_has_Socios_Prestamos1_idx` (`Prestamos_Folio` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
