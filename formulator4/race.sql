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
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `RCTrack` char(4) NOT NULL,
  `RCDate` date NOT NULL,
  `RCRace` tinyint(4) NOT NULL,
  `Starters` tinyint(4) DEFAULT NULL,
  `TrackName` varchar(40) DEFAULT NULL,
  `RaceState` char(2) DEFAULT NULL,
  `Division` char(2) DEFAULT NULL,
  `RaceBred` char(2) DEFAULT NULL,
  `StateBred` char(2) DEFAULT NULL,
  `RaceSex` char(2) DEFAULT NULL,
  `RaceAge` char(2) DEFAULT NULL,
  `Class` char(4) DEFAULT NULL,
  `Purse` decimal(10,3) DEFAULT NULL,
  `HiClaim` decimal(10,3) DEFAULT NULL,
  `LoClaim` decimal(10,3) DEFAULT NULL,
  `Distance` decimal(6,3) DEFAULT NULL,
  `InnerCode` char(2) DEFAULT NULL,
  `Surface` char(2) DEFAULT NULL,
  `RaceType` char(2) DEFAULT NULL,
  `GradedRace` tinyint(4) DEFAULT NULL,
  `GradedRaceDesc` varchar(46) DEFAULT NULL,
  `SimTrack` char(4) DEFAULT NULL,
  `SimRace` tinyint(4) DEFAULT NULL,
  `TrackRecord` decimal(6,2) DEFAULT NULL,
  `DayOf_Week` varchar(10) DEFAULT NULL,
  `PostTime` char(6) DEFAULT NULL,
  `LongClass` varchar(14) DEFAULT NULL,
  `TrkAbbrev` varchar(30) DEFAULT NULL,
  `DistUnit` char(2) DEFAULT NULL,
  `TimeUnit` char(2) DEFAULT NULL,
  `Conditions` mediumtext,
  PRIMARY KEY (`RCTrack`,`RCDate`,`RCRace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:27
