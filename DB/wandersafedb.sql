-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wandersafedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wandersafedb` ;

-- -----------------------------------------------------
-- Schema wandersafedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wandersafedb` DEFAULT CHARACTER SET utf8 ;
USE `wandersafedb` ;

-- -----------------------------------------------------
-- Table `wandersafedb`.`contact_card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wandersafedb`.`contact_card` ;

CREATE TABLE IF NOT EXISTS `wandersafedb`.`contact_card` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(500) NULL,
  `phone` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wandersafedb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wandersafedb`.`user` ;

CREATE TABLE IF NOT EXISTS `wandersafedb`.`user` (
  `username` VARCHAR(45) NOT NULL,
  `contact_card_id` INT NOT NULL,
  PRIMARY KEY (`username`),
  INDEX `fk_user_contact_card_idx` (`contact_card_id` ASC),
  CONSTRAINT `fk_user_contact_card`
    FOREIGN KEY (`contact_card_id`)
    REFERENCES `wandersafedb`.`contact_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wandersafedb`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wandersafedb`.`contact` ;

CREATE TABLE IF NOT EXISTS `wandersafedb`.`contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `contact_card_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_contact_card1_idx` (`contact_card_id` ASC),
  CONSTRAINT `fk_contact_contact_card1`
    FOREIGN KEY (`contact_card_id`)
    REFERENCES `wandersafedb`.`contact_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wandersafedb`.`sos_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wandersafedb`.`sos_event` ;

CREATE TABLE IF NOT EXISTS `wandersafedb`.`sos_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NULL,
  `active` TINYINT NULL,
  `user` VARCHAR(45) NOT NULL,
  `contact` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sos_event_user1_idx` (`user` ASC),
  INDEX `fk_sos_event_contact1_idx` (`contact` ASC),
  CONSTRAINT `fk_sos_event_user1`
    FOREIGN KEY (`user`)
    REFERENCES `wandersafedb`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sos_event_contact1`
    FOREIGN KEY (`contact`)
    REFERENCES `wandersafedb`.`contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS wandersafeuser;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'wandersafeuser' IDENTIFIED BY 'user';

GRANT SELECT ON TABLE `wandersafedb`.* TO 'wandersafeuser';
GRANT SELECT, INSERT, TRIGGER ON TABLE `wandersafedb`.* TO 'wandersafeuser';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `wandersafedb`.* TO 'wandersafeuser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `wandersafedb`.`contact_card`
-- -----------------------------------------------------
START TRANSACTION;
USE `wandersafedb`;
INSERT INTO `wandersafedb`.`contact_card` (`id`, `email`, `phone`) VALUES (1, 'wanderer@wanderlust.com', '0015555555555');
INSERT INTO `wandersafedb`.`contact_card` (`id`, `email`, `phone`) VALUES (2, 'friend@friends.com', '0015555555556');
INSERT INTO `wandersafedb`.`contact_card` (`id`, `email`, `phone`) VALUES (3, 'familymember@family.com', '0015555555557');

COMMIT;


-- -----------------------------------------------------
-- Data for table `wandersafedb`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `wandersafedb`;
INSERT INTO `wandersafedb`.`user` (`username`, `contact_card_id`) VALUES ('wanderer', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wandersafedb`.`contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `wandersafedb`;
INSERT INTO `wandersafedb`.`contact` (`id`, `name`, `contact_card_id`) VALUES (1, 'friend', 2);
INSERT INTO `wandersafedb`.`contact` (`id`, `name`, `contact_card_id`) VALUES (2, 'family member', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wandersafedb`.`sos_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `wandersafedb`;
INSERT INTO `wandersafedb`.`sos_event` (`id`, `time`, `active`, `user`, `contact`) VALUES (1, '2023-10-26 12:00:00', 1, 'wanderer', 1);
INSERT INTO `wandersafedb`.`sos_event` (`id`, `time`, `active`, `user`, `contact`) VALUES (2, '2023-10-27 18:00:00', 1, 'wanderer', 2);

COMMIT;

