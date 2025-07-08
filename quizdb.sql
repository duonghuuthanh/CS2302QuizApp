-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: quizdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Adjective'),(3,'Adverb'),(1,'Noun'),(4,'Preposition'),(5,'Verb');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `is_correct` bit(1) DEFAULT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_choice_question_idx` (`question_id`),
  CONSTRAINT `fk_choice_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (5,'were',_binary '',9),(6,'was',_binary '\0',9),(7,'is',_binary '\0',9),(8,'are',_binary '\0',9),(9,'go',_binary '\0',10),(10,'goes',_binary '',10),(11,'gone',_binary '\0',10),(12,'going',_binary '\0',10),(13,'reads',_binary '\0',11),(14,'are reading',_binary '',11),(15,'reading',_binary '\0',11),(16,'readed',_binary '\0',11),(17,'watch',_binary '\0',12),(18,'watches',_binary '',12),(19,'watched',_binary '\0',12),(20,'watching',_binary '\0',12),(21,'is',_binary '',13),(22,'are',_binary '\0',13),(23,'were',_binary '\0',13),(24,'be',_binary '\0',13),(25,'go',_binary '\0',14),(26,'went',_binary '\0',14),(27,'are going',_binary '',14),(28,'going',_binary '\0',14),(29,'do',_binary '\0',15),(30,'did',_binary '',15),(31,'does',_binary '\0',15),(32,'doing',_binary '\0',15),(33,'book',_binary '\0',16),(34,'books',_binary '',16),(35,'bookes',_binary '\0',16),(36,'booking',_binary '\0',16),(37,'apple',_binary '',17),(38,'apples',_binary '\0',17),(39,'a apple',_binary '\0',17),(40,'an apples',_binary '\0',17),(41,'deers',_binary '\0',18),(42,'deer',_binary '',18),(43,'deeres',_binary '\0',18),(44,'deer\'s',_binary '\0',18),(45,'fast',_binary '',19),(46,'fastly',_binary '\0',19),(47,'faster',_binary '\0',19),(48,'fastest',_binary '\0',19),(49,'beautiful',_binary '\0',20),(50,'beautifully',_binary '',20),(51,'beauty',_binary '\0',20),(52,'beautify',_binary '\0',20),(53,'quiet',_binary '\0',21),(54,'quietly',_binary '',21),(55,'quieter',_binary '\0',21),(56,'quietness',_binary '\0',21),(57,'sun',_binary '\0',22),(58,'sunny',_binary '',22),(59,'sunning',_binary '\0',22),(60,'sunshine',_binary '\0',22),(61,'quickly',_binary '\0',23),(62,'intelligent',_binary '',23),(63,'intelligence',_binary '\0',23),(64,'quickness',_binary '\0',23),(65,'boring',_binary '',24),(66,'bored',_binary '\0',24),(67,'bore',_binary '\0',24),(68,'boredom',_binary '\0',24);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'easy',NULL),(2,'intermediate',NULL),(3,'hard',NULL);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_category_idx` (`category_id`),
  KEY `fk_question_level_idx` (`level_id`),
  CONSTRAINT `fk_question_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_question_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (9,'Wishing you ... here!',NULL,NULL,5,1),(10,'She ___ to school every day.',NULL,NULL,5,1),(11,'I ___ a book now.',NULL,NULL,5,1),(12,'They ___ TV last night.',NULL,NULL,5,1),(13,'There ___ a cat under the table.',NULL,NULL,5,1),(14,'We ___ to the zoo tomorrow.',NULL,NULL,5,1),(15,'I ___ my homework yesterday.',NULL,NULL,5,1),(16,'I have two ___ in my bag.',NULL,NULL,1,1),(17,'There is a ___ on the table.',NULL,NULL,1,1),(18,'We saw some ___ in the zoo.',NULL,NULL,1,1),(19,'He runs very ___.',NULL,NULL,3,1),(20,'She sings ___.',NULL,NULL,3,1),(21,'The baby is sleeping, so speak ___.',NULL,NULL,3,1),(22,'The weather is very __ today.',NULL,NULL,2,1),(23,'He is a ___ boy.',NULL,NULL,2,1),(24,'I had a ___ day at school.',NULL,NULL,2,1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24  7:37:57
