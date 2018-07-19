-- MySQL dump 10.16  Distrib 10.1.33-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: racingform
-- ------------------------------------------------------
-- Server version	10.1.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout` (
  `RCTrack` char(4) NOT NULL,
  `RCDate` date NOT NULL,
  `RCRace` tinyint(4) NOT NULL,
  `Horse` varchar(22) NOT NULL,
  `FD` char(2) DEFAULT NULL,
  `Track` char(4) NOT NULL,
  `DateofWork` date NOT NULL,
  `Surface` char(2) DEFAULT NULL,
  `Distance` decimal(6,2) DEFAULT NULL,
  `TrkCond` char(4) DEFAULT NULL,
  `WorkType` char(2) DEFAULT NULL,
  `WorkTime` decimal(6,2) DEFAULT NULL,
  `Bullet` char(2) DEFAULT NULL,
  `Comment` varchar(16) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `RankIn` int(11) DEFAULT NULL,
  `Race` int(11) DEFAULT NULL,
  `DistUnit` char(1) DEFAULT NULL,
  `TimeUnit` char(1) DEFAULT NULL,
  PRIMARY KEY (`RCTrack`,`RCDate`,`RCRace`,`Horse`,`Track`,`DateofWork`),
  KEY `Horse` (`Horse`,`Track`,`DateofWork`),
  KEY `Horse_2` (`Horse`,`DateofWork`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:28
