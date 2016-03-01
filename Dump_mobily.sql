-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: mobily
-- ------------------------------------------------------
-- Server version	5.5.16

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

create database mobily character set utf8 collate utf8_czech_ci;
use mobily;
--
-- Table structure for table `mobily`
--

DROP TABLE IF EXISTS `mobily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobily` (
  `Kod_telefonu` varchar(50) COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `Vyrobce` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Typ` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Cena_bez_DPH` double NOT NULL,
  PRIMARY KEY (`Kod_telefonu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobily`
--

LOCK TABLES `mobily` WRITE;
/*!40000 ALTER TABLE `mobily` DISABLE KEYS */;
INSERT INTO `mobily` (`Kod_telefonu`, `Vyrobce`, `Typ`, `Cena_bez_DPH`) VALUES ('1000','Nokia','1800',897),('1001','Nokia','C2',2402),('1002','Samsung','Galaxy 551',4577),('1003','Sony','Experia X8',2977),('1004','Apple','iPhone 4',16299),('1005','Nokia','7650',9447),('1006','BlackBerry','Bold 9780',10299),('1007','Nokia','6101',3950),('1008','BlackBerry','8520',4899),('1009','Samsung','S5260 Star II',2370),('1010','HTC','Desire HD',12299),('1011','Sony','Experia mini',5777),('1012','Motorola','Defy',6370),('1013','HTC','Wildfire S',6199),('1014','Nokia','C5',4699),('1015','Sony Ericsson','K750i',4400),('1016','Nokia','E7',12200),('1017','Nokia','E1170i',599),('1018','Samsung','Xcover 271',2899),('1020','Huawei','Ideos X5',4977),('1021','LG','P970 Optimus',7177),('1022','LG','Optimus 3D',10337),('1023','Nokia','N8',10977),('1024','HTC','EVO 3D',13177),('1025','Apple','iPhone 5',19765),('1026','Samsung','S5660',2999),('1027','Nokia','Lumia 520',2777),('1028','Nokia','Lumia 625',4789);
/*!40000 ALTER TABLE `mobily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objednavky`
--

DROP TABLE IF EXISTS `objednavky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objednavky` (
  `Kod_objednavky` int(11) NOT NULL,
  `Kod_zakaznika` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `Datum_zadani` date NOT NULL,
  `Zpusob_platby` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Splatnost` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `Vyrizeni` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Kod_objednavky`),
  KEY `objed_zakaz_fk_idx` (`Kod_zakaznika`),
  CONSTRAINT `objed_zakaz_fk` FOREIGN KEY (`Kod_zakaznika`) REFERENCES `zakaznici` (`Kod_zakaznika`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objednavky`
--

LOCK TABLES `objednavky` WRITE;
/*!40000 ALTER TABLE `objednavky` DISABLE KEYS */;
INSERT INTO `objednavky` (`Kod_objednavky`, `Kod_zakaznika`, `Datum_zadani`, `Zpusob_platby`, `Splatnost`, `Vyrizeni`) VALUES (5,'0004','2015-07-18','Karta','60','\0'),(8,'2155','2015-09-03','Prevod','14','\0'),(9,'2222','2014-09-02','Cash','0','\0'),(10,'6456','2015-07-06','Prevod','21','\0'),(11,'9531','2013-10-02','Karta','14','\0'),(12,'0012','2015-10-04','Cash','0','\0'),(13,'0002','2015-01-15','Cash','0','\0'),(14,'0012','2014-09-08','Cash','0','\0'),(15,'0005','2015-01-03','Prevod','21','\0'),(16,'1235','2015-11-05','Karta','14','\0'),(17,'9685','2015-03-22','Cash','0','\0'),(19,'5698','2015-11-08','Cash','0','\0'),(20,'2136','2015-09-18','Prevod','14','\0'),(21,'0100','2015-03-22','Prevod','14','\0'),(22,'0005','2015-07-09','Prevod','21','\0'),(23,'0100','2015-02-23','Cash','0','\0'),(24,'0002','2015-08-03','Karta','14','\0'),(26,'0100','2014-12-19','Cash','0','\0'),(27,'0056','2014-08-23','Cash','0','\0'),(28,'0012','2015-11-01','Karta','14','\0'),(29,'0005','2014-08-22','Cash','0','\0'),(30,'9531','2015-03-24','Cash','0','\0'),(31,'5698','2015-07-12','Cash','0','\0'),(32,'0002','2015-09-30','Cash','0','\0'),(33,'9531','2015-11-09','Cash','0','\0'),(34,'2356','2015-07-20','Cash','0','\0');
/*!40000 ALTER TABLE `objednavky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obsah`
--

DROP TABLE IF EXISTS `obsah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obsah` (
  `Kod_objednavky` int(11) NOT NULL DEFAULT '0',
  `Kod_telefonu` varchar(50) COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `Pocet_kusu` int(11) NOT NULL,
  PRIMARY KEY (`Kod_objednavky`,`Kod_telefonu`),
  KEY `obs_obj_fk_idx` (`Kod_objednavky`),
  KEY `obs_mob_fk_idx` (`Kod_telefonu`),
  CONSTRAINT `obs_mob_fk` FOREIGN KEY (`Kod_telefonu`) REFERENCES `mobily` (`Kod_telefonu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `obs_obj_fk` FOREIGN KEY (`Kod_objednavky`) REFERENCES `objednavky` (`Kod_objednavky`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obsah`
--

LOCK TABLES `obsah` WRITE;
/*!40000 ALTER TABLE `obsah` DISABLE KEYS */;
INSERT INTO `obsah` (`Kod_objednavky`, `Kod_telefonu`, `Pocet_kusu`) VALUES (5,'1005',10),(9,'1012',10),(11,'1008',11),(11,'1011',12),(12,'1004',1),(12,'1007',11),(13,'1002',10),(13,'1011',5),(14,'1003',3),(14,'1004',5),(14,'1009',6),(15,'1010',10),(15,'1012',5),(16,'1007',10),(16,'1008',8),(16,'1010',3),(16,'1011',5),(19,'1001',5),(19,'1006',5),(20,'1008',10),(21,'1005',10),(21,'1010',5),(22,'1011',10),(22,'1012',5),(23,'1013',15),(23,'1014',10),(24,'1007',5),(24,'1013',6),(24,'1014',13),(26,'1001',1),(26,'1010',10),(26,'1011',13),(26,'1013',10),(26,'1014',15),(27,'1014',1),(27,'1017',1),(27,'1018',1),(27,'1020',1),(27,'1022',1),(27,'1023',1),(27,'1024',1),(28,'1004',1),(28,'1008',1),(28,'1010',1),(28,'1023',1),(28,'1024',1),(29,'1000',10),(29,'1001',10),(29,'1005',10),(30,'1013',10),(31,'1006',10),(31,'1010',10),(31,'1013',10),(31,'1014',10),(32,'1002',1),(32,'1013',1),(32,'1025',1),(33,'1013',1),(33,'1025',1),(33,'1027',1),(34,'1003',1),(34,'1004',1),(34,'1006',1),(34,'1010',1),(34,'1022',1),(34,'1023',1),(34,'1024',1),(34,'1025',1),(34,'1026',1);
/*!40000 ALTER TABLE `obsah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakaznici`
--

DROP TABLE IF EXISTS `zakaznici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zakaznici` (
  `Kod_zakaznika` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Jmeno` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `Prijmeni` varchar(25) COLLATE utf8_czech_ci NOT NULL,
  `Ulice` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `Mesto` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `PSc` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `Telefon` varchar(15) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`Kod_zakaznika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaznici`
--

LOCK TABLES `zakaznici` WRITE;
/*!40000 ALTER TABLE `zakaznici` DISABLE KEYS */;
INSERT INTO `zakaznici` (`Kod_zakaznika`, `Jmeno`, `Prijmeni`, `Ulice`, `Mesto`, `PSc`, `Telefon`) VALUES ('0001','Jiri','Andiel','Jirská 16','Ostrava','70200','671222333'),('0002','Jan','Hajduk','Pod Kovárnu 13','Vratimov','73932','564323123'),('0003','Jan','Svrek','Jirská 18','Ostrava-Vítkovice','70200','649159488'),('0004','Petra','Hajduková','Strmá 602','Vratimov','73932','425115116'),('0005','Roman','Musialek','U lesíka 7','Dolní Datyne','73905','875436999'),('0012','Jan','Jost','Smrkova 962','Šenov','75651','545246546'),('0056','Ivo','Kuba',NULL,NULL,NULL,NULL),('0057','Martin','Novák',NULL,'Ostrava',NULL,NULL),('0100','Martin','Polasek','Okružní 56','Ostrava-Vítkovice','74568','725669999'),('0987','Lucie','Ferfecká','Malá 7','Bohumín',NULL,NULL),('1235','Irena','Pindová','K statku 161','Havírov','73934','596887700'),('2136','Petra','Janská','Smrková','Ostrava-Radvanice',NULL,NULL),('2155','Karel','Nový','Lesní 3','Ostrava-Radvanice','72121','254555455'),('2222','Jan','Malý','Zelená 96','Ostrava-Dubina','72466',NULL),('2356','Karla','Novotná',NULL,'Ostrava-Prívoz',NULL,'653637786'),('2365','Jan','Malý','Kratochvílova 5','Petrvald',NULL,'434357965'),('2754','Ivana','Hrubá','Lesní 7','Orlová',NULL,NULL),('2875','Zuzana','Nejedlá','Okrajová 78','Orlová-Lutyne',NULL,'535479595'),('5689','Karel','Jan','Kolmá','Ostrava','70200',NULL),('5690','Jan','Nový','Lomá','Ostrava',NULL,'354667975'),('5691','Marcela','Malá',NULL,'Havírov-Mesto',NULL,NULL),('5698','Petr','Jan','U potoka 698','Petrvald',NULL,NULL),('6456','Ondra','Malý','Pod horou 3','Petrvald','73965','698434654'),('6549','Jan','Nový','Strmá 5','Ostrava-Radvanice',NULL,NULL),('9531','Petr','Pavel','Ostrá 6','Havírov-Bludovice','73601',NULL),('9685','Petr','Kuba','Maticní 6','Ostrava-Moravská Ostrava',NULL,'255656879');
/*!40000 ALTER TABLE `zakaznici` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-07 13:49:25
