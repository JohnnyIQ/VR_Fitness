-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema VRFitnessTrainingdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VRFitnessTrainingdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VRFitnessTrainingdb` ;
USE `VRFitnessTrainingdb` ;

-- -----------------------------------------------------
-- Table `VRFitnessTrainingdb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VRFitnessTrainingdb`.`User` (
  `User_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `join_date` DATE NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VRFitnessTrainingdb`.`Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VRFitnessTrainingdb`.`Trainer` (
  `trainer_id` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `specialty` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`trainer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VRFitnessTrainingdb`.`Workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VRFitnessTrainingdb`.`Workout` (
  `workout_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `difficulty` VARCHAR(45) NOT NULL,
  `duration_minutes` INT NOT NULL,
  `trainer_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`),
  INDEX `Trainer_idx` (`trainer_id` ASC) VISIBLE,
  CONSTRAINT `Trainer`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `VRFitnessTrainingdb`.`Trainer` (`trainer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VRFitnessTrainingdb`.`TrainingSession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VRFitnessTrainingdb`.`TrainingSession` (
  `session_id` INT NULL,
  `session_date` DATE NOT NULL,
  `calories_burned` INT NULL,
  `completion_status` VARCHAR(30) NOT NULL,
  `user_id` INT NOT NULL,
  `workout_id` INT NOT NULL,
  PRIMARY KEY (`session_id`),
  INDEX `User_idx` (`user_id` ASC) VISIBLE,
  INDEX `Workout_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `User`
    FOREIGN KEY (`user_id`)
    REFERENCES `VRFitnessTrainingdb`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Workout`
    FOREIGN KEY (`workout_id`)
    REFERENCES `VRFitnessTrainingdb`.`Workout` (`workout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
