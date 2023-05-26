-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.11.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hotel_252
CREATE DATABASE IF NOT EXISTS `hotel_252` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `hotel_252`;

-- Dumping structure for table hotel_252.books
CREATE TABLE IF NOT EXISTS `books` (
  `Room_No` int(11) DEFAULT NULL,
  `Book_ID` int(11) NOT NULL,
  `Check_In` date DEFAULT NULL,
  `Check_Out` date DEFAULT NULL,
  `Customer_ID` varchar(50) DEFAULT NULL,
  `Payment_ID` int(11) DEFAULT NULL,
  `No_Nights` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  KEY `FK_Room_No` (`Room_No`),
  KEY `FK_Payment_ID` (`Payment_ID`),
  KEY `FK_Customer_ID` (`Customer_ID`),
  CONSTRAINT `FK_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_ID` FOREIGN KEY (`Payment_ID`) REFERENCES `payments` (`Payment_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Room_No` FOREIGN KEY (`Room_No`) REFERENCES `room_table` (`Room_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.books: ~0 rows (approximately)

-- Dumping structure for table hotel_252.book_extra_services
CREATE TABLE IF NOT EXISTS `book_extra_services` (
  `Book_ID` int(11) DEFAULT NULL,
  `Serv_ID` int(11) DEFAULT NULL,
  KEY `FK_BOOK_ID` (`Book_ID`),
  KEY `FK_Serv_ID` (`Serv_ID`),
  CONSTRAINT `FK_BOOK_ID` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`Book_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Serv_ID` FOREIGN KEY (`Serv_ID`) REFERENCES `extra_services` (`Serv_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.book_extra_services: ~0 rows (approximately)

-- Dumping structure for table hotel_252.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer_ID` varchar(50) NOT NULL DEFAULT '0',
  `Customer_Age` int(11) DEFAULT NULL,
  `Customer_Phone` varchar(25) DEFAULT NULL,
  `Customer_Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.customers: ~0 rows (approximately)

-- Dumping structure for table hotel_252.extra_services
CREATE TABLE IF NOT EXISTS `extra_services` (
  `Serv_ID` int(11) NOT NULL DEFAULT 0,
  `Serv_Name` varchar(50) DEFAULT '0',
  `Serv_Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Serv_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.extra_services: ~4 rows (approximately)
REPLACE INTO `extra_services` (`Serv_ID`, `Serv_Name`, `Serv_Price`) VALUES
	(1, 'Breakfast', 50),
	(2, 'Dinner', 50),
	(3, 'Gym', 100),
	(4, 'Valet', 150);

-- Dumping structure for table hotel_252.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_Type` varchar(50) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.payments: ~0 rows (approximately)

-- Dumping structure for table hotel_252.room_table
CREATE TABLE IF NOT EXISTS `room_table` (
  `Room_No` int(11) NOT NULL AUTO_INCREMENT,
  `Room_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Room_No`),
  KEY `FK_ROOM_Type` (`Room_Type`),
  CONSTRAINT `FK_ROOM_Type` FOREIGN KEY (`Room_Type`) REFERENCES `room_types` (`Type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.room_table: ~10 rows (approximately)
REPLACE INTO `room_table` (`Room_No`, `Room_Type`) VALUES
	(6, 'Double'),
	(7, 'Double'),
	(8, 'Double'),
	(9, 'Double'),
	(10, 'Double'),
	(1, 'Singel'),
	(2, 'Singel'),
	(3, 'Singel'),
	(4, 'Singel'),
	(5, 'Singel');

-- Dumping structure for table hotel_252.room_types
CREATE TABLE IF NOT EXISTS `room_types` (
  `Type` varchar(50) NOT NULL DEFAULT 'X',
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table hotel_252.room_types: ~2 rows (approximately)
REPLACE INTO `room_types` (`Type`, `Price`) VALUES
	('Double', 150),
	('Singel', 100);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
