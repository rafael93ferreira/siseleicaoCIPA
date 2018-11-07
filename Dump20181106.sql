-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_eleicao
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `tb_candidatos`
--

DROP TABLE IF EXISTS `tb_candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_candidatos` (
  `numero` tinyint(2) unsigned NOT NULL,
  `nome` varchar(60) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `eleicao` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `eleicao` (`eleicao`),
  CONSTRAINT `tb_candidatos_ibfk_1` FOREIGN KEY (`eleicao`) REFERENCES `tb_eleicao` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_candidatos`
--

LOCK TABLES `tb_candidatos` WRITE;
/*!40000 ALTER TABLE `tb_candidatos` DISABLE KEYS */;
INSERT INTO `tb_candidatos` VALUES (0,'Voto Nulo','nulo.jpg',1000),(1,'Voto Branco','branco.jpg',1000),(10,'João da Silva','joao_silva.jpg',1000),(13,'Ana Vitória','ana_vitoria.jpg',1000),(17,'Esther Bueno','esther_bueno.jpg',1000),(25,'Maria Lima','maria_lima.jpg',1000),(50,'Paulo Bastos','paulo_bastos.jpg',1000);
/*!40000 ALTER TABLE `tb_candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_eleicao`
--

DROP TABLE IF EXISTS `tb_eleicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_eleicao` (
  `cod` smallint(4) unsigned NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `ano_ref` year(4) DEFAULT NULL,
  `data_eleicao` date DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_eleicao`
--

LOCK TABLES `tb_eleicao` WRITE;
/*!40000 ALTER TABLE `tb_eleicao` DISABLE KEYS */;
INSERT INTO `tb_eleicao` VALUES (1000,'Eleição para presidente CIPA',2018,'2018-12-01');
/*!40000 ALTER TABLE `tb_eleicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionarios`
--

DROP TABLE IF EXISTS `tb_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionarios` (
  `matricula` smallint(4) unsigned NOT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionarios`
--

LOCK TABLES `tb_funcionarios` WRITE;
/*!40000 ALTER TABLE `tb_funcionarios` DISABLE KEYS */;
INSERT INTO `tb_funcionarios` VALUES (1000,'João da Silva'),(1001,'Maria Lima'),(1002,'Paulo Guilherme'),(1003,'Antônio Diego'),(1004,'Rose Maria'),(1005,'Rodrigo Lameira'),(1006,'Esther Bueno'),(1007,'Adonias Pires'),(1008,'Ana Vitória'),(1009,'Grazielle Batista'),(1010,'Paulo Bastos');
/*!40000 ALTER TABLE `tb_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voto` (
  `cod_voto` int(10) unsigned NOT NULL,
  `numero_votado` tinyint(2) unsigned NOT NULL,
  `data_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_voto`),
  KEY `numero_votado` (`numero_votado`),
  CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`numero_votado`) REFERENCES `tb_candidatos` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto`
--

LOCK TABLES `voto` WRITE;
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-06 20:58:00
