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
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `Cod-Empresa` INT NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod-Empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `Cod Empleado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `1er apellido` VARCHAR(45) NOT NULL,
  `2do apellido` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod Empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Director` (
  `Empleado_Cod Empleado1` INT NOT NULL,
  PRIMARY KEY (`Empleado_Cod Empleado1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Programador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Programador` (
  `Empleado_Cod Empleado` INT NOT NULL,
  PRIMARY KEY (`Empleado_Cod Empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auxiliar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auxiliar` (
  `Empleado_Cod Empleado` INT NOT NULL,
  `Num_Pulsaciones` INT NOT NULL,
  PRIMARY KEY (`Empleado_Cod Empleado`),
  INDEX `fk_Auxiliar_Empleado1_idx` (`Empleado_Cod Empleado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`País`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`País` (
  `Cod_país` INT NOT NULL,
  `Nombre_país` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_país`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lenguaje de Programación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lenguaje de Programación` (
  `Cod_Lenguaje` INT NOT NULL,
  `Nombre_lenguaje` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Lenguaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paquete Ofimatico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paquete Ofimatico` (
  `Cod_Paquete` INT NOT NULL,
  `Nombre_paquete` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Paquete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa_has_Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa_has_Empleado` (
  `Empresa_Cod-Empresa` INT NOT NULL,
  `Empleado_Cod Empleado` INT NOT NULL,
  `Fecha_inicio` DATETIME NOT NULL,
  `Fecha_Fin` DATETIME NULL,
  PRIMARY KEY (`Empresa_Cod-Empresa`, `Empleado_Cod Empleado`),
  INDEX `fk_Empresa_has_Empleado_Empleado1_idx` (`Empleado_Cod Empleado` ASC) VISIBLE,
  INDEX `fk_Empresa_has_Empleado_Empresa1_idx` (`Empresa_Cod-Empresa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D-P` (
  `País_Cod_país` INT NOT NULL,
  `Director_Empleado_Cod Empleado1` INT NOT NULL,
  PRIMARY KEY (`País_Cod_país`, `Director_Empleado_Cod Empleado1`),
  INDEX `fk_País_has_Director_Director1_idx` (`Director_Empleado_Cod Empleado1` ASC) VISIBLE,
  INDEX `fk_País_has_Director_País1_idx` (`País_Cod_país` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`P-LP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`P-LP` (
  `Lenguaje de Programación_Cod_Lenguaje` INT NOT NULL,
  `Programador_Empleado_Cod Empleado` INT NOT NULL,
  PRIMARY KEY (`Lenguaje de Programación_Cod_Lenguaje`, `Programador_Empleado_Cod Empleado`),
  INDEX `fk_Lenguaje de Programación_has_Programador_Programador1_idx` (`Programador_Empleado_Cod Empleado` ASC) VISIBLE,
  INDEX `fk_Lenguaje de Programación_has_Programador_Lenguaje de Pr_idx` (`Lenguaje de Programación_Cod_Lenguaje` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`H-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`H-A` (
  `Paquete Ofimatico_Cod_Paquete` INT NOT NULL,
  `Auxiliar_Empleado_Cod Empleado` INT NOT NULL,
  PRIMARY KEY (`Paquete Ofimatico_Cod_Paquete`, `Auxiliar_Empleado_Cod Empleado`),
  INDEX `fk_Paquete Ofimatico_has_Auxiliar_Auxiliar1_idx` (`Auxiliar_Empleado_Cod Empleado` ASC) VISIBLE,
  INDEX `fk_Paquete Ofimatico_has_Auxiliar_Paquete Ofimatico1_idx` (`Paquete Ofimatico_Cod_Paquete` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
