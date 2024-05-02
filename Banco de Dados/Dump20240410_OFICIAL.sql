CREATE DATABASE  IF NOT EXISTS `heavenpath` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `heavenpath`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: heavenpath
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

--
-- Table structure for table `congregacao`
--

DROP TABLE IF EXISTS `congregacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congregacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(20) DEFAULT NULL,
  `NOME` varchar(99) NOT NULL,
  `RUA` varchar(60) NOT NULL,
  `BAIRRO` varchar(30) NOT NULL,
  `NUMERO` int NOT NULL,
  `COMPLEMENTO` varchar(30) DEFAULT NULL,
  `TELEFONE` int DEFAULT NULL,
  `GESTOR_ID` int DEFAULT NULL,
  `SEDE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GESTOR_ID` (`GESTOR_ID`),
  KEY `SEDE_ID` (`SEDE_ID`),
  CONSTRAINT `congregacao_ibfk_1` FOREIGN KEY (`GESTOR_ID`) REFERENCES `gestor` (`ID`),
  CONSTRAINT `congregacao_ibfk_2` FOREIGN KEY (`SEDE_ID`) REFERENCES `sede` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congregacao`
--

LOCK TABLES `congregacao` WRITE;
/*!40000 ALTER TABLE `congregacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `congregacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(99) NOT NULL,
  `DATA_INICIO` timestamp NOT NULL,
  `DATA_FIM` timestamp NOT NULL,
  `CONGREGACAO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONGREGACAO_ID` (`CONGREGACAO_ID`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`CONGREGACAO_ID`) REFERENCES `congregacao` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequenta`
--

DROP TABLE IF EXISTS `frequenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequenta` (
  `MEMBRO_ID` int NOT NULL,
  `EVENTO_ID` int NOT NULL,
  `DATA_HORA` timestamp NOT NULL,
  PRIMARY KEY (`MEMBRO_ID`,`EVENTO_ID`),
  KEY `EVENTO_ID` (`EVENTO_ID`),
  CONSTRAINT `frequenta_ibfk_1` FOREIGN KEY (`MEMBRO_ID`) REFERENCES `membro` (`ID`),
  CONSTRAINT `frequenta_ibfk_2` FOREIGN KEY (`EVENTO_ID`) REFERENCES `evento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequenta`
--

LOCK TABLES `frequenta` WRITE;
/*!40000 ALTER TABLE `frequenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestor`
--

DROP TABLE IF EXISTS `gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `CPF` varchar(15) NOT NULL,
  `USUARIO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  CONSTRAINT `gestor_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor`
--

LOCK TABLES `gestor` WRITE;
/*!40000 ALTER TABLE `gestor` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(99) NOT NULL,
  `CONGREGACAO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONGREGACAO_ID` (`CONGREGACAO_ID`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`CONGREGACAO_ID`) REFERENCES `congregacao` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(45) NOT NULL,
  `DATA_HORA` timestamp NULL DEFAULT NULL,
  `MEMBRO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MEMBRO_ID` (`MEMBRO_ID`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`MEMBRO_ID`) REFERENCES `membro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro`
--

DROP TABLE IF EXISTS `membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membro` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(60) NOT NULL,
  `NATURALIDADE` varchar(20) NOT NULL,
  `IDENTIDADE` varchar(15) NOT NULL,
  `ESTADO_CIVIL` varchar(15) NOT NULL,
  `CPF` varchar(15) NOT NULL,
  `PROFISSAO` varchar(30) DEFAULT NULL,
  `OCUPACAO` varchar(30) DEFAULT NULL,
  `REF` varchar(30) DEFAULT NULL,
  `NOME_PAI` varchar(60) DEFAULT NULL,
  `NOME_MAE` varchar(60) DEFAULT NULL,
  `NOME_CONJUGE` varchar(60) DEFAULT NULL,
  `DATA_CONVERSAO` date DEFAULT NULL,
  `DATA_NASCIMENTO` date DEFAULT NULL,
  `DATA_BATISMO` date DEFAULT NULL,
  `DATA_BATISMO_ESP_SANTO` date DEFAULT NULL,
  `DATA_ADMISSAO` date DEFAULT NULL,
  `DATA_CANCELAMENTO` date DEFAULT NULL,
  `DATA_READMISSAO` date DEFAULT NULL,
  `LUGAR_CONGREGA` varchar(40) DEFAULT NULL,
  `CLASSE_ESC_DOMINICAL` varchar(40) DEFAULT NULL,
  `RUA` varchar(60) DEFAULT NULL,
  `BAIRRO` varchar(30) DEFAULT NULL,
  `NUMERO` int DEFAULT NULL,
  `COMPLEMENTO` varchar(30) DEFAULT NULL,
  `PROCEDENCIA` varchar(45) DEFAULT NULL,
  `MOTIVO_DESTINO` varchar(60) DEFAULT NULL,
  `LUGAR_CONVERSAO` varchar(60) DEFAULT NULL,
  `LUGAR_BATISMO` varchar(60) DEFAULT NULL,
  `LUGAR_BATISMO_ESP_SANTO` varchar(60) DEFAULT NULL,
  `ATIVIDADES_NA_IGREJA` varchar(99) DEFAULT NULL,
  `CONGREGACAO_ID` int DEFAULT NULL,
  `USUARIO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDENTIDADE` (`IDENTIDADE`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `CONGREGACAO_ID` (`CONGREGACAO_ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  CONSTRAINT `membro_ibfk_1` FOREIGN KEY (`CONGREGACAO_ID`) REFERENCES `congregacao` (`ID`),
  CONSTRAINT `membro_ibfk_2` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro`
--

LOCK TABLES `membro` WRITE;
/*!40000 ALTER TABLE `membro` DISABLE KEYS */;
/*!40000 ALTER TABLE `membro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participa`
--

DROP TABLE IF EXISTS `participa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa` (
  `MEMBRO_ID` int NOT NULL,
  `GRUPO_ID` int NOT NULL,
  PRIMARY KEY (`MEMBRO_ID`,`GRUPO_ID`),
  KEY `GRUPO_ID` (`GRUPO_ID`),
  CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`MEMBRO_ID`) REFERENCES `membro` (`ID`),
  CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`GRUPO_ID`) REFERENCES `grupo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa`
--

LOCK TABLES `participa` WRITE;
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(20) DEFAULT NULL,
  `NOME` varchar(60) NOT NULL,
  `RUA` varchar(60) DEFAULT NULL,
  `BAIRRO` varchar(30) DEFAULT NULL,
  `NUMERO` int DEFAULT NULL,
  `COMPLEMENTO` varchar(30) DEFAULT NULL,
  `TELEFONE` int DEFAULT NULL,
  `GESTOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  KEY `GESTOR_ID` (`GESTOR_ID`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`GESTOR_ID`) REFERENCES `gestor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CHAVE` varchar(99) NOT NULL,
  `SENHA` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CHAVE` (`CHAVE`),
  UNIQUE KEY `SENHA` (`SENHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-10 21:06:05
