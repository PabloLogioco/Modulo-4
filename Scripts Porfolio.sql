-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema porfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema porfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `porfolio` DEFAULT CHARACTER SET utf8 ;
USE `porfolio` ;

-- -----------------------------------------------------
-- Table `porfolio`.`titular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio`.`titular` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `mail` VARCHAR(100) NULL,
  `titulo` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio`.`experiencia` (
  `id` INT NOT NULL,
  `desde` VARCHAR(45) NULL,
  `hasta` VARCHAR(45) NULL,
  `empresa` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `titular_id` INT NOT NULL,
  PRIMARY KEY (`id`, `titular_id`),
  INDEX `fk_experiencia_titular_idx` (`titular_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_titular`
    FOREIGN KEY (`titular_id`)
    REFERENCES `porfolio`.`titular` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio`.`estudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio`.`estudios` (
  `id` INT NOT NULL,
  `año` VARCHAR(45) NULL,
  `institucion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `titular_id` INT NOT NULL,
  PRIMARY KEY (`id`, `titular_id`),
  INDEX `fk_estudios_titular1_idx` (`titular_id` ASC) VISIBLE,
  CONSTRAINT `fk_estudios_titular1`
    FOREIGN KEY (`titular_id`)
    REFERENCES `porfolio`.`titular` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio`.`proyectos` (
  `id` INT NOT NULL,
  `año` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `titular_id` INT NOT NULL,
  PRIMARY KEY (`id`, `titular_id`),
  INDEX `fk_proyectos_titular1_idx` (`titular_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_titular1`
    FOREIGN KEY (`titular_id`)
    REFERENCES `porfolio`.`titular` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
