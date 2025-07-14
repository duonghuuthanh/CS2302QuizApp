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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Adjective'),(3,'Adverb'),(6,'Conjunction'),(1,'Noun'),(4,'Preposition'),(5,'Verb');
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (5,'were.',_binary '',9),(6,'was',_binary '\0',9),(7,'is',_binary '\0',9),(8,'are',_binary '\0',9),(9,'go',_binary '\0',10),(10,'goes',_binary '',10),(11,'gone',_binary '\0',10),(12,'going',_binary '\0',10),(13,'reads',_binary '\0',11),(14,'am reading',_binary '',11),(15,'reading',_binary '\0',11),(16,'readed',_binary '\0',11),(17,'watch',_binary '\0',12),(18,'watches',_binary '',12),(19,'watched',_binary '\0',12),(20,'watching',_binary '\0',12),(21,'is',_binary '',13),(22,'are',_binary '\0',13),(23,'were',_binary '\0',13),(24,'be',_binary '\0',13),(25,'go',_binary '\0',14),(26,'went',_binary '\0',14),(27,'are going',_binary '',14),(28,'going',_binary '\0',14),(29,'do',_binary '\0',15),(30,'did',_binary '',15),(31,'does',_binary '\0',15),(32,'doing',_binary '\0',15),(33,'book',_binary '\0',16),(34,'books',_binary '',16),(35,'bookes',_binary '\0',16),(36,'booking',_binary '\0',16),(37,'apple',_binary '',17),(38,'apples',_binary '\0',17),(39,'a apple',_binary '\0',17),(40,'an apples',_binary '\0',17),(41,'deers',_binary '\0',18),(42,'deer',_binary '',18),(43,'deeres',_binary '\0',18),(44,'deer\'s',_binary '\0',18),(45,'fast',_binary '',19),(46,'fastly',_binary '\0',19),(47,'faster',_binary '\0',19),(48,'fastest',_binary '\0',19),(49,'beautiful',_binary '\0',20),(50,'beautifully',_binary '',20),(51,'beauty',_binary '\0',20),(52,'beautify',_binary '\0',20),(53,'quiet',_binary '\0',21),(54,'quietly',_binary '',21),(55,'quieter',_binary '\0',21),(56,'quietness',_binary '\0',21),(57,'sun',_binary '\0',22),(58,'sunny',_binary '',22),(59,'sunning',_binary '\0',22),(60,'sunshine',_binary '\0',22),(61,'quickly',_binary '\0',23),(62,'intelligent',_binary '',23),(63,'intelligence',_binary '\0',23),(64,'quickness',_binary '\0',23),(65,'boring',_binary '',24),(66,'bored',_binary '\0',24),(67,'bore',_binary '\0',24),(68,'boredom',_binary '\0',24),(69,'rain',_binary '\0',25),(70,'rains',_binary '',25),(71,'will rain',_binary '\0',25),(72,'raining',_binary '\0',25),(73,'for',_binary '\0',26),(74,'from',_binary '\0',26),(75,'since',_binary '',26),(76,'until',_binary '\0',26),(77,'so',_binary '',27),(78,'such',_binary '\0',27),(79,'too',_binary '\0',27),(80,'very',_binary '\0',27),(81,'have',_binary '',28),(82,'had',_binary '\0',28),(83,'will have',_binary '\0',28),(84,'am having',_binary '\0',28),(85,'which',_binary '\0',29),(86,'whom',_binary '\0',29),(87,'who',_binary '',29),(88,'whose',_binary '\0',29),(89,'She don’t like coffee.',_binary '\0',30),(90,'She doesn’t likes coffee.',_binary '\0',30),(91,'She doesn’t like coffee.',_binary '',30),(92,'She not likes coffee.',_binary '\0',30),(93,'will fly',_binary '\0',31),(94,'will be flying',_binary '',31),(95,'are flying',_binary '\0',31),(96,'have flown',_binary '\0',31),(97,'interestinger',_binary '\0',32),(98,'more interesting',_binary '',32),(99,'most interesting',_binary '\0',32),(100,' interesting',_binary '\0',32),(101,'at',_binary '\0',33),(102,'on',_binary '\0',33),(103,'in',_binary '',33),(104,'for',_binary '\0',33),(105,'since',_binary '\0',34),(106,'from',_binary '\0',34),(107,'for',_binary '',34),(108,'during',_binary '\0',34),(109,'have',_binary '\0',35),(110,'had',_binary '',35),(111,'will have',_binary '\0',35),(112,'has',_binary '\0',35),(113,'was made',_binary '',36),(114,'is made',_binary '\0',36),(115,'made',_binary '\0',36),(116,'makes',_binary '\0',36),(117,'which',_binary '\0',37),(118,'who',_binary '',37),(119,'where',_binary '\0',37),(120,'whose',_binary '\0',37),(121,'I am going to the gym every morning.',_binary '\0',38),(122,' I used to go to the gym every morning.',_binary '',38),(123,'I am used to go to the gym every morning.',_binary '\0',38),(124,' I use go to the gym every morning.',_binary '\0',38),(125,'He said he helps me.',_binary '\0',39),(126,'He said he would help me.',_binary '',39),(127,'He said he will help me.',_binary '\0',39),(128,'He said he helped me.',_binary '\0',39),(129,'You must to finish your homework before playing.',_binary '\0',40),(130,'You must finish your homework before playing.',_binary '',40),(131,' You musts finish your homework before playing.',_binary '\0',40),(132,'You musted finish your homework before playing.',_binary '\0',40),(133,'continue',_binary '\0',41),(134,'stop trying',_binary '',41),(135,'start again',_binary '\0',41),(136,'hand in',_binary '\0',41),(137,'Hardly I had arrived when it started to rain.',_binary '\0',42),(138,'Hardly had I arrived when it started to rain.',_binary '',42),(139,'Hardly had arrived I when it started to rain.',_binary '\0',42),(140,'Hardly I arrived had when it started to rain.',_binary '\0',42),(141,'studied',_binary '\0',43),(142,'has studied',_binary '',43),(143,'study',_binary '\0',43),(144,'was studying',_binary '\0',43),(145,'do',_binary '\0',44),(146,'make',_binary '\0',44),(147,'have',_binary '',44),(148,'take',_binary '\0',44),(149,'Dùng “will have + V3” để nói một hành động sẽ hoàn thành tại một thời điểm trong tương lai.',_binary '\0',45),(150,'By the end of this year, I will have worked here for ten years.',_binary '',45),(151,'By the end of this year, I will be working here for ten years.',_binary '\0',45),(152,'By the end of this year, I will worked here for ten years.',_binary '\0',45),(153,'to repair',_binary '\0',46),(154,'repaired',_binary '',46),(155,'repairing',_binary '\0',46),(156,'repair',_binary '\0',46);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (6,'Exam-2025-07-05','2025-07-05 00:00:00'),(7,'Exam-2025-07-05','2025-07-05 00:00:00'),(8,'Exam-2025-07-05T09:32:53.322161','2025-07-05 09:32:53');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_idx` (`exam_id`),
  KEY `fk_question_idx` (`question_id`),
  CONSTRAINT `fk_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,6,19),(2,6,23),(3,6,30),(4,7,11),(5,7,18),(6,7,20),(7,7,34),(8,7,32),(9,8,20),(10,8,19),(11,8,14),(12,8,15),(13,8,38),(14,8,37),(15,8,26),(16,8,36),(17,8,44),(18,8,43);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (9,'Wishing you ... here!',NULL,NULL,5,1),(10,'She ___ to school every day.',NULL,NULL,5,1),(11,'I ___ a book now.',NULL,NULL,5,1),(12,'They ___ TV last night.',NULL,NULL,5,1),(13,'There ___ a cat under the table.',NULL,NULL,5,1),(14,'We ___ to the zoo tomorrow.',NULL,NULL,5,1),(15,'I ___ my homework yesterday.',NULL,NULL,5,1),(16,'I have two ___ in my bag.',NULL,NULL,1,1),(17,'There is a ___ on the table.',NULL,NULL,1,1),(18,'We saw some ___ in the zoo.',NULL,NULL,1,1),(19,'He runs very ___.',NULL,NULL,3,1),(20,'She sings ___.',NULL,NULL,3,1),(21,'The baby is sleeping, so speak ___.',NULL,NULL,3,1),(22,'The weather is very __ today.',NULL,NULL,2,1),(23,'He is a ___ boy.',NULL,NULL,2,1),(24,'I had a ___ day at school.',NULL,NULL,2,1),(25,'If it ___ tomorrow, we will cancel the trip.',NULL,NULL,5,2),(26,'He has lived in this city ___ 2010.',NULL,NULL,4,2),(27,'The film was ___ interesting that I watched it twice.',NULL,NULL,4,2),(28,'I wish I ___ more time to finish the project.',NULL,NULL,5,2),(29,'He is the man ___ helped me yesterday.',NULL,NULL,5,2),(30,'Which sentence is grammatically correct?','Với “doesn’t”, động từ nguyên mẫu được dùng.',NULL,5,2),(31,'By this time tomorrow, we ___ to Paris.','By this time tomorrow” → dùng thì tương lai tiếp diễn để diễn tả hành động đang diễn ra tại thời điểm đó.',NULL,5,2),(32,'What is the correct comparative form? This book is ___ than that one.','Tính từ dài → dùng “more + adj” khi so sánh hơn.',NULL,2,2),(33,'I’m interested ___ learning Spanish.','Cụm cố định “interested in + V-ing”.',NULL,4,2),(34,'I’ve lived in this town ___ five years.','for + khoảng thời gian”, “since + mốc thời gian',NULL,4,2),(35,'If I ___ more time, I would help you.','Câu điều kiện loại 2 → “If + past simple, would + V”.',NULL,5,2),(36,'The cake ___ by Mary yesterday.','Yesterday → quá khứ đơn → bị động: “was/were + V3”.',NULL,5,2),(37,'The woman ___ lives next door is a doctor.','“who” dùng cho người.',NULL,3,2),(38,'Which sentence describes a past habit?','“used to” diễn tả thói quen trong quá khứ đã không còn.',NULL,5,2),(39,'Choose the correct reported speech: He said, “I will help you.”','will → would trong câu gián tiếp.',NULL,5,2),(40,'Choose the correct sentence:','Sau must dùng động từ nguyên mẫu (không “to”).',NULL,5,2),(41,'Choose the correct meaning of: give up','“give up” = từ bỏ, dừng cố gắng.',NULL,5,2),(42,'Which sentence uses inversion correctly?','Với “Hardly…when”, dùng đảo ngữ: Hardly + trợ động từ + chủ ngữ + V.',NULL,3,3),(43,'If I ___ harder at school, I would have a better job now.','Điều kiện quá khứ (had studied) ảnh hưởng đến hiện tại (would have).',NULL,5,3),(44,'The new policy will ___ consequences for the whole industry.','Cụm cố định: “have consequences”.',NULL,5,3),(45,'Which sentence is correct?','Dùng “will have + V3” để nói một hành động sẽ hoàn thành tại một thời điểm trong tương lai.',NULL,5,3),(46,'She had her car ___ last week.','Causative structure: had + object + V3.',NULL,5,3);
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

-- Dump completed on 2025-07-15  6:54:15
