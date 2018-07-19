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
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse` (
  `RCTrack` char(4) NOT NULL,
  `RCDate` date NOT NULL,
  `RCRace` tinyint(4) NOT NULL,
  `AeMto` char(2) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Horse` varchar(22) NOT NULL,
  `FD` char(2) DEFAULT NULL,
  `TripleCrown` char(2) DEFAULT NULL,
  `Sex` char(2) DEFAULT NULL,
  `YBorn` int(11) DEFAULT NULL,
  `MBorn` tinyint(4) DEFAULT NULL,
  `State` char(6) DEFAULT NULL,
  `Breeder` varchar(58) DEFAULT NULL,
  `Color` varchar(12) DEFAULT NULL,
  `Sire` varchar(22) DEFAULT NULL,
  `SireSire` varchar(22) DEFAULT NULL,
  `Dam` varchar(22) DEFAULT NULL,
  `DamSire` varchar(22) DEFAULT NULL,
  `Owner` varchar(40) DEFAULT NULL,
  `Sale` char(6) DEFAULT NULL,
  `SaleYear` smallint(6) DEFAULT NULL,
  `SalePrice` decimal(8,2) DEFAULT NULL,
  `LastRaced` date DEFAULT NULL,
  `Bute` char(2) DEFAULT NULL,
  `Lasix` char(2) DEFAULT NULL,
  `Blinker` char(2) DEFAULT NULL,
  `ClaimPrice` decimal(6,2) DEFAULT NULL,
  `Apprentice` char(2) DEFAULT NULL,
  `Jockey` varchar(22) DEFAULT NULL,
  `Trainer` varchar(22) DEFAULT NULL,
  `PostPosition` tinyint(4) DEFAULT NULL,
  `CYEarnings` decimal(8,3) DEFAULT NULL,
  `CYStarts` tinyint(4) DEFAULT NULL,
  `CYWins` tinyint(4) DEFAULT NULL,
  `CYPlaces` tinyint(4) DEFAULT NULL,
  `CYShows` tinyint(4) DEFAULT NULL,
  `PYEarnings` decimal(8,3) DEFAULT NULL,
  `PYStarts` tinyint(4) DEFAULT NULL,
  `PYWins` tinyint(4) DEFAULT NULL,
  `PYPlaces` tinyint(4) DEFAULT NULL,
  `PYShows` tinyint(4) DEFAULT NULL,
  `Earnings` decimal(8,3) DEFAULT NULL,
  `Starts` smallint(6) DEFAULT NULL,
  `Wins` smallint(6) DEFAULT NULL,
  `Places` smallint(6) DEFAULT NULL,
  `Shows` smallint(6) DEFAULT NULL,
  `WEarnings` decimal(8,3) DEFAULT NULL,
  `WStarts` smallint(6) DEFAULT NULL,
  `WWins` smallint(6) DEFAULT NULL,
  `WPlaces` smallint(6) DEFAULT NULL,
  `WShows` smallint(6) DEFAULT NULL,
  `TEarnings` decimal(8,3) DEFAULT NULL,
  `TStarts` smallint(6) DEFAULT NULL,
  `TWins` smallint(6) DEFAULT NULL,
  `TPlaces` smallint(6) DEFAULT NULL,
  `TShows` smallint(6) DEFAULT NULL,
  `DEarnings` decimal(8,3) DEFAULT NULL,
  `DStarts` smallint(6) DEFAULT NULL,
  `DWins` smallint(6) DEFAULT NULL,
  `DPlaces` smallint(6) DEFAULT NULL,
  `DShows` smallint(6) DEFAULT NULL,
  `TrkEarnings` decimal(8,3) DEFAULT NULL,
  `TrkStarts` smallint(6) DEFAULT NULL,
  `TrkWins` smallint(6) DEFAULT NULL,
  `TrkPlaces` smallint(6) DEFAULT NULL,
  `TrkShows` smallint(6) DEFAULT NULL,
  `DistEarnings` decimal(8,3) DEFAULT NULL,
  `DistStarts` smallint(6) DEFAULT NULL,
  `DistWins` smallint(6) DEFAULT NULL,
  `DistPlaces` smallint(6) DEFAULT NULL,
  `DistShows` smallint(6) DEFAULT NULL,
  `Entry` char(2) DEFAULT NULL,
  `JockMeetStarts` int(11) DEFAULT NULL,
  `JockMeetEarnings` decimal(8,3) DEFAULT NULL,
  `JockMeetWins` int(11) DEFAULT NULL,
  `JockMeetPlaces` int(11) DEFAULT NULL,
  `JockMeetShows` int(11) DEFAULT NULL,
  `JockMeetWinPct` decimal(4,2) DEFAULT NULL,
  `JockMeetMoneyPct` decimal(4,2) DEFAULT NULL,
  `JockYTDStarts` int(11) DEFAULT NULL,
  `JockYTDEarnings` decimal(8,3) DEFAULT NULL,
  `JockYTDWins` int(11) DEFAULT NULL,
  `JockYTDPlaces` int(11) DEFAULT NULL,
  `JockYTDShows` int(11) DEFAULT NULL,
  `JockYTDWinPct` decimal(4,2) DEFAULT NULL,
  `JockYTDMoneyPct` decimal(4,2) DEFAULT NULL,
  `TrainerMeetStarts` int(11) DEFAULT NULL,
  `TrainerMeetEarnings` decimal(8,3) DEFAULT NULL,
  `TrainerMeetWins` int(11) DEFAULT NULL,
  `TrainerMeetPlaces` int(11) DEFAULT NULL,
  `TrainerMeetShows` int(11) DEFAULT NULL,
  `TrainerMeetWinPct` decimal(4,2) DEFAULT NULL,
  `TrainerMeetMoneyPct` decimal(4,2) DEFAULT NULL,
  `TrainerYTDStarts` int(11) DEFAULT NULL,
  `TrainerYTDEarnings` decimal(8,3) DEFAULT NULL,
  `TrainerYTDWins` int(11) DEFAULT NULL,
  `TrainerYTDPlaces` int(11) DEFAULT NULL,
  `TrainerYTDShows` int(11) DEFAULT NULL,
  `TrainerYTDWinPct` decimal(4,2) DEFAULT NULL,
  `TrainerYTDMoneyPct` decimal(4,2) DEFAULT NULL,
  `QtrStarts` smallint(6) DEFAULT NULL,
  `QtrEarnings` decimal(8,3) DEFAULT NULL,
  `QtrWins` smallint(6) DEFAULT NULL,
  `QtrPlaces` smallint(6) DEFAULT NULL,
  `QtrShows` smallint(6) DEFAULT NULL,
  `EnteredTrack` char(4) DEFAULT NULL,
  `EnteredDate` date DEFAULT NULL,
  `EnteredRace` tinyint(4) DEFAULT NULL,
  `StatsPriorYear` date DEFAULT NULL,
  `StudFee` decimal(8,3) DEFAULT NULL,
  `Scratch` char(2) DEFAULT NULL,
  `JTTrackPeriod` char(7) DEFAULT NULL,
  `JTTrackStarts` smallint(6) DEFAULT NULL,
  `JTTrackEarnings` decimal(6,2) DEFAULT NULL,
  `JTTrackWinPct` decimal(5,2) DEFAULT NULL,
  `JTAllStarts` smallint(6) DEFAULT NULL,
  `JTAllWinPct` decimal(5,2) DEFAULT NULL,
  `JTAllRoi` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`RCTrack`,`RCDate`,`RCRace`,`Horse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:27
