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
-- Table structure for table `partimes`
--

DROP TABLE IF EXISTS `partimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partimes` (
  `Track` char(4) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Surface` char(2) DEFAULT NULL,
  `Distance` decimal(6,2) DEFAULT NULL,
  `TrkCond` char(4) DEFAULT NULL,
  `RaceSex` char(2) DEFAULT NULL,
  `RaceAge` char(2) DEFAULT NULL,
  `StateBred` char(2) DEFAULT NULL,
  `Class` char(4) DEFAULT NULL,
  `LongClass` varchar(14) DEFAULT NULL,
  `LowClaimingPrice` decimal(6,2) DEFAULT NULL,
  `HighClaimingPrice` decimal(6,2) DEFAULT NULL,
  `LowPurse` decimal(8,3) DEFAULT NULL,
  `HighPurse` decimal(8,3) DEFAULT NULL,
  `LowClass` varchar(14) DEFAULT NULL,
  `HighClass` varchar(14) DEFAULT NULL,
  `Grade` tinyint(4) DEFAULT NULL,
  `NumberOfRaces` int(11) DEFAULT NULL,
  `FirstFractSum` decimal(8,2) DEFAULT NULL,
  `SecondFractSum` decimal(8,2) DEFAULT NULL,
  `ThirdFractSum` decimal(8,2) DEFAULT NULL,
  `FourthFractSum` decimal(8,2) DEFAULT NULL,
  `FifthFractSum` decimal(8,2) DEFAULT NULL,
  `SixthFractSum` decimal(8,2) DEFAULT NULL,
  `FinalTimeSum` decimal(8,2) DEFAULT NULL,
  `FirstFractSumOfSquares` decimal(9,2) DEFAULT NULL,
  `SecondFractSumOfSquares` decimal(9,2) DEFAULT NULL,
  `ThirdFractSumOfSquares` decimal(9,2) DEFAULT NULL,
  `FourthFractSumOfSquare` decimal(9,2) DEFAULT NULL,
  `FifthFractSumOfSquares` decimal(9,2) DEFAULT NULL,
  `SixthFractSumOfSquares` decimal(9,2) DEFAULT NULL,
  `FinalTimeSumOfSquares` decimal(9,2) DEFAULT NULL,
  `FirstFractSumSquared` decimal(9,2) DEFAULT NULL,
  `SecondFractSumSquare` decimal(9,2) DEFAULT NULL,
  `ThirdFractSumSquared` decimal(9,2) DEFAULT NULL,
  `FourthFractSumSquare` decimal(9,2) DEFAULT NULL,
  `FifthFractSumSquared` decimal(9,2) DEFAULT NULL,
  `SixthFractSumSquared` decimal(9,2) DEFAULT NULL,
  `FinalTimeSumSquared` decimal(9,2) DEFAULT NULL,
  `FirstFractStdDev` decimal(6,2) DEFAULT NULL,
  `SecondFractStdDev` decimal(6,2) DEFAULT NULL,
  `ThirdFractStdDev` decimal(6,2) DEFAULT NULL,
  `FourthFractStdDev` decimal(6,2) DEFAULT NULL,
  `FifthFractStdDev` decimal(6,2) DEFAULT NULL,
  `SixthFractStdDev` decimal(6,2) DEFAULT NULL,
  `FinalTimeStdDev` decimal(6,2) DEFAULT NULL,
  `FirstFractPar` decimal(6,2) DEFAULT NULL,
  `SecondFractPar` decimal(6,2) DEFAULT NULL,
  `ThirdFractPar` decimal(6,2) DEFAULT NULL,
  `FourthFractPar` decimal(6,2) DEFAULT NULL,
  `FifthFractPar` decimal(6,2) DEFAULT NULL,
  `SixthFractPar` decimal(6,2) DEFAULT NULL,
  `FinalTimePar` decimal(6,2) DEFAULT NULL,
  KEY `Track` (`Track`,`StartDate`,`EndDate`,`Surface`,`Distance`,`TrkCond`,`RaceSex`,`RaceAge`,`StateBred`,`Class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19  9:47:27
