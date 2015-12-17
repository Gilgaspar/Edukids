SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=1;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `EduKids` ;
CREATE SCHEMA IF NOT EXISTS `EduKids` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `EduKids` ;

-- -----------------------------------------------------
-- Table `EduKids`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`Users` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(150) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `birthdate` DATE NULL,
  `sex` CHAR NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`Responsable_Assisted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`Responsable_Assisted` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`Responsable_Assisted` (
  `idResponsableAssisted` INT NOT NULL AUTO_INCREMENT,
  `Responsable` INT NOT NULL,
  `Assisted` INT NOT NULL,
  PRIMARY KEY (`Responsable`, `Assisted`),
  INDEX `fk_Responsable_Assisted_Assisted_idx` (`Assisted` ASC),
  UNIQUE INDEX `idResponsableAssisted_UNIQUE` (`idResponsableAssisted` ASC),
  CONSTRAINT `fk_Responsable_Assisted_Responsable`
    FOREIGN KEY (`Responsable`)
    REFERENCES `EduKids`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Responsable_Assisted_Assisted`
    FOREIGN KEY (`Assisted`)
    REFERENCES `EduKids`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`GroupsEvents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`GroupsEvents` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`GroupsEvents` (
  `idGroupEvent` INT NOT NULL AUTO_INCREMENT,
  `ResponsableGroupEvent` INT NOT NULL,
  `nameGroupEvent` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupEvent`, `ResponsableGroupEvent`),
  INDEX `fk_GroupsEvents_Responsable_idx` (`ResponsableGroupEvent` ASC),
  CONSTRAINT `fk_GroupsEvents_Responsable`
    FOREIGN KEY (`ResponsableGroupEvent`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`Events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`Events` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`Events` (
  `idEvent` INT NOT NULL AUTO_INCREMENT,
  `ResponsableEvent` INT NOT NULL,
  `GroupEvent` INT NOT NULL,
  `nameEvent` VARCHAR(50) NOT NULL,
  `Description` TEXT NULL,
  `Point` INT NOT NULL,
  PRIMARY KEY (`idEvent`, `ResponsableEvent`, `GroupEvent`),
  INDEX `fk_Events_groupEvent_idx` (`GroupEvent` ASC),
  INDEX `fk_Events_Responsable_idx` (`ResponsableEvent` ASC),
  CONSTRAINT `fk_Events_groupEvent`
    FOREIGN KEY (`GroupEvent`)
    REFERENCES `EduKids`.`GroupsEvents` (`idGroupEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_Responsable`
    FOREIGN KEY (`ResponsableEvent`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`Efects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`Efects` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`Efects` (
  `idEfect` INT NOT NULL AUTO_INCREMENT,
  `Responsable` INT NOT NULL,
  `idGroupEfect` INT NOT NULL,
  `nameReflexion` VARCHAR(50) NOT NULL,
  `descriptionReflexion` TEXT NULL,
  `pointMIn` INT NULL,
  `pointMax` INT NULL,
  PRIMARY KEY (`idEfect`, `Responsable`, `idGroupEfect`),
  INDEX `fk_Efects_Responsable_idx` (`Responsable` ASC),
  CONSTRAINT `fk_Efects_Responsable`
    FOREIGN KEY (`Responsable`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`GroupsEfects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`GroupsEfects` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`GroupsEfects` (
  `idGroupEfect` INT NOT NULL AUTO_INCREMENT,
  `Responsable` INT NOT NULL,
  `nameGroupEfect` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idGroupEfect`, `Responsable`),
  INDEX `fk_GroupsEfects_Responsable_idx` (`Responsable` ASC),
  CONSTRAINT `fk_GroupsEfects_Responsable`
    FOREIGN KEY (`Responsable`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`RecordsEfects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`RecordsEfects` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`RecordsEfects` (
  `idRecordEfect` INT NOT NULL AUTO_INCREMENT,
  `Responsable_Assisted_Responsable` INT NOT NULL,
  `Responsable_Assisted_Assisted` INT NOT NULL,
  `Efects_idEfect` INT NOT NULL,
  `dateEfect` DATE NOT NULL,
  INDEX `fk_Efects_has_Responsable_Assisted_Efects1_idx` (`Efects_idEfect` ASC),
  PRIMARY KEY (`idRecordEfect`),
  INDEX `fk_RecordsEfects_Responsable_idx` (`Responsable_Assisted_Responsable` ASC, `Responsable_Assisted_Assisted` ASC),
  CONSTRAINT `fk_RecordEfects`
    FOREIGN KEY (`Efects_idEfect`)
    REFERENCES `EduKids`.`Efects` (`idEfect`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RecEfects_Responsable_Assisted`
    FOREIGN KEY (`Responsable_Assisted_Responsable` , `Responsable_Assisted_Assisted`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable` , `Assisted`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EduKids`.`RecordsEvents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduKids`.`RecordsEvents` ;

CREATE TABLE IF NOT EXISTS `EduKids`.`RecordsEvents` (
  `idRecordEvent` INT NOT NULL AUTO_INCREMENT,
  `Responsable_Assisted_Responsable` INT NOT NULL,
  `Responsable_Assisted_Assisted` INT NOT NULL,
  `Events_idEvent` INT NOT NULL,
  `dateEvent` DATE NOT NULL,
  INDEX `fk_Responsable_Assisted_has_Events_Events1_idx` (`Events_idEvent` ASC),
  PRIMARY KEY (`idRecordEvent`),
  INDEX `fk_RecordsEvents_Responsable_idx` (`Responsable_Assisted_Responsable` ASC, `Responsable_Assisted_Assisted` ASC),
  CONSTRAINT `fk_RecordsEvents_Event`
    FOREIGN KEY (`Events_idEvent`)
    REFERENCES `EduKids`.`Events` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RecordsEvents_Responsable_Assisted`
    FOREIGN KEY (`Responsable_Assisted_Responsable` , `Responsable_Assisted_Assisted`)
    REFERENCES `EduKids`.`Responsable_Assisted` (`Responsable` , `Assisted`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
