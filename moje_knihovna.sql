CREATE DATABASE  IF NOT EXISTS `kniha_i4c` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `kniha_i4c`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: kniha_i4c
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ctenar`
--

DROP TABLE IF EXISTS `ctenar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctenar` (
  `IDctenar` int(11) NOT NULL,
  `jmneno` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `prijmeni` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`IDctenar`),
  KEY `IDctenar` (`IDctenar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctenar`
--

/*!40000 ALTER TABLE `ctenar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctenar` ENABLE KEYS */;

--
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplar` (
  `ISBN` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `Exemp` char(1) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`ISBN`,`Exemp`),
  KEY `ISBN` (`ISBN`),
  KEY `Exemp` (`Exemp`),
  CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `kniha` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;

--
-- Table structure for table `kniha`
--

DROP TABLE IF EXISTS `kniha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kniha` (
  `ISBN` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `Autor` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `Nazev` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `Vydavatelstvi` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `Rok_vydani` year(4) NOT NULL,
  `Cena` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kniha`
--

/*!40000 ALTER TABLE `kniha` DISABLE KEYS */;
INSERT INTO `kniha` VALUES ('12545','Karel','RUR','Praha',2000,150);
/*!40000 ALTER TABLE `kniha` ENABLE KEYS */;

--
-- Table structure for table `vypujcka`
--

DROP TABLE IF EXISTS `vypujcka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vypujcka` (
  `IDctenar` int(11) NOT NULL,
  `datum` date NOT NULL,
  `ISBN` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `Exemp` char(1) COLLATE utf8_czech_ci NOT NULL,
  `vraceno` int(1) NOT NULL,
  PRIMARY KEY (`IDctenar`,`datum`,`ISBN`,`Exemp`),
  KEY `ISBN` (`ISBN`),
  KEY `Exemp` (`Exemp`),
  CONSTRAINT `vypujcka_ibfk_1` FOREIGN KEY (`IDctenar`) REFERENCES `ctenar` (`IDctenar`),
  CONSTRAINT `vypujcka_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `exemplar` (`ISBN`),
  CONSTRAINT `vypujcka_ibfk_3` FOREIGN KEY (`Exemp`) REFERENCES `exemplar` (`Exemp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vypujcka`
--

/*!40000 ALTER TABLE `vypujcka` DISABLE KEYS */;
/*!40000 ALTER TABLE `vypujcka` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13  8:17:06
