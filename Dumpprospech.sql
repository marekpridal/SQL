CREATE DATABASE  IF NOT EXISTS `prospech` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `prospech`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prospech
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `obory`
--

DROP TABLE IF EXISTS `obory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obory` (
  `Oznaceni_oboru` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `ID_oboru` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `Obor` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`Oznaceni_oboru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obory`
--

LOCK TABLES `obory` WRITE;
/*!40000 ALTER TABLE `obory` DISABLE KEYS */;
INSERT INTO `obory` VALUES ('E','26-41-M/01','Elektrotechnika'),('EP','26-47-M/002','Elektronické po?íta?ové systémy -dobíhající'),('ES','26-43-M/004','Slaboproudá elektrotechnika-dobíhajíci'),('I','18-20-M/01','Informa?ní technologie'),('L','78-42-M/001','Technické lyceum-dobíhající'),('T','26-41-M/002','Elektrotechnika-dobíhající'),('TL','78-42-M/01','Technické lyceum');
/*!40000 ALTER TABLE `obory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trida`
--

DROP TABLE IF EXISTS `trida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trida` (
  `IDtridy` int(11) NOT NULL,
  `nazevtridy` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `zkroboru` varchar(4) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`IDtridy`),
  KEY `tri_obo_fk_idx` (`zkroboru`),
  CONSTRAINT `tri_obo_fk` FOREIGN KEY (`zkroboru`) REFERENCES `obory` (`Oznaceni_oboru`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trida`
--

LOCK TABLES `trida` WRITE;
/*!40000 ALTER TABLE `trida` DISABLE KEYS */;
INSERT INTO `trida` VALUES (1,'E3A','E'),(2,'E3B','E'),(3,'I3A','I'),(4,'I4C','I'),(5,'I3C','I'),(6,'I4A','I'),(7,'I2A','I');
/*!40000 ALTER TABLE `trida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `IDs` int(11) NOT NULL,
  `prijmeni` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `jmeno` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `IDtridy` int(11) NOT NULL,
  `DatNar` date DEFAULT NULL,
  `RodCislo` text COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`IDs`),
  KEY `stu_tri_fk_idx` (`IDtridy`),
  CONSTRAINT `stu_tri_fk` FOREIGN KEY (`IDtridy`) REFERENCES `trida` (`IDtridy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Novák','Michal',4,'1994-05-10','940510/5219'),(3,'Konecný','Filip',7,'1997-05-15','950515/5120'),(4,'Svobodný','Martin',5,'1994-05-22','940522/5020'),(5,'Kolek','Radim',6,'1996-04-24','930424/5616'),(6,'Tomáš','Miroslav',5,'1994-04-05','940405/5214'),(7,'Chytrý','Jan',1,'1995-06-05','950605/5123'),(8,'Bohatá','Veronika',1,'1995-05-10','955510/5319'),(9,'Slabý','Miroslav',1,'1995-05-05','950505/5518'),(10,'Slidný','Filip',4,'1994-11-05','941105/5644'),(11,'Pátý','Richard',2,'1995-08-10','950810/5432'),(12,'Bílý','Martin',2,'1998-11-04','931104/5444'),(13,'Fervený','Daniel',6,'1994-02-09','940209/5306'),(14,'Modrý','Lukáš',2,'1995-02-18','950218/5607'),(15,'Modrý','Petr',3,'1995-08-10','950810/5432'),(16,'Jasný','Daniel',2,'1994-01-31','940131/5105'),(17,'Bohatý','Ondra',2,'1996-11-03','941103/5444'),(18,'Petrová','Lucie',6,'1994-09-01','945901/5435'),(19,'Hašek','Michal',7,'1997-07-01','950701/5626'),(20,'Jasný','Tomáš',2,'1995-06-07','950607/5323'),(21,'Zub','Daniel',7,'1998-05-01','950501/5118'),(22,'Zounar','Martin',4,'1995-04-25','950425/5217'),(23,'Vaculík','Lukáš',7,'1997-06-25','930625/5525'),(24,'Brzobohatý','Ondra',4,'1995-09-26','950926/5239'),(25,'Vaculík','Radek',3,'1994-02-24','940224/5408'),(26,'Modrý','Petr',4,'1994-04-06','940406/5314'),(27,'Hašek','Josef',7,'1997-05-16','950516/5220'),(28,'Kolek','Jan',3,'1994-01-01','940101/5600'),(29,'Svatý','Vít',3,'1994-04-06','940406/5314'),(30,'Hašek','Michal',6,'1995-02-19','950219/5007'),(31,'Poustevník','Dominik',3,'1994-05-27','940527/5521'),(32,'Capek','Josef',4,'1993-08-29','930829/5034'),(33,'Tell','Vilém',4,'1995-02-24','950224/5508'),(34,'Pavel','Petr',1,'1993-05-09','930509/5018'),(35,'Holub','Jaromír',6,'1997-05-27','940527/5521'),(36,'Datlová','Nataša',3,'1995-02-01','955201/5305'),(37,'Kolibrík','František',5,'1993-08-29','930829/5034'),(38,'Vrabec','Ondra',1,'1994-05-29','940529/5021'),(39,'Vrabcová','Jana',5,'1995-02-09','955209/5406'),(40,'Datlová','Petra',3,'1993-08-02','935802/5131'),(41,'Sýkora','Pavel',2,'1994-05-22','940522/5020'),(42,'Král','Petr',4,'1993-08-19','930819/5433'),(43,'Slepicka','Pavel',4,'1995-02-28','950228/5209'),(44,'Drozdová','Libuše',1,'1994-05-07','945507/5618'),(45,'Holub','Vít',2,'1995-04-19','950419/5316'),(46,'Datlová','Kamila',1,'1993-07-29','935729/5430'),(47,'Sova','Karel',7,'1998-03-27','940327/5012'),(48,'Páf','Leonard',6,'1997-06-19','950619/5125'),(49,'Malá','Marta',2,'1994-05-02','945502/5118'),(50,'Nový','Ivo',5,'1995-11-19','951119/5046');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence` (
  `IDS` int(11) NOT NULL DEFAULT '0',
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `duvod` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `pocethod` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDS`,`datum`),
  KEY `abs_stu_fk_idx` (`IDS`),
  CONSTRAINT `abs_stu_fk` FOREIGN KEY (`IDS`) REFERENCES `student` (`IDs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
INSERT INTO `absence` VALUES (1,'2015-05-21','nemoc',7),(1,'2015-05-24','nemoc',6),(1,'2015-06-02','nemoc',5),(1,'2015-06-27','nemoc',3),(1,'2015-07-21','nemoc',7),(1,'2015-09-02','zaspal',2),(1,'2015-09-06','lékar',2),(3,'2015-02-06','autoškola',1),(3,'2015-02-27','autoškola',2),(3,'2015-05-08','nevolnost',2),(3,'2015-05-11','autoškola',5),(3,'2015-05-18','autoškola (zkoušky)',5),(3,'2015-05-22','rodinné duvody',7),(3,'2015-05-25','akce školy',0),(3,'2015-05-26','autoškola',1),(3,'2015-05-29','autoškola',2),(3,'2015-06-02','zubar',1),(3,'2015-06-10','autoškola',1),(3,'2015-06-11','autoškola',4),(3,'2015-07-18','lékar',1),(3,'2015-07-21','zaspal',3),(3,'2015-09-03','doprava',0),(3,'2015-09-07','autoškola',5),(3,'2015-12-06','zaspal',1),(4,'2015-02-27',NULL,7),(4,'2015-04-30','zaspal,autoškola',4),(4,'2015-05-04','autoškola',2),(4,'2015-05-08','nemoc',7),(4,'2015-05-09','nemoc',5),(4,'2015-05-11','autoškola',2),(4,'2015-05-18','autoškola',2),(4,'2015-05-20','autoškola',2),(4,'2015-05-21',NULL,2),(4,'2015-05-29','nemoc',6),(4,'2015-05-30',NULL,6),(4,'2015-06-03','nemoc',6),(4,'2015-06-04','nemoc',7),(4,'2015-06-05','nemoc',6),(4,'2015-06-16','zaspal',1),(4,'2015-06-25','autoškola',2),(4,'2015-07-13','doprava',1),(4,'2015-07-22','rodinné duvody',2),(4,'2015-07-24','autoškola',2),(4,'2015-08-08','lékar',1),(4,'2015-08-14','autoškola',3),(4,'2015-08-22','doprava',1),(4,'2015-09-07','nemoc',6),(4,'2015-09-09','rodinné duvody',7),(4,'2015-09-12','autoškola',2),(5,'2015-01-29','nevolnost',2),(5,'2015-01-30','autoškola',4),(5,'2015-02-06','nemoc',5),(5,'2015-02-07','lékar',4),(5,'2015-02-08','necvicí',2),(5,'2015-02-17','rodinné duvody',6),(5,'2015-02-18','nemoc',6),(5,'2015-02-19','nemoc',7),(5,'2015-02-20',NULL,3),(5,'2015-02-21','nemoc',6),(5,'2015-02-22','nemoc',7),(5,'2015-02-24','pozdní príchod',0),(5,'2015-02-25',NULL,NULL),(5,'2015-02-26','nemoc',7),(5,'2015-03-01',NULL,6),(5,'2015-03-02',NULL,2),(5,'2015-03-04','lékar',2),(5,'2015-03-05','lékar',1),(5,'2015-03-10','autoškola',1),(5,'2015-03-11','autoškola',1),(5,'2015-03-12','pozdní príchod',0),(5,'2015-03-17','autoškola',2),(5,'2015-04-07','nemoc',7),(5,'2015-04-16','rodinné duvody',5),(5,'2015-08-20','nevolnost',5),(5,'2015-09-03','neomluveno',2),(5,'2015-09-06','zaspal',3),(5,'2015-09-10','doprava',2),(5,'2015-09-14','autoškola (zkoušky)',7),(5,'2015-11-14',NULL,1),(5,'2015-12-02','pozdní príchod',0),(5,'2015-12-03',NULL,6),(5,'2015-12-04','nemoc',7),(5,'2015-12-05','nemoc',7),(5,'2015-12-07','nemoc',6),(5,'2015-12-14',NULL,2),(5,'2015-12-15','nemoc',7),(5,'2015-12-16','zaspal',1),(5,'2015-12-17','lékar',3),(5,'2015-12-18','nemoc',7),(5,'2015-12-19','pozdní príchod',3),(5,'2015-12-20','nemoc',6),(5,'2016-01-05',NULL,7),(6,'2015-02-17','autoškola',1),(6,'2015-05-02','autoškola',1),(6,'2015-05-04','autoškola',3),(6,'2015-05-07','autoškola',3),(6,'2015-05-09','autoškola',1),(6,'2015-05-11','nemoc',6),(6,'2015-05-14','autoškola',2),(6,'2015-05-20',NULL,6),(6,'2015-05-21','autoškola',2),(6,'2015-05-22','zaspal',3),(6,'2015-05-29','nemoc',6),(6,'2015-06-06','autoškola (zkoušky)',4),(6,'2015-06-07','nemoc',6),(6,'2015-06-10','lékar',2),(7,'2012-03-31','autoškola',3),(7,'2012-04-01','neomluveno',1),(7,'2015-02-07','lékar',6),(7,'2015-02-11','autoškola',3),(7,'2015-02-14','nemoc',6),(7,'2015-02-15','necvicí',2),(7,'2015-02-17',NULL,7),(7,'2015-02-18',NULL,6),(7,'2015-02-20','rodinné duvody',3),(7,'2015-02-21','rodinné duvody',6),(7,'2015-02-22','autoškola',3),(7,'2015-02-23','autoškola',2),(7,'2015-02-24',NULL,1),(7,'2015-02-25','autoškola',2),(7,'2015-02-26',NULL,3),(7,'2015-02-27',NULL,1),(7,'2015-02-28','nemoc',6),(7,'2015-03-01','autoškola',3),(7,'2015-03-03','zaspal',1),(7,'2015-03-04',NULL,NULL),(7,'2015-03-05','nemoc',6),(7,'2015-03-06','nemoc',7),(7,'2015-03-08','autoškola',3),(7,'2015-03-10','pozdní príchod',0),(7,'2015-03-11','autoškola',1),(7,'2015-03-12','nevolnost',1),(7,'2015-03-13','autoškola',4),(7,'2015-03-14','neprítomen',1),(7,'2015-03-16','doprava',3),(7,'2015-03-17','autoškola',2),(7,'2015-04-16','pozdní príchod',0),(7,'2015-07-17','nemoc',6),(7,'2015-08-16','nemoc',5),(7,'2015-08-24','rodinné duvody',6),(7,'2015-09-07','pozdní príchod',0),(7,'2015-09-13','nemoc',1),(7,'2015-12-02',NULL,3),(7,'2015-12-13','lékar',6),(7,'2015-12-14','nemoc',6),(7,'2015-12-18','autoškola',2),(7,'2015-12-19','autoškola',3),(7,'2015-12-20','autoškola',6),(7,'2015-12-21','neomluveno',1),(7,'2016-01-02','rodinné duvody',1),(7,'2016-01-04','pozdní príchod',0),(7,'2016-01-08',NULL,6),(8,'2015-04-29','nemoc',6),(8,'2015-05-03','nemoc',7),(8,'2015-05-12','nemoc',6),(8,'2015-05-13','lékar',6),(8,'2015-05-15','nemoc',7),(8,'2015-05-16','nemoc',7),(8,'2015-05-19','neomluveno',1),(8,'2015-05-25','nemoc',7),(8,'2015-05-26','nemoc',6),(8,'2015-06-03','nevolnost',6),(8,'2015-06-12','nemoc',7),(8,'2015-08-11','nemoc',7),(9,'2015-05-03','zaspal',1),(9,'2015-05-04','lékar',5),(9,'2015-05-09','lékar',7),(9,'2015-05-14','rodinné duvody',1),(9,'2015-05-18','lékar',7),(9,'2015-05-19','neomluveno',1),(9,'2015-05-23','nemoc',7),(9,'2015-05-24','nemoc',6),(9,'2015-05-30','necvicí',2),(9,'2015-11-27','lékar',2),(9,'2015-12-04','rodinné duvody',6),(10,'2015-02-04','doprava',1),(10,'2015-02-11','nevolnost',7),(10,'2015-02-16','nemoc',6),(10,'2015-02-20','nemoc',6),(10,'2015-02-23','neomluveno',1),(10,'2015-02-24',NULL,1),(10,'2015-02-27','autoškola',2),(10,'2015-03-05','nemoc',6),(10,'2015-03-06','nemoc',7),(10,'2015-03-07','nemoc',6),(10,'2015-03-12','pozdní príchod',0),(10,'2015-05-06','doprava',1),(12,'2015-02-04','nemoc',7),(12,'2015-02-05','doprava',0),(12,'2015-02-06','nemoc',5),(12,'2015-02-15','necvicí',2),(12,'2015-02-17','nemoc',6),(12,'2015-02-19','nemoc',7),(12,'2015-02-20','nemoc',7),(12,'2015-02-21','nemoc',6),(12,'2015-02-22','pozdní príchod',0),(12,'2015-02-23','neomluveno',1),(12,'2015-02-24','nemoc',6),(12,'2015-02-27','necvicí',2),(12,'2015-03-17','lékar',2),(13,'2015-02-14','neomluveno',1),(13,'2015-04-30','reprezentace školy',0),(13,'2015-05-02','kompars',2),(13,'2015-05-12',NULL,2),(13,'2015-05-16','nemoc',7),(13,'2015-05-17','nemoc',7),(13,'2015-05-18','nemoc',6),(13,'2015-05-19','lékar',6),(13,'2015-05-21','nemoc',6),(13,'2015-05-25','sport',0),(13,'2015-05-28','zaspal',0),(13,'2015-06-03','nemoc',6),(13,'2015-06-07','pozdní príchod',0),(14,'2015-02-07','doprava',0),(14,'2015-02-21','zaspal',1),(14,'2015-02-23','neomluveno',1),(14,'2015-03-01','zaspal',1),(14,'2015-03-05','nemoc',6),(14,'2015-03-06','necvicí',2),(14,'2015-09-03','zaspal',1),(15,'2015-02-03','nemoc',6),(15,'2015-02-05','nemoc',7),(15,'2015-02-07','nemoc',6),(15,'2015-02-16',NULL,1),(15,'2015-02-23','neomluveno',1),(16,'2015-01-23','autoškola',3),(16,'2015-02-06','nemoc',6),(16,'2015-02-13','nemoc',7),(16,'2015-02-17','nemoc',6),(16,'2015-04-21','nemoc',6),(16,'2015-04-25','autoškola',2),(16,'2015-04-26','doprava',1),(16,'2015-04-27','doprava',1),(16,'2015-04-29','doprava',0),(16,'2015-05-01','autoškola',2),(16,'2015-05-08','autoškola',1),(16,'2015-05-11','nevolnost',7),(16,'2015-05-12','nemoc',7),(16,'2015-05-13','nemoc',7),(16,'2015-05-14','nemoc',6),(16,'2015-05-16','autoškola (zkoušky)',6),(16,'2015-05-17',NULL,2),(16,'2015-05-18',NULL,7),(16,'2015-05-19',NULL,6),(16,'2015-05-20','autoškola',7),(16,'2015-05-21','autoškola',2),(16,'2015-05-22','nemoc',7),(16,'2015-05-23','autoškola',2),(16,'2015-05-25','nemoc',6),(16,'2015-05-26','nemoc',7),(16,'2015-06-01','zaspal',4),(16,'2015-10-05','lékar',2),(16,'2015-10-31','zubar',1),(16,'2015-11-22','zubar',1),(16,'2015-11-26','doprava',1),(17,'2015-02-05','nemoc',7),(17,'2015-02-18','nemoc',7),(17,'2015-02-19','nemoc',7),(17,'2015-02-20','nemoc',7),(17,'2015-02-21','nemoc',6),(17,'2015-02-24','nemoc',6),(17,'2015-02-26','autoškola',3),(17,'2015-03-06','lékar',4),(18,'2015-02-03','rodinné duvody',2),(18,'2015-02-06','nevolnost',7),(18,'2015-02-10','nemoc',6),(18,'2015-02-12',NULL,6),(18,'2015-04-22','nevolnost',6),(18,'2015-04-29','nemoc',7),(18,'2015-04-30','zaspal',1),(18,'2015-05-01','rodinné duvody',6),(18,'2015-05-08','rodinné duvody',6),(18,'2015-05-11','zaspal',1),(18,'2015-05-12','nevolnost',7),(18,'2015-05-13',NULL,1),(18,'2015-05-14','rodinné duvody',3),(18,'2015-05-15',NULL,6),(18,'2015-05-16',NULL,2),(18,'2015-05-17','nemoc',7),(18,'2015-05-18',NULL,7),(18,'2015-05-19','nemoc',7),(18,'2015-05-20','nemoc',6),(18,'2015-05-21',NULL,6),(18,'2015-05-22','nevolnost',3),(18,'2015-05-23',NULL,6),(18,'2015-05-24','nemoc',5),(18,'2015-05-25','nemoc',6),(18,'2015-05-26','nemoc',7),(18,'2015-05-27','nemoc',6),(18,'2015-05-30','nemoc',6),(18,'2015-05-31','nemoc',7),(18,'2015-06-02','nemoc',7),(18,'2015-06-03','nemoc',6),(18,'2015-09-30','nemoc',6),(18,'2015-10-29','nemoc',7),(18,'2015-11-27','nemoc',7),(18,'2015-11-29','nemoc',7),(18,'2015-12-03','rodinné duvody',1),(19,'2015-02-16','doprava',1),(19,'2015-02-21','pozdní príchod',0),(19,'2015-02-26','nemoc',7),(19,'2015-02-27','nemoc',7),(19,'2015-02-28','nemoc',6),(19,'2015-03-01','doprava',0),(19,'2015-03-06','necvicí',2),(20,'2015-02-06','autoškola',5),(20,'2015-02-07','autoškola',1),(20,'2015-02-10','autoškola',2),(20,'2015-02-11','autoškola',1),(20,'2015-02-16','autoškola',1),(20,'2015-02-18','autoškola',2),(20,'2015-02-22','autoškola',2),(20,'2015-02-28','rodinné duvody',6),(20,'2015-03-01','zaspal',1),(20,'2015-03-03','lékar',7),(20,'2015-03-07','autoškola',2),(20,'2015-03-10','autoškola',3),(20,'2015-03-13','zaspal',0),(20,'2015-03-14','nemoc',6),(20,'2015-04-15','autoškola',1),(20,'2015-04-17','zubar',2),(20,'2015-05-13','nemoc',7),(20,'2015-10-17','autoškola (zkoušky)',6),(21,'2015-02-04','nemoc',7),(21,'2015-02-07','pozdní príchod',2),(21,'2015-02-10','autoškola',2),(21,'2015-02-13','nemoc',7),(21,'2015-02-14','nemoc',6),(21,'2015-02-15','necvicí',2),(21,'2015-02-16','zubar',6),(21,'2015-02-17','zaspal',3),(21,'2015-02-18','autoškola',3),(21,'2015-02-19','autoškola',1),(21,'2015-02-20',NULL,2),(21,'2015-02-21','nevolnost',6),(21,'2015-02-22','autoškola',6),(21,'2015-02-23','autoškola',2),(21,'2015-02-24','autoškola (zkoušky)',6),(21,'2015-02-25','nemoc',7),(21,'2015-02-26','nemoc',7),(21,'2015-02-28','nemoc',6),(21,'2015-03-01',NULL,1),(21,'2015-03-02',NULL,1),(21,'2015-03-03',NULL,7),(21,'2015-03-04','autoškola',1),(21,'2015-03-06','autoškola',2),(21,'2015-03-08','lékar',6),(21,'2015-03-10','pozdní príchod',0),(21,'2015-03-13','zubar',2),(21,'2015-03-17','nemoc',6),(21,'2015-04-16','nemoc',7),(21,'2015-04-17','nemoc',7),(21,'2015-07-03','autoškola',2),(21,'2015-07-19','autoškola',4),(21,'2015-07-28',NULL,6),(21,'2015-07-29','nemoc',7),(21,'2015-09-03','zaspal',1),(21,'2015-09-06','nemoc',5),(21,'2015-09-09','zubar',1),(21,'2015-09-11','nemoc',7),(21,'2015-09-13','nemoc',7),(21,'2015-09-14','autoškola',2),(21,'2015-12-01','zaspal, autoškola',3),(21,'2015-12-03','zaspal',6),(21,'2015-12-04','kompars',2),(21,'2015-12-06',NULL,7),(21,'2015-12-16','autoškola (zkoušky)',6),(21,'2015-12-17','neomluveno',7),(21,'2015-12-19','autoškola (zkoušky)',7),(21,'2015-12-20','autoškola',2),(21,'2015-12-21','neomluveno',1),(21,'2016-01-09','nevolnost',7),(23,'2015-02-05','sport',1),(23,'2015-02-13','nemoc',6),(23,'2015-02-14','zaspal',2),(23,'2015-02-15','zaspal',3),(23,'2015-02-17','zaspal',0),(23,'2015-02-18','nemoc',6),(23,'2015-02-19','lékar',7),(23,'2015-02-20',NULL,2),(23,'2015-02-21','nemoc',7),(23,'2015-02-22','nemoc',6),(23,'2015-02-23','neomluveno',1),(23,'2015-02-26',NULL,3),(23,'2015-02-27','nemoc',7),(23,'2015-02-28','nemoc',6),(23,'2015-03-01',NULL,6),(23,'2015-03-02','nemoc',7),(23,'2015-03-07','nevolnost',6),(23,'2015-03-10','zaspal',2),(23,'2015-03-17',NULL,1),(23,'2015-06-17',NULL,7),(23,'2015-07-08','sport',7),(23,'2015-08-04','sport',7),(23,'2015-08-11','rodinné duvody',1),(23,'2015-09-08','sport',1),(23,'2015-12-18','zubar',6),(23,'2016-01-06',NULL,7),(24,'2015-02-05','autoškola',6),(24,'2015-02-10','neomluveno',2),(24,'2015-04-29','pozdní príchod',1),(24,'2015-05-01','neomluveno',1),(24,'2015-05-08','lékar',1),(24,'2015-05-10','zaspal',6),(24,'2015-05-14',NULL,6),(24,'2015-05-15','doprava',1),(24,'2015-05-16','rodinné duvody',6),(24,'2015-05-17','rodinné duvody',7),(24,'2015-05-20',NULL,7),(24,'2015-05-21',NULL,6),(24,'2015-05-22','nevolnost',6),(24,'2015-06-02','nemoc',7),(24,'2015-06-03','pozdní puíchod',0),(24,'2015-06-04','nemoc',6),(24,'2015-08-26','nemoc',7),(24,'2015-11-27','nemoc',7),(25,'2015-02-04','doprava',1),(25,'2015-02-06','kompars',2),(25,'2015-02-08','zubar',2),(25,'2015-02-17','zaspal',1),(25,'2015-02-19','autoškola',1),(25,'2015-02-23','nemoc',6),(25,'2015-02-24','nemoc',6),(25,'2015-02-25',NULL,7),(25,'2015-02-26',NULL,7),(25,'2015-02-27','autoškola',1),(25,'2015-03-01','lékar',6),(25,'2015-03-18','lékar',1),(25,'2015-09-06','nemoc',6),(25,'2016-01-06',NULL,7),(26,'2015-02-22','pozdní príchod',0),(26,'2015-02-27','lékar',7),(26,'2015-03-04','rodinné duvody',5),(26,'2015-06-30','pozdní príchod',0),(27,'2015-02-06','lékar',3),(27,'2015-02-13','lékar',1),(27,'2015-02-15','lékar',7),(27,'2015-02-18','lékar',3),(27,'2015-02-24','nemoc',6),(27,'2015-02-25','autoškola',1),(27,'2015-03-03',NULL,6),(27,'2015-03-13','rodinné duvody',1),(27,'2015-07-04','nemoc',6),(27,'2015-08-12','lékar',2),(27,'2015-12-15','zaspal',2),(28,'2015-04-26','doprava',1),(28,'2015-04-27','zaspal',1),(28,'2015-05-15','neomluveno',1),(28,'2015-05-24','lékar',2),(28,'2015-06-01','nemoc',7),(28,'2015-11-11','lékar',2),(29,'2015-02-05','lékar',1),(29,'2015-02-07','nemoc',6),(29,'2015-02-17','doprava',1),(29,'2015-02-19','zaspal',0),(29,'2015-02-21','doprava',1),(29,'2015-02-22','nemoc',6),(29,'2015-02-24',NULL,6),(29,'2015-02-25',NULL,7),(29,'2015-02-26',NULL,7),(29,'2015-02-27','nemoc',7),(29,'2015-03-07','lékar',2),(29,'2015-03-17','nemoc',6),(29,'2015-03-18','nemoc',7),(29,'2015-07-16','necvicí',2),(29,'2015-08-07','nemoc',5),(29,'2015-12-04','doprava',1),(29,'2015-12-12','nemoc',6),(29,'2015-12-14','nemoc',7),(30,'2015-02-21','zubar',2),(30,'2015-02-26',NULL,0),(30,'2015-02-27','nevolnost',5),(30,'2015-02-28','nemoc',7),(30,'2015-03-02','nemoc',7),(30,'2015-09-10','sport',2),(31,'2015-02-05','nemoc',6),(31,'2015-02-07','zaspal',1),(31,'2015-02-08','necvicí',2),(31,'2015-02-15','necvicí',2),(31,'2015-02-23','nemoc',7),(31,'2015-02-25','nemoc',7),(31,'2015-02-26','nemoc',7),(31,'2015-02-27','nemoc',7),(31,'2015-02-28','nemoc',6),(31,'2015-03-02','nemoc',6),(31,'2015-03-03','rodinné duvody',6),(31,'2015-03-05','nemoc',6),(31,'2015-03-11','odbery',2),(31,'2015-03-12','rodinné duvody',7),(31,'2015-03-13','lékar',4),(31,'2015-05-06','rodinné duvody',6),(31,'2015-06-06','nemoc',7),(31,'2015-07-21','rodinné duvody',6),(31,'2015-12-02','nemoc',7),(31,'2015-12-21','neomluveno',1),(31,'2016-01-06',NULL,7),(32,'2015-02-11','nemoc',7),(32,'2015-02-22','lékar',6),(32,'2015-03-01','nemoc',7),(32,'2015-03-07','nemoc',6),(32,'2015-06-28','nemoc',7),(33,'2015-02-15','nemoc',7),(35,'2015-02-09','nemoc',7),(36,'2015-02-05','autoškola',3),(36,'2015-03-04','nemoc',6),(37,'2015-02-04','nemoc',7),(37,'2015-02-16',NULL,6),(37,'2015-03-02',NULL,6),(37,'2015-03-05','autoškola',2),(37,'2015-03-07','nemoc',6),(37,'2015-12-04','autoškola',3),(38,'2015-02-11','nemoc',7),(38,'2015-07-11','zubar',7),(38,'2015-09-12',NULL,6),(39,'2015-02-07','doprava',0),(39,'2015-02-19','rodinné duvody',7),(39,'2015-02-25','lékar',3),(40,'2015-02-19','zaspal',0),(42,'2015-02-18','nemoc',7),(43,'2015-03-07','pozdní príchod',0),(44,'2015-02-16','doprava',1),(45,'2015-06-07','autoškola',3),(45,'2015-06-20','autoškola',1),(45,'2015-07-08','zaspal',1),(46,'2015-02-12','autoškola',2),(46,'2015-08-10','autoškola',2),(47,'2015-02-03',NULL,1),(47,'2015-02-19','nevolnost',7),(47,'2015-09-14','nemoc',7),(48,'2015-05-07','nemoc',6),(49,'2015-05-22','rodinné duvody',6),(50,'2015-07-22','lékar',1),(50,'2015-08-16',NULL,1),(50,'2015-09-09','doprava',0);
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmety`
--

DROP TABLE IF EXISTS `predmety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predmety` (
  `Zkr_predmetu` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `Nazev` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`Zkr_predmetu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmety`
--

LOCK TABLES `predmety` WRITE;
/*!40000 ALTER TABLE `predmety` DISABLE KEYS */;
INSERT INTO `predmety` VALUES ('ANJ','Anglický jazyk'),('ASE','Seminá? z angličtiny'),('ATT','Automatizační technika'),('BIO','Biologie'),('CAD','CAD systémy'),('CIT','?íslicová technika'),('CJL','?eský jazyk a literatura'),('DAS','Databázové systémy'),('DEJ','D?jepis'),('DEK','Deskriptivní geometrie'),('EKO','Ekonomika'),('ELA','Elektrotechnická m??ení'),('ELG','Elektrotechnologie'),('ELR','Elektronika'),('ELT','Elektrotechnika'),('ENV','Enviromentální výchova'),('EPO','Elektronické po?íta?ové systémy'),('FYZ','Fyzika'),('GKO','Grafická komunikace'),('GRS','Grafické systémy	'),('CHE','Chemie'),('CHK','Chemie a ekologie'),('ICT','Informa?ní a komunika?ní technologie'),('MAT','Matematika'),('MIT','Mikroprocesorová technika'),('MSE','Seminá? z matematiky'),('OBN','Ob?anská nauka'),('OPS','Opera?ní systémy'),('POS','Po?íta?ové systémy'),('PRA','Praxe'),('PRG','Programování'),('PRV','Programové vybavení'),('PVY','Pr?myslové výtvarnictví'),('REZ','Radioelektronická za?ízení'),('SDE','Seminá? z digitální elektroniky'),('SIT','Sí?ové informa?ní technologie'),('SIZ','Silnoproudá za?ízení'),('SPH','Sportovní hry'),('SST','Sí?ové informa?ní technologie'),('STR','Strojnictví'),('TED','Technická dokumentace'),('TEK','Technické kreslení'),('TEV','T?lesná výchova'),('TEZ','Telekomunika?ní za?ízení'),('ZAE','Základy elektrotechniky'),('ZEM','Zem?pis');
/*!40000 ALTER TABLE `predmety` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `hodnoceni`
--

DROP TABLE IF EXISTS `hodnoceni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hodnoceni` (
  `Zkr_predmetu` varchar(255) COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `Datum` date NOT NULL DEFAULT '0000-00-00',
  `IDs` int(11) NOT NULL DEFAULT '0',
  `Znamka` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Zkr_predmetu`,`Datum`,`IDs`),
  KEY `hod_pre_fk_idx` (`Zkr_predmetu`),
  KEY `hod_stu_fk_idx` (`IDs`),
  CONSTRAINT `hod_pre_fk` FOREIGN KEY (`Zkr_predmetu`) REFERENCES `predmety` (`Zkr_predmetu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hod_stu_fk` FOREIGN KEY (`IDs`) REFERENCES `student` (`IDs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hodnoceni`
--

LOCK TABLES `hodnoceni` WRITE;
/*!40000 ALTER TABLE `hodnoceni` DISABLE KEYS */;
INSERT INTO `hodnoceni` VALUES ('ANJ','2014-03-19',3,2),('ANJ','2014-03-19',13,1),('ANJ','2014-03-22',8,2),('ANJ','2014-03-29',24,1),('ANJ','2014-04-01',14,1),('ANJ','2014-04-27',14,3),('CJL','2014-02-03',19,4),('CJL','2014-02-18',9,3),('CJL','2014-02-23',4,1),('CJL','2014-02-25',13,5),('CJL','2014-02-28',37,3),('CJL','2014-03-03',10,4),('CJL','2014-03-20',7,3),('CJL','2014-03-21',23,1),('CJL','2014-03-21',37,1),('CJL','2014-03-25',14,4),('CJL','2014-03-26',12,5),('CJL','2014-03-31',16,1),('CJL','2014-04-02',4,4),('CJL','2014-04-02',20,4),('CJL','2014-04-20',23,3),('CJL','2014-05-01',7,3),('CJL','2014-05-02',13,5),('CJL','2014-05-03',12,4),('DAS','2014-01-20',8,3),('DAS','2014-01-29',15,1),('DAS','2014-02-24',12,4),('DAS','2014-03-19',42,2),('DAS','2014-03-22',9,2),('DAS','2014-03-23',3,3),('DAS','2014-03-24',9,1),('DAS','2014-03-25',11,4),('DAS','2014-03-28',15,3),('DAS','2014-04-01',15,2),('DAS','2014-04-21',6,2),('DAS','2014-04-27',16,2),('DAS','2014-05-19',21,2),('EKO','2014-02-23',12,3),('EKO','2014-03-01',1,2),('EKO','2014-03-23',10,3),('EKO','2014-03-27',7,2),('EKO','2014-05-09',18,1),('ELA','2014-03-27',18,1),('ELA','2014-04-22',22,3),('ELA','2014-04-23',9,2),('GRS','2014-03-26',6,5),('GRS','2014-03-30',16,2),('GRS','2014-04-01',19,1),('ICT','2014-05-01',40,3),('ICT','2014-06-25',10,1),('MAT','2014-02-16',24,1),('MAT','2014-02-24',31,1),('MAT','2014-02-27',14,3),('MAT','2014-02-27',43,2),('MAT','2014-03-24',24,2),('MAT','2014-03-25',5,4),('MAT','2014-03-27',14,2),('MAT','2014-03-28',15,5),('MAT','2014-03-31',17,3),('MAT','2014-04-01',6,2),('MAT','2014-04-03',5,5),('MAT','2014-04-30',17,2),('MAT','2014-05-01',18,3),('MAT','2014-05-05',21,5),('OPS','2014-03-21',8,1),('OPS','2014-05-01',44,1),('POS','2014-03-30',19,2),('POS','2014-05-03',20,5);
/*!40000 ALTER TABLE `hodnoceni` ENABLE KEYS */;
UNLOCK TABLES;





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 11:51:31
