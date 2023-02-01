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
  PRIMARY KEY (`proizvod_id_proizvoda`),
  CONSTRAINT `fk_medicinska_oprema_proizvod1`
    FOREIGN KEY (`proizvod_id_proizvoda`)
    REFERENCES `apoteka_nelek`.`proizvod` (`id_proizvoda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`proizvod_id_proizvoda`),
  CONSTRAINT `fk_ostalo_proizvod1`
    FOREIGN KEY (`proizvod_id_proizvoda`)
    REFERENCES `apoteka_nelek`.`proizvod` (`id_proizvoda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`jmbg_z`),
  INDEX `fk_zaposleni_apoteka_idx` (`apoteka_id_apoteke` ASC) VISIBLE,
  CONSTRAINT `fk_zaposleni_apoteka`
    FOREIGN KEY (`apoteka_id_apoteke`)
    REFERENCES `apoteka_nelek`.`apoteka` (`id_apoteke`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`narucuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`narucuje` (
  `proizvodd_id_proizvoda` INT(11) NOT NULL,
  `zaposleni_jmbg_z` INT(11) NOT NULL,
  PRIMARY KEY (`proizvodd_id_proizvoda`, `zaposleni_jmbg_z`),
  INDEX `fk_proizvod_has_zaposleni_zaposleni1_idx` (`zaposleni_jmbg_z` ASC) VISIBLE,
  INDEX `fk_proizvod_has_zaposleni_proizvod1_idx` (`proizvodd_id_proizvoda` ASC) VISIBLE,
  CONSTRAINT `fk_proizvod_has_zaposleni_proizvod1`
    FOREIGN KEY (`proizvodd_id_proizvoda`)
    REFERENCES `apoteka_nelek`.`proizvod` (`id_proizvoda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_has_zaposleni_zaposleni1`
    FOREIGN KEY (`zaposleni_jmbg_z`)
    REFERENCES `apoteka_nelek`.`zaposleni` (`jmbg_z`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`obezbedjuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`obezbedjuje` (
  `proizvod_id_proizvoda` INT(11) NOT NULL,
  `dobavljac_id_dobavljaca` INT(11) NOT NULL,
  PRIMARY KEY (`proizvod_id_proizvoda`, `dobavljac_id_dobavljaca`),
  INDEX `fk_proizvod_has_dobavljac_dobavljac1_idx` (`dobavljac_id_dobavljaca` ASC) VISIBLE,
  INDEX `fk_proizvod_has_dobavljac_proizvod1_idx` (`proizvod_id_proizvoda` ASC) VISIBLE,
  CONSTRAINT `fk_proizvod_has_dobavljac_proizvod1`
    FOREIGN KEY (`proizvod_id_proizvoda`)
    REFERENCES `apoteka_nelek`.`proizvod` (`id_proizvoda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_has_dobavljac_dobavljac1`
    FOREIGN KEY (`dobavljac_id_dobavljaca`)
    REFERENCES `apoteka_nelek`.`dobavljac` (`id_dobavljaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `apoteka_nelek`.`kupuje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apoteka_nelek`.`kupuje` (
  `proizvod_id_proizvod` INT(11) NOT NULL,
  `musterija_jmbg_m` INT(11) NOT NULL,
  PRIMARY KEY (`musterija_jmbg_m`),
  INDEX `fk_proizvod_has_musterija_musterija1_idx` (`musterija_jmbg_m` ASC) VISIBLE,
  INDEX `fk_proizvod_has_musterija_proizvod1_idx` (`proizvod_id_proizvod` ASC) VISIBLE,
  CONSTRAINT `fk_proizvod_has_musterija_proizvod1`
    FOREIGN KEY (`proizvod_id_proizvod`)
    REFERENCES `apoteka_nelek`.`proizvod` (`id_proizvoda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_has_musterija_musterija1`
    FOREIGN KEY (`musterija_jmbg_m`)
    REFERENCES `apoteka_nelek`.`musterija` (`jmbg_m`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
