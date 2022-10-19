-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: dentista
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `clvpac` int(4) DEFAULT NULL,
  `boleta` blob,
  `semestre` mediumtext,
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (7,'278A2745371612079CBBB2F9313C28A3','1');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alumnosver`
--

DROP TABLE IF EXISTS `alumnosver`;
/*!50001 DROP VIEW IF EXISTS `alumnosver`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `alumnosver` AS SELECT 
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `clvpac`,
 1 AS `clvdoc`,
 1 AS `edad`,
 1 AS `aes_decrypt(unhex(alumno.boleta),'alksdfj902uj40jr0qj')`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita` (
  `clvdoc` int(4) DEFAULT NULL,
  `clvpac` int(4) DEFAULT NULL,
  `claveproc` int(4) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  KEY `clvdoc` (`clvdoc`),
  KEY `clvpac` (`clvpac`),
  KEY `claveproc` (`claveproc`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`clvdoc`) REFERENCES `doctor` (`clvdoc`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`claveproc`) REFERENCES `procedimientos` (`claveproc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (2,6,8,'2017-05-11 15:00:00'),(2,7,2,'2017-05-13 15:00:00'),(2,6,1,'2017-05-13 15:30:00'),(2,6,1,'2017-05-14 16:30:00'),(2,6,10,'2017-05-13 17:30:00'),(2,7,4,'2017-05-14 00:00:00'),(2,7,6,'2017-05-13 20:00:00'),(2,6,10,'2017-05-20 15:00:00'),(2,NULL,11,'2017-05-18 15:00:00'),(2,NULL,11,'2017-05-18 15:30:00'),(2,NULL,11,'2017-05-18 16:00:00'),(2,NULL,11,'2017-05-18 16:30:00'),(2,NULL,11,'2017-05-18 17:00:00'),(2,NULL,11,'2017-05-18 17:30:00'),(2,NULL,11,'2017-05-18 18:00:00'),(2,NULL,11,'2017-05-18 18:30:00'),(2,NULL,11,'2017-05-18 19:00:00'),(2,NULL,11,'2017-05-18 19:30:00');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentadura`
--

DROP TABLE IF EXISTS `dentadura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dentadura` (
  `clvpac` int(4) DEFAULT NULL,
  `dientecondicion` varchar(100) DEFAULT NULL,
  `tipo` int(4) DEFAULT NULL,
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `dentadura_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentadura`
--

LOCK TABLES `dentadura` WRITE;
/*!40000 ALTER TABLE `dentadura` DISABLE KEYS */;
/*!40000 ALTER TABLE `dentadura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directo`
--

DROP TABLE IF EXISTS `directo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directo` (
  `clvpac` int(4) DEFAULT NULL,
  `area` mediumtext,
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `directo_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directo`
--

LOCK TABLES `directo` WRITE;
/*!40000 ALTER TABLE `directo` DISABLE KEYS */;
/*!40000 ALTER TABLE `directo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `directover`
--

DROP TABLE IF EXISTS `directover`;
/*!50001 DROP VIEW IF EXISTS `directover`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `directover` AS SELECT 
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `clvdoc`,
 1 AS `clvpac`,
 1 AS `edad`,
 1 AS `area`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `clvpac` int(4) NOT NULL,
  `area` mediumtext,
  KEY `clvpac` (`clvpac`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (2,'nunu');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `usuario` blob,
  `clvdoc` int(4) NOT NULL AUTO_INCREMENT,
  `correo` blob,
  `password` blob,
  `nombre` varchar(250) DEFAULT NULL,
  `apellidopa` varchar(250) DEFAULT NULL,
  `apellidoma` varchar(250) DEFAULT NULL,
  `sexo` varchar(8) DEFAULT NULL,
  `tema` int(3) DEFAULT '2',
  `particulas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`clvdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('1E41D6117F78E60BB45EBCF438123DFA',1,'16FA454519EE1F074E1DAF7ED6396D244B507E2097BB78CA7FA146D1C63FC8E8','1E41D6117F78E60BB45EBCF438123DFA','AFC37AD7A09533EFC3A4A4BFCC8998AC','DE10AA3CA31ED2575CA5099AC939FC49','775B78027C54218326D7A5CF674DA48B','Mujer',2,''),('0E2F1C87A457C22E8DE856148BE87372',2,'0E2F1C87A457C22E8DE856148BE87372','0E2F1C87A457C22E8DE856148BE87372','0E2F1C87A457C22E8DE856148BE87372','0E2F1C87A457C22E8DE856148BE87372','0E2F1C87A457C22E8DE856148BE87372','Hombre',2,NULL),('0F75D74F8E8D02C0492D23D402C3FC5B',3,'6944BDB8F63FAA7DA41BB2A5B8780381','6944BDB8F63FAA7DA41BB2A5B8780381','6944BDB8F63FAA7DA41BB2A5B8780381','6944BDB8F63FAA7DA41BB2A5B8780381','6944BDB8F63FAA7DA41BB2A5B8780381','Hombre',2,NULL);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `claveenf` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`claveenf`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` VALUES (1,'HPTA'),(2,'Alegias'),(3,'Anemia'),(4,'Asma'),(5,'Sangrado'),(6,'Cancer'),(7,'Paralisis Cerebral'),(8,'Sinusistis Cronica'),(10,'Dolor de Oido'),(11,'Epilepsia'),(12,'Desmayo'),(13,'Problemas de crecimiento'),(14,'Audicion'),(15,'Corazon'),(16,'Soplo Cardiaco'),(17,'Alergia al Latex'),(18,'Embarazo'),(19,'Convulsiones'),(20,'Tiroides'),(21,'El uso de drogas'),(22,'otra');
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfpac`
--

DROP TABLE IF EXISTS `enfpac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfpac` (
  `clvpac` int(4) DEFAULT NULL,
  `claveenf` int(4) DEFAULT NULL,
  KEY `clvpac` (`clvpac`),
  KEY `claveenf` (`claveenf`),
  CONSTRAINT `enfpac_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enfpac_ibfk_2` FOREIGN KEY (`claveenf`) REFERENCES `enfermedad` (`claveenf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfpac`
--

LOCK TABLES `enfpac` WRITE;
/*!40000 ALTER TABLE `enfpac` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfpac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externo`
--

DROP TABLE IF EXISTS `externo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externo` (
  `clvpac` int(4) DEFAULT NULL,
  `clvext` int(4) DEFAULT NULL,
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `externo_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externo`
--

LOCK TABLES `externo` WRITE;
/*!40000 ALTER TABLE `externo` DISABLE KEYS */;
/*!40000 ALTER TABLE `externo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `extver`
--

DROP TABLE IF EXISTS `extver`;
/*!50001 DROP VIEW IF EXISTS `extver`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `extver` AS SELECT 
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `clvpac`,
 1 AS `clvdoc`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historia` (
  `clavhis` int(4) NOT NULL AUTO_INCREMENT,
  `alergias` varchar(20) DEFAULT NULL,
  `descenfer` varchar(300) DEFAULT NULL,
  `anestesia` varchar(10) DEFAULT NULL,
  `comanes` varchar(300) DEFAULT NULL,
  `clvpac` int(4) DEFAULT NULL,
  `enfermedad` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`clavhis`),
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `last`
--

DROP TABLE IF EXISTS `last`;
/*!50001 DROP VIEW IF EXISTS `last`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `last` AS SELECT 
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `edad`,
 1 AS `clvdoc`,
 1 AS `clvpac`,
 1 AS `tipo`,
 1 AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ola`
--

DROP TABLE IF EXISTS `ola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ola` (
  `nom` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ola`
--

LOCK TABLES `ola` WRITE;
/*!40000 ALTER TABLE `ola` DISABLE KEYS */;
/*!40000 ALTER TABLE `ola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ols2`
--

DROP TABLE IF EXISTS `ols2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ols2` (
  `oji` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ols2`
--

LOCK TABLES `ols2` WRITE;
/*!40000 ALTER TABLE `ols2` DISABLE KEYS */;
INSERT INTO `ols2` VALUES ('Y„5¸\É|‘»¾ˆ±Ô„\ä'),('B399B0DE6FC5B39D61049A02C81D9E09FC347418B82D328CCC2B8B8DDAF92BAB');
/*!40000 ALTER TABLE `ols2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `nombre` blob,
  `sexo` varchar(10) DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `clvdoc` int(4) DEFAULT NULL,
  `clvpac` int(4) NOT NULL AUTO_INCREMENT,
  `tipo` int(4) DEFAULT NULL,
  `apellidom` blob,
  `apellidop` blob,
  `usuario` blob,
  `contrasena` blob,
  PRIMARY KEY (`clvpac`),
  KEY `clvdoc` (`clvdoc`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`clvdoc`) REFERENCES `doctor` (`clvdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('92DD43285116FF5F2DE099C90FBFEAF1','x','10/10/1998',2,6,2,'23E0BEB5256251F721223C7E0714117B','DBF07B91BA45437DADE211EF972899FB','DAEC5D9881E1005E2D2F034259973559','DAEC5D9881E1005E2D2F034259973559'),('EFC28629C31BDBA169EF29D1AC6E35FB','x','10/10/1998',2,7,1,'23E0BEB5256251F721223C7E0714117B','DBF07B91BA45437DADE211EF972899FB','DB23806FA4EB1214AFD681AE0A0B8469','DB23806FA4EB1214AFD681AE0A0B8469');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimientos`
--

DROP TABLE IF EXISTS `procedimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimientos` (
  `nombreproc` varchar(100) DEFAULT NULL,
  `claveproc` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`claveproc`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimientos`
--

LOCK TABLES `procedimientos` WRITE;
/*!40000 ALTER TABLE `procedimientos` DISABLE KEYS */;
INSERT INTO `procedimientos` VALUES ('engodoncia',1),('alergia',2),('DX',3),('Profilaxis',4),('Ter.Cep',5),('Obtulacion',6),('Resina/Amalgama',7),('Extraccion',8),('Endodoncia',9),('Revision',10),('Ocupado',11);
/*!40000 ALTER TABLE `procedimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `selecreportes`
--

DROP TABLE IF EXISTS `selecreportes`;
/*!50001 DROP VIEW IF EXISTS `selecreportes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `selecreportes` AS SELECT 
 1 AS `nombreproc`,
 1 AS `fecha`,
 1 AS `clvpac`,
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `selectcale`
--

DROP TABLE IF EXISTS `selectcale`;
/*!50001 DROP VIEW IF EXISTS `selectcale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `selectcale` AS SELECT 
 1 AS `nombreproc`,
 1 AS `fecha`,
 1 AS `clvpac`,
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!50001 DROP VIEW IF EXISTS `sesion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sesion` AS SELECT 
 1 AS `aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')`,
 1 AS `clvdoc`,
 1 AS `aes_decrypt(unhex(doctor.correo),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(doctor.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(doctor.apellidopa),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(doctor.apellidoma),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `tema`,
 1 AS `particulas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `solicitudcita`
--

DROP TABLE IF EXISTS `solicitudcita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudcita` (
  `comentario` varchar(100) DEFAULT NULL,
  `clvdoc` int(4) DEFAULT NULL,
  `clvpac` int(4) DEFAULT NULL,
  `estado` int(1) DEFAULT '0',
  `fecha` datetime DEFAULT NULL,
  `id` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `clvdoc` (`clvdoc`),
  KEY `clvpac` (`clvpac`),
  CONSTRAINT `solicitudcita_ibfk_1` FOREIGN KEY (`clvdoc`) REFERENCES `doctor` (`clvdoc`),
  CONSTRAINT `solicitudcita_ibfk_2` FOREIGN KEY (`clvpac`) REFERENCES `paciente` (`clvpac`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudcita`
--

LOCK TABLES `solicitudcita` WRITE;
/*!40000 ALTER TABLE `solicitudcita` DISABLE KEYS */;
INSERT INTO `solicitudcita` VALUES ('me duele la muela',2,6,1,'2017-05-11 15:00:00',4);
/*!40000 ALTER TABLE `solicitudcita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `verdocentes`
--

DROP TABLE IF EXISTS `verdocentes`;
/*!50001 DROP VIEW IF EXISTS `verdocentes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `verdocentes` AS SELECT 
 1 AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,
 1 AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,
 1 AS `sexo`,
 1 AS `clvdoc`,
 1 AS `edad`,
 1 AS `area`,
 1 AS `clvpac`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'dentista'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAlumno`(bol blob, semes int(1), clvp int(6))
begin
insert into alumno(boleta,semestre,clvpac) values (hex(Aes_encrypt(bol,'alksdfj902uj40jr0qj')),semes,clvp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCita`(c1 int(6),c2 int(6),c3 int(6),deito datetime)
begin
insert into cita(clvdoc,clvpac,claveproc,FECHA) values(c1,c2,c3,deito);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDentadura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDentadura`(clave int(6), dienteC varchar(100), type int(4))
begin
insert into dentadura(clvpac,dientecondicion,tipo) values(clave, dienteC, type);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDirect1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDirect1`(name blob, edad varchar(10), sexo varchar(8), clvdoc int(6), mat blob, pat blob,usuario blob, contrasena blob)
begin
insert into paciente(nombre,edad,sexo,clvdoc,apellidom,apellidop,usuario,contrasena) values (hex(Aes_encrypt(name,'alksdfj902uj40jr0qj')),edad,sexo,clvdoc,hex(Aes_encrypt(mat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(pat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(usuario,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(contrasena,'alksdfj902uj40jr0qj')));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDirecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDirecto`(clave int(6), are mediumtext)
begin
insert into directo(clvpac, area) values(clave,are);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDocente2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDocente2`(clave int(4), are2 mediumtext)
BEGIN
insert into docente(clvpac, area) values(clave,are2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarEnf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEnf`(clave1 int(6), clave2 int(4))
begin
insert into enfpac(clvpac, claveenf) values(clave1, clave2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarHistorial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarHistorial`(alerg varchar(20), descr varchar(300), anest varchar(10), coma varchar(300), clave int(6),enfermedad varchar(300))
begin
insert into historia(alergias,descenfer,anestesia,comanes,clvpac,enfermedad) values(alerg, descr, anest, coma, clave,enfermedad);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarPaciente1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPaciente1`(name blob, sex varchar(8), age varchar(10), clvdoc int(3), tipo int(1), mat blob, pat blob, usuario blob, contrasena blob)
begin
insert into paciente (nombre,sexo,edad,clvdoc,tipo,apellidom,apellidop,usuario,contrasena) values (hex(Aes_encrypt(name,'alksdfj902uj40jr0qj')),sex,age,clvdoc,tipo,hex(Aes_encrypt(mat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(pat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(usuario,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(contrasena,'alksdfj902uj40jr0qj')));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarPaciente2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPaciente2`(name blob, age varchar(10), sex varchar(8), clave1 int(6), type int(4), mat blob, pat blob,usuario blob, contrasena blob)
begin
insert into paciente(nombre,edad,sexo,clvdoc,tipo,apellidom,apellidop,usuario,contrasena) values(hex(Aes_encrypt(name,'alksdfj902uj40jr0qj')), age, sex, clave1, type, hex(Aes_encrypt(mat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(pat,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(usuario,'alksdfj902uj40jr0qj')),hex(Aes_encrypt(contrasena,'alksdfj902uj40jr0qj')));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarDoctor`(usuario blob, pass blob, correo blob, nombre blob, pat blob, mat blob, sexo varchar(15))
begin
insert into doctor(usuario, password, correo, nombre, apellidopa, apellidoma, sexo) values(hex(Aes_encrypt(usuario,"alksdfj902uj40jr0qj")), hex(Aes_encrypt(pass,"alksdfj902uj40jr0qj")), hex(Aes_encrypt(correo,"alksdfj902uj40jr0qj")), hex(Aes_encrypt(nombre,"alksdfj902uj40jr0qj")), hex(Aes_encrypt(pat,"alksdfj902uj40jr0qj")), hex(Aes_encrypt(mat,"alksdfj902uj40jr0qj")),sexo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1`(in boleta blob)
BEGIN
IF(SELECT EXISTS ( SELECT alumno.boleta FROM alumno WHERE alumno.boleta like CONCAT('%', boleta, '%')) ) THEN SELECT 'EXISTE';
ELSE
SELECT 'NO EXISTE';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alumnosver`
--

/*!50001 DROP VIEW IF EXISTS `alumnosver`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnosver` AS select aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidom`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,`paciente`.`sexo` AS `sexo`,`paciente`.`clvpac` AS `clvpac`,`paciente`.`clvdoc` AS `clvdoc`,`paciente`.`edad` AS `edad`,aes_decrypt(unhex(`alumno`.`boleta`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(alumno.boleta),'alksdfj902uj40jr0qj')` from (`paciente` join `alumno`) where ((`paciente`.`clvpac` = `alumno`.`clvpac`) and (`paciente`.`tipo` = '1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `directover`
--

/*!50001 DROP VIEW IF EXISTS `directover`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `directover` AS select aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidom`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,`paciente`.`sexo` AS `sexo`,`paciente`.`clvdoc` AS `clvdoc`,`paciente`.`clvpac` AS `clvpac`,`paciente`.`edad` AS `edad`,`directo`.`area` AS `area` from (`paciente` join `directo`) where (`paciente`.`clvpac` = `directo`.`clvpac`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `extver`
--

/*!50001 DROP VIEW IF EXISTS `extver`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `extver` AS select aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidom`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,`paciente`.`sexo` AS `sexo`,`paciente`.`clvpac` AS `clvpac`,`paciente`.`clvdoc` AS `clvdoc`,`paciente`.`edad` AS `edad` from `paciente` where (`paciente`.`tipo` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last`
--

/*!50001 DROP VIEW IF EXISTS `last`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last` AS select aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,`paciente`.`sexo` AS `sexo`,`paciente`.`edad` AS `edad`,`paciente`.`clvdoc` AS `clvdoc`,`paciente`.`clvpac` AS `clvpac`,`paciente`.`tipo` AS `tipo`,aes_decrypt(unhex(`paciente`.`apellidom`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')` from `paciente` order by `paciente`.`clvpac` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `selecreportes`
--

/*!50001 DROP VIEW IF EXISTS `selecreportes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `selecreportes` AS select `procedimientos`.`nombreproc` AS `nombreproc`,`cita`.`FECHA` AS `fecha`,`cita`.`clvpac` AS `clvpac`,aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')` from ((`cita` join `procedimientos`) join `paciente`) where ((`cita`.`claveproc` = `procedimientos`.`claveproc`) and (`cita`.`clvpac` = `paciente`.`clvpac`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `selectcale`
--

/*!50001 DROP VIEW IF EXISTS `selectcale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `selectcale` AS select `procedimientos`.`nombreproc` AS `nombreproc`,`cita`.`FECHA` AS `fecha`,`cita`.`clvpac` AS `clvpac`,aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')` from ((`cita` join `procedimientos`) join `paciente`) where ((`cita`.`claveproc` = `procedimientos`.`claveproc`) and (`cita`.`clvpac` = `paciente`.`clvpac`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sesion`
--

/*!50001 DROP VIEW IF EXISTS `sesion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sesion` AS select aes_decrypt(unhex(`doctor`.`usuario`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')`,`doctor`.`clvdoc` AS `clvdoc`,aes_decrypt(unhex(`doctor`.`correo`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.correo),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`doctor`.`password`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`doctor`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`doctor`.`apellidopa`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.apellidopa),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`doctor`.`apellidoma`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(doctor.apellidoma),'alksdfj902uj40jr0qj')`,`doctor`.`sexo` AS `sexo`,`doctor`.`tema` AS `tema`,`doctor`.`particulas` AS `particulas` from `doctor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `verdocentes`
--

/*!50001 DROP VIEW IF EXISTS `verdocentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `verdocentes` AS select aes_decrypt(unhex(`paciente`.`nombre`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidom`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')`,aes_decrypt(unhex(`paciente`.`apellidop`),'alksdfj902uj40jr0qj') AS `aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')`,`paciente`.`sexo` AS `sexo`,`paciente`.`clvdoc` AS `clvdoc`,`paciente`.`edad` AS `edad`,`docente`.`area` AS `area`,`paciente`.`clvpac` AS `clvpac` from (`paciente` join `docente`) where (`paciente`.`clvpac` = `docente`.`clvpac`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-17 22:14:37
