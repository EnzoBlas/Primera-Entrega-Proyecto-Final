-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: cotillon_paris
-- ------------------------------------------------------
-- Server version	8.0.30

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
CREATE SCHEMA cotillon_paris;
USE cotillon_paris;
--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `ID_ARTICLE` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DETAIL` varchar(100) DEFAULT NULL,
  `ACTUAL_PRICE` float NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicing`
--

DROP TABLE IF EXISTS `invoicing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicing` (
  `ID_INVOCING` int NOT NULL AUTO_INCREMENT,
  `ID_ARTICLE` int NOT NULL,
  `ID_ORDER` int NOT NULL,
  `ID_SALE` int NOT NULL,
  PRIMARY KEY (`ID_INVOCING`),
  KEY `fk_articleInvoicing_idx` (`ID_ARTICLE`),
  KEY `fk_orderInvoicing_idx` (`ID_ORDER`),
  KEY `fk_saleInvoicing_idx` (`ID_SALE`),
  CONSTRAINT `fk_articleInvoicing` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_orderInvoicing` FOREIGN KEY (`ID_ORDER`) REFERENCES `orders` (`ID_ORDER`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_saleInvoicing` FOREIGN KEY (`ID_SALE`) REFERENCES `sales` (`ID_SALE`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicing`
--

LOCK TABLES `invoicing` WRITE;
/*!40000 ALTER TABLE `invoicing` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID_ORDER` int NOT NULL AUTO_INCREMENT,
  `ID_ARTICLE` int NOT NULL,
  `ID_SUPPLIER` int NOT NULL,
  `BUY_DATE` date NOT NULL,
  `BUY_PRICE` float NOT NULL,
  PRIMARY KEY (`ID_ORDER`),
  KEY `ID_ARTICLE_idx` (`ID_ARTICLE`),
  KEY `ID_SUPPLIER_idx` (`ID_SUPPLIER`),
  CONSTRAINT `fk_articleOrder` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_supplierOrder` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `suppliers` (`ID_SUPPLIER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `ID_SALE` int NOT NULL AUTO_INCREMENT,
  `ID_ARTICLE` int NOT NULL,
  `SALE_DATE` date NOT NULL,
  `SALE_PRICE` float NOT NULL,
  PRIMARY KEY (`ID_SALE`),
  KEY `fk_articleSales_idx` (`ID_ARTICLE`),
  CONSTRAINT `fk_articleSales` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `ID_STOCK` int NOT NULL AUTO_INCREMENT,
  `ID_ARTICLE` int NOT NULL,
  `CALCULATED_STOCK` int NOT NULL,
  `REAL_STOCK` int DEFAULT NULL,
  PRIMARY KEY (`ID_STOCK`),
  KEY `fk_articleStock_idx` (`ID_ARTICLE`),
  CONSTRAINT `fk_articleStock` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `ID_SUPPLIER` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `PHONE` int NOT NULL,
  PRIMARY KEY (`ID_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers for articles`
--

DROP TABLE IF EXISTS `suppliers for articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers for articles` (
  `ID_SUPPLIER` int NOT NULL,
  `ID_ARTICLE` int NOT NULL,
  KEY `fk_articleSupplier/articles_idx` (`ID_ARTICLE`),
  KEY `fk_supplierSuppliersforarticles` (`ID_SUPPLIER`),
  CONSTRAINT `fk_articleSuppliersforarticles` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`),
  CONSTRAINT `fk_supplierSuppliersforarticles` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `suppliers` (`ID_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers for articles`
--

LOCK TABLES `suppliers for articles` WRITE;
/*!40000 ALTER TABLE `suppliers for articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers for articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 12:08:20
