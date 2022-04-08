-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: usuarios
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario ID` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ub_idx` (`Usuario ID`),
  CONSTRAINT `fk_ub` FOREIGN KEY (`Usuario ID`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,'2022-03-10 09:53:58',2,'Usuario registrado'),(2,'2022-03-11 09:26:22',3,'Usuario registrado'),(3,'2022-03-11 09:26:44',3,'Usuario Uniciado'),(4,'2022-03-11 09:27:26',3,'Usuario Editado'),(5,'2022-03-11 09:47:35',5,'Usuario registrado'),(6,'2022-03-11 09:49:41',5,'Usuario Editado'),(7,'2022-03-14 09:42:53',6,'Usuario registrado'),(8,'2022-03-14 09:44:37',6,'Usuario Editado'),(9,'2022-03-14 09:49:16',6,'Usuario Uniciado'),(10,'2022-03-26 13:47:14',7,'Usuario registrado'),(11,'2022-04-06 22:34:59',8,'Usuario registrado'),(12,'2022-04-06 22:35:15',8,'Sesion iniciada'),(13,'2022-04-06 22:39:29',8,'Sesion iniciada'),(14,'2022-04-07 21:05:22',9,'Usuario registrado'),(15,'2022-04-07 21:13:31',11,'Usuario registrado'),(16,'2022-04-07 21:14:07',8,'Sesion iniciada'),(17,'2022-04-07 21:14:30',8,'Sesion iniciada'),(18,'2022-04-07 21:15:19',8,'Sesion iniciada'),(19,'2022-04-07 21:21:11',12,'Usuario registrado'),(20,'2022-04-07 21:21:23',12,'Sesion iniciada'),(21,'2022-04-07 21:29:53',12,'Sesion iniciada'),(22,'2022-04-07 21:30:14',12,'Sesion iniciada'),(23,'2022-04-07 21:35:04',12,'Sesion iniciada'),(24,'2022-04-07 21:35:54',12,'Sesion iniciada'),(25,'2022-04-07 21:37:57',12,'Sesion iniciada'),(26,'2022-04-07 21:44:41',12,'Sesion iniciada'),(27,'2022-04-07 21:45:26',12,'Sesion iniciada'),(28,'2022-04-07 21:45:33',12,'Usuario Editado');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `eMail` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'asdad','adasd','asdad','asdasd','fa1b865d9280d4a488afa30fd60216e7'),(2,'dsad','asdasd','asd','sd','6226f7cbe59e99a90b5cef6f94f966fd'),(3,'beto','zzzz','zz','zz','25ed1bcb423b0b7200f485fc5ff71c8e'),(4,'beto','zzzz','zz','zz','25ed1bcb423b0b7200f485fc5ff71c8e'),(5,'fef','dsdsd','sdd','ff','8fa14cdd754f91cc6554c9e71929cce7'),(6,'meli','sdasd','asd','asd','202cb962ac59075b964b07152d234b70'),(7,'asd','asd','asd','123','7815696ecbf1c96e6894b779456d330e'),(8,'betobeto91@hotmail.com','alberto','privadaabasolo','8611128067','8c4b1157cb6f8884aa183ac0f1447e6c'),(9,'otrebla','a','a','a','202cb962ac59075b964b07152d234b70'),(10,'otrebla','a','a','a','202cb962ac59075b964b07152d234b70'),(11,'a','a','a','123','202cb962ac59075b964b07152d234b70'),(12,'otrebla1','juanluis','a','a','caf1a3dfb505ffed0d024130f58c5cfa');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'usuarios'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_EditarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EditarDatos`(eM char(40), Nom varchar(45), Dir varchar(45), Tel varchar(45),Contr varchar(45))
begin

insert into bitacora(Fecha,`Usuario ID`,Descripcion) values(current_timestamp(),(select ID from usuario where eMail=eM),'Usuario Editado');


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InicioSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InicioSesion`(eM char(40), Contr varchar(45))
begin

insert into bitacora(Fecha,`Usuario ID`,Descripcion) values(current_timestamp(),(select ID from usuario where eMail=eM),'Sesion iniciada');


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Registro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Registro`(eM char(40), Nom varchar(45), Dir varchar(45), Tel varchar(45),Contr varchar(45))
begin


insert into usuario(eMail,Nombre,Direccion,Telefono,Contraseña) values(eM,Nom,Dir,Tel,md5(Contr));
insert into bitacora(Fecha,`Usuario ID`,Descripcion) values(current_timestamp(),(select ID from usuario where eMail=eM),'Usuario registrado');


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08  9:12:07
