-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: healthx
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy` (
  `Date Diagnosed` int NOT NULL,
  `Doctor (medical licence number)` int NOT NULL,
  `Allergen` varchar(45) NOT NULL,
  `Clinic CID` int DEFAULT NULL,
  `PATIENT_PID` int NOT NULL,
  PRIMARY KEY (`PATIENT_PID`),
  CONSTRAINT `fk_ALLERGY_PATIENT1` FOREIGN KEY (`PATIENT_PID`) REFERENCES `patient` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A table which talks about the various allergies patients have';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antibody_test_result`
--

DROP TABLE IF EXISTS `antibody_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antibody_test_result` (
  `RID` int NOT NULL,
  `Disease` varchar(100) NOT NULL,
  `Antibody-count` int NOT NULL,
  `Result` varchar(10) NOT NULL COMMENT 'Positive or Negative ',
  `LAB_ACTION_Lab_Tech_EID` int NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` int NOT NULL,
  PRIMARY KEY (`RID`,`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE KEY `Disease_UNIQUE` (`Disease`),
  UNIQUE KEY `Antibody-count_UNIQUE` (`Antibody-count`),
  KEY `fk_ANTIBODY_TEST_RESULT_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  CONSTRAINT `fk_ANTIBODY_TEST_RESULT_LAB_ACTION1` FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`) REFERENCES `lab_action` (`Lab_Tech_EID`, `APPOINTMENT_AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antibody_test_result`
--

LOCK TABLES `antibody_test_result` WRITE;
/*!40000 ALTER TABLE `antibody_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `antibody_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AID` int NOT NULL,
  `PrimaryPhys` tinyint NOT NULL COMMENT 'Bool',
  `Datetime` datetime DEFAULT NULL,
  `Doctors_Comments` varchar(1000) DEFAULT NULL,
  `PATIENT_PID` int NOT NULL,
  `DOCTOR_EID` int unsigned NOT NULL,
  `CLINIC_clinic_id` int NOT NULL,
  PRIMARY KEY (`AID`,`PATIENT_PID`,`DOCTOR_EID`,`CLINIC_clinic_id`),
  UNIQUE KEY `AID_UNIQUE` (`AID`),
  KEY `fk_APPOINTMENT_PATIENT1_idx` (`PATIENT_PID`),
  KEY `fk_APPOINTMENT_DOCTOR1_idx` (`DOCTOR_EID`),
  KEY `fk_APPOINTMENT_CLINIC1_idx` (`CLINIC_clinic_id`),
  CONSTRAINT `fk_APPOINTMENT_CLINIC1` FOREIGN KEY (`CLINIC_clinic_id`) REFERENCES `clinic` (`clinic_id`),
  CONSTRAINT `fk_APPOINTMENT_DOCTOR1` FOREIGN KEY (`DOCTOR_EID`) REFERENCES `doctor` (`EID`),
  CONSTRAINT `fk_APPOINTMENT_PATIENT1` FOREIGN KEY (`PATIENT_PID`) REFERENCES `patient` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_cnt_tst_rslt`
--

DROP TABLE IF EXISTS `blood_cnt_tst_rslt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_cnt_tst_rslt` (
  `ID (RID)` int NOT NULL,
  `Red cell blood count` int NOT NULL,
  `White cell blood count` int NOT NULL,
  `Platelet count` int NOT NULL,
  `Mean corpuscular volume` int NOT NULL,
  `Hemoglobin Test` int NOT NULL,
  `Hematocrit test` int NOT NULL,
  `Enzyme marker` int NOT NULL,
  `Lipoprotein panel` tinyint NOT NULL,
  `Pregnancy test` tinyint NOT NULL,
  `Ammonia test` tinyint NOT NULL,
  `CO2 test` tinyint NOT NULL,
  `Coagulation tests` tinyint NOT NULL,
  `LAB_ACTION_Lab_Tech_EID` int NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` int NOT NULL,
  PRIMARY KEY (`ID (RID)`,`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE KEY `ID (RID)_UNIQUE` (`ID (RID)`),
  KEY `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  CONSTRAINT `fk_BLOOD_CNT_TST_RSLT_LAB_ACTION1` FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`) REFERENCES `lab_action` (`Lab_Tech_EID`, `APPOINTMENT_AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Results of a blood examination';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_cnt_tst_rslt`
--

LOCK TABLES `blood_cnt_tst_rslt` WRITE;
/*!40000 ALTER TABLE `blood_cnt_tst_rslt` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_cnt_tst_rslt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_id` int NOT NULL,
  `clinic_location` varchar(255) DEFAULT NULL,
  `clinic_phone` char(10) DEFAULT NULL,
  `clinic_email` varchar(255) DEFAULT NULL,
  `clinic_fax` char(10) DEFAULT NULL,
  `clinic_type` char(100) DEFAULT NULL,
  `mgr_ssn` int DEFAULT NULL,
  `mgr_start` date DEFAULT NULL,
  PRIMARY KEY (`clinic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `EID` int unsigned NOT NULL,
  `FName` varchar(45) NOT NULL,
  `MInitial` varchar(1) DEFAULT NULL,
  `LName` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` int DEFAULT NULL COMMENT '0 - Male\\\\n1 - Female\\\\n2 - NonBinary/GenderNeutral',
  `SSN` int unsigned DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Type` int DEFAULT NULL COMMENT '0 - General\\\\n1 - Dermatology\\\\n2 - Dental\\\\n3 - etc.',
  `Salary` int DEFAULT NULL,
  `MedicalLicenseNumber` int unsigned NOT NULL,
  PRIMARY KEY (`EID`),
  UNIQUE KEY `EID_UNIQUE` (`EID`),
  UNIQUE KEY `MedicalLicenseNumber_UNIQUE` (`MedicalLicenseNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_worksin_clinic`
--

DROP TABLE IF EXISTS `doctor_worksin_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_worksin_clinic` (
  `DOCTOR_EID` int unsigned NOT NULL,
  `CLINIC_clinic_id` int NOT NULL,
  `Day` tinyint NOT NULL COMMENT '0-Sunday\n...\n6-Saturday',
  `Work_Hours_Start` time NOT NULL,
  `Work_Hours_End` time NOT NULL,
  `On_Call_Start` time DEFAULT NULL,
  `On_Call_End` time DEFAULT NULL,
  PRIMARY KEY (`DOCTOR_EID`,`CLINIC_clinic_id`),
  KEY `fk_DOCTOR_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id`),
  KEY `fk_DOCTOR_has_CLINIC_DOCTOR1_idx` (`DOCTOR_EID`),
  CONSTRAINT `fk_DOCTOR_has_CLINIC_CLINIC1` FOREIGN KEY (`CLINIC_clinic_id`) REFERENCES `clinic` (`clinic_id`),
  CONSTRAINT `fk_DOCTOR_has_CLINIC_DOCTOR1` FOREIGN KEY (`DOCTOR_EID`) REFERENCES `doctor` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_worksin_clinic`
--

LOCK TABLES `doctor_worksin_clinic` WRITE;
/*!40000 ALTER TABLE `doctor_worksin_clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_worksin_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `Name` varchar(45) NOT NULL,
  `PhoneNum` varchar(16) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `PATIENT_PID` int NOT NULL,
  PRIMARY KEY (`Name`,`PATIENT_PID`),
  KEY `fk_EMERGENCY_CONTACT_PATIENT1_idx` (`PATIENT_PID`),
  CONSTRAINT `fk_EMERGENCY_CONTACT_PATIENT1` FOREIGN KEY (`PATIENT_PID`) REFERENCES `patient` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EID` int NOT NULL,
  `FName` varchar(45) NOT NULL,
  `MInitial` varchar(1) DEFAULT NULL,
  `LName` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` int DEFAULT NULL COMMENT '0 - Male\\\\n1 - Female\\\\n2 - NonBinary/GenderNeutral',
  `SSN` int DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Role` int DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  PRIMARY KEY (`EID`),
  UNIQUE KEY `EID_UNIQUE` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_worksin_clinic`
--

DROP TABLE IF EXISTS `employee_worksin_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_worksin_clinic` (
  `EMPLOYEE_EID` int NOT NULL,
  `CLINIC_clinic_id` int NOT NULL,
  `Day` tinyint NOT NULL COMMENT '0-Sunday\n...\n6-Saturday',
  `Work_Hours_Start` time NOT NULL,
  `Work_Hours_End` time NOT NULL,
  `On_Call_Start` time DEFAULT NULL,
  `On_Call_End` time DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_EID`,`CLINIC_clinic_id`),
  KEY `fk_EMPLOYEE_has_CLINIC_CLINIC1_idx` (`CLINIC_clinic_id`),
  KEY `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1_idx` (`EMPLOYEE_EID`),
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_CLINIC1` FOREIGN KEY (`CLINIC_clinic_id`) REFERENCES `clinic` (`clinic_id`),
  CONSTRAINT `fk_EMPLOYEE_has_CLINIC_EMPLOYEE1` FOREIGN KEY (`EMPLOYEE_EID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_worksin_clinic`
--

LOCK TABLES `employee_worksin_clinic` WRITE;
/*!40000 ALTER TABLE `employee_worksin_clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_worksin_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_action`
--

DROP TABLE IF EXISTS `lab_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_action` (
  `Lab_Tech_EID` int NOT NULL,
  `APPOINTMENT_AID` int NOT NULL,
  PRIMARY KEY (`Lab_Tech_EID`,`APPOINTMENT_AID`),
  KEY `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID`),
  KEY `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1_idx` (`Lab_Tech_EID`),
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_APPOINTMENT1` FOREIGN KEY (`APPOINTMENT_AID`) REFERENCES `appointment` (`AID`),
  CONSTRAINT `fk_EMPLOYEE_has_APPOINTMENT_EMPLOYEE1` FOREIGN KEY (`Lab_Tech_EID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_action`
--

LOCK TABLES `lab_action` WRITE;
/*!40000 ALTER TABLE `lab_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_scan`
--

DROP TABLE IF EXISTS `lab_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_scan` (
  `Type` int DEFAULT NULL COMMENT '0 - X-Ray\\n1 - CT\\n2 - MRI',
  `File` blob,
  `LAB_ACTION_Lab_Tech_EID` int NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` int NOT NULL,
  PRIMARY KEY (`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  KEY `fk_LAB_SCAN_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  CONSTRAINT `fk_LAB_SCAN_LAB_ACTION1` FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`) REFERENCES `lab_action` (`Lab_Tech_EID`, `APPOINTMENT_AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_scan`
--

LOCK TABLES `lab_scan` WRITE;
/*!40000 ALTER TABLE `lab_scan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `MedHisID` int NOT NULL,
  `Date` int NOT NULL,
  `Condition` varchar(45) NOT NULL,
  `Treatment` varchar(45) NOT NULL,
  `Doctor_Name` varchar(45) DEFAULT NULL,
  `PATIENT_PID` int NOT NULL,
  `Doctor_Med_License_Num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MedHisID`,`PATIENT_PID`),
  KEY `fk_MEDICAL_HISTORY_PATIENT1_idx` (`PATIENT_PID`),
  CONSTRAINT `fk_MEDICAL_HISTORY_PATIENT1` FOREIGN KEY (`PATIENT_PID`) REFERENCES `patient` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='History of a patient';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathologcal_test`
--

DROP TABLE IF EXISTS `pathologcal_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pathologcal_test` (
  `ID(RID)` varchar(45) NOT NULL,
  `Name Of Test` varchar(100) NOT NULL,
  `Result` varchar(50) NOT NULL,
  `LAB_ACTION_Lab_Tech_EID` int NOT NULL,
  `LAB_ACTION_APPOINTMENT_AID` int NOT NULL,
  PRIMARY KEY (`ID(RID)`,`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  UNIQUE KEY `Result_UNIQUE` (`Result`),
  KEY `fk_PATHOLOGCAL_TEST_LAB_ACTION1_idx` (`LAB_ACTION_Lab_Tech_EID`,`LAB_ACTION_APPOINTMENT_AID`),
  CONSTRAINT `fk_PATHOLOGCAL_TEST_LAB_ACTION1` FOREIGN KEY (`LAB_ACTION_Lab_Tech_EID`, `LAB_ACTION_APPOINTMENT_AID`) REFERENCES `lab_action` (`Lab_Tech_EID`, `APPOINTMENT_AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathologcal_test`
--

LOCK TABLES `pathologcal_test` WRITE;
/*!40000 ALTER TABLE `pathologcal_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathologcal_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `PhoneNum` varchar(16) NOT NULL,
  `SSN` varchar(11) NOT NULL,
  `Insurance` varchar(255) NOT NULL,
  `Height` int NOT NULL,
  `Weight` int NOT NULL,
  `Eye Color` varchar(45) NOT NULL,
  `Hair Color` varchar(45) NOT NULL,
  `PCP_EID` int unsigned NOT NULL,
  `Email` varchar(45) NOT NULL,
  `MailingAddress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `fk_PATIENT_DOCTOR_idx` (`PCP_EID`),
  CONSTRAINT `fk_PATIENT_DOCTOR` FOREIGN KEY (`PCP_EID`) REFERENCES `doctor` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PayID` int NOT NULL,
  `Total Amount` decimal(10,2) NOT NULL,
  `Doctor's Fee` decimal(10,2) NOT NULL,
  `Lab Fee` decimal(10,2) NOT NULL,
  `Insurance` varchar(255) NOT NULL,
  `Deductible` decimal(10,2) NOT NULL,
  `Balance` decimal(10,2) NOT NULL,
  `APPOINTMENT_AID` int NOT NULL,
  `APPOINTMENT_PATIENT_PID` int NOT NULL,
  PRIMARY KEY (`PayID`,`APPOINTMENT_AID`,`APPOINTMENT_PATIENT_PID`),
  KEY `fk_PAYMENT_APPOINTMENT1_idx` (`APPOINTMENT_AID`,`APPOINTMENT_PATIENT_PID`),
  CONSTRAINT `fk_PAYMENT_APPOINTMENT1` FOREIGN KEY (`APPOINTMENT_AID`, `APPOINTMENT_PATIENT_PID`) REFERENCES `appointment` (`AID`, `PATIENT_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `presc_name` varchar(100) DEFAULT NULL,
  `presc_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `presc_date` date DEFAULT NULL,
  `dosage` decimal(7,2) DEFAULT NULL,
  `daily_intake` tinyint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `refills` int DEFAULT NULL,
  `prescribed_by_doc` int DEFAULT NULL,
  `prescribed_at_clinic` int DEFAULT NULL,
  `APPOINTMENT_AID` int NOT NULL,
  `APPOINTMENT_PATIENT_PID` int NOT NULL,
  `APPOINTMENT_DOCTOR_EID` int unsigned NOT NULL,
  `APPOINTMENT_CLINIC_clinic_id` int NOT NULL,
  PRIMARY KEY (`presc_id`,`APPOINTMENT_AID`,`APPOINTMENT_PATIENT_PID`,`APPOINTMENT_DOCTOR_EID`,`APPOINTMENT_CLINIC_clinic_id`),
  KEY `fk_PRESCRIPTION_APPOINTMENT1_idx` (`APPOINTMENT_AID`,`APPOINTMENT_PATIENT_PID`,`APPOINTMENT_DOCTOR_EID`,`APPOINTMENT_CLINIC_clinic_id`),
  CONSTRAINT `fk_PRESCRIPTION_APPOINTMENT1` FOREIGN KEY (`APPOINTMENT_AID`, `APPOINTMENT_PATIENT_PID`, `APPOINTMENT_DOCTOR_EID`, `APPOINTMENT_CLINIC_clinic_id`) REFERENCES `appointment` (`AID`, `PATIENT_PID`, `DOCTOR_EID`, `CLINIC_clinic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_hist`
--

DROP TABLE IF EXISTS `scan_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan_hist` (
  `RID` int NOT NULL,
  `Type` int DEFAULT NULL COMMENT '0 - X-Ray\\n1 - CT\\n2 - MRI',
  `File` blob,
  `MEDICAL_HISTORY_MedHisID` int NOT NULL,
  `MEDICAL_HISTORY_PATIENT_PID` int NOT NULL,
  PRIMARY KEY (`RID`,`MEDICAL_HISTORY_MedHisID`,`MEDICAL_HISTORY_PATIENT_PID`),
  UNIQUE KEY `RID_UNIQUE` (`RID`),
  KEY `fk_SCAN_MEDICAL_HISTORY1_idx` (`MEDICAL_HISTORY_MedHisID`,`MEDICAL_HISTORY_PATIENT_PID`),
  CONSTRAINT `fk_SCAN_MEDICAL_HISTORY1` FOREIGN KEY (`MEDICAL_HISTORY_MedHisID`, `MEDICAL_HISTORY_PATIENT_PID`) REFERENCES `medical_history` (`MedHisID`, `PATIENT_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_hist`
--

LOCK TABLES `scan_hist` WRITE;
/*!40000 ALTER TABLE `scan_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `scan_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccination`
--

DROP TABLE IF EXISTS `vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccination` (
  `Vaccinator` varchar(50) NOT NULL,
  `CID` int DEFAULT NULL,
  `Date` int NOT NULL,
  `Disease` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Funding` int NOT NULL COMMENT '(0-Federal, 1-State, 2-Private)',
  `Route` int NOT NULL COMMENT '0-Oral, \\n1-Intranasal, \\n2-Subcutaneous, \\n3-Intramuscular',
  `Site` int DEFAULT NULL COMMENT '(0-Right Arm, \\n1-Left Arm, \\n2-Right Thigh, \\n3-Left Thigh)',
  `Name of vaccination` varchar(100) DEFAULT NULL,
  `Date of Vaccinaton` int NOT NULL,
  `Vaccine-Lot-Num` int NOT NULL,
  `Vaccine-Manufac` varchar(45) DEFAULT NULL,
  `Vac-Info-State-Date` date DEFAULT NULL,
  `Vac-Info-State-Date-Given` date DEFAULT NULL,
  `PATIENT_PID` int NOT NULL,
  PRIMARY KEY (`PATIENT_PID`),
  UNIQUE KEY `new_tablecol_UNIQUE` (`Name of vaccination`),
  CONSTRAINT `fk_VACCINATION_PATIENT1` FOREIGN KEY (`PATIENT_PID`) REFERENCES `patient` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination`
--

LOCK TABLES `vaccination` WRITE;
/*!40000 ALTER TABLE `vaccination` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccination` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-02 14:21:37
 
