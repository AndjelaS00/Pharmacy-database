-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema apoteka_nelek
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema apoteka_nelek
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `apoteka_nelek` DEFAULT CHARACTER SET utf8mb4 ;
USE `apoteka_nelek` ;

-- -----------------------------------------------------
-- Table `apoteka_nelek`.`apoteka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`apoteka` (
  `id_apoteke` INT(11) NOT NULL,
  `kontakt` INT(11) NOT NULL,
  `grad` VARCHAR(45) NOT NULL,
  `ulica` VARCHAR(45) NOT NULL,
  `broj` INT(11) NOT NULL,
  PRIMARY KEY (`id_apoteke`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`dobavljac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`dobavljac` (
  `id_dobavljaca` INT(11) NOT NULL,
  `kontakt_d` VARCHAR(45) NOT NULL,
  `grad_d` VARCHAR(45) NOT NULL,
  `ulica_d` VARCHAR(45) NOT NULL,
  `broj_d` INT(11) NOT NULL,
  PRIMARY KEY (`id_dobavljaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`proizvod` (
  `id_proizvoda` INT(11) NOT NULL,
  `cena` INT(11) NOT NULL,
  PRIMARY KEY (`id_proizvoda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`medicinska_oprema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`medicinska_oprema` (
  `vrsta` VARCHAR(45) NOT NULL,
  `proizvod_id_proizvoda` INT(11) NOT NULL,
  PRIMARY KEY (`proizvod_id_proizvoda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`musterija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`musterija` (
  `jmbg_m` INT(11) NOT NULL,
  `kontakt_m` VARCHAR(45) NOT NULL,
  `ime_m` VARCHAR(45) NOT NULL,
  `prezime_m` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`jmbg_m`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`ostalo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`ostalo` (
  `namena` INT(11) NOT NULL,
  `proizvod_id_proizvoda` INT(11) NOT NULL,
  PRIMARY KEY (`proizvod_id_proizvoda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`zaposleni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`zaposleni` (
  `jmbg_z` INT(11) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_zaposlenja` DATE NOT NULL,
  `apoteka_id_apoteke` INT(11) NOT NULL,
  PRIMARY KEY (`jmbg_z`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`narucuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`narucuje` (
  `proizvodd_id_proizvoda` INT(11) NOT NULL,
  `zaposleni_jmbg_z` INT(11) NOT NULL,
  PRIMARY KEY (`proizvodd_id_proizvoda`, `zaposleni_jmbg_z`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`obezbedjuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`obezbedjuje` (
  `proizvod_id_proizvoda` INT(11) NOT NULL,
  `dobavljac_id_dobavljaca` INT(11) NOT NULL,
  PRIMARY KEY (`proizvod_id_proizvoda`, `dobavljac_id_dobavljaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`kupuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`kupuje` (
  `proizvod_id_proizvod` INT(11) NOT NULL,
  `musterija_jmbg_m` INT(11) NOT NULL,
  PRIMARY KEY (`musterija_jmbg_m`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
