-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema healthx
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema healthx
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `healthx` DEFAULT CHARACTER SET utf8 ;
USE `healthx` ;

-- -----------------------------------------------------
-- Table `healthx`.`DOCTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`DOCTOR` (
  `EID` INT UNSIGNED NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `MInitial` VARCHAR(1) NULL DEFAULT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` INT NULL DEFAULT NULL COMMENT '0 - Male\\\\n1 - Female\\\\n2 - NonBinary/GenderNeutral',
  `SSN` INT UNSIGNED NULL DEFAULT NULL,
  `Contact` VARCHAR(45) NULL DEFAULT NULL,
  `Type` INT NULL DEFAULT NULL COMMENT '0 - General\\\\n1 - Dermatology\\\\n2 - Dental\\\\n3 - etc.',
  `Salary` INT NULL DEFAULT NULL,
  `MedicalLicenseNumber` INT UNSIGNED NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '0 or 1',
  PRIMARY KEY (`EID`),
  UNIQUE INDEX `EID_UNIQUE` (`EID` ASC) VISIBLE,
  UNIQUE INDEX `MedicalLicenseNumber_UNIQUE` (`MedicalLicenseNumber` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`EMPLOYEE` (
  `EID` INT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `MInitial` VARCHAR(1) NULL DEFAULT NULL,
  `LName` VARCHAR(45) NOT NULL,
  'Email' VARCHAR(100) NULL DEFAULT NULL,
  `DOB` DATE NOT NULL,
  `Gender` INT NULL DEFAULT NULL COMMENT '0 - Male\\\\n1 - Female\\\\n2 - NonBinary/GenderNeutral',
  `SSN` INT NULL DEFAULT NULL,
  `Contact` VARCHAR(45) NULL DEFAULT NULL,
  `Role` INT NULL DEFAULT NULL,
  `Salary` INT NULL DEFAULT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '0 or 1',
  PRIMARY KEY (`EID`),
  UNIQUE INDEX `EID_UNIQUE` (`EID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`PATIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`PATIENT` (
  `PID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `PhoneNum` VARCHAR(16) NOT NULL,
  `SSN` VARCHAR(11) NOT NULL,
  `Insurance` VARCHAR(255) NOT NULL,
  `Height` INT NOT NULL,
  `Weight` INT NOT NULL,
  `Eye Color` VARCHAR(45) NOT NULL,
  `Hair Color` VARCHAR(45) NOT NULL,
  `PCP_EID` INT UNSIGNED NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `MailingAddress` VARCHAR(500) NULL,
  `Deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '0 or 1',
  PRIMARY KEY (`PID`),
  INDEX `fk_PATIENT_DOCTOR_idx` (`PCP_EID` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_DOCTOR`
    FOREIGN KEY (`PCP_EID`)
    REFERENCES `healthx`.`DOCTOR` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `healthx`.`CLINIC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`CLINIC` (
  `clinic_name` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_id` INT NOT NULL,
  `clinic_location` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_phone` CHAR(10) NULL DEFAULT NULL,
  `clinic_email` VARCHAR(255) NULL DEFAULT NULL,
  `clinic_fax` CHAR(10) NULL DEFAULT NULL,
  `clinic_type` CHAR(100) NULL DEFAULT NULL,
  `mgr_ssn` INT NULL DEFAULT NULL,
  `mgr_start` DATE NULL DEFAULT NULL,
  `Deleted` TINYINT NULL DEFAULT 0 COMMENT '0 or 1',
  PRIMARY KEY (`clinic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`APPOINTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`APPOINTMENT` (
  `AID` INT NOT NULL,
  `PrimaryPhys` TINYINT NOT NULL COMMENT 'Bool',
  `Datetime` DATETIME NULL DEFAULT NULL,
  `Doctors_Comments` VARCHAR(1000) NULL DEFAULT NULL,
  `PATIENT_PID` INT NOT NULL,
  `DOCTOR_EID` INT UNSIGNED NOT NULL,
  `CLINIC_clinic_id` INT NOT NULL,
  `Canceled` TINYINT NULL DEFAULT 0 COMMENT '0 or 1',
  PRIMARY KEY (`AID`, `PATIENT_PID`, `DOCTOR_EID`, `CLINIC_clinic_id`),
  UNIQUE INDEX `AID_UNIQUE` (`AID` ASC) VISIBLE,
  INDEX `fk_APPOINTMENT_PATIENT1_idx` (`PATIENT_PID` ASC) VISIBLE,
  INDEX `fk_APPOINTMENT_DOCTOR1_idx` (`DOCTOR_EID` ASC) VISIBLE,
  INDEX `fk_APPOINTMENT_CLINIC1_idx` (`CLINIC_clinic_id` ASC) VISIBLE,
  CONSTRAINT `fk_APPOINTMENT_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`PATIENT` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT_DOCTOR1`
    FOREIGN KEY (`DOCTOR_EID`)
    REFERENCES `healthx`.`DOCTOR` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`CLINIC` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`LAB_ACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`LAB_ACTION` (
  `Lab_Tech_EID` INT NOT NULL,
  `APPOINTMENT_AID` INT NOT NULL,
  PRIMARY KEY (`Lab_Tech_EID`, `APPOINTMENT_AID`),
  INDEX `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1_idx` (`Lab_Tech_EID` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1`
    FOREIGN KEY (`Lab_Tech_EID`)
    REFERENCES `healthx`.`EMPLOYEE` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID`)
    REFERENCES `healthx`.`APPOINTMENT` (`AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`PATHOLOGCAL_TEST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`PATHOLOGCAL_TEST` (
  `ID(RID)` VARCHAR(45) NOT NULL,
  `Name Of Test` VARCHAR(100) NOT NULL,
  `Result` VARCHAR(50) NOT NULL,
  `LAB_ACTION_Lab_Tech_EID` INT NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` INT NOT NULL,
  PRIMARY KEY (`ID(RID)`, `LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE INDEX `Result_UNIQUE` (`Result` ASC) VISIBLE,
  INDEX `fk_PATHOLOGCAL_TEST_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID` ASC, `LAB_ACTION_APPOINTMENT_AID` ASC) VISIBLE,
  CONSTRAINT `fk_PATHOLOGCAL_TEST_LAB_ACTION1`
    FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID` , `LAB_ACTION_APPOINTMENT_AID`)
    REFERENCES `healthx`.`LAB_ACTION` (`Lab_Tech_EID` , `APPOINTMENT_AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`VACCINATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`VACCINATION` (
  `Vaccinator` VARCHAR(50) NOT NULL,
  `CID` INT NULL DEFAULT NULL,
  `Date` INT NOT NULL,
  `Disease` VARCHAR(100) NOT NULL,
  `Type` VARCHAR(100) NOT NULL,
  `Funding` INT NOT NULL COMMENT '(0-Federal, 1-State, 2-Private)',
  `Route` INT NOT NULL COMMENT '0-Oral, \\n1-Intranasal, \\n2-Subcutaneous, \\n3-Intramuscular',
  `Site` INT NULL DEFAULT NULL COMMENT '(0-Right Arm, \\n1-Left Arm, \\n2-Right Thigh, \\n3-Left Thigh)',
  `Name of vaccination` VARCHAR(100) NULL DEFAULT NULL,
  `Date of Vaccinaton` INT NOT NULL,
  `Vaccine-Lot-Num` INT NOT NULL,
  `Vaccine-Manufac` VARCHAR(45) NULL DEFAULT NULL,
  `Vac-Info-State-Date` DATE NULL DEFAULT NULL,
  `Vac-Info-State-Date-Given` DATE NULL DEFAULT NULL,
  `PATIENT_PID` INT NOT NULL,
  UNIQUE INDEX `new_tablecol_UNIQUE` (`Name of vaccination` ASC) VISIBLE,
  PRIMARY KEY (`PATIENT_PID`),
  CONSTRAINT `fk_VACCINATION_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`PATIENT` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`ANTIBODY_TEST_RESULT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`ANTIBODY_TEST_RESULT` (
  `RID` INT NOT NULL,
  `Disease` VARCHAR(100) NOT NULL,
  `Antibody-count` INT NOT NULL,
  `Result` VARCHAR(10) NOT NULL COMMENT 'Positive or Negative ',
  `LAB_ACTION_Lab_Tech_EID` INT NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` INT NOT NULL,
  PRIMARY KEY (`RID`, `LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE INDEX `Disease_UNIQUE` (`Disease` ASC) VISIBLE,
  UNIQUE INDEX `Antibody-count_UNIQUE` (`Antibody-count` ASC) VISIBLE,
  INDEX `fk_ANTIBODY_TEST_RESULT_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID` ASC, `LAB_ACTION_APPOINTMENT_AID` ASC) VISIBLE,
  CONSTRAINT `fk_ANTIBODY_TEST_RESULT_LAB_ACTION1`
    FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID` , `LAB_ACTION_APPOINTMENT_AID`)
    REFERENCES `healthx`.`LAB_ACTION` (`Lab_Tech_EID` , `APPOINTMENT_AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`PRESCRIPTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`PRESCRIPTION` (
  `presc_name` VARCHAR(100) NULL DEFAULT NULL,
  `presc_id` INT NOT NULL,
  `patient_id` INT NULL DEFAULT NULL,
  `presc_date` DATE NULL DEFAULT NULL,
  `dosage` DECIMAL(7,2) NULL DEFAULT NULL,
  `daily_intake` TINYINT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `refills` INT NULL DEFAULT NULL,
  `prescribed_by_doc` INT NULL DEFAULT NULL,
  `prescribed_at_clinic` INT NULL DEFAULT NULL,
  `APPOINTMENT_AID` INT NOT NULL,
  `APPOINTMENT_PATIENT_PID` INT NOT NULL,
  `APPOINTMENT_DOCTOR_EID` INT UNSIGNED NOT NULL,
  `APPOINTMENT_CLINIC_clinic_id` INT NOT NULL,
  PRIMARY KEY (`presc_id`, `APPOINTMENT_AID`, `APPOINTMENT_PATIENT_PID`, `APPOINTMENT_DOCTOR_EID`, `APPOINTMENT_CLINIC_clinic_id`),
  INDEX `fk_PRESCRIPTION_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC, `APPOINTMENT_PATIENT_PID` ASC, `APPOINTMENT_DOCTOR_EID` ASC, `APPOINTMENT_CLINIC_clinic_id` ASC) VISIBLE,
  CONSTRAINT `fk_PRESCRIPTION_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID` , `APPOINTMENT_PATIENT_PID` , `APPOINTMENT_DOCTOR_EID`)
    REFERENCES `healthx`.`APPOINTMENT` (`AID` , `PATIENT_PID` , `DOCTOR_EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`MEDICAL_HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`MEDICAL_HISTORY` (
  `MedHisID` INT NOT NULL,
  `Date` INT NOT NULL,
  `Condition` VARCHAR(45) NOT NULL,
  `Treatment` VARCHAR(45) NOT NULL,
  `Doctor_Name` VARCHAR(45) NULL DEFAULT NULL,
  `PATIENT_PID` INT NOT NULL,
  `Doctor_Med_License_Num` VARCHAR(45) NULL,
  PRIMARY KEY (`MedHisID`, `PATIENT_PID`),
  INDEX `fk_MEDICAL_HISTORY_PATIENT1_idx` (`PATIENT_PID` ASC) VISIBLE,
  CONSTRAINT `fk_MEDICAL_HISTORY_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`PATIENT` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'History of a patient';


-- -----------------------------------------------------
-- Table `healthx`.`SCAN_HIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`SCAN_HIST` (
  `RID` INT NOT NULL,
  `Type` INT NULL DEFAULT NULL COMMENT '0 - X-Ray\\n1 - CT\\n2 - MRI',
  `File` BLOB NULL DEFAULT NULL,
  `MEDICAL_HISTORY_MedHisID` INT NOT NULL,
  `MEDICAL_HISTORY_PATIENT_PID` INT NOT NULL,
  PRIMARY KEY (`RID`, `MEDICAL_HISTORY_MedHisID`, `MEDICAL_HISTORY_PATIENT_PID`),
  UNIQUE INDEX `RID_UNIQUE` (`RID` ASC) VISIBLE,
  INDEX `fk_SCAN_MEDICAL_HISTORY1_idx` (`MEDICAL_HISTORY_MedHisID` ASC, `MEDICAL_HISTORY_PATIENT_PID` ASC) VISIBLE,
  CONSTRAINT `fk_SCAN_MEDICAL_HISTORY1`
    FOREIGN KEY (`MEDICAL_HISTORY_MedHisID` , `MEDICAL_HISTORY_PATIENT_PID`)
    REFERENCES `healthx`.`MEDICAL_HISTORY` (`MedHisID` , `PATIENT_PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`ALLERGY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`ALLERGY` (
  `Date Diagnosed` INT NOT NULL,
  `Doctor (medical licence number)` INT NOT NULL,
  `Allergen` VARCHAR(45) NOT NULL,
  `Clinic CID` INT NULL DEFAULT NULL,
  `PATIENT_PID` INT NOT NULL,
  PRIMARY KEY (`PATIENT_PID`),
  CONSTRAINT `fk_ALLERGY_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`PATIENT` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'A table which talks about the various allergies patients have';


-- -----------------------------------------------------
-- Table `healthx`.`BLOOD_CNT_TST_RSLT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`BLOOD_CNT_TST_RSLT` (
  `ID (RID)` INT NOT NULL,
  `Red cell blood count` INT NOT NULL,
  `White cell blood count` INT NOT NULL,
  `Platelet count` INT NOT NULL,
  `Mean corpuscular volume` INT NOT NULL,
  `Hemoglobin Test` INT NOT NULL,
  `Hematocrit test` INT NOT NULL,
  `Enzyme marker` INT NOT NULL,
  `Lipoprotein panel` TINYINT NOT NULL,
  `Pregnancy test` TINYINT NOT NULL,
  `Ammonia test` TINYINT NOT NULL,
  `CO2 test` TINYINT NOT NULL,
  `Coagulation tests` TINYINT NOT NULL,
  `LAB_ACTION_Lab_Tech_EID` INT NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` INT NOT NULL,
  PRIMARY KEY (`ID (RID)`, `LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE INDEX `ID (RID)_UNIQUE` (`ID (RID)` ASC) VISIBLE,
  INDEX `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID` ASC, `LAB_ACTION_APPOINTMENT_AID` ASC) VISIBLE,
  CONSTRAINT `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION1`
    FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID` , `LAB_ACTION_APPOINTMENT_AID`)
    REFERENCES `healthx`.`LAB_ACTION` (`Lab_Tech_EID` , `APPOINTMENT_AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Results of a blood examination';


-- -----------------------------------------------------
-- Table `healthx`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`PAYMENT` (
  `PayID` INT NOT NULL,
  `Total Amount` DECIMAL(10,2) NOT NULL,
  `Doctor's Fee` DECIMAL(10,2) NOT NULL,
  `Lab Fee` DECIMAL(10,2) NOT NULL,
  `Insurance` VARCHAR(255) NOT NULL,
  `Deductible` DECIMAL(10,2) NOT NULL,
  `Balance` DECIMAL(10,2) NOT NULL,
  `APPOINTMENT_AID` INT NOT NULL,
  `APPOINTMENT_PATIENT_PID` INT NOT NULL,
  PRIMARY KEY (`PayID`, `APPOINTMENT_AID`, `APPOINTMENT_PATIENT_PID`),
  INDEX `fk_PAYMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID` ASC, `APPOINTMENT_PATIENT_PID` ASC) VISIBLE,
  CONSTRAINT `fk_PAYMENT_APPOINTMENT1`
    FOREIGN KEY (`APPOINTMENT_AID` , `APPOINTMENT_PATIENT_PID`)
    REFERENCES `healthx`.`APPOINTMENT` (`AID` , `PATIENT_PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `healthx`.`EMPLOYEE_WorksIn_CLINIC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`EMPLOYEE_WorksIn_CLINIC` (
  `EMPLOYEE_EID` INT NOT NULL,
  `CLINIC_clinic_id` INT NOT NULL,
  `Day` TINYINT NOT NULL COMMENT '0-Sunday\n...\n6-Saturday',
  `Work_Hours_Start` TIME NOT NULL,
  `Work_Hours_End` TIME NOT NULL,
  `On_Call_Start` TIME NULL,
  `On_Call_End` TIME NULL,
  PRIMARY KEY (`EMPLOYEE_EID`, `CLINIC_clinic_id`),
  INDEX `fk_EMPLOYEE_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1_idx` (`EMPLOYEE_EID` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_EID`)
    REFERENCES `healthx`.`EMPLOYEE` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`CLINIC` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`EMERGENCY_CONTACT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`EMERGENCY_CONTACT` (
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNum` VARCHAR(16) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(500) NULL,
  `PATIENT_PID` INT NOT NULL,
  PRIMARY KEY (`Name`, `PATIENT_PID`),
  INDEX `fk_EMERGENCY_CONTACT_PATIENT1_idx` (`PATIENT_PID` ASC) VISIBLE,
  CONSTRAINT `fk_EMERGENCY_CONTACT_PATIENT1`
    FOREIGN KEY (`PATIENT_PID`)
    REFERENCES `healthx`.`PATIENT` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`LAB_SCAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`LAB_SCAN` (
  `Type` INT NULL DEFAULT NULL COMMENT '0 - X-Ray\\n1 - CT\\n2 - MRI',
  `File` BLOB NULL DEFAULT NULL,
  `LAB_ACTION_Lab_Tech_EID` INT NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` INT NOT NULL,
  INDEX `fk_LAB_SCAN_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID` ASC, `LAB_ACTION_APPOINTMENT_AID` ASC) VISIBLE,
  PRIMARY KEY (`LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`),
  CONSTRAINT `fk_LAB_SCAN_LAB_ACTION1`
    FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID` , `LAB_ACTION_APPOINTMENT_AID`)
    REFERENCES `healthx`.`LAB_ACTION` (`Lab_Tech_EID` , `APPOINTMENT_AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthx`.`DOCTOR_WorksIn_CLINIC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthx`.`DOCTOR_WorksIn_CLINIC` (
  `DOCTOR_EID` INT UNSIGNED NOT NULL,
  `CLINIC_clinic_id` INT NOT NULL,
  `Day` TINYINT NOT NULL COMMENT '0-Sunday\n...\n6-Saturday',
  `Work_Hours_Start` TIME NOT NULL,
  `Work_Hours_End` TIME NOT NULL,
  `On_Call_Start` TIME NULL,
  `On_Call_End` TIME NULL,
  PRIMARY KEY (`DOCTOR_EID`, `CLINIC_clinic_id`),
  INDEX `fk_DOCTOR_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id` ASC) VISIBLE,
  INDEX `fk_DOCTOR_has_CLINIC_DOCTOR1_idx` (`DOCTOR_EID` ASC) VISIBLE,
  CONSTRAINT `fk_DOCTOR_has_CLINIC_DOCTOR1`
    FOREIGN KEY (`DOCTOR_EID`)
    REFERENCES `healthx`.`DOCTOR` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOCTOR_has_CLINIC_CLINIC1`
    FOREIGN KEY (`CLINIC_clinic_id`)
    REFERENCES `healthx`.`CLINIC` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;