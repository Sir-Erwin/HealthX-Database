-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema healthx
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `healthx` ;

-- -----------------------------------------------------
-- Schema healthx
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `healthx` DEFAULT CHARACTER SET utf8 ;
USE `healthx` ;

-- -----------------------------------------------------
-- Table `healthx`.`doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`doctor` ;

CREATE TABLE IF NOT EXISTS `healthx`.`doctor` (
  `EID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(45) NOT NULL,
  `MInitial` VARCHAR(1) NULL DEFAULT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` INT(11) NULL DEFAULT NULL COMMENT '0 - Male\\\\\\\\\\\\\\\\n1 - Female\\\\\\\\\\\\\\\\n2 - NonBinary/GenderNeutral',
  `SSN` INT(10) UNSIGNED NULL DEFAULT NULL,
  `Contact` VARCHAR(45) NULL DEFAULT NULL,
  `Type` INT(11) NULL DEFAULT NULL COMMENT '0 - General\\\\\\\\\\\\\\\\n1 - Dermatology\\\\\\\\\\\\\\\\n2 - Dental\\\\\\\\\\\\\\\\n3 - etc.',
  `Salary` INT(11) NULL DEFAULT NULL,
  `MedicalLicenseNumber` INT(10) UNSIGNED NOT NULL,
  `Deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0 or 1',
  `Passw` VARCHAR(45) NOT NULL DEFAULT 'Password!',
  PRIMARY KEY (`EID`),
  UNIQUE INDEX `EID_UNIQUE` (`EID` ASC)  ,
  UNIQUE INDEX `MedicalLicenseNumber_UNIQUE` (`MedicalLicenseNumber` ASC)  )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`patient` ;

CREATE TABLE IF NOT EXISTS `healthx`.`patient` (
  `PID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `PhoneNum` VARCHAR(16) NOT NULL,
  `SSN` VARCHAR(11) NOT NULL,
  `Insurance` VARCHAR(255) NOT NULL,
  `Height` INT(11) NOT NULL,
  `Weight` INT(11) NOT NULL,
  `Eye Color` VARCHAR(45) NOT NULL,
  `Hair Color` VARCHAR(45) NOT NULL,
  `PCP_EID` INT(10) UNSIGNED NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `MailingAddress` VARCHAR(500) NULL DEFAULT NULL,
  `Deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0 or 1',
  `Passw` VARCHAR(45) NOT NULL DEFAULT 'Password!',
  `PreIntake` TINYINT(4) NOT NULL COMMENT '0 - False\\n1 - True',
  PRIMARY KEY (`PID`),
  INDEX `fk_PATIENT_DOCTOR_idx` (`PCP_EID` ASC)  ,
  CONSTRAINT `fk_PATIENT_DOCTOR`
    FOREIGN KEY (`PCP_EID`)
    REFERENCES `healthx`.`doctor` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `healthx`.`allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`allergy` ;

CREATE TABLE IF NOT EXISTS `healthx`.`allergy` (
  `Date Diagnosed` INT(11) NOT NULL,
  `Doctor (medical licence number)` INT(11) NOT NULL,
  `Allergen` VARCHAR(45) NOT NULL,
  `Clinic CID` INT(11) NULL DEFAULT NULL,
  `PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`PATIENT_PID`),
  CONSTRAINT `fk_ALLERGY_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'A table which talks about the various allergies patients have';


-- -----------------------------------------------------
-- Table `healthx`.`clinic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`clinic` ;

CREATE TABLE IF NOT EXISTS `healthx`.`clinic` (
  `clinic_name` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_id` INT(11) NOT NULL,
  `clinic_location` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_phone` CHAR(10) NULL DEFAULT NULL,
  `clinic_email` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_fax` CHAR(10) NULL DEFAULT NULL,
  `clinic_type` CHAR(100) NULL DEFAULT NULL,
  `mgr_ssn` INT(11) NULL DEFAULT NULL,
  `mgr_start` DATE NULL DEFAULT NULL,
  `Deleted` TINYINT(4) NULL DEFAULT '0' COMMENT '0 or 1',
  PRIMARY KEY (`clinic_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`appointment` ;

CREATE TABLE IF NOT EXISTS `healthx`.`appointment` (
  `AID` INT(11) NOT NULL,
  `PrimaryPhys` TINYINT(4) NOT NULL COMMENT 'Bool',
  `Datetime` DATETIME NULL DEFAULT NULL,
  `Doctors_Comments` VARCHAR(1000) NULL DEFAULT NULL,
  `PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  `DOCTOR_EID` INT(10) UNSIGNED NOT NULL,
  `CLINIC_clinic_id` INT(11) NOT NULL,
  `Canceled` TINYINT(4) NULL DEFAULT '0' COMMENT '0 or 1',
  PRIMARY KEY (`AID`, `PATIENT_PID`, `DOCTOR_EID`, `CLINIC_clinic_id`),
  UNIQUE INDEX `AID_UNIQUE` (`AID` ASC)  ,
  INDEX `fk_APPOINTMENT_CLINIC1_idx` (`CLINIC_clinic_id` ASC)  ,
  INDEX `fk_APPOINTMENT_DOCTOR1_idx` (`DOCTOR_EID` ASC)  ,
  INDEX `fk_APPOINTMENT_PATIENT1_idx` (`PATIENT_PID` ASC)  ,
  CONSTRAINT `fk_APPOINTMENT_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`clinic` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT_DOCTOR1`
    FOREIGN KEY (`DOCTOR_EID`)
    REFERENCES `healthx`.`doctor` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`employee` ;

CREATE TABLE IF NOT EXISTS `healthx`.`employee` (
  `EID` INT(11) NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `MInitial` VARCHAR(1) NULL DEFAULT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` INT(11) NULL DEFAULT NULL COMMENT '0 - Male\\\\\\\\\\\\\\\\n1 - Female\\\\\\\\\\\\\\\\n2 - NonBinary/GenderNeutral',
  `SSN` INT(11) NULL DEFAULT NULL,
  `Contact` VARCHAR(45) NULL DEFAULT NULL,
  `Role` INT(11) NOT NULL COMMENT '0 - Admin\\n1 - Lab Tech\\n2 - Nurse / Medical Prof.\\n3 - Front Desk\\n4 - Maintenance\\n5 - Miscelaneous\\n\\n6 - Contractor',
  `Salary` INT(11) NULL DEFAULT NULL,
  `Deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0 or 1',
  `Passw` VARCHAR(45) NOT NULL DEFAULT 'Password!',
  PRIMARY KEY (`EID`),
  UNIQUE INDEX `EID_UNIQUE` (`EID` ASC)  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`lab_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`lab_action` ;

CREATE TABLE IF NOT EXISTS `healthx`.`lab_action` (
  `RID` INT(11) NOT NULL,
  `Lab_Tech_EID` INT(11) NOT NULL,
  `APPOINTMENT_AID` INT(11) NOT NULL,
  `Type` INT(1) NOT NULL COMMENT '0 - Blood Count Test Result\\\\n1 - Pathological Test\\\\n2 - Lab Scan\\\\n3 - Antibody Test',
  PRIMARY KEY (`RID`),
  INDEX `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC)  ,
  INDEX `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1_idx` (`Lab_Tech_EID` ASC)  ,
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID`)
    REFERENCES `healthx`.`appointment` (`AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1`
    FOREIGN KEY (`Lab_Tech_EID`)
    REFERENCES `healthx`.`employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`antibody_test_result`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`antibody_test_result` ;

CREATE TABLE IF NOT EXISTS `healthx`.`antibody_test_result` (
  `RID` INT(11) NOT NULL,
  `Disease` VARCHAR(100) NOT NULL,
  `Antibody-count` INT(11) NOT NULL,
  `Result` VARCHAR(10) NOT NULL COMMENT 'Positive or Negative ',
  PRIMARY KEY (`RID`),
  UNIQUE INDEX `Disease_UNIQUE` (`Disease` ASC)  ,
  UNIQUE INDEX `Antibody-count_UNIQUE` (`Antibody-count` ASC)  ,
  CONSTRAINT `fk_ANTIBODY_TEST_RESULT_LAB_ACTION1`
    FOREIGN KEY (`RID`)
    REFERENCES `healthx`.`lab_action` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`blood_cnt_tst_rslt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`blood_cnt_tst_rslt` ;

CREATE TABLE IF NOT EXISTS `healthx`.`blood_cnt_tst_rslt` (
  `RID` INT(11) NOT NULL,
  `Red cell blood count` INT(11) NOT NULL,
  `White cell blood count` INT(11) NOT NULL,
  `Platelet count` INT(11) NOT NULL,
  `Mean corpuscular volume` INT(11) NOT NULL,
  `Hemoglobin Test` INT(11) NOT NULL,
  `Hematocrit test` INT(11) NOT NULL,
  `Enzyme marker` INT(11) NOT NULL,
  `Lipoprotein panel` TINYINT(4) NOT NULL,
  `Pregnancy test` TINYINT(4) NOT NULL,
  `Ammonia test` TINYINT(4) NOT NULL,
  `CO2 test` TINYINT(4) NOT NULL,
  `Coagulation tests` TINYINT(4) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE INDEX `ID (RID)_UNIQUE` (`RID` ASC)  ,
  INDEX `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION_idx` (`RID` ASC)  ,
  CONSTRAINT `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION`
    FOREIGN KEY (`RID`)
    REFERENCES `healthx`.`lab_action` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Results of a blood examination';


-- -----------------------------------------------------
-- Table `healthx`.`doctor_worksin_clinic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`doctor_worksin_clinic` ;

CREATE TABLE IF NOT EXISTS `healthx`.`doctor_worksin_clinic` (
  `EID` INT(10) UNSIGNED NOT NULL,
  `CLINIC_clinic_id` INT(11) NOT NULL,
  `Day` TINYINT(4) NOT NULL COMMENT '0-Sunday\\\\n...\\\\n6-Saturday',
  `Work_Hours_Start` TIME NOT NULL,
  `Work_Hours_End` TIME NOT NULL,
  `On_Call_Start` TIME NULL DEFAULT NULL,
  `On_Call_End` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`EID`, `CLINIC_clinic_id`),
  INDEX `fk_DOCTOR_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id` ASC)  ,
  INDEX `fk_DOCTOR_has_CLINIC_DOCTOR1_idx` (`EID` ASC)  ,
  CONSTRAINT `fk_DOCTOR_has_CLINIC_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`clinic` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOCTOR_has_CLINIC_DOCTOR1`
    FOREIGN KEY (`EID`)
    REFERENCES `healthx`.`doctor` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`emergency_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`emergency_contact` ;

CREATE TABLE IF NOT EXISTS `healthx`.`emergency_contact` (
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNum` VARCHAR(16) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(500) NULL DEFAULT NULL,
  `PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Name`, `PATIENT_PID`),
  INDEX `fk_EMERGENCY_CONTACT_PATIENT1_idx` (`PATIENT_PID` ASC)  ,
  CONSTRAINT `fk_EMERGENCY_CONTACT_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`employee_worksin_clinic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`employee_worksin_clinic` ;

CREATE TABLE IF NOT EXISTS `healthx`.`employee_worksin_clinic` (
  `EID` INT(11) NOT NULL,
  `CLINIC_clinic_id` INT(11) NOT NULL,
  `Day` TINYINT(4) NOT NULL COMMENT '0-Sunday\\\\n...\\\\n6-Saturday',
  `Work_Hours_Start` TIME NOT NULL,
  `Work_Hours_End` TIME NOT NULL,
  `On_Call_Start` TIME NULL DEFAULT NULL,
  `On_Call_End` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`EID`, `CLINIC_clinic_id`),
  INDEX `fk_EMPLOYEE_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id` ASC)  ,
  INDEX `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1_idx` (`EID` ASC)  ,
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`clinic` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1`
    FOREIGN KEY (`EID`)
    REFERENCES `healthx`.`employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`lab_scan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`lab_scan` ;

CREATE TABLE IF NOT EXISTS `healthx`.`lab_scan` (
  `RID` INT(11) NOT NULL,
  `Type` INT(11) NULL DEFAULT NULL COMMENT '0 - X-Ray\\\\\\\\n1 - CT\\\\\\\\n2 - MRI',
  `File` BLOB NULL DEFAULT NULL,
  `LAB_ACTION_Lab_Tech_EID` INT(11) NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` INT(11) NOT NULL,
  PRIMARY KEY (`RID`),
  CONSTRAINT `fk_LAB_SCAN_LAB_ACTION`
    FOREIGN KEY (`RID`)
    REFERENCES `healthx`.`lab_action` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`medical_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`medical_history` ;

CREATE TABLE IF NOT EXISTS `healthx`.`medical_history` (
  `MedHisID` INT(11) NOT NULL,
  `Date` INT(11) NOT NULL,
  `Condition` VARCHAR(45) NOT NULL,
  `Treatment` VARCHAR(45) NOT NULL,
  `Doctor_Name` VARCHAR(45) NULL DEFAULT NULL,
  `PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  `Doctor_Med_License_Num` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`MedHisID`, `PATIENT_PID`),
  INDEX `fk_MEDICAL_HISTORY_DOCTOR1_idx` (`Doctor_Med_License_Num` ASC)  ,
  INDEX `fk_MEDICAL_HISTORY_PATIENT1_idx` (`PATIENT_PID` ASC)  ,
  CONSTRAINT `fk_MEDICAL_HISTORY_DOCTOR1`
    FOREIGN KEY (`Doctor_Med_License_Num`)
    REFERENCES `healthx`.`doctor` (`MedicalLicenseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICAL_HISTORY_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'History of a patient';


-- -----------------------------------------------------
-- Table `healthx`.`pathologcal_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`pathologcal_test` ;

CREATE TABLE IF NOT EXISTS `healthx`.`pathologcal_test` (
  `RID` INT(11) NOT NULL,
  `Name Of Test` VARCHAR(100) NOT NULL,
  `Result` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE INDEX `Result_UNIQUE` (`Result` ASC)  ,
  CONSTRAINT `fk_PATHOLOGCAL_TEST_LAB_ACTION1`
    FOREIGN KEY (`RID`)
    REFERENCES `healthx`.`lab_action` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`payment` ;

CREATE TABLE IF NOT EXISTS `healthx`.`payment` (
  `PayID` INT(11) NOT NULL,
  `Total Amount` DECIMAL(10,2) NOT NULL,
  `Doctors Fee` DECIMAL(10,2) NOT NULL,
  `Lab Fee` DECIMAL(10,2) NOT NULL,
  `Insurance` VARCHAR(255) NOT NULL,
  `Deductible` DECIMAL(10,2) NOT NULL,
  `Balance` DECIMAL(10,2) NOT NULL,
  `APPOINTMENT_AID` INT(11) NOT NULL,
  `APPOINTMENT_PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  `Deleted` TINYINT(4) NOT NULL COMMENT '0 - No\\n1 - Yes',
  PRIMARY KEY (`PayID`, `APPOINTMENT_AID`, `APPOINTMENT_PATIENT_PID`),
  INDEX `fk_PAYMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC, `APPOINTMENT_PATIENT_PID` ASC)  ,
  CONSTRAINT `fk_PAYMENT_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID` , `APPOINTMENT_PATIENT_PID`)
    REFERENCES `healthx`.`appointment` (`AID` , `PATIENT_PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `healthx`.`prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`prescription` ;

CREATE TABLE IF NOT EXISTS `healthx`.`prescription` (
  `presc_name` VARCHAR(100) NULL DEFAULT NULL,
  `presc_id` INT(11) NOT NULL,
  `patient_id` INT(11) NULL DEFAULT NULL,
  `presc_date` DATE NULL DEFAULT NULL,
  `dosage` DECIMAL(7,2) NULL DEFAULT NULL,
  `daily_intake` TINYINT(4) NULL DEFAULT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `refills` INT(11) NULL DEFAULT NULL,
  `prescribed_by_doc` INT(11) NULL DEFAULT NULL,
  `prescribed_at_clinic` INT(11) NULL DEFAULT NULL,
  `APPOINTMENT_AID` INT(11) NOT NULL,
  `APPOINTMENT_PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  `APPOINTMENT_DOCTOR_EID` INT(10) UNSIGNED NOT NULL,
  `APPOINTMENT_CLINIC_clinic_id` INT(11) NOT NULL,
  PRIMARY KEY (`presc_id`),
  INDEX `fk_PRESCRIPTION_APPOINTMENT1_idx1` (`APPOINTMENT_AID` ASC, `APPOINTMENT_DOCTOR_EID` ASC, `APPOINTMENT_CLINIC_clinic_id` ASC)  ,
  INDEX `fk_PRESCRIPTION_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC, `APPOINTMENT_PATIENT_PID` ASC, `APPOINTMENT_DOCTOR_EID` ASC, `APPOINTMENT_CLINIC_clinic_id` ASC)  ,
  CONSTRAINT `fk_PRESCRIPTION_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID` , `APPOINTMENT_PATIENT_PID` , `APPOINTMENT_DOCTOR_EID` , `APPOINTMENT_CLINIC_clinic_id`)
    REFERENCES `healthx`.`appointment` (`AID` , `PATIENT_PID` , `DOCTOR_EID` , `CLINIC_clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`scan_hist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`scan_hist` ;

CREATE TABLE IF NOT EXISTS `healthx`.`scan_hist` (
  `RID` INT(11) NOT NULL,
  `Type` INT(11) NULL DEFAULT NULL COMMENT '0 - X-Ray\\\\\\\\n1 - CT\\\\\\\\n2 - MRI',
  `File` BLOB NULL DEFAULT NULL,
  `MEDICAL_HISTORY_MedHisID` INT(11) NOT NULL,
  `MEDICAL_HISTORY_PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`RID`, `MEDICAL_HISTORY_MedHisID`, `MEDICAL_HISTORY_PATIENT_PID`),
  UNIQUE INDEX `RID_UNIQUE` (`RID` ASC)  ,
  INDEX `fk_SCAN_MEDICAL_HISTORY1_idx` (`MEDICAL_HISTORY_MedHisID` ASC, `MEDICAL_HISTORY_PATIENT_PID` ASC)  ,
  CONSTRAINT `fk_SCAN_MEDICAL_HISTORY1`
    FOREIGN KEY (`MEDICAL_HISTORY_MedHisID` , `MEDICAL_HISTORY_PATIENT_PID`)
    REFERENCES `healthx`.`medical_history` (`MedHisID` , `PATIENT_PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthx`.`vaccination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`vaccination` ;

CREATE TABLE IF NOT EXISTS `healthx`.`vaccination` (
  `Vaccinator` VARCHAR(50) NOT NULL,
  `CID` INT(11) NULL DEFAULT NULL,
  `Date` INT(11) NOT NULL,
  `Disease` VARCHAR(100) NOT NULL,
  `Type` VARCHAR(100) NOT NULL,
  `Funding` INT(11) NOT NULL COMMENT '(0-Federal, 1-State, 2-Private)',
  `Route` INT(11) NOT NULL COMMENT '0-Oral, \\\\\\\\n1-Intranasal, \\\\\\\\n2-Subcutaneous, \\\\\\\\n3-Intramuscular',
  `Site` INT(11) NULL DEFAULT NULL COMMENT '(0-Right Arm, \\\\\\\\n1-Left Arm, \\\\\\\\n2-Right Thigh, \\\\\\\\n3-Left Thigh)',
  `Name of vaccination` VARCHAR(100) NULL DEFAULT NULL,
  `Date of Vaccinaton` INT(11) NOT NULL,
  `Vaccine-Lot-Num` INT(11) NOT NULL,
  `Vaccine-Manufac` VARCHAR(45) NULL DEFAULT NULL,
  `Vac-Info-State-Date` DATE NULL DEFAULT NULL,
  `Vac-Info-State-Date-Given` DATE NULL DEFAULT NULL,
  `PATIENT_PID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`PATIENT_PID`),
  UNIQUE INDEX `new_tablecol_UNIQUE` (`Name of vaccination` ASC)  ,
  CONSTRAINT `fk_VACCINATION_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `healthx` ;

-- -----------------------------------------------------
-- Placeholder table for view `healthx`.`doclogindetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`doclogindetails` (`EID` INT, `Passw` INT);

-- -----------------------------------------------------
-- Placeholder table for view `healthx`.`emplogindetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`emplogindetails` (`EID` INT, `Passw` INT);

-- -----------------------------------------------------
-- Placeholder table for view `healthx`.`employeeschedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`employeeschedule` (`EID` INT, `CLINIC_clinic_id` INT, `Day` INT, `Work_Hours_Start` INT, `Work_Hours_End` INT, `On_Call_Start` INT, `On_Call_End` INT);

-- -----------------------------------------------------
-- Placeholder table for view `healthx`.`patlogindetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`patlogindetails` (`PID` INT, `Passw` INT);

-- -----------------------------------------------------
-- View `healthx`.`doclogindetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`doclogindetails`;
DROP VIEW IF EXISTS `healthx`.`doclogindetails` ;
USE `healthx`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`tvoumnlmnu`@`%` SQL SECURITY DEFINER VIEW `healthx`.`doclogindetails` AS select `healthx`.`doctor`.`EID` AS `EID`,`healthx`.`doctor`.`Passw` AS `Passw` from `healthx`.`doctor`;

-- -----------------------------------------------------
-- View `healthx`.`emplogindetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`emplogindetails`;
DROP VIEW IF EXISTS `healthx`.`emplogindetails` ;
USE `healthx`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`tvoumnlmnu`@`%` SQL SECURITY DEFINER VIEW `healthx`.`emplogindetails` AS select `healthx`.`employee`.`EID` AS `EID`,`healthx`.`employee`.`Passw` AS `Passw` from `healthx`.`employee`;

-- -----------------------------------------------------
-- View `healthx`.`employeeschedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`employeeschedule`;
DROP VIEW IF EXISTS `healthx`.`employeeschedule` ;
USE `healthx`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`tvoumnlmnu`@`%` SQL SECURITY DEFINER VIEW `healthx`.`employeeschedule` AS select `healthx`.`employee_worksin_clinic`.`EID` AS `EID`,`healthx`.`employee_worksin_clinic`.`CLINIC_clinic_id` AS `CLINIC_clinic_id`,`healthx`.`employee_worksin_clinic`.`Day` AS `Day`,`healthx`.`employee_worksin_clinic`.`Work_Hours_Start` AS `Work_Hours_Start`,`healthx`.`employee_worksin_clinic`.`Work_Hours_End` AS `Work_Hours_End`,`healthx`.`employee_worksin_clinic`.`On_Call_Start` AS `On_Call_Start`,`healthx`.`employee_worksin_clinic`.`On_Call_End` AS `On_Call_End` from `healthx`.`employee_worksin_clinic` group by `healthx`.`employee_worksin_clinic`.`EID`;

-- -----------------------------------------------------
-- View `healthx`.`patlogindetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthx`.`patlogindetails`;
DROP VIEW IF EXISTS `healthx`.`patlogindetails` ;
USE `healthx`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`tvoumnlmnu`@`%` SQL SECURITY DEFINER VIEW `healthx`.`patlogindetails` AS select `healthx`.`patient`.`PID` AS `PID`,`healthx`.`patient`.`Passw` AS `Passw` from `healthx`.`patient`;
USE `healthx`;

DELIMITER $$

USE `healthx`$$
DROP TRIGGER IF EXISTS `healthx`.`APPOINTMENT_BEFORE_INSERT` $$
USE `healthx`$$
CREATE
DEFINER=`tvoumnlmnu`@`%`
TRIGGER `healthx`.`APPOINTMENT_BEFORE_INSERT`
BEFORE INSERT ON `healthx`.`appointment`
FOR EACH ROW
BEGIN

END$$


USE `healthx`$$
DROP TRIGGER IF EXISTS `healthx`.`EMPLOYEE_WorksIn_CLINIC_BEFORE_DELETE` $$
USE `healthx`$$
CREATE
DEFINER=`tvoumnlmnu`@`%`
TRIGGER `healthx`.`EMPLOYEE_WorksIn_CLINIC_BEFORE_DELETE`
BEFORE DELETE ON `healthx`.`employee_worksin_clinic`
FOR EACH ROW
BEGIN

END$$


USE `healthx`$$
DROP TRIGGER IF EXISTS `healthx`.`EMPLOYEE_WorksIn_CLINIC_BEFORE_UPDATE` $$
USE `healthx`$$
CREATE
DEFINER=`tvoumnlmnu`@`%`
TRIGGER `healthx`.`EMPLOYEE_WorksIn_CLINIC_BEFORE_UPDATE`
BEFORE UPDATE ON `healthx`.`employee_worksin_clinic`
FOR EACH ROW
BEGIN

END$$


USE `healthx`$$
DROP TRIGGER IF EXISTS `healthx`.`PAYMENT_BEFORE_DELETE` $$
USE `healthx`$$
CREATE
DEFINER=`tvoumnlmnu`@`%`
TRIGGER `healthx`.`PAYMENT_BEFORE_DELETE`
BEFORE DELETE ON `healthx`.`payment`
FOR EACH ROW
BEGIN

END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
