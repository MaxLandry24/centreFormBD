-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: centre_formation
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartient` (
  `codeForm` varchar(8) NOT NULL,
  `codeSpec` varchar(8) NOT NULL,
  PRIMARY KEY (`codeForm`,`codeSpec`),
  KEY `codeSpec` (`codeSpec`),
  CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`),
  CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`codeSpec`) REFERENCES `specialite` (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartient`
--

LOCK TABLES `appartient` WRITE;
/*!40000 ALTER TABLE `appartient` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etudiant` (
  `NumCNIEtu` varchar(20) NOT NULL,
  `nomEtu` varchar(30) DEFAULT NULL,
  `prenomEtu` varchar(30) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `adresseEtu` varchar(50) DEFAULT NULL,
  `villeEtu` varchar(30) DEFAULT NULL,
  `niveauEtu` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumCNIEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formation` (
  `codeForm` varchar(8) NOT NULL,
  `titreForm` varchar(20) DEFAULT NULL,
  `dureeForm` int(11) DEFAULT NULL,
  `prixForm` float DEFAULT NULL,
  PRIMARY KEY (`codeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscription` (
  `codeSess` varchar(8) NOT NULL,
  `NumCNIEtu` varchar(20) NOT NULL,
  `TypeCours` varchar(8) NOT NULL,
  PRIMARY KEY (`codeSess`,`NumCNIEtu`),
  KEY `NumCNIEtu` (`NumCNIEtu`),
  CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`codeSess`) REFERENCES `session` (`codeSess`),
  CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`NumCNIEtu`) REFERENCES `etudiant` (`NumCNIEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription`
--

LOCK TABLES `inscription` WRITE;
/*!40000 ALTER TABLE `inscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `codeSess` varchar(8) NOT NULL,
  `nomSess` varchar(20) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `codeForm` varchar(8) NOT NULL,
  PRIMARY KEY (`codeSess`),
  KEY `codeForm` (`codeForm`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`),
  CONSTRAINT `chk_date` CHECK (`dateFin` > `dateDebut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialite` (
  `codeSpec` varchar(8) NOT NULL,
  `nomSpec` varchar(20) DEFAULT NULL,
  `descSpec` varchar(255) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13 15:11:53
