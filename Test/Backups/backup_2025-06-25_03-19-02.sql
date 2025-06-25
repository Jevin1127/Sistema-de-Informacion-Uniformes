-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_usuarios`
--

DROP TABLE IF EXISTS `_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(27) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `clave` varchar(70) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `token` varchar(50) DEFAULT NULL,
  `fecha_expiracion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol` (`id_rol`),
  KEY `id_caja` (`id_caja`),
  CONSTRAINT `_usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_usuarios`
--

LOCK TABLES `_usuarios` WRITE;
/*!40000 ALTER TABLE `_usuarios` DISABLE KEYS */;
INSERT INTO `_usuarios` VALUES (1,'USER','NEW USER','8f12799f15bb7c301cb20459da11e5edf6f4f8473cec27048d0abd5b63789fbd','holamundo@gmail.com',1,1,1,NULL,NULL),(100,'USUARIO','USUARIO NUEVO','870f4865f21e0ee520ab1c46c3242acdddf6c155926ee21815c016b41c7f2b92','holamundo@hotmail.com',2,1,1,NULL,NULL);
/*!40000 ALTER TABLE `_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(30) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `detalle` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (18,'Inicio de Sesión','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','2025-06-25 01:18:49');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caja` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,'General',1),(2,'Secundario',1);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCompleto` varchar(70) NOT NULL,
  `Identificacion` varchar(25) NOT NULL,
  `Telefono` varchar(70) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ClienteID`),
  KEY `ClienteID` (`ClienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Marco Antonio Solis','0000-00000-0000','9999-9999',1),(2,'Mauricio Calderon','0000-00000-0000','9999-9999',1),(3,'Marvin Ponce','0000-00000-0000','9999-9999',1),(11,'Ace Barcelone','0000-00000-0000','9999-9999',1),(12,'Jennifer López','0000-00000-0000','9999-9999',1),(13,'Jessenia Perez','0000-00000-0000','9999-9999',1),(14,'Alejandra Martinez','0000-00000-0000','9999-9999',1),(15,'Ellio Perlman','0000-00000-0000','9999-9999',1),(16,'Sebastian Ruly','0000-00000-0000','9999-9999',1),(17,'Angélica María ','0000-00000-0000','9999-9999',1),(18,'Matias Gomez','0000-00000-0000','9999-9999',0),(19,'Rodrigo Hernandez','0000-00000-0000','9999-9999',0),(20,'Kevin Carl','0000-00000-0000','9999-9999',1),(21,'Karla Mercado','0000-00000-0000','9999-9999',0),(22,'Desmond Miles','0000-00000-0000','9999-9999',1),(23,'Rodrigo','0000-00000-0000','9999-9999',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura` varchar(10) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'12345',5000.00,'2023-04-11'),(2,'12212',100.00,'2023-04-11'),(3,'23123',2000.00,'2023-04-11'),(4,'12334',468.00,'2023-04-11'),(5,'112313',500.00,'2024-03-14'),(6,'921123',1080.00,'2024-10-13'),(7,'900113',400.00,'2024-02-10'),(8,'23234',7500.00,'2024-02-17'),(10,'929102',2100.00,'2024-04-15'),(12,'123123',8379.00,'2024-03-15'),(13,'122311',5000.00,'2024-02-15'),(14,'213133',7500.00,'2024-05-15'),(15,'123123',5000.00,'2024-01-15'),(16,'1231212',4950.00,'2024-05-15'),(17,'345454',44000.00,'2024-06-15'),(18,'123124',5000.00,'2024-07-13'),(19,'231323',5500.00,'2024-08-11'),(20,'1231231',17500.00,'2024-09-05'),(21,'123555',4950.00,'2024-11-12'),(22,'1234551',4500.00,'2024-12-13'),(23,'123123',525.00,'2024-04-19'),(24,'1',50.50,'2024-07-15'),(25,'123123',455.00,'2024-07-10'),(26,'123123',20.20,'2024-07-16'),(27,'123123',105.00,'2024-07-17'),(28,'11223',100.00,'2024-07-30'),(29,'11211',100.00,'2024-08-01'),(30,'1',100.00,'2024-08-08'),(31,'1',100.00,'2024-08-01'),(32,'1',10500.00,'2025-03-24');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `proveedor` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL,
  `proveedor` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,'Plastitelas',2,'Polystretch','Tela en yarda para camisas de futbol.',100,50.00,5000.00),(2,2,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo',1,100.00,100.00),(3,3,'Almacén La Tijera',3,'Camisa blanca','Camisa blanca para personalizar.',50,40.00,2000.00),(4,4,'Almacén La Tijera',4,'Agujas en caja','Agujas para maquina de costurar.',50,12.00,600.00),(5,5,'Almacén La Tijera',4,'Agujas en caja','Agujas para maquina de costurar.',5,100.00,500.00),(6,6,'Plastitelas',5,'Tela Roja','Tela en yarda para camisas de futbol.',40,30.00,1200.00),(9,9,'Cortitelas',7,'Tela negra','tela negra para camisas negras ',100,10.00,1000.00),(10,10,'Confeccionadora Los robles',8,'Tela Blanca','Tela para bordado de camisas',40,50.00,2000.00),(12,12,'Abarrotería los castaños',12,'Hilo Rojo','Hilo de color rojo para camisas',150,49.00,7350.00),(13,13,'Confeccionadora Los robles',9,'Tela color negro','tela negra para camisas negras ',50,100.00,5000.00),(14,14,'Plastitelas',7,'Tela negra','tela negra para camisas negras',50,150.00,7500.00),(15,15,'Almacenes el bodeguero',4,'Agujas en caja','Agujas para maquina de costurar.',50,100.00,5000.00),(16,16,'Confeccionadora Los robles',10,'Botones','Botones para camisas polo',100,50.00,5000.00),(17,17,'Almacenes La Tela',1,'Hilo blanco','Hilo para costurar blanco, en royo',400,100.00,40000.00),(18,18,'Abarrotería los castaños',10,'Botones','Botones para camisas polo',100,50.00,5000.00),(19,19,'Almacenes el bodeguero',9,'Tela color negro','tela negra para camisas negras ',10,550.00,5500.00),(20,20,'Almacenes el bodeguero',12,'Hilo Rojo','Hilo de color rojo para camisas',350,50.00,17500.00),(21,21,'Abarrotería los castaños',7,'Tela negra','tela negra para camisas negras',50,100.00,5000.00),(22,22,'Almacenes el bodeguero',11,'Agujas para máquina','Agujas utilizadas para la máquina ',10,450.00,4500.00),(23,23,'Abarrotería los castaños',4,'Agujas en caja','Agujas para maquina de costurar.',50,10.00,500.00),(24,24,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo',1,50.00,50.00),(25,25,'Cortitelas',2,'Polystretch','Tela en yarda para camisas de futbol.',5,100.00,500.00),(26,26,'Almacenes el bodeguero',2,'Polystretch','Tela en yarda para camisas de futbol.',2,10.00,20.00),(27,27,'Cortitelas',2,'Polystretch','Tela en yarda para camisas de futbol.',1,100.00,100.00),(28,28,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo',1,100.00,100.00),(29,29,'Plastitelas',2,'Polystretch','Tela en yarda para camisas de futbol.',1,100.00,100.00),(30,30,'Almacén La Tijera',2,'Polystretch','Tela en yarda para camisas de futbol.',1,100.00,100.00),(31,31,'Almacén La Tijera',3,'Camisa blanca','Camisa blanca para personalizar.',1,100.00,100.00),(32,32,'Almacén La Tijera',2,'Polystretch','Tela en yarda para camisas de futbol.',100,100.00,10000.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_permisos`
--

DROP TABLE IF EXISTS `detalle_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_permisos`
--

LOCK TABLES `detalle_permisos` WRITE;
/*!40000 ALTER TABLE `detalle_permisos` DISABLE KEYS */;
INSERT INTO `detalle_permisos` VALUES (94,3,1,0),(95,3,2,0),(96,3,3,0),(134,18,1,0),(141,15,3,0),(142,16,1,0),(143,16,3,0),(144,16,7,0),(145,16,8,0),(146,16,9,0),(147,16,10,0),(148,16,11,0),(149,16,12,0),(150,16,13,0),(151,16,14,0),(152,16,15,0),(159,1,1,0),(160,1,3,0),(161,1,7,0),(162,1,8,0),(163,1,9,0),(164,1,10,0),(165,1,11,0),(166,1,12,0),(167,1,13,0),(168,1,14,0),(169,1,15,0),(210,5,1,NULL),(211,5,3,NULL),(212,2,1,NULL),(213,2,3,NULL),(214,2,7,NULL),(215,2,8,NULL),(216,2,9,NULL),(217,2,10,NULL),(223,22,16,NULL),(229,19,1,NULL),(230,19,3,NULL),(231,19,12,NULL),(232,19,15,NULL),(233,19,16,NULL),(236,31,1,NULL),(237,31,15,NULL),(238,31,16,NULL),(239,33,16,NULL),(240,34,1,NULL),(241,34,3,NULL),(242,34,7,NULL),(243,34,8,NULL),(244,34,9,NULL),(245,34,10,NULL),(246,34,11,NULL),(247,34,12,NULL),(248,34,13,NULL),(249,34,14,NULL),(250,34,15,NULL),(251,34,16,NULL),(252,34,17,NULL),(253,34,18,NULL),(254,34,19,NULL),(255,34,21,NULL),(256,34,22,NULL),(257,34,23,NULL),(258,34,24,NULL),(259,34,25,NULL),(260,34,26,NULL),(261,34,27,NULL);
/*!40000 ALTER TABLE `detalle_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_salida`
--

DROP TABLE IF EXISTS `detalle_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo_salida` varchar(80) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_salida`
--

LOCK TABLES `detalle_salida` WRITE;
/*!40000 ALTER TABLE `detalle_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `factura` varchar(10) NOT NULL,
  `tipo_productob` varchar(30) NOT NULL,
  `descripcionpb` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `color` varchar(30) NOT NULL DEFAULT 'N/A',
  `color_letra` varchar(100) NOT NULL DEFAULT 'N/A',
  `logo_izquierdo` varchar(100) NOT NULL DEFAULT 'N/A',
  `logo_derecho` varchar(100) NOT NULL DEFAULT 'N/A',
  `logo_delantero` varchar(100) NOT NULL DEFAULT 'N/A',
  `logo_trasero` varchar(100) NOT NULL DEFAULT 'N/A',
  `sub_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,'2A972','Uniforme','Uniforme completo de futbol, camisa, calsoneta, medias',1,100.00,'L','Negro','Blanco','Sin logo','Sin logo','Sin logo','Sin logo',100.00),(2,2,'19112','Uniforme','Uniforme completo de futbol, camisa, calsoneta, medias',10,100.00,'L','Negro','Blanco','Sin logo','Sin logo','Sin logo','Sin logo',1000.00),(3,3,'47BBA','Camisa','Camisa manga larga con logo empresarial',5,100.00,'M','Negro','Blanco ','Sin logo','Sin logo','Sin logo','Sin logo',500.00),(4,4,'90515','Polo','Camisa tipo Polo',10,100.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',1000.00),(5,5,'305CC','Uniforme','Uniforme completo de futbol, camisa, calsoneta, medias',100,100.00,'L','Negro','N/A','N/A','N/A','N/A','N/A',1000.00),(6,6,'21C46','Zapato','Zapatos',2,750.00,'L','Negro','N/A','N/A','N/A','N/A','N/A',1500.00),(7,7,'50033','Camisa','Camisa manga larga con logo empresarial',5,550.00,'L','Blanco','N/A','N/A','N/A','N/A','N/A',2750.00),(8,8,'A9731','Polo','Camisa tipo Polo',3,300.00,'','Blanca','N/A','N/A','N/A','N/A','N/A',900.00),(9,9,'563AC','Polo','Camisa tipo Polo',10,245.00,'M','Verde','N/A','N/A','N/A','N/A','N/A',2450.00),(10,10,'694B1','Camisa','Camisa personalizada con sublimación',5,450.00,'M','Blanco','Negro','N/A','N/A','Foto','Acid ghost',2250.00),(11,12,'41348','Polo de trabajo','Camisa polo para empresas',5,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',2500.00),(12,14,'ABC68','Polo de trabajo','Camisa polo para empresas',5,700.00,'M','Blanca','N/A','N/A','N/A','N/A','N/A',3500.00),(13,16,'4BB80','Uniforme','Uniformes para equipos de futbol',5,450.00,'M','Negro','Blanco','Escudo','Copa','FENAFUT','BAC',2250.00),(14,16,'4BB80','Uniforme','Uniformes para equipos de futbol',5,450.00,'S','Negro','Blanco','Escudo','Copa','FENAFUT','BAC',2250.00),(15,17,'35439','Zapato','Zapatos para trabajos pesados',2,700.00,'M','Blancos','N/A','N/A','N/A','N/A','N/A',1400.00),(16,19,'779C1','Uniforme','Uniformes para equipos de futbol',5,1000.00,'M','Blanco','N/A','N/A','N/A','N/A','N/A',5000.00),(17,20,'B3447','Zapato','Zapatos para trabajos pesados',4,500.00,'M','Verde','N/A','N/A','N/A','N/A','N/A',2000.00),(18,21,'AB644','Uniforme','Uniformes para equipos de futbol',5,400.00,'M','Amarillo','N/A','N/A','N/A','N/A','N/A',2000.00),(19,21,'AB644','Uniforme','Uniformes para equipos de futbol',5,400.00,'XL','Amarillo','N/A','N/A','N/A','N/A','N/A',2000.00),(20,22,'94AB3','Camisa','Camisa personalizada con sublimación',10,200.00,'L','Roja','N/A','N/A','N/A','N/A','N/A',2000.00),(21,23,'88A1B','Gorra','Gorra',5,300.00,'M','Rosado','N/A','N/A','N/A','N/A','N/A',1500.00),(22,24,'4232B','Gorra','Gorra',5,300.00,'L','Rosado','N/A','N/A','N/A','N/A','N/A',1500.00),(23,25,'31568','Camisa','Camisa manga larga con logo empresarial',5,200.00,'S','Rojo','N/A','N/A','N/A','N/A','N/A',1000.00),(24,26,'C856A','Camisa','Camisa manga larga con logo empresarial',15,650.00,'XL','Amarillo','Rojo','N/A','N/A','MUSICON','N/A',9750.00),(25,27,'50718','Gorra','Gorra',10,500.00,'S','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(26,27,'50718','Gorra','Gorra',10,500.00,'XXL','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(27,28,'CB98B','Camisa','Camisa personalizada con sublimación',20,200.00,'M','Rojo','N/A','N/A','N/A','N/A','N/A',4000.00),(28,28,'CB98B','Camisa','Camisa personalizada con sublimación',20,200.00,'XL','Rojo','N/A','N/A','N/A','N/A','N/A',4000.00),(29,28,'CB98B','Camisa','Camisa personalizada con sublimación',20,200.00,'S','Rojo','N/A','N/A','N/A','N/A','N/A',4000.00),(30,29,'37349','Polo de trabajo','Camisa polo para empresas',20,500.00,'M','Gris','Negro','N/A','N/A','FICOHSA','N/A',10000.00),(31,29,'37349','Polo de trabajo','Camisa polo para empresas',20,500.00,'XL','Gris','Negro','N/A','N/A','FICOHSA','N/A',10000.00),(32,30,'354BC','Zapato','Zapatos para trabajos pesados',10,1500.00,'S','Negro','N/A','N/A','N/A','Caterpilar','N/A',15000.00),(33,31,'72287','Uniforme','Uniformes para equipos de futbol',30,500.00,'L','Blanca','N/A','N/A','N/A','N/A','Aguila Roja',15000.00),(34,31,'72287','Uniforme','Uniformes para equipos de futbol',30,500.00,'XXL','Blanca','N/A','N/A','N/A','N/A','Aguila Roja',15000.00),(35,32,'48488','Gorra','Gorra',40,500.00,'S','Blanco','N/A','N/A','N/A','N/A','N/A',20000.00),(36,33,'04976','Camisa','Camisa manga larga con logo empresarial',10,500.00,'M','Verde','N/A','N/A','N/A','N/A','N/A',5000.00),(37,33,'04976','Camisa','Camisa manga larga con logo empresarial',10,500.00,'XL','Verde','N/A','N/A','N/A','N/A','N/A',5000.00),(38,33,'04976','Camisa','Camisa manga larga con logo empresarial',10,500.00,'XXL','Verde','N/A','N/A','N/A','N/A','N/A',5000.00),(39,34,'643AB','Camisa','Camisa personalizada con sublimación',20,500.00,'XL','Beige','N/A','N/A','N/A','N/A','N/A',10000.00),(40,35,'53758','Polo de trabajo','Camisa polo para empresas',25,400.00,'M','Blanco','N/A','N/A','N/A','Olimpia','N/A',10000.00),(41,36,'554B3','Zapato','Zapatos para trabajos pesados',10,500.00,'M','Azul','N/A','N/A','N/A','N/A','N/A',5000.00),(42,36,'554B3','Zapato','Zapatos para trabajos pesados',10,500.00,'XXL','Azul','N/A','N/A','N/A','N/A','N/A',5000.00),(43,37,'B9C82','Camisa','Camisa manga larga con logo empresarial',20,500.00,'L','Blanco','Gris','N/A','N/A','BAC','N/A',10000.00),(44,37,'B9C82','Camisa','Camisa manga larga con logo empresarial',20,500.00,'M','Blanco','Gris','N/A','N/A','BAC','N/A',10000.00),(45,37,'B9C82','Camisa','Camisa manga larga con logo empresarial',20,500.00,'XL','Blanco','Gris','N/A','N/A','BAC','N/A',10000.00),(46,38,'03B95','Gorra','Gorra',20,500.00,'M','Roja Oscuro','N/A','N/A','N/A','N/A','N/A',10000.00),(47,38,'03B95','Gorra','Gorra',20,500.00,'XXL','Roja Oscuro','N/A','N/A','N/A','N/A','N/A',10000.00),(48,39,'067AB','Polo de trabajo','Camisa polo para empresas',1,100.00,'M','Blanco','N/A','N/A','N/A','N/A','N/A',100.00),(49,40,'66046','Polo de trabajo','Camisa polo para empresas',1,100.00,'L','Negro','N/A','N/A','N/A','N/A','N/A',100.00),(50,42,'294C3','Polo de trabajo','Camisa polo para empresas',1,100.00,'L','Blanco','N/A','N/A','N/A','N/A','N/A',100.00),(51,43,'11409','Polo de trabajo','Camisa polo para empresas',1,100.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',100.00),(52,44,'A05A0','Uniforme','Uniformes para equipos de futbol',10,100.00,'M','Blanco','N/A','N/A','N/A','N/A','N/A',1000.00),(53,45,'B3383','Polo de trabajo','Camisa polo para empresas',10,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(54,46,'6C5A8','Uniforme','Uniformes para equipos de futbol',1,300.00,'L','Azul','Blanco','Logo del equipo','Nombre persona','Numero','Brayan #11',300.00),(55,46,'6C5A8','Uniforme','Uniformes para equipos de futbol',1,300.00,'L','Azul','Blanco','Logo del equipo','Nombre persona','Numero','Allan #9',300.00),(56,46,'6C5A8','Uniforme','Uniformes para equipos de futbol',1,300.00,'M','Azul','Blanco','Logo del equipo','Nombre persona','Numero','Juan #1',300.00),(57,46,'6C5A8','Uniforme','Uniformes para equipos de futbol',1,300.00,'S','Azul','Blanco','Logo del equipo','Nombre persona','Numero','Yanior #5',300.00),(58,46,'6C5A8','Camisa','Camisa manga larga con logo empresarial',1,280.00,'L','Blanco','N/A','N/A','N/A','N/A','N/A',280.00),(59,47,'8708A','Uniforme','Uniformes para equipos de futbol',1,100.00,'M','BNergo','N/A','N/A','N/A','N/A','N/A',100.00),(60,48,'5C929','Camisa','Camisa manga larga con logo empresarial',1,500.00,'M','Blanco','N/A','N/A','N/A','N/A','N/A',500.00),(61,49,'08118','Uniforme','Uniformes para equipos de futbol',10,500.00,'L','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(62,50,'AC897','Polo de trabajo','Camisa polo para empresas',2,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',1000.00),(63,51,'7C4B7','Camisa','Camisa manga larga con logo empresarial',10,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(64,52,'84101','Uniforme','Uniformes para equipos de futbol',1,333.00,'XL','roja','negro','N/A','N/A','N/A','N/A',333.00),(65,53,'58184','Camisa','Camisa manga larga con logo empresarial',2,500.00,'S','Negro','N/A','N/A','N/A','N/A','N/A',1000.00),(66,54,'C5997','Polo de trabajo','Camisa polo para empresas',10,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(67,54,'C5997','Polo de trabajo','Camisa polo para empresas',10,500.00,'L','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(68,55,'031B7','Zapato','Zapato de trabajo',10,16644.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',166440.00),(69,56,'05044','Zapato','Zapato de trabajo',10,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',5000.00),(70,57,'35428','Camisa','Camisa manga larga con logo empresarial',10,500.00,'M','Negro','N/A','N/A','N/A','N/A','N/A',5000.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallev`
--

DROP TABLE IF EXISTS `detallev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallev` (
  `id_detallev` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo_productob` varchar(30) NOT NULL,
  `descripcionpb` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `color` varchar(30) NOT NULL,
  `color_letra` varchar(100) NOT NULL,
  `logo_izquierdo` varchar(100) NOT NULL,
  `logo_derecho` varchar(100) NOT NULL,
  `logo_delantero` varchar(100) NOT NULL,
  `logo_trasero` varchar(100) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detallev`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallev`
--

LOCK TABLES `detallev` WRITE;
/*!40000 ALTER TABLE `detallev` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `mensaje` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Uniformes del Atlántico','9999-9999','Barrio El Centro, Plaza Coral, Tela, Honduras','¡POR FAVOR REVISAR SU PRODUCTO A LA HORA DE ENTREGA!\r\nNO SOMOS RESPONSABLES UNA VEZ ENTREGADO.');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `almacen` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'Plastitelas',2,'Polystretch','Tela en yarda para camisas de futbol.',159,'2024-04-12',1),(2,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo',143,'2024-04-12',1),(3,'Almacén La Tijera',3,'Camisa blanca','Camisa blanca para personalizar.',11,'2024-04-12',1),(4,'Almacén La Tijera',4,'Agujas en caja','Agujas para maquina de costurar.',85,'2024-04-11',1),(7,'Cortitelas',7,'Tela negra','tela negra para camisas negras xd',98,'2024-04-11',1),(8,'Confeccionadora Los robles',8,'Tela Blanca','Tela para bordado de camisas',40,'2024-04-15',1),(9,'Almacenes el bodeguero',10,'Botones','Botones para camisas polo',246,'2024-01-15',1),(10,'Abarrotería los castaños',12,'Hilo Rojo','Hilo de color rojo para camisas',250,'2024-03-15',1),(11,'Confeccionadora Los robles',9,'Tela color negro','tela negra para camisas negras ',60,'2024-02-15',1),(12,'Almacenes el bodeguero',11,'Agujas para máquina','Agujas utilizadas para la máquina ',10,'2024-04-13',1);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex` (
  `id_kardex` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `proveedor` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `tipo_kardex` enum('entrada','salida','','') NOT NULL,
  `fecha_entrada` date NOT NULL,
  `cantidad_entrada` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `factura` varchar(10) NOT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `motivo_salida` varchar(80) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `costo_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_kardex`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (1,0,'Plastitelas',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2023-04-11',100,'0000-00-00','12345',0,'',50.00,5000.00),(2,0,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo','entrada','2023-04-11',1,'0000-00-00','12212',0,'',100.00,100.00),(3,0,'Almacén La Tijera',3,'Camisa blanca','Camisa blanca para personalizar.','entrada','2023-04-11',50,'0000-00-00','23',0,'',40.00,2000.00),(4,0,'Almacén La Tijera',4,'Agujas en caja','Agujas para maquina de costurar.','entrada','2023-04-11',50,'0000-00-00','12334',0,'',12.00,600.00),(9,0,'',2,'Polystretch','','salida','0000-00-00',0,'2024-04-11','',1,'Uso de camisa',0.00,0.00),(10,0,'',2,'Polystretch','','salida','0000-00-00',0,'2024-04-12','',50,'Uso de camisa',0.00,0.00),(11,0,'Almacén La Tijera',4,'Agujas en caja','Agujas para maquina de costurar.','entrada','2024-03-14',5,'0000-00-00','1',0,'',100.00,500.00),(12,0,'',4,'Agujas en caja','','salida','0000-00-00',0,'2024-04-12','',40,'Uso de camisa',0.00,0.00),(18,0,'Cortitelas',7,'Tela negra','tela negra para camisas negras xd','entrada','2024-01-01',100,'0000-00-00','12123',0,'',10.00,1000.00),(19,0,'',7,'Tela negra','','salida','0000-00-00',0,'2024-04-12','',50,'Uso de camisa',0.00,0.00),(20,0,'',7,'Tela negra','','salida','0000-00-00',0,'2024-06-12','',10,'Uso de camisa',0.00,0.00),(21,0,'',3,'Camisa blanca','','salida','0000-00-00',0,'2024-04-13','',20,'Uso de camisa',0.00,0.00),(22,0,'',3,'Camisa blanca','','salida','0000-00-00',0,'2024-04-14','',20,'Uso de camisa',0.00,0.00),(23,0,'Confeccionadora Los robles',8,'Tela Blanca','Tela para bordado de camisas','entrada','2024-04-15',40,'0000-00-00','929102',0,'',50.00,2000.00),(24,0,'Almacenes el bodeguero',10,'Botones','Botones para camisas polo','entrada','2024-01-15',300,'0000-00-00','900912',0,'',40.00,18000.00),(25,0,'Abarrotería los castaños',12,'Hilo Rojo','Hilo de color rojo para camisas','entrada','2024-03-15',150,'0000-00-00','123123',0,'',49.00,7350.00),(26,0,'Confeccionadora Los robles',9,'Tela color negro','tela negra para camisas negras ','entrada','2024-02-15',50,'0000-00-00','122311',0,'',100.00,5000.00),(27,0,'Plastitelas',7,'Tela negra','tela negra para camisas negras','entrada','2024-05-15',50,'0000-00-00','213133',0,'',150.00,7500.00),(28,0,'Almacenes el bodeguero',4,'Agujas en caja','Agujas para maquina de costurar.','entrada','2024-01-15',50,'0000-00-00','123123',0,'',100.00,5000.00),(29,0,'Confeccionadora Los robles',10,'Botones','Botones para camisas polo','entrada','2024-06-15',100,'0000-00-00','123123',0,'',50.00,5000.00),(30,0,'Almacenes La Tela',1,'Hilo blanco','Hilo para costurar blanco, en royo','entrada','2024-07-15',400,'0000-00-00','345454',0,'',100.00,40000.00),(31,0,'Abarrotería los castaños',10,'Botones','Botones para camisas polo','entrada','2024-08-13',100,'0000-00-00','123124',0,'',50.00,5000.00),(32,0,'Almacenes el bodeguero',9,'Tela color negro','tela negra para camisas negras ','entrada','2024-09-11',10,'0000-00-00','231323',0,'',550.00,5500.00),(33,0,'Almacenes el bodeguero',12,'Hilo Rojo','Hilo de color rojo para camisas','entrada','2024-10-05',350,'0000-00-00','1231231',0,'',50.00,17500.00),(34,0,'Abarrotería los castaños',7,'Tela negra','tela negra para camisas negras','entrada','2024-11-12',50,'0000-00-00','123555',0,'',100.00,5000.00),(35,0,'Almacenes el bodeguero',11,'Agujas para máquina','Agujas utilizadas para la máquina ','entrada','2024-12-13',10,'0000-00-00','1234551',0,'',450.00,4500.00),(36,0,'',10,'Botones','','salida','0000-00-00',0,'2024-01-15','',100,'Confeccion de camisas',0.00,0.00),(37,0,'',1,'Hilo blanco','','salida','0000-00-00',0,'2024-02-15','',150,'Costura de gorras',0.00,0.00),(38,0,'',4,'Agujas en caja','','salida','0000-00-00',0,'2024-03-15','',15,'Costurar gorras',0.00,0.00),(39,0,'',12,'Hilo Rojo','','salida','0000-00-00',0,'2024-05-15','',100,'Reparacion de zapatos costurandolos',0.00,0.00),(40,0,'',7,'Tela negra','','salida','0000-00-00',0,'2024-06-15','',40,'Costurar camisas',0.00,0.00),(41,0,'',10,'Botones','','salida','0000-00-00',0,'2024-07-15','',100,'Costurar botones a camisas',0.00,0.00),(42,0,'',12,'Hilo Rojo','','salida','0000-00-00',0,'2024-08-15','',50,'Hilo para costurar camisas',0.00,0.00),(43,0,'',10,'Botones','','salida','0000-00-00',0,'2024-09-15','',50,'Botones que iran costurados en las camisas',0.00,0.00),(44,0,'',1,'Hilo blanco','','salida','0000-00-00',0,'2024-10-15','',100,'Costurar gorras con este hilo',0.00,0.00),(45,0,'',10,'Botones','','salida','0000-00-00',0,'2024-11-15','',50,'Botones laterales que iran en las gorras',0.00,0.00),(46,0,'',10,'Botones','','salida','0000-00-00',0,'2024-12-15','',100,'Botones para costurar en camisas',0.00,0.00),(47,0,'',12,'Hilo Rojo','','salida','0000-00-00',0,'2023-04-15','',100,'Hilo para los laterales',0.00,0.00),(48,0,'',4,'Agujas en caja','','salida','0000-00-00',0,'2024-04-19','',10,'Para la camisas',0.00,0.00),(49,0,'',4,'Agujas en caja','','salida','0000-00-00',0,'2024-04-19','',5,'Creacion de camisa polo para musicon',0.00,0.00),(50,0,'',7,'Tela negra','','salida','0000-00-00',0,'2024-04-19','',2,'Creacion de camisa polo para musicon',0.00,0.00),(51,0,'',10,'Botones','','salida','0000-00-00',0,'2024-04-19','',2,'Creacion de camisa polo para musicon',0.00,0.00),(52,0,'',10,'Botones','','salida','0000-00-00',0,'2024-04-19','',2,'Costurar botones a camisas',0.00,0.00),(53,0,'Abarrotería los castaños',4,'Agujas en caja','Agujas para maquina de costurar.','entrada','2024-04-19',50,'0000-00-00','123123',0,'',10.00,500.00),(54,0,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo','entrada','2024-07-15',1,'0000-00-00','1',0,'',50.00,50.00),(55,0,'Cortitelas',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2024-07-10',5,'0000-00-00','123123',0,'',100.00,500.00),(56,0,'Almacenes el bodeguero',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2024-07-16',2,'0000-00-00','123123',0,'',10.00,20.00),(57,0,'Cortitelas',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2024-07-17',1,'0000-00-00','123123',0,'',100.00,100.00),(58,0,'',1,'Hilo blanco','','salida','0000-00-00',0,'2024-07-17','',10,'Botones que iran costurados en las camisas',0.00,0.00),(59,0,'Almacén La Tijera',1,'Hilo blanco','Hilo para costurar blanco, en royo','entrada','2024-07-30',1,'0000-00-00','11223',0,'',100.00,100.00),(60,0,'Plastitelas',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2024-08-01',1,'0000-00-00','11211',0,'',100.00,100.00),(61,0,'Almacén La Tijera',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2024-08-08',1,'0000-00-00','1',0,'',100.00,100.00),(62,0,'Almacén La Tijera',3,'Camisa blanca','Camisa blanca para personalizar.','entrada','2024-08-01',1,'0000-00-00','1',0,'',100.00,100.00),(63,0,'Almacén La Tijera',2,'Polystretch','Tela en yarda para camisas de futbol.','entrada','2025-03-24',100,'0000-00-00','1',0,'',100.00,10000.00);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_kardex_insert` AFTER INSERT ON `kardex` FOR EACH ROW BEGIN
    IF NEW.tipo_kardex = 'entrada' THEN
        
        IF (SELECT COUNT(*) FROM inventario WHERE id_producto = NEW.id_producto) = 0 THEN
            
            INSERT INTO inventario (proveedor, id_producto, producto, descripcion, cantidad, fecha_entrada)
            VALUES (NEW.proveedor, NEW.id_producto, NEW.producto, NEW.descripcion, NEW.cantidad_entrada, NEW.fecha_entrada);
        ELSE
            
            UPDATE inventario
            SET cantidad = cantidad + NEW.cantidad_entrada
            WHERE id_producto = NEW.id_producto;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_kardex_insert_salida` AFTER INSERT ON `kardex` FOR EACH ROW BEGIN
    IF NEW.tipo_kardex = 'salida' THEN
        
        UPDATE inventario
        SET cantidad = CASE
            WHEN cantidad >= NEW.cantidad_salida THEN cantidad - NEW.cantidad_salida
            ELSE cantidad
        END
        WHERE id_producto = NEW.id_producto;

        
        IF ROW_COUNT() = 0 THEN
            
            INSERT INTO error_log (mensaje) VALUES ('No hay suficiente cantidad del producto en el inventario para la salida');
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'Hilo blanco','Hilo para costurar blanco, en royo',1),(2,'Polystretch','Tela en yarda para camisas de futbol.',1),(3,'Camisa blanca','Camisa blanca para personalizar.',1),(4,'Agujas en caja','Agujas para maquina de costurar.',1),(7,'Tela negra','tela negra para camisas negras',1),(8,'Tela Blanca','Tela para bordado de camisas',1),(9,'Tela color negro','tela negra para camisas negras ',1),(10,'Botones','Botones para camisas polo',1),(11,'Agujas para máquina','Agujas utilizadas para la máquina ',1),(12,'Hilo Rojo','Hilo de color rojo para camisas',1);
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Usuarios'),(3,'Configuracion'),(7,'Nueva Venta'),(9,'Proveedores'),(10,'Nueva Compra'),(11,'Realizadas'),(12,'Kardex'),(13,'Productos'),(14,'Inventario'),(15,'Roles'),(22,'Clientes'),(23,'Tallas'),(24,'Materia Prima'),(25,'Historial de Ventas'),(26,'Produccion'),(27,'Catalogo'),(28,'Reportes'),(29,'Logs de Acceso'),(32,'Entregas'),(33,'No Reclamados'),(35,'Manual de usuario'),(36,'Manual tecnico'),(37,'Respaldo');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_base`
--

DROP TABLE IF EXISTS `productos_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_base` (
  `id_productob` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_productob` varchar(20) DEFAULT NULL,
  `nombrepb` varchar(200) DEFAULT NULL,
  `descripcionpb` text DEFAULT NULL,
  `tipo_productob` varchar(50) DEFAULT NULL,
  `estadopb` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_productob`),
  UNIQUE KEY `codigo_productob` (`codigo_productob`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_base`
--

LOCK TABLES `productos_base` WRITE;
/*!40000 ALTER TABLE `productos_base` DISABLE KEYS */;
INSERT INTO `productos_base` VALUES (1,'CA001','Camisa Polo ','Camisa polo para empresas','Polo de trabajo',1),(2,'UF001','Uniforme de Futbol','Uniformes para equipos de futbol','Uniforme',1),(3,'CA002','Camisa Formal','Camisa manga larga con logo empresarial','Camisa',1),(4,'GO001','Gorra Deportiva','Gorra deportiva','Gorra',1),(5,'ZA001','Zapato de trabajo','Zapato de trabajo','Zapato',1),(7,'CA003','Camisa Personal','Camisa para sublimacion','Camisa',1),(8,'PA001','Pantalon de tela','Pantalon de tela','Pantalon Jean',1);
/*!40000 ALTER TABLE `productos_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedores_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `condiciones_pago` varchar(60) NOT NULL,
  `plazo_entrega` varchar(60) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`proveedores_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (13,'Cortitelas','Col. Alameda','9999-9999','Contado','2 dias',1),(14,'Almacén La Tijera','Col. las torres','9999-9999','Contado','1 dia',1),(15,'Plastitelas','Barrio. Concepción','9999-9999','Credito','3 dias',1),(22,'Almacenes La Tela','Col. Las crucitas','9999-9999','Plazo','En 2 dias',1),(23,'Confeccionadora Los robles','Frente a BAC Col. Las vegas','9999-9999','Al contado','2 dias',1),(24,'Almacenes el bodeguero','Colonia san martin','9999-9999','Credito','3 dias',1),(25,'Abarrotería los castaños','Colonia pedregal','9999-9999','A plazo','2 dias',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `permisos` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMINISTRADOR',1,'[\"Usuarios\",\"Configuracion\",\"Nueva Venta\",\"Proveedores\",\"Nueva Compra\",\"Realizadas\",\"Kardex\",\"Productos\",\"Inventario\",\"Roles\",\"Clientes\",\"Tallas\",\"Materia Prima\",\"Historial de Ventas\",\"Produccion\",\"Catalogo\",\"Reportes\",\"Logs de Acceso\",\"Entregas\",\"No Reclamados\",\"Manual de usuario\",\"Manual tecnico\",\"Respaldo\"]'),(2,'GERENTE',1,'[\"Nueva Venta\",\"Proveedores\",\"Nueva Compra\",\"Realizadas\",\"Kardex\",\"Productos\",\"Inventario\",\"Clientes\",\"Tallas\",\"Materia Prima\",\"Historial de Ventas\",\"Produccion\",\"Catalogo\",\"Reportes\",\"Entregas\",\"Manual de usuario\"]'),(4,'COSTURERO',1,'[\"Productos\",\"Inventario\",\"Tallas\",\"Materia Prima\",\"Produccion\",\"Catalogo\",\"Manual de usuario\"]'),(5,'CAJERO',1,'[\"Nueva Venta\",\"Clientes\",\"Tallas\",\"Historial de Ventas\",\"Catalogo\",\"Entregas\",\"Manual de usuario\"]'),(73,'MANUFACTURA',1,'[\"Usuarios\",\"Nueva Venta\",\"Proveedores\",\"Nueva Compra\",\"Realizadas\",\"Kardex\",\"Productos\",\"Inventario\",\"Roles\",\"Reportes\",\"Manual de usuario\"]');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallas`
--

DROP TABLE IF EXISTS `tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas` (
  `TallasID` int(11) NOT NULL AUTO_INCREMENT,
  `TipoTalla` text NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`TallasID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas`
--

LOCK TABLES `tallas` WRITE;
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
INSERT INTO `tallas` VALUES (1,'L',1),(2,'M',1),(3,'S',1),(4,'XL',1),(5,'XXL',1),(8,'18',1);
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura` varchar(10) NOT NULL,
  `cliente` varchar(30) NOT NULL,
  `identificacion` varchar(25) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `fecha_actual` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `cajero` varchar(30) NOT NULL,
  `comentario` varchar(80) NOT NULL DEFAULT 'N/A',
  `descuento` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `foto` varchar(100) DEFAULT 'default.jpg',
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (54,'C5997','Marco Antonio Solis','0000-00000-0000','9999-9999','2025-06-24','2025-06-25','USER','N/A',10,9000.00,2000.00,0.00,'default.jpg',2),(55,'031B7','Jennifer López','0000-00000-0000','9999-9999','2025-06-24','2025-06-26','USER','N/A',12,146467.20,1000.00,145467.20,'default.jpg',0),(56,'05044','Desmond Miles','0000-00000-0000','9999-9999','2025-06-24','2025-07-04','USER','N/A',10,4500.00,200.00,4300.00,'default.jpg',1),(57,'35428','Sebastian Ruly','0000-00000-0000','9999-9999','2025-06-24','2025-06-27','USER','N/A',5,4750.00,300.00,4450.00,'default.jpg',3);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 19:19:02
