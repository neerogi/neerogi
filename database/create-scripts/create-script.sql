SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `neerogi` DEFAULT CHARACTER SET latin1 ;
USE `neerogi` ;

-- -----------------------------------------------------
-- Table `neerogi`.`patient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`patient` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NOT NULL ,
  `address` VARCHAR(1000) NULL DEFAULT NULL ,
  `gender` VARCHAR(1000) NULL DEFAULT NULL ,
  `occupation` VARCHAR(1000) NULL DEFAULT NULL ,
  `date_of_birth` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`allergy_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`allergy_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `neerogi`.`allergy`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`allergy` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `allergy_type` INT(11) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_PatientAllergy`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_AllergyAllergyType`
    FOREIGN KEY (`allergy_type` )
    REFERENCES `neerogi`.`allergy_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_PatientAllergy` ON `neerogi`.`allergy` (`patient` ASC) ;

CREATE INDEX `IX_FK_AllergyAllergyType` ON `neerogi`.`allergy` (`allergy_type` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`medical_condition_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_condition_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `neerogi`.`medical_condition_sub_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_condition_sub_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_condition_type` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_MedCondSubTypeMedCondType`
    FOREIGN KEY (`medical_condition_type` )
    REFERENCES `neerogi`.`medical_condition_type` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_MedCondSubTypeMedCondType` ON `neerogi`.`medical_condition_sub_type` (`medical_condition_type` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`doctor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`doctor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `designation` VARCHAR(1000) NULL DEFAULT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `registration_no` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`hospital`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`hospital` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NOT NULL ,
  `address` VARCHAR(1000) NULL DEFAULT NULL ,
  `telephone` VARCHAR(45) NULL ,
  `fax` VARCHAR(45) NULL ,
  `email` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`consultation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`consultation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `hospital` INT(11) NOT NULL ,
  `doctor` INT(11) NOT NULL ,
  `visit_date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_ConsultationDoctor`
    FOREIGN KEY (`doctor` )
    REFERENCES `neerogi`.`doctor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ConsultationHospital`
    FOREIGN KEY (`hospital` )
    REFERENCES `neerogi`.`hospital` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientConsultation`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_PatientConsultation` ON `neerogi`.`consultation` (`patient` ASC) ;

CREATE INDEX `IX_FK_ConsultationHospital` ON `neerogi`.`consultation` (`hospital` ASC) ;

CREATE INDEX `IX_FK_ConsultationDoctor` ON `neerogi`.`consultation` (`doctor` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`medical_condition`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_condition` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `medical_condition_type` INT(11) NOT NULL ,
  `medical_condition_sub_type` INT(11) NOT NULL ,
  `consultation` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(4000) NULL ,
  `first_symptom_date` DATETIME NULL ,
  `last_symptom_date` DATETIME NULL ,
  `follow_up` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_PatientCondition`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondMedCondType`
    FOREIGN KEY (`medical_condition_type` )
    REFERENCES `neerogi`.`medical_condition_type` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondMedCondSubType`
    FOREIGN KEY (`medical_condition_sub_type` )
    REFERENCES `neerogi`.`medical_condition_sub_type` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondConsultation`
    FOREIGN KEY (`consultation` )
    REFERENCES `neerogi`.`consultation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_PatientCondition` ON `neerogi`.`medical_condition` (`patient` ASC) ;

CREATE INDEX `IX_FK_MedCondMedCondType` ON `neerogi`.`medical_condition` (`medical_condition_type` ASC) ;

CREATE INDEX `IX_FK_MedCondMedCondSubType` ON `neerogi`.`medical_condition` (`medical_condition_sub_type` ASC) ;

CREATE INDEX `IX_FK_MedCondConsultation` ON `neerogi`.`medical_condition` (`consultation` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`treatment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`treatment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_condition` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_TreatmentMedicalCondition`
    FOREIGN KEY (`medical_condition` )
    REFERENCES `neerogi`.`medical_condition` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_TreatmentMedicalCondition` ON `neerogi`.`treatment` (`medical_condition` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`drug_treatment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`drug_treatment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `treatment` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `medical_name` VARCHAR(1000) NULL DEFAULT NULL ,
  `dose` VARCHAR(1000) NULL DEFAULT NULL ,
  `frequency` VARCHAR(1000) NULL DEFAULT NULL ,
  `duration` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_TreatmentDrugTreatment`
    FOREIGN KEY (`treatment` )
    REFERENCES `neerogi`.`treatment` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_TreatmentDrugTreatment` ON `neerogi`.`drug_treatment` (`treatment` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`follow_up`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`follow_up` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_condition` INT(11) NOT NULL ,
  `follow_up_condition_id` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_FollowUpMedicalCondition`
    FOREIGN KEY (`medical_condition` )
    REFERENCES `neerogi`.`medical_condition` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_FollowUpMedCond` ON `neerogi`.`follow_up` (`medical_condition` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`investigation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`investigation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_condition` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `planned_date` DATETIME NULL DEFAULT NULL ,
  `actual_date` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_InvestigationMedicalCondition`
    FOREIGN KEY (`medical_condition` )
    REFERENCES `neerogi`.`medical_condition` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_InvestigationMedCond` ON `neerogi`.`investigation` (`medical_condition` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`procedure_treatment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`procedure_treatment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `treatment` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `duration` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_TreatmentProcedureTreatment`
    FOREIGN KEY (`treatment` )
    REFERENCES `neerogi`.`treatment` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_TreatmentProcedureTreatment` ON `neerogi`.`procedure_treatment` (`treatment` ASC) ;


-- -----------------------------------------------------
-- Table `neerogi`.`social_history`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`social_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `type` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_PatientSocialHistory`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IX_FK_PatientSocialHistory` ON `neerogi`.`social_history` (`patient` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
