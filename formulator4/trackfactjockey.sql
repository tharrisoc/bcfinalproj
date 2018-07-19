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
-- Table structure for table `trackfactjockey`
--

DROP TABLE IF EXISTS `trackfactjockey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackfactjockey` (
  `RCDate` date NOT NULL,
  `RCTrack` char(4) NOT NULL,
  `Jockey` varchar(22) NOT NULL,
  `Starts` decimal(5,2) DEFAULT NULL,
  `Wins` decimal(5,2) DEFAULT NULL,
  `Places` decimal(5,2) DEFAULT NULL,
  `Shows` decimal(5,2) DEFAULT NULL,
  `WinPercentage` decimal(5,2) DEFAULT NULL,
  `ITMPercentage` decimal(5,2) DEFAULT NULL,
  `AverageWinningPayoff` decimal(5,2) DEFAULT NULL,
  `SprintWins` decimal(5,2) DEFAULT NULL,
  `SprintStarts` decimal(5,2) DEFAULT NULL,
  `RouteWins` decimal(5,2) DEFAULT NULL,
  `RouteStarts` decimal(5,2) DEFAULT NULL,
  `TurfWins` decimal(5,2) DEFAULT NULL,
  `TurfStarts` decimal(5,2) DEFAULT NULL,
  `MainTrackWins` decimal(5,2) DEFAULT NULL,
  `MainTrackStarts` decimal(5,2) DEFAULT NULL,
  `MaidenAndClaimingWins` decimal(5,2) DEFAULT NULL,
  `MaidenAndClaimingStarts` decimal(5,2) DEFAULT NULL,
  `OtherWins` decimal(5,2) DEFAULT NULL,
  `OtherStarts` decimal(5,2) DEFAULT NULL,
  `WinsLastThirtyDays` decimal(5,2) DEFAULT NULL,
  `StartsLastThirtyDays` decimal(5,2) DEFAULT NULL,
  `WinsLastTenDays` decimal(5,2) DEFAULT NULL,
  `StartsLastTenDays` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`RCDate`,`RCTrack`,`Jockey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:28
