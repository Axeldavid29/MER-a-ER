-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ParquesNaturales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ParquesNaturales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ParquesNaturales` DEFAULT CHARACTER SET utf8 ;
USE `ParquesNaturales` ;

-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Sistema de informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Sistema de informacion` (
  `Id del sistema` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Descripcion` VARCHAR(20) NOT NULL,
  `Fecha de implementacion Dia` DATE NOT NULL,
  `Fecha de implementacion Mes` DATE NOT NULL,
  `Fecha de implementacion Año` YEAR(9999) NOT NULL,
  `Responsable de mantenimiento` VARCHAR(20) NOT NULL,
  `Version del sistema` INT NOT NULL,
  PRIMARY KEY (`Id del sistema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Ministerio del Medio Ambiente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Ministerio del Medio Ambiente` (
  `ID Ministerio del Medio Ambiente` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  `Correo electronico` VARCHAR(20) NOT NULL,
  `Colonia` VARCHAR(20) NOT NULL,
  `Calle` VARCHAR(20) NOT NULL,
  `CP` VARCHAR(20) NOT NULL,
  `Ministerio del Medio Ambientecol` VARCHAR(20) NOT NULL,
  `Sistema de informacion_Id del sistema` INT NOT NULL,
  PRIMARY KEY (`ID Ministerio del Medio Ambiente`, `Sistema de informacion_Id del sistema`),
  INDEX `fk_Ministerio del Medio Ambiente_Sistema de informacion_idx` (`Sistema de informacion_Id del sistema` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Personal del parque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Personal del parque` (
  `ID personal del parque` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Cargo` VARCHAR(20) NOT NULL,
  `Area de trabajo` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  PRIMARY KEY (`ID personal del parque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Area` (
  `ID Area` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Ubicacion dentro del parque` VARCHAR(20) NOT NULL,
  `Superficie` VARCHAR(20) NOT NULL,
  `Tipo de area` VARCHAR(20) NOT NULL,
  `Especie_ID especie` INT NOT NULL,
  `Personal del parque_ID personal del parque` INT NOT NULL,
  PRIMARY KEY (`ID Area`, `Especie_ID especie`, `Personal del parque_ID personal del parque`),
  INDEX `fk_Area_Personal del parque1_idx` (`Personal del parque_ID personal del parque` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Parque Natural`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Parque Natural` (
  `ID parque natural` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Ubicacion Geografica` VARCHAR(20) NOT NULL,
  `Superficie` VARCHAR(20) NOT NULL,
  `Fecha de creacion Dia` DATE NOT NULL,
  `Fecha de creacion Mes` DATE NOT NULL,
  `Fecha de creacion Año` YEAR(9999) NOT NULL,
  `Tipo de escosistema` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID parque natural`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Parque Natural_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Comunidad Autonoma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Comunidad Autonoma` (
  `ID comunidad autonoma` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Coordenadas Geograficas` VARCHAR(20) NOT NULL,
  `Poblacion` VARCHAR(20) NOT NULL,
  `Superficie` VARCHAR(20) NOT NULL,
  `Idiomas Hablados` INT NOT NULL,
  `Parque Natural_ID parque natural` INT NOT NULL,
  `Ministerio del Medio Ambiente_ID Ministerio del Medio Ambiente` INT NOT NULL,
  `Ministerio del Medio Ambiente_Sistema de informacion_Id del sistema` INT NOT NULL,
  PRIMARY KEY (`ID comunidad autonoma`, `Parque Natural_ID parque natural`, `Ministerio del Medio Ambiente_ID Ministerio del Medio Ambiente`, `Ministerio del Medio Ambiente_Sistema de informacion_Id del sistema`),
  INDEX `fk_Comunidad Autonoma_Parque Natural1_idx` (`Parque Natural_ID parque natural` ASC) VISIBLE,
  INDEX `fk_Comunidad Autonoma_Ministerio del Medio Ambiente1_idx` (`Ministerio del Medio Ambiente_ID Ministerio del Medio Ambiente` ASC, `Ministerio del Medio Ambiente_Sistema de informacion_Id del sistema` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Personal de Gestion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Personal de Gestion` (
  `ID personal de gestion` INT NOT NULL,
  `Cargo` VARCHAR(20) NOT NULL,
  `Responsabilidad` VARCHAR(20) NOT NULL,
  `Nivel de autoridad` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID personal de gestion`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Personal de Gestion_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Personal de vigilancia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Personal de vigilancia` (
  `ID personal de vigilancia` INT NOT NULL,
  `Cargo` VARCHAR(20) NOT NULL,
  `Area de cobertura` VARCHAR(20) NOT NULL,
  `Equipamiento` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID personal de vigilancia`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Personal de vigilancia_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Personal de Conservación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Personal de Conservación` (
  `ID personal de conservacion` INT NOT NULL,
  `Cargo` VARCHAR(20) NOT NULL,
  `Especialidad` VARCHAR(20) NOT NULL,
  `Proyectos actuales` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID personal de conservacion`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Personal de Conservación_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Personal Investigador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Personal Investigador` (
  `ID investigador` INT NOT NULL,
  `Area de investigacion` VARCHAR(20) NOT NULL,
  `Proyectos actuales` VARCHAR(20) NOT NULL,
  `Publicaciones relevantes` VARCHAR(20) NOT NULL,
  `Numero de celular 10 dig.` INT NOT NULL,
  `Lada` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID investigador`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Personal Investigador_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Visitante` (
  `ID visitante` INT NOT NULL,
  `Nombre 1` VARCHAR(20) NOT NULL,
  `Nombre 2` VARCHAR(20) NOT NULL,
  `Apellido 1` VARCHAR(20) NOT NULL,
  `Apellido 2` VARCHAR(20) NOT NULL,
  `Fecha de visita Dia` DATE NOT NULL,
  `Fecha de visita Mes` DATE NOT NULL,
  `Fecha de visita Año` YEAR(9999) NOT NULL,
  `Tipo de visita` VARCHAR(20) NOT NULL,
  `Sugerencias` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID visitante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Alojamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Alojamiento` (
  `ID alojamiento` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `Capacidad` INT NOT NULL,
  `Servicios disponibles` VARCHAR(20) NOT NULL,
  `Reservas` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID alojamiento`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Alojamiento_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Excursion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Excursion` (
  `ID excursion` INT NOT NULL,
  `Fecha de inicio Dia` DATE NOT NULL,
  `Fecha de inicio Mes` DATE NOT NULL,
  `Fecha de inicio Año` YEAR(9999) NOT NULL,
  `Duracion` VARCHAR(20) NOT NULL,
  `Ruta` VARCHAR(20) NOT NULL,
  `Responsable` VARCHAR(20) NOT NULL,
  `Participantes` VARCHAR(20) NOT NULL,
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`ID excursion`, `Area_ID Area`, `Area_Especie_ID especie`),
  INDEX `fk_Excursion_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Especie` (
  `ID especie` INT NOT NULL,
  `Nombre cientifico` VARCHAR(20) NOT NULL,
  `Nombre comun` VARCHAR(20) NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `Habitad natural` VARCHAR(20) NOT NULL,
  `Estado de conservacion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID especie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Area_has_Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Area_has_Especie` (
  `Area_ID Area` INT NOT NULL,
  `Area_Especie_ID especie` INT NOT NULL,
  `Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`Area_ID Area`, `Area_Especie_ID especie`, `Especie_ID especie`),
  INDEX `fk_Area_has_Especie_Especie1_idx` (`Especie_ID especie` ASC) VISIBLE,
  INDEX `fk_Area_has_Especie_Area1_idx` (`Area_ID Area` ASC, `Area_Especie_ID especie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParquesNaturales`.`Visitante_has_Excursion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParquesNaturales`.`Visitante_has_Excursion` (
  `Visitante_ID visitante` INT NOT NULL,
  `Excursion_ID excursion` INT NOT NULL,
  `Excursion_Area_ID Area` INT NOT NULL,
  `Excursion_Area_Especie_ID especie` INT NOT NULL,
  PRIMARY KEY (`Visitante_ID visitante`, `Excursion_ID excursion`, `Excursion_Area_ID Area`, `Excursion_Area_Especie_ID especie`),
  INDEX `fk_Visitante_has_Excursion_Excursion1_idx` (`Excursion_ID excursion` ASC, `Excursion_Area_ID Area` ASC, `Excursion_Area_Especie_ID especie` ASC) VISIBLE,
  INDEX `fk_Visitante_has_Excursion_Visitante1_idx` (`Visitante_ID visitante` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
