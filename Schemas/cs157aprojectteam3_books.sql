-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: cs157aprojectteam3
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ISBN` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('0000000000001','LORD OF THE RINGS',1954,5.5,1),('0000000000002','THE HOBBIT',1937,5.5,1),('0000000000003','HARRY POTTER AND THE CHAMBER OF SECRETS',1998,5.5,2),('0000000000004','CATCHER IN THE RYE',1951,3.5,5),('0000000000005','THE DA VINCI CODE',2003,9,4),('0000000000006','THE LION, THE WITCH AND THE WARDROBE',1950,5.5,3),('0000000000007','ANNE OF GREEN GABLES',1908,2.5,6),('0000000000008','CHARLOTTES WEB',1952,7.3,8),('0000000000009','TO KILL A MOCKINGBIRD',1960,4.5,9),('0000000000010','ANGELS AND DEMONS',2000,10,4),('0000000000011','1984',1949,5.5,10),('0000000000012','THE HUNGER GAMES',2008,6,11),('0000000000013','WOLF TOTEM',1998,5.5,14),('0000000000014','THE FAULT IN OUR STARS',2012,5.5,13),('0000000000015','ADVENTURES OF HUCKLEBERRY FINN',1885,5.5,15);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-08 17:38:14
