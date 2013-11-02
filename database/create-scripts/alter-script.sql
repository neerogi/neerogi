SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `neerogi`.`allergy` DROP FOREIGN KEY `FK_PatientAllergy` , DROP FOREIGN KEY `FK_AllergyAllergyType` ;

ALTER TABLE `neerogi`.`medical_condition` DROP FOREIGN KEY `FK_PatientCondition` , DROP FOREIGN KEY `FK_MedCondConsultation` , DROP FOREIGN KEY `FK_MedicalSubSpeciality` , DROP FOREIGN KEY `FK_MedicalSpeciality` ;

ALTER TABLE `neerogi`.`consultation` DROP FOREIGN KEY `FK_ConsultationDoctor` , DROP FOREIGN KEY `FK_PatientConsultation` ;

ALTER TABLE `neerogi`.`doctor` DROP FOREIGN KEY `fk_doctor_hospital1` ;

ALTER TABLE `neerogi`.`drug_treatment` DROP FOREIGN KEY `FK_TreatmentDrugTreatment` ;

ALTER TABLE `neerogi`.`follow_up` DROP FOREIGN KEY `FK_FollowUpMedicalCondition` ;

ALTER TABLE `neerogi`.`investigation` DROP FOREIGN KEY `FK_InvestigationMedicalCondition` ;

ALTER TABLE `neerogi`.`social_history` DROP FOREIGN KEY `FK_PatientSocialHistory` ;

ALTER TABLE `neerogi`.`treatment` DROP FOREIGN KEY `FK_TreatmentMedicalCondition` ;

ALTER TABLE `neerogi`.`allergy` DROP COLUMN `allergy_type` , DROP COLUMN `patient` , ADD COLUMN `patient` INT(11) NOT NULL  AFTER `id` , ADD COLUMN `allergy_type` INT(11) NOT NULL  AFTER `patient` , 
  ADD CONSTRAINT `FK_PatientAllergy`
  FOREIGN KEY (`patient` )
  REFERENCES `neerogi`.`patient` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE, 
  ADD CONSTRAINT `FK_AllergyAllergyType`
  FOREIGN KEY (`allergy_type` )
  REFERENCES `neerogi`.`allergy_type` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `IX_FK_PatientAllergy` 
, ADD INDEX `IX_FK_PatientAllergy` (`patient` ASC) 
, ADD INDEX `IX_FK_AllergyAllergyType` (`allergy_type` ASC) 
, DROP INDEX `IX_FK_AllergyAllergyType` ;

ALTER TABLE `neerogi`.`medical_condition` DROP COLUMN `date_of_admission` , DROP COLUMN `diagnosis` , DROP COLUMN `problems_identified` , DROP COLUMN `consultation` , DROP COLUMN `medical_sub_speciality` , DROP COLUMN `medical_speciality` , DROP COLUMN `patient` , ADD COLUMN `patient` INT(11) NOT NULL  AFTER `id` , ADD COLUMN `medical_speciality` INT(11) NOT NULL  AFTER `patient` , ADD COLUMN `medical_sub_speciality` INT(11) NOT NULL  AFTER `medical_speciality` , ADD COLUMN `consultation` INT(11) NOT NULL  AFTER `medical_sub_speciality` , ADD COLUMN `problems_identified` VARCHAR(4000) NULL DEFAULT NULL  AFTER `examination_findings` , ADD COLUMN `diagnosis` VARCHAR(1000) NOT NULL  AFTER `problems_identified` , ADD COLUMN `date_of_admission` DATETIME NULL DEFAULT NULL  AFTER `management_plan` , 
  ADD CONSTRAINT `FK_PatientCondition`
  FOREIGN KEY (`patient` )
  REFERENCES `neerogi`.`patient` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE, 
  ADD CONSTRAINT `FK_MedCondMedCondType`
  FOREIGN KEY (`medical_speciality` )
  REFERENCES `neerogi`.`medical_speciality` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE, 
  ADD CONSTRAINT `FK_MedCondMedCondSubType`
  FOREIGN KEY (`medical_sub_speciality` )
  REFERENCES `neerogi`.`medical_sub_speciality` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE, 
  ADD CONSTRAINT `FK_MedCondConsultation`
  FOREIGN KEY (`consultation` )
  REFERENCES `neerogi`.`consultation` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `IX_FK_PatientCondition` 
, ADD INDEX `IX_FK_PatientCondition` (`patient` ASC) 
, ADD INDEX `IX_FK_MedCondMedCondType` (`medical_speciality` ASC) 
, ADD INDEX `IX_FK_MedCondMedCondSubType` (`medical_sub_speciality` ASC) 
, ADD INDEX `IX_FK_MedCondConsultation` (`consultation` ASC) 
, DROP INDEX `IX_FK_MedCondConsultation` 
, DROP INDEX `IX_FK_MedCondMedCondSubType` 
, DROP INDEX `IX_FK_MedCondMedCondType` ;

CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_sub_speciality` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `medical_speciality` INT(11) NOT NULL ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `IX_FK_MedCondSubTypeMedCondType` (`medical_speciality` ASC) ,
  CONSTRAINT `FK_MedSubSpecialityMedSpeciality`
    FOREIGN KEY (`medical_speciality` )
    REFERENCES `neerogi`.`medical_speciality` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

ALTER TABLE `neerogi`.`consultation` DROP COLUMN `doctor` , DROP COLUMN `patient` , ADD COLUMN `patient` INT(11) NOT NULL  AFTER `id` , ADD COLUMN `doctor` INT(11) NOT NULL  AFTER `patient` , 
  ADD CONSTRAINT `FK_ConsultationDoctor`
  FOREIGN KEY (`doctor` )
  REFERENCES `neerogi`.`doctor` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `FK_PatientConsultation`
  FOREIGN KEY (`patient` )
  REFERENCES `neerogi`.`patient` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `IX_FK_PatientConsultation` 
, ADD INDEX `IX_FK_PatientConsultation` (`patient` ASC) 
, DROP INDEX `IX_FK_ConsultationDoctor` 
, ADD INDEX `IX_FK_ConsultationDoctor` (`doctor` ASC) ;

ALTER TABLE `neerogi`.`doctor` DROP COLUMN `hospital` , ADD COLUMN `hospital` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `fk_doctor_hospital1`
  FOREIGN KEY (`hospital` )
  REFERENCES `neerogi`.`hospital` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_doctor_hospital1_idx` (`hospital` ASC) 
, DROP INDEX `fk_doctor_hospital1_idx` ;

ALTER TABLE `neerogi`.`drug_treatment` DROP COLUMN `treatment` , ADD COLUMN `treatment` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `FK_TreatmentDrugTreatment`
  FOREIGN KEY (`treatment` )
  REFERENCES `neerogi`.`treatment` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, DROP INDEX `IX_FK_TreatmentDrugTreatment` 
, ADD INDEX `IX_FK_TreatmentDrugTreatment` (`treatment` ASC) ;

ALTER TABLE `neerogi`.`follow_up` DROP COLUMN `medical_condition` , ADD COLUMN `medical_condition` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `FK_FollowUpMedicalCondition`
  FOREIGN KEY (`medical_condition` )
  REFERENCES `neerogi`.`medical_condition` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, ADD INDEX `IX_FK_FollowUpMedCond` (`medical_condition` ASC) 
, DROP INDEX `IX_FK_FollowUpMedCond` ;

ALTER TABLE `neerogi`.`investigation` DROP COLUMN `medical_condition` , ADD COLUMN `medical_condition` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `FK_InvestigationMedicalCondition`
  FOREIGN KEY (`medical_condition` )
  REFERENCES `neerogi`.`medical_condition` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `IX_FK_InvestigationMedCond` (`medical_condition` ASC) 
, DROP INDEX `IX_FK_InvestigationMedCond` ;

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
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

ALTER TABLE `neerogi`.`social_history` DROP COLUMN `patient` , ADD COLUMN `patient` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `FK_PatientSocialHistory`
  FOREIGN KEY (`patient` )
  REFERENCES `neerogi`.`patient` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `IX_FK_PatientSocialHistory` (`patient` ASC) 
, DROP INDEX `IX_FK_PatientSocialHistory` ;

ALTER TABLE `neerogi`.`treatment` DROP COLUMN `medical_condition` , ADD COLUMN `medical_condition` INT(11) NOT NULL  AFTER `id` , 
  ADD CONSTRAINT `FK_TreatmentMedicalCondition`
  FOREIGN KEY (`medical_condition` )
  REFERENCES `neerogi`.`medical_condition` (`id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `IX_FK_TreatmentMedicalCondition` (`medical_condition` ASC) 
, DROP INDEX `IX_FK_TreatmentMedicalCondition` ;

CREATE  TABLE IF NOT EXISTS `neerogi`.`medical_speciality` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(1000) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

DROP TABLE IF EXISTS `neerogi`.`other_treatment` ;

DROP TABLE IF EXISTS `neerogi`.`medical_sub_speciality` ;

DROP TABLE IF EXISTS `neerogi`.`medical_speciality` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
