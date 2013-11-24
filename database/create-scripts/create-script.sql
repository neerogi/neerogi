SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `neerogi` DEFAULT CHARACTER SET latin1 ;
USE `neerogi` ;

-- -----------------------------------------------------
-- Table `neerogi`.`title`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`title` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `neerogi`.`patient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`patient` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `clinic_no` VARCHAR(100) NOT NULL COMMENT '	' ,
  `title` INT NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `address` VARCHAR(1000) NULL DEFAULT NULL ,
  `gender` VARCHAR(1000) NULL DEFAULT NULL ,
  `occupation` VARCHAR(1000) NULL DEFAULT NULL ,
  `date_of_birth` DATETIME NULL DEFAULT NULL ,
  `age` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_patient_title1_idx` (`title` ASC) ,
  CONSTRAINT `fk_patient_title`
    FOREIGN KEY (`title` )
    REFERENCES `neerogi`.`title` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  INDEX `IX_FK_PatientAllergy` (`patient` ASC) ,
  INDEX `IX_FK_AllergyAllergyType` (`allergy_type` ASC) ,
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


-- -----------------------------------------------------
-- Table `neerogi`.`medical_speciality`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_speciality` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `neerogi`.`medical_sub_speciality`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_sub_speciality` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_speciality` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_MedSubSpecialityMedSpeciality` (`medical_speciality` ASC) ,
  CONSTRAINT `FK_MedSubSpecialityMedSpeciality`
    FOREIGN KEY (`medical_speciality` )
    REFERENCES `neerogi`.`medical_speciality` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
-- Table `neerogi`.`doctor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`doctor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `hospital` INT(11) NOT NULL ,
  `designation` VARCHAR(200) NULL DEFAULT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `specialization` VARCHAR(200) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_doctor_hospital1_idx` (`hospital` ASC) ,
  CONSTRAINT `fk_doctor_hospital1`
    FOREIGN KEY (`hospital` )
    REFERENCES `neerogi`.`hospital` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`consultation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`consultation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `doctor` INT(11) NOT NULL ,
  `visit_date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_PatientConsultation` (`patient` ASC) ,
  INDEX `IX_FK_ConsultationDoctor` (`doctor` ASC) ,
  CONSTRAINT `FK_ConsultationDoctor`
    FOREIGN KEY (`doctor` )
    REFERENCES `neerogi`.`doctor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientConsultation`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`medical_condition`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_condition` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `medical_speciality` INT(11) NOT NULL ,
  `medical_sub_speciality` INT(11) NOT NULL ,
  `consultation` INT(11) NOT NULL ,
  `history` VARCHAR(4000) NULL ,
  `examination_findings` VARCHAR(4000) NULL ,
  `problems_identified` VARCHAR(4000) NULL ,
  `diagnosis` VARCHAR(1000) NOT NULL ,
  `follow_up` VARCHAR(1000) NULL ,
  `management_plan` VARCHAR(4000) NULL ,
  `date_of_admission` DATETIME NULL ,
  `date_of_discharge` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_PatientCondition` (`patient` ASC) ,
  INDEX `IX_FK_MedCondMedSpeciality` (`medical_speciality` ASC) ,
  INDEX `IX_FK_MedCondMedSubSpeciality` (`medical_sub_speciality` ASC) ,
  INDEX `IX_FK_MedCondConsultation` (`consultation` ASC) ,
  CONSTRAINT `FK_PatientCondition`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondMedSpeciality`
    FOREIGN KEY (`medical_speciality` )
    REFERENCES `neerogi`.`medical_speciality` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondMedSubSpeciality`
    FOREIGN KEY (`medical_sub_speciality` )
    REFERENCES `neerogi`.`medical_sub_speciality` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MedCondConsultation`
    FOREIGN KEY (`consultation` )
    REFERENCES `neerogi`.`consultation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`treatment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`treatment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_condition` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `outcome` VARCHAR(4000) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_TreatmentMedicalCondition` (`medical_condition` ASC) ,
  CONSTRAINT `FK_TreatmentMedicalCondition`
    FOREIGN KEY (`medical_condition` )
    REFERENCES `neerogi`.`medical_condition` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


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
  INDEX `IX_FK_TreatmentDrugTreatment` (`treatment` ASC) ,
  CONSTRAINT `FK_TreatmentDrugTreatment`
    FOREIGN KEY (`treatment` )
    REFERENCES `neerogi`.`treatment` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


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
  INDEX `IX_FK_InvestigationMedCond` (`medical_condition` ASC) ,
  CONSTRAINT `FK_InvestigationMedicalCondition`
    FOREIGN KEY (`medical_condition` )
    REFERENCES `neerogi`.`medical_condition` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`other_treatment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`other_treatment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `treatment` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `duration` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_TreatmentProcedureTreatment` (`treatment` ASC) ,
  CONSTRAINT `FK_TreatmentProcedureTreatment`
    FOREIGN KEY (`treatment` )
    REFERENCES `neerogi`.`treatment` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `neerogi`.`social_history`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `neerogi`.`social_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient` INT(11) NOT NULL ,
  `type` VARCHAR(1000) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_PatientSocialHistory` (`patient` ASC) ,
  CONSTRAINT `FK_PatientSocialHistory`
    FOREIGN KEY (`patient` )
    REFERENCES `neerogi`.`patient` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `neerogi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
