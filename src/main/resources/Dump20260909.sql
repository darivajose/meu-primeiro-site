CREATE DATABASE  IF NOT EXISTS `clube_do_livro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clube_do_livro`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: clube_do_livro
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `DATA_CADASTRO` date DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Souza','123.456.789-00','ana@email.com','2026-04-22'),(3,'Ana maria','123.456.789-99','anamaria@email.com','2016-04-22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `ID_LIVRO` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  PRIMARY KEY (`ID_LIVRO`),
  CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`ID_LIVRO`) REFERENCES `livros` (`ID_LIVRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (101,50),(102,15),(103,10),(104,8),(105,20),(106,5),(107,12),(108,7),(109,30),(110,14),(111,6),(112,5),(113,18),(114,22),(115,9),(116,4),(117,11),(118,13),(119,25),(120,17),(121,19),(122,12),(123,8),(124,15),(125,10),(126,6),(127,4),(128,3),(129,5),(130,7),(131,9),(132,14),(133,5),(134,8),(135,20),(136,11),(137,6),(138,25),(139,22),(140,18),(141,35),(142,28),(143,15),(144,7),(145,12),(146,10),(147,9),(148,6),(149,5),(150,40),(151,50);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `ID_ITEM` int NOT NULL AUTO_INCREMENT,
  `ID_VENDA` int DEFAULT NULL,
  `ID_LIVRO` int DEFAULT NULL,
  `QUANTIDADE` int DEFAULT NULL,
  `PRECO_UNITARIO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_ITEM`),
  KEY `ID_VENDA` (`ID_VENDA`),
  KEY `ID_LIVRO` (`ID_LIVRO`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`ID_VENDA`) REFERENCES `vendas` (`ID_VENDA`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`ID_LIVRO`) REFERENCES `livros` (`ID_LIVRO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` VALUES (1,1,105,1,106.40),(2,1,113,1,109.76);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `ID_LIVRO` int NOT NULL,
  `NOME_LIVRO` varchar(100) NOT NULL,
  `AUTORIA` varchar(100) NOT NULL,
  `EDITORA` varchar(100) NOT NULL,
  `CATEGORIA` varchar(100) NOT NULL,
  `PRECO` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ID_LIVRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (101,'Banco de Dados Prático','José Belmiro','Editora ADS','Tecnologia',78.50),(102,'Lógica de Programação','Paulo Silveira','Casa do Código','Programação',59.90),(103,'HTML5 e CSS3','Maurício Samy','Novatec','Tecnologia',65.00),(104,'JavaScript Fluente','David Flanagan','O Reilly','Programação',120.00),(105,'Clean Code','Robert Martin','Alta Books','Tecnologia',106.40),(106,'Design Patterns','Erich Gamma','Bookman','Sistemas',110.00),(107,'Docker para Desenvolvedores','Rafael Gomes','Brasport','Infraestrutura',85.00),(108,'Kubernetes Prático','Jeferson Fernando','Linux Tips','Infraestrutura',130.00),(109,'Python para Iniciantes','Nilo Ney','Novatec','Programação',45.00),(110,'Data Science do Zero','Joel Grus','Alta Books','Ciência de Dados',88.00),(111,'Redes de Computadores','Andrew Tanenbaum','Pearson','Infraestrutura',150.00),(112,'Sistemas Operacionais Modernos','Andrew Tanenbaum','Pearson','Tecnologia',140.00),(113,'Arquitetura Limpa','Robert Martin','Alta Books','Sistemas',109.76),(114,'O Codificador Limpo','Robert Martin','Alta Books','Sistemas',95.20),(115,'Refatoração','Martin Fowler','Bookman','Programação',115.00),(116,'Domain-Driven Design','Eric Evans','Alta Books','Sistemas',145.00),(117,'Expressões Regulares','Aurelio Jargas','Novatec','Tecnologia',42.00),(118,'Shell Script Profissional','Aurelio Jargas','Novatec','Infraestrutura',75.00),(119,'Git e GitHub','Willian Molinari','Casa do Código','Tecnologia',55.00),(120,'React Native','Diego Fernandes','Rocketseat','Programação',90.00),(121,'Flutter na Prática','Eduardo Morgado','Novatec','Programação',85.00),(122,'Kotlin para Android','Ricardo Lecheta','Novatec','Programação',92.00),(123,'Swift Essentials','Alexandre de Abreu','Alta Books','Programação',105.00),(124,'UX Design','Fabricio Teixeira','Casa do Código','Design',68.00),(125,'UI Design Profissional','Guilherme Lima','Dribbble Ed.','Design',110.00),(126,'Cibersegurança Prática','Yuri Diogenes','Alta Books','Cibersegurança',135.00),(127,'Hacking Ético','Bruno Fraga','Segurança Web','Cibersegurança',160.00),(128,'Deep Learning','Ian Goodfellow','MIT Press','IA',190.00),(129,'Machine Learning','Tom Mitchell','McGraw Hill','IA',180.00),(130,'NLP com Python','Steven Bird','O Reilly','IA',155.00),(131,'Big Data','Viktor Mayer','Elsevier','Ciência de Dados',125.00),(132,'Estatística Prática','Peter Bruce','Alta Books','Ciência de Dados',95.00),(133,'Java Como Programar','Deitel','Pearson','Programação',170.00),(134,'C++ Estrutura de Dados','Tenembaum','Pearson','Programação',110.00),(135,'C# e .NET Core','Antonio de Padua','Casa do Código','Programação',80.00),(136,'Entity Framework','Diego Vega','Microsoft Press','Sistemas',115.00),(137,'Microserviços','Sam Newman','O Reilly','Sistemas',130.00),(138,'AWS Cloud Practitioner','Neymar Jr','Cloud Ed.','Infraestrutura',99.00),(139,'Google Cloud Platform','Sulivan Gomes','Cloud Ed.','Infraestrutura',105.00),(140,'Azure Fundamentals','Marcos Santos','Microsoft Press','Infraestrutura',95.00),(141,'Scrum e Ágil','Rafael Sabino','Casa do Código','Gestão',50.00),(142,'Kanban Essencial','David Anderson','Blue Hole','Gestão',65.00),(143,'Gestão de Projetos TI','Ricardo Vargas','Sextante','Gestão',75.00),(144,'SQL Avançado','Joe Celko','Elsevier','Tecnologia',140.00),(145,'NoSQL Essencial','Pramod Sadalage','Addison-Wesley','Tecnologia',110.00),(146,'MongoDB na Prática','Kyle Banker','Manning','Tecnologia',125.00),(147,'PostgreSQL Guia','Regina Obe','Manning','Tecnologia',130.00),(148,'DevOps Handbook','Gene Kim','IT Revolution','Sistemas',145.00),(149,'SRE Google','Betsy Beyer','O Reilly','Sistemas',150.00),(150,'Soft Skills para Devs','Manu Mendes','Zahar','Gestão',40.00),(151,'Carreira em TI','Tadeu Ferreira','Editora ADS','Gestão',35.00);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `ID_VENDA` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int DEFAULT NULL,
  `DATA_VENDA` datetime DEFAULT NULL,
  `VALOR_TOTAL` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_VENDA`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,1,'2026-04-22 07:41:03',212.80),(2,1,'2026-05-11 00:13:31',212.80),(3,1,'2026-05-11 00:13:33',212.80);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-09 20:58:55
