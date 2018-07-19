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
-- Table structure for table `runningline`
--

DROP TABLE IF EXISTS `runningline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runningline` (
  `RCTrack` char(4) NOT NULL,
  `RCDate` date NOT NULL,
  `RCRace` tinyint(4) NOT NULL,
  `Horse` varchar(22) NOT NULL,
  `FD` char(2) DEFAULT NULL,
  `ForeignRace` char(1) DEFAULT NULL,
  `DateofRace` date NOT NULL,
  `Track` char(4) NOT NULL,
  `Race` tinyint(4) DEFAULT NULL,
  `Surface` char(2) DEFAULT NULL,
  `TimeformCode` char(1) DEFAULT NULL,
  `InnerCode` char(2) DEFAULT NULL,
  `Distance` decimal(6,2) DEFAULT NULL,
  `Class` char(4) DEFAULT NULL,
  `LongClass` varchar(14) DEFAULT NULL,
  `ClaimPrice` decimal(6,2) DEFAULT NULL,
  `Purse` decimal(8,3) DEFAULT NULL,
  `TrkCond` char(4) DEFAULT NULL,
  `RaceSex` char(2) DEFAULT NULL,
  `RaceAge` char(2) DEFAULT NULL,
  `StateBred` char(2) DEFAULT NULL,
  `Starters` tinyint(4) DEFAULT NULL,
  `FirstFraction` decimal(6,2) DEFAULT NULL,
  `SecondFraction` decimal(6,2) DEFAULT NULL,
  `ThirdFraction` decimal(6,2) DEFAULT NULL,
  `FourthFraction` decimal(6,2) DEFAULT NULL,
  `FifthFraction` decimal(6,2) DEFAULT NULL,
  `SixthFraction` decimal(6,2) DEFAULT NULL,
  `FinalTime` decimal(6,2) DEFAULT NULL,
  `FirstHorse` varchar(22) DEFAULT NULL,
  `SecondHorse` varchar(22) DEFAULT NULL,
  `ThirdHorse` varchar(22) DEFAULT NULL,
  `FirstWeight` int(11) DEFAULT NULL,
  `SecondWeight` int(11) DEFAULT NULL,
  `ThirdWeight` int(11) DEFAULT NULL,
  `FirstLenAdj` decimal(6,2) DEFAULT NULL,
  `SecondLenAdj` decimal(6,2) DEFAULT NULL,
  `ThirdLenAdj` decimal(6,2) DEFAULT NULL,
  `GradedRace` tinyint(4) DEFAULT NULL,
  `GradedRaceDesc` varchar(46) DEFAULT NULL,
  `ForeignCourse` char(1) DEFAULT NULL,
  `PostPosition` tinyint(4) DEFAULT NULL,
  `FirstCall` tinyint(4) DEFAULT NULL,
  `FirstCallLenAdj` decimal(6,2) DEFAULT NULL,
  `SecondCall` tinyint(4) DEFAULT NULL,
  `SecondCallLenAdj` decimal(6,2) DEFAULT NULL,
  `ThirdCall` tinyint(4) DEFAULT NULL,
  `ThirdCallLenAdj` decimal(6,2) DEFAULT NULL,
  `FourthCall` tinyint(4) DEFAULT NULL,
  `FourthCallLenAdj` decimal(6,2) DEFAULT NULL,
  `StrCall` tinyint(4) DEFAULT NULL,
  `StrCallLenAdj` decimal(6,2) DEFAULT NULL,
  `FinalCall` tinyint(4) DEFAULT NULL,
  `FinalCallLenAdj` decimal(6,2) DEFAULT NULL,
  `DQ` char(2) DEFAULT NULL,
  `DH` char(2) DEFAULT NULL,
  `DQPlace` tinyint(4) DEFAULT NULL,
  `Beyer` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Apprentice` tinyint(4) DEFAULT NULL,
  `Comment` varchar(22) DEFAULT NULL,
  `LongComment` varchar(72) DEFAULT NULL,
  `Odds` decimal(6,2) DEFAULT NULL,
  `OddsPosition` tinyint(4) DEFAULT NULL,
  `Claimed` char(2) DEFAULT NULL,
  `Lasix` char(2) DEFAULT NULL,
  `Bute` char(2) DEFAULT NULL,
  `Blinker` char(2) DEFAULT NULL,
  `Bandage` char(2) DEFAULT NULL,
  `AltEquipment` char(4) DEFAULT NULL,
  `Jockey` varchar(22) DEFAULT NULL,
  `Trainer` varchar(22) DEFAULT NULL,
  `Entries` char(2) DEFAULT NULL,
  `TrackVariant` int(11) DEFAULT NULL,
  `SpeedRating` int(11) DEFAULT NULL,
  `Breed` char(2) DEFAULT NULL,
  `Owner` varchar(36) DEFAULT NULL,
  `DistUnit` char(2) DEFAULT NULL,
  `TimeUnit` char(2) DEFAULT NULL,
  `LoPrice` decimal(6,2) DEFAULT NULL,
  `TrainYear` year(4) DEFAULT NULL,
  `TrainStarts` smallint(6) DEFAULT NULL,
  `TrainWins` smallint(6) DEFAULT NULL,
  `TrainPlaces` smallint(6) DEFAULT NULL,
  `TrainShows` smallint(6) DEFAULT NULL,
  `TrainWinPct` decimal(6,2) DEFAULT NULL,
  `SealedTrack` char(1) DEFAULT NULL,
  `PrevTrainYear` year(4) DEFAULT NULL,
  `PrevTrainStarts` smallint(6) DEFAULT NULL,
  `PrevTrainWins` smallint(6) DEFAULT NULL,
  `PrevTrainPlaces` smallint(6) DEFAULT NULL,
  `PrevTrainShows` smallint(6) DEFAULT NULL,
  `PrevTrainWinPct` decimal(6,2) DEFAULT NULL,
  `FirstFracHdths` decimal(6,2) DEFAULT NULL,
  `SecondFracHdths` decimal(6,2) DEFAULT NULL,
  `ThirdFracHdths` decimal(6,2) DEFAULT NULL,
  `FourthFracHdths` decimal(6,2) DEFAULT NULL,
  `FifthFracHdths` decimal(6,2) DEFAULT NULL,
  `SixthFracHdths` decimal(6,2) DEFAULT NULL,
  `FinalTimeHdths` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`RCTrack`,`RCDate`,`RCRace`,`Horse`,`DateofRace`,`Track`),
  KEY `Horse` (`Horse`,`Track`),
  KEY `Horse_2` (`Horse`,`DateofRace`),
  KEY `Track` (`Track`,`DateofRace`,`Race`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:27
