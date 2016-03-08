CREATE DATABASE  IF NOT EXISTS `car_pooling` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `car_pooling`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: car_pooling
-- ------------------------------------------------------
-- Server version	5.5.41

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

--
-- Table structure for table `user_route`
--

DROP TABLE IF EXISTS `user_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_route` (
  `user_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `route_source_id` int(11) NOT NULL,
  `route_destination_id` int(11) NOT NULL,
  PRIMARY KEY (`user_route_id`),
  KEY `username_fk_idx` (`username`),
  KEY `user_route_source_fk_idx` (`route_source_id`),
  KEY `user_route_destination_fk_idx` (`route_destination_id`),
  CONSTRAINT `username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_route_destination_fk` FOREIGN KEY (`route_destination_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_route_source_fk` FOREIGN KEY (`route_source_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_route`
--

LOCK TABLES `user_route` WRITE;
/*!40000 ALTER TABLE `user_route` DISABLE KEYS */;
INSERT INTO `user_route` VALUES (2,'alex',9,2),(3,'alex',9,2),(4,'alex',2,9),(5,'alex',2,9),(6,'alex',2,9),(7,'alex',2,9),(8,'alex',2,9),(9,'alex',2,9),(10,'alex',2,9),(11,'alex',2,9),(12,'alex',2,9),(13,'alex',2,9),(14,'alex',2,9),(15,'alex',2,9),(16,'alex',2,9),(17,'alex',2,9),(18,'alex',2,9),(19,'alex',2,9),(20,'alex',2,9),(21,'alex',2,9),(22,'alex',2,9),(23,'alex',2,9),(24,'alex',2,9),(25,'alex',2,9),(26,'alex',2,9),(27,'alex',2,9),(28,'alex',2,9),(29,'alex',2,9),(30,'alex',2,9),(31,'alex',2,9),(32,'alex',2,9),(33,'alex',2,9),(35,'alex',2,9),(36,'alex',2,9),(37,'alex',2,9),(38,'alex',2,9),(39,'alex',2,9),(40,'alex',2,9),(42,'alex',2,9),(44,'alex',2,9),(45,'alex',2,9),(46,'alex',2,9),(47,'alex',2,9),(49,'alex',2,9),(50,'alex',2,9),(51,'alex',2,9),(52,'alex',2,9),(53,'alex',2,9),(54,'alex',2,9),(55,'alex',2,9),(56,'alex',2,9),(57,'alex',2,9),(58,'alex',2,9),(59,'alex',2,9),(60,'alex',2,9),(61,'CarOwner1',2,9),(62,'CarOwner1',2,9),(63,'CarOwner1',2,9),(64,'CarOwner1',2,9);
/*!40000 ALTER TABLE `user_route` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-07 18:03:25
