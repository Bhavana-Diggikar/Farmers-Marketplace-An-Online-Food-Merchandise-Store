-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: farmersystem
-- ------------------------------------------------------
-- Server version	8.0.43

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
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK_lroeo5fvfdeg4hpicn4lw7x9b` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Flowers'),(1,'Fruits'),(3,'Grains'),(2,'Vegetables');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_stock_details`
--

DROP TABLE IF EXISTS `category_stock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_stock_details` (
  `category_category_id` int NOT NULL,
  `stock_details_product_id` int NOT NULL,
  UNIQUE KEY `UK_oreb29n1k4brb9cn4fy50l7f7` (`stock_details_product_id`),
  KEY `FKkxgka352hmpoloeoep7cm9b7c` (`category_category_id`),
  CONSTRAINT `FKkxgka352hmpoloeoep7cm9b7c` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKw6smw42ssadb9q6kxc291mf8` FOREIGN KEY (`stock_details_product_id`) REFERENCES `stock_details` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_stock_details`
--

LOCK TABLES `category_stock_details` WRITE;
/*!40000 ALTER TABLE `category_stock_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer` (
  `farmer_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`farmer_id`),
  UNIQUE KEY `UK_o75u7w6s9t2ao4doco3vf238e` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` VALUES (1,'Kothrud,Pune','bd1@gmail.com','Bhavana','Diggikar','7896541230'),(2,'Sr Colony,Satara-pune Road, Satara','monika@gmail.com','Monika','Barge','9874512360'),(3,'Ramwadi, tq.Ahmadpur,Latur','rjt@gmail.com','Raj','Thakur','7410258963'),(4,'Sundar Wadi,Near govt. hospital, Lohara','ghkpm@gmail.com','Ghansham','Chavan','7485961230'),(5,'Durga Farmhouse, Girigaon,Ratanwdi','ak@gmail.com','Akash','Shinde','7391486250'),(6,'Ramwadi,Latur','skt@gmail.com','Salim','Aktar','7412589630');
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `order_item` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  `farmer_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe42r1gblmc7u54u3geikk7ig4` (`farmer_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  CONSTRAINT `FKe42r1gblmc7u54u3geikk7ig4` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`farmer_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (74,10,'Rose',1,1,59),(75,275,'Lily',55,1,59),(76,10,'Rose',1,1,60),(77,275,'Lily',55,1,60);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `delivery_date` date DEFAULT NULL,
  `delivery_status` bit(1) DEFAULT NULL,
  `payment_status` bit(1) DEFAULT NULL,
  `place_order_date` date DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (59,'2026-02-12',_binary '\0',_binary '','2026-02-09',4),(60,'2026-02-12',_binary '\0',_binary '','2026-02-09',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_details`
--

DROP TABLE IF EXISTS `stock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_details` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_image` varchar(400) DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL,
  `quantity` int NOT NULL,
  `stock_item` varchar(50) NOT NULL,
  `category_id` int DEFAULT NULL,
  `farmer_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UK_19kumlh2b3wbeboabeekd6wf9` (`stock_item`),
  KEY `FKikv0jeil5f6snxpkqkk6itk56` (`category_id`),
  KEY `FKti5jc581t2ne5x55q9nq3fqpk` (`farmer_id`),
  CONSTRAINT `FKikv0jeil5f6snxpkqkk6itk56` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKti5jc581t2ne5x55q9nq3fqpk` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`farmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_details`
--

LOCK TABLES `stock_details` WRITE;
/*!40000 ALTER TABLE `stock_details` DISABLE KEYS */;
INSERT INTO `stock_details` VALUES (1,'Alphonso-Mangoes-1-1024x1024.jpeg',25,200,'Mango',1,1),(2,'rose.jpg',10,125,'Rose',4,1),(3,'AS_HardyLily_Umbria_1.jpg.jpeg',5,50,'Lily',4,1),(4,'2_89b5cdb4-c2f3-4d63-bbe5-90bfd7c81474_700x700 (1).jpg.jpeg',12,40,'Hibiscus',4,1),(6,'water-lilies-lake-france-royalty-free-image-1699382596.jpg.jpeg',25,45,'Lotus',4,1),(7,'b81d431f9a1ba4859151b510c4adfd72.jpg.jpeg',8,80,'Lavender',4,1),(8,'122573036.jpg.jpeg',15,200,'Marigold',4,1),(9,'paudhewale-2024-06-02t174026-163.png',25,200,'Jasmine',4,1),(10,'apple.jpg',48,200,'Apple',1,2),(11,'banana.jpg',10,500,'Banana',1,2),(12,'orange.jpg',5,400,'Orange',1,2),(13,'watermel.jpg',45,100,'Watermelon',1,3),(14,'Sesame.jpg',15,500,'Sesame',3,4),(15,'rice.jpg',60,500,'Rice',3,4),(16,'wheat_PNG1.png',50,400,'Wheat',3,5),(17,'mug.jpg',45,20,'Mung Beans(Dal)',3,6),(18,'urad.jpg',30,41,'Black Gram(Urad Dal)',3,6),(19,'Massor-Whole-Dal.png',40,55,'Lentils (Masoor Dal)',3,5);
/*!40000 ALTER TABLE `stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Pune','admin@gmail.com','Admin',_binary '','Admin','$2a$10$s36O51QwabMnuWn9MNISbO8gImnRKC4o8admjhpHcrF3WGmRmV.Ny','1234567890'),(3,'SH. Road, Solapur','radhikavpatil14@gmail.com','Radhika',_binary '\0','Patil','$2a$10$J9F6v8rY6R4xq9Y0E2WlQe6Q0q0lJm9ZC5ZpXxk1cK8Z6mZQvQx9K','8855227744'),(4,'Nanded Road,Wagholi','mansism2001@gmail.com','Mansi',_binary '\0','Markunde','$2a$10$fyhzeeaiNi63bzjm4hmIY.HpLSM79nxZX4xEkk5/9tYdwoVCh8bgS','8749651230'),(5,'pune','diggikarbhavana@gmail.com','Bhavana',_binary '\0','Diggikar','$2a$10$jcM4DiyId0Pyvgj0Q1utL..M7S6NN1hfY7EjwIsuOUiGVB9uSU9R.','9857632105');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-21 22:15:56
