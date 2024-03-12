-- --------------------------------------------------------
-- Host:                         localhost
-- Versione server:              5.7.14 - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database api_example
CREATE DATABASE IF NOT EXISTS `api_example` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `api_example`;

-- Dump della struttura di tabella api_example.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstparent_id` int(11) DEFAULT NULL,
  `secondparent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firstparent_id` (`firstparent_id`),
  KEY `secondparent_id` (`secondparent_id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`firstparent_id`) REFERENCES `person` (`id`) ON DELETE SET NULL,
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`secondparent_id`) REFERENCES `person` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella api_example.person: ~9 rows (circa)
INSERT INTO `person` (`id`, `firstname`, `lastname`, `firstparent_id`, `secondparent_id`) VALUES
	(1, 'Krasimir', 'Hristozov', NULL, NULL),
	(2, 'Maria', 'Hristozova', NULL, NULL),
	(3, 'Masha', 'Hristozova', 1, 2),
	(4, 'Jane', 'Smith', NULL, NULL),
	(5, 'John', 'Smith', NULL, NULL),
	(6, 'Richard', 'Smith', 4, 5),
	(7, 'Donna', 'Smith', 4, 5),
	(8, 'Josh', 'Harrelson', NULL, NULL),
	(9, 'Anna', 'Harrelson', 7, 8);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
