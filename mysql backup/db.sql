-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: davetest
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `salts`
--

DROP TABLE IF EXISTS `salts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salts`
--

LOCK TABLES `salts` WRITE;
/*!40000 ALTER TABLE `salts` DISABLE KEYS */;
INSERT INTO `salts` VALUES (5,10,'nSHuv83bfAZcZaPMdawH8ITVnzImDOKpRTHv5MvAlLfpoTciudBZ6_6P4T8pm0z9SBkBjvNSi64itifZTzmOS-6rbJ1tvYUQcx5vF3adulRvyoZbFqm3VSbAVABeW9945dzIMappu9SG1qJoknW5NhfKwfmHjfnMet2W_vxFBPjz-sDw21836vJxQErLLVlytnljCrEFaGXjUhE1oBvw_ZRw40mil0GdddD7-Vfo9D4kuYoIHnn7Zjgt4Cri_CS');
/*!40000 ALTER TABLE `salts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (4,10,'Zav2vmXrFmkmlj7ZIBCQrUyyJM8fmiGiky7lv9BdsufF_GLql4xtuKw-XRpYsnZyjszHnysOsi91FcERK2H_6Z-ZCIQPhRvkxtB72733AE6Mp3reDO-MURClDTZDq1c2r7I4gLpQ318lc7JvRILQzbZ1mGG4V_RFDPtiwmR9Uvze0tH2HP6aBE4_OgXGzSkz7Gg5OK8NIpQzcchiJ20BLdsCS7aZdYaetS0b8tYuTxOZWiVZIIV9YvIv64Zak5d','2021-06-01 22:57:55'),(5,10,'CDpxvqaiXmIQCySsL1L8jWhYWLHYAx_Blee0R0WvNm2TtEw3PBWZLvEV-yvZDCJI_TD8P02m-ZRTPNma_KNk4FE4QIPFVOAHj8r5NnA6QkhhPn2VwrUlvfyK7QaeSsJvTXHoFbABpDQtSxNz-fymdPmnnopBsv8UEqM6kGKesOb4GeyLfaXScNYZu4wH4ZSe5RyDD2bUqeLONRSBEflQ1f9J6Zqi37E9lcfHRhiJeebUhZPqKXMxHzomXifz5t5','2021-06-01 23:18:47'),(6,10,'hJSIdVSHPhutaWzobLCSjkgn9AbYLAzVIGE39A8PV89tePx0JX6OjMv3XnuWB41XqcdNT7SwheWgH0CzNuKk50aQOUkh6T3IZ9UybNGEn0kO9kpcK7g78tGmteAFyoMryEOo-5t6h6iNcrfy4_Cr5kynmSbYQNrm7gOBES1VAmwMkAIeOQx-31HpXI9WrLu5X131DtkoGLTSWqsboXaOny9ZQh_9OSR98cy-f8BuA8aGa2JbY8itSuRVUxc4GxE','2021-06-01 23:19:26'),(7,10,'BjftD-A6todpmPxBgSI6gRXAXTSPQ_CUZn2p3p6l90v9-_we46r5viHDmQ0-H_j-fIaNbd12Gj7_Z7NOLr61saPIPB2R9iEihHB35_-T2fUtiiVEXUGI_p5mNUcXZDkwG6iWOl862RwGmgCTjfd1v7EqQtxrEZmMSQ_1CfS9uKR7s-sluh1cguFUHa_4UisR1Rh-vb9nghQkvlURXAEWPDvdjaDr6LjN894LAvH11Z1Q6jNLPuEijQI9kARUByE','2021-06-01 23:36:07');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pwhash` varchar(255) DEFAULT NULL,
  `confcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'spuds@2020rendezvous.com','David','Fowler','2021-06-01 22:57:55',1,'kjYnTWs/NoPWuE4wp4+M7P0vfJzmNP3aphi4nu+qrvuEA5AJsFpxzCNs4PBC0ONLD5BFeprjCHITu53+zYZtRDcheD3KtapzH71JtahTlrgCOcgJYvYay57XfFPJcv6tqAZOVIaoo8CsisTyCa9cVoTOwHjj07slSbMl56I6YJ1Q8Qu/EFO+z20qW3XlVIXoYssMCRbA2ZJEPsa/yoRV8LoDjtJmfBmR7kIZ0SfZv1N76tQtto6ThLaLPhSU+sw','WwkiLG2NZmZgzcyb09flX3-owjhQV2eLNqBQOG4SmV_ob');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'davetest'
--

--
-- Dumping routines for database 'davetest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03  2:21:29
