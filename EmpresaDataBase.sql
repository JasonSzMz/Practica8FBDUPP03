-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_examen_a_6a
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `departamentos`
--
create database Empresa;
use Empresa;
DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `dept_no` int(5) NOT NULL,
  `dnombre` varchar(30) NOT NULL,
  `loc` varchar(30) NOT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (10,'CONTABILIDAD','SEVILLA'),(20,'INVESTIGACION','MADRID'),(30,'VENTAS','BARCELONA'),(40,'PRODUCCION','BILBAO');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `emp_no` int(5) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `oficio` varchar(30) NOT NULL,
  `dir` int(5) NOT NULL,
  `fecha_alt` varchar(20) NOT NULL,
  `salario` int(10) NOT NULL,
  `comision` int(10) NOT NULL,
  `dept_no` int(5) NOT NULL,
  PRIMARY KEY (`emp_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `departamentos` (`dept_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17-12-1980',104000,0,20),(7499,'ARROYO','VENDEDOR',7698,'20-02-1980',208000,39000,30),(7521,'SALA','VENDEDOR',7698,'22-02-1981',162500,162500,30),(7566,'JIMENEZ','DIRECTOR',7839,'02-04-1981',386750,0,20),(7654,'MARTIN','VENDEDOR',7698,'29-09-1981',162500,182000,30),(7698,'NEGRO','DIRECTOR',7839,'01-05-1981',370500,0,30),(7788,'GIL','ANALISTA',7566,'09-11-1981',390000,0,20),(7839,'REY','PRESIDENTE',0,'17-11-1981',650000,0,10),(7844,'TOVAR','VENDEDOR',7698,'08-09-1981',195000,0,30),(7876,'ALONSO','EMPLEADO',7788,'23-09-1981',143000,0,20),(7900,'JIMENO','EMPLEADO',7698,'03-12-1981',1235000,0,30),(7902,'FERNANDEZ','ANALISTA',7566,'03-12-1982',390000,0,20),(7934,'MUNOZ','EMPLEADO',7782,'23-01-1982',390000,0,10);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitales`
--

DROP TABLE IF EXISTS `hospitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitales` (
  `cod_hospital` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `num_plazas` int(5) NOT NULL,
  PRIMARY KEY (`cod_hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitales`
--

LOCK TABLES `hospitales` WRITE;
/*!40000 ALTER TABLE `hospitales` DISABLE KEYS */;
INSERT INTO `hospitales` VALUES (1,'Rafael Mendez','Gran Via, 7',250),(2,'Reina Sofia','Junterones, 5',225),(3,'Principe Asturias','Avenida Colon',150),(4,'Virgen de la Arrixaca','Avenida Juan Carlos, I',250);
/*!40000 ALTER TABLE `hospitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `cod_hospital` int(5) NOT NULL,
  `dni` int(10) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `especialidad` varchar(40) NOT NULL,
  PRIMARY KEY (`cod_hospital`,`dni`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`cod_hospital`) REFERENCES `hospitales` (`cod_hospital`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,66755544,'Castillo Montes, Pedro','PSIQUIATRA'),(2,22233322,'Tristan Garcia, Ana','CIRUJANO'),(2,22233333,'Martinez Molina, Andres','CIRUJANO'),(4,22233311,'Martinez Molina, Gloria','PSIQUIATRA'),(4,33222111,'Mesa del Castillo, Juan','DERMATOLOGO');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal`  (
  `cod_hospital` int(5) NOT NULL,
  `dni` int(10) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `funcion` varchar(20) NOT NULL,
  `salario` int(7) NOT NULL,
  PRIMARY KEY (`cod_hospital`,`dni`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`cod_hospital`) REFERENCES `hospitales` (`cod_hospital`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,12345678,'Garcia Hernandez, Eladio','CONSERJE',1500),(1,66755544,'Castillo Montes, Pedro','MEDICO',1700),(1,87654321,'Fuentes Bermejo, Carlos','DIRECTOR',2000),(2,22233322,'Tristan Garcia, Ana','MEDICO',1900),(2,22233333,'Martinez Molina, Andres','MEDICO',1600),(2,55544433,'Gonzalez Marin, Alicia','CONSERJE',1200),(3,55544411,'Ruiz Hernandez, Caridad','MEDICO',1900),(3,99988333,'Serrano Diaz, Alejandro','DIRECTOR',2400),(4,22233311,'Martinez Molina, Gloria','MEDICO',1600),(4,33222111,'Mesa del Castillo, Juan','MEDICO',2200),(4,55544412,'Jimenez Jimenez, Dolores','CONSERJE',1200);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-26 17:47:48