-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: nutritec
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

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
-- Table structure for table `asistenteia`
--

DROP TABLE IF EXISTS `asistenteia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistenteia` (
  `idAsistenteIA` int NOT NULL AUTO_INCREMENT,
  `idDieta` int DEFAULT NULL,
  `tipoConsulta` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombreAsistente` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mensajeUsuario` text COLLATE utf8mb4_general_ci,
  `mensajeAsistente` text COLLATE utf8mb4_general_ci,
  `fechaInteraccion` date DEFAULT NULL,
  PRIMARY KEY (`idAsistenteIA`),
  KEY `idDieta` (`idDieta`),
  CONSTRAINT `asistenteia_ibfk_1` FOREIGN KEY (`idDieta`) REFERENCES `dieta` (`idDieta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenteia`
--

LOCK TABLES `asistenteia` WRITE;
/*!40000 ALTER TABLE `asistenteia` DISABLE KEYS */;
INSERT INTO `asistenteia` VALUES (1,1,'Consulta de comida','NutriBot','?Qu? puedo cenar hoy?','Te recomiendo tacos de pollo.','2025-07-07'),(2,2,'Consulta de comida','NutriBot','?Que puedo Desayunar hoy?','Te recomiendo Un yogur sin asucar con avena.','2025-07-07'),(3,1,'Recomendaci?n','NutriBot','?Qu? puedo cenar?','Te recomiendo ensalada.','2025-08-09'),(4,2,'Seguimiento','NutriBot','?Cu?ntas calor?as com??','Aproximadamente 500 kcal.','2025-08-09'),(5,1,'Recomendaci?n','NutriBot','?Qu? puedo Comer?','Te recomiendo ensalada.','2022-07-19'),(6,2,'Seguimiento','NutriBot','?Cuanto Puedo subir de peso en 1 semana?','Aproximadamente de 3 a 5 kilos se se lleva bien la dieta','2021-03-23'),(7,1,'Recomendaci?n','NutriBot','?Qu? puedo Cenar hoy?','Te recomiendo Huevo con atun.','2022-10-11'),(8,2,'Seguimiento','NutriBot','?Cuantas proteinas consumi dentro de toda la semana?','Aproximadamente consumiste 20000 calorias','2023-03-13');
/*!40000 ALTER TABLE `asistenteia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comida`
--

DROP TABLE IF EXISTS `comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comida` (
  `idComida` int NOT NULL AUTO_INCREMENT,
  `idDescripcionComidas` int DEFAULT NULL,
  `nombreComida` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipoComida` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fechaConsumo` date DEFAULT NULL,
  `unidadComida` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idComida`),
  KEY `idDescripcionComidas` (`idDescripcionComidas`),
  CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`idDescripcionComidas`) REFERENCES `descripcioncomidas` (`idDescripcionComidas`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comida`
--

LOCK TABLES `comida` WRITE;
/*!40000 ALTER TABLE `comida` DISABLE KEYS */;
INSERT INTO `comida` VALUES (1,1,'Tacos de Pollo','Cena','2025-07-07','gramos'),(2,2,'Pan Integral con Huevos','Cena','2025-07-07','gramos'),(3,1,'Atun ','Comida','2021-10-21','Gramos'),(4,1,'Yogurt y Avena ','Desayuno','2022-01-05','Gramos'),(5,1,'Pechuga de Pollo','Comida','2023-07-25','Gramos'),(6,1,'Pan Integral Con Mernelada','desayuno','2020-04-25','Gramos'),(7,3,'Sopa de verduras','Cena','2025-08-09','ml'),(8,3,'pan integral','desayuno','2025-07-10','ml'),(9,2,'Caldo de pollo','Cena','2025-08-29','gramos'),(10,1,'Pollo al horno','Almuerzo','2025-08-09','gramos'),(11,2,'Ensalada C?sar','Cena','2025-08-09','gramos'),(12,5,'Sopa de verduras','Cena','2025-08-09','ml'),(13,5,'Sopa de verduras','Cena','2025-08-09','ml'),(14,1,'Arroz con Pollo','Comida','2021-07-19','Gramos');
/*!40000 ALTER TABLE `comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcioncomidas`
--

DROP TABLE IF EXISTS `descripcioncomidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descripcioncomidas` (
  `idDescripcionComidas` int NOT NULL AUTO_INCREMENT,
  `calorias` int DEFAULT NULL,
  `carbohidratos` int DEFAULT NULL,
  `proteinas` int DEFAULT NULL,
  PRIMARY KEY (`idDescripcionComidas`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcioncomidas`
--

LOCK TABLES `descripcioncomidas` WRITE;
/*!40000 ALTER TABLE `descripcioncomidas` DISABLE KEYS */;
INSERT INTO `descripcioncomidas` VALUES (1,350,45,20),(2,200,15,10),(3,500,60,20),(4,500,60,20),(5,200,60,20),(6,150,30,15),(7,350,45,20),(8,500,60,30),(9,150,30,10),(10,75,40,20),(11,35,35,36),(12,130,70,45),(13,130,70,45),(14,250,15,50);
/*!40000 ALTER TABLE `descripcioncomidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieta`
--

DROP TABLE IF EXISTS `dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta` (
  `idDieta` int NOT NULL AUTO_INCREMENT,
  `idComida` int DEFAULT NULL,
  `nombreDieta` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipoDieta` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idDieta`),
  KEY `idComida` (`idComida`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `dieta_ibfk_1` FOREIGN KEY (`idComida`) REFERENCES `comida` (`idComida`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieta`
--

LOCK TABLES `dieta` WRITE;
/*!40000 ALTER TABLE `dieta` DISABLE KEYS */;
INSERT INTO `dieta` VALUES (1,1,'Dieta Proteica','Alta en prote?na',1),(2,1,'Dieta Deportiva','Alta en prote?na',2),(9,1,'Dieta cetogenica','Mixta',3),(10,1,'Dieta Deportiva','Calorica',2),(11,1,'Dieta Deportiva','Calorica',2),(12,2,'Dieta Meditarranea','Proteica',2),(17,1,'Dieta Mixta','Proteica',2),(18,2,'Dieta Ligera','Mixta moderada',2),(19,1,'Dieta Baja en Grasas','Hipocal?rica',2),(20,2,'Dieta Alta en Prote?nas','Hipercal?rica',2),(21,1,'Dieta Baja en Grasas','Hipocal?rica',2),(22,2,'Dieta Alta en Prote?nas','Hipercal?rica',2),(23,1,'Dieta vegetariana','Proteica',2),(24,2,'Dieta Vegetariana','Calorica',2),(25,1,'Dieta Vegana','Vegana',2),(26,2,'Dieta Alta en Prote?nas','Proteica',2);
/*!40000 ALTER TABLE `dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecharegistro`
--

DROP TABLE IF EXISTS `fecharegistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecharegistro` (
  `idFechaRegistro` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idFechaRegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecharegistro`
--

LOCK TABLES `fecharegistro` WRITE;
/*!40000 ALTER TABLE `fecharegistro` DISABLE KEYS */;
INSERT INTO `fecharegistro` VALUES (1,'2025-08-09'),(2,'2025-07-29'),(3,'2025-06-30'),(4,'2025-12-21'),(5,'2024-11-05'),(6,'2021-11-15'),(7,'2022-05-21'),(8,'2024-12-23'),(9,'2021-11-20'),(10,'2021-01-29'),(11,'2023-05-15');
/*!40000 ALTER TABLE `fecharegistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilsalud`
--

DROP TABLE IF EXISTS `perfilsalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfilsalud` (
  `idPerfilSalud` int NOT NULL AUTO_INCREMENT,
  `idFechaRegistro` int DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pesoActual` decimal(5,2) DEFAULT NULL,
  `alergias` text COLLATE utf8mb4_general_ci,
  `condicionMedica` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idPerfilSalud`),
  KEY `idFechaRegistro` (`idFechaRegistro`),
  CONSTRAINT `perfilsalud_ibfk_1` FOREIGN KEY (`idFechaRegistro`) REFERENCES `fecharegistro` (`idFechaRegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilsalud`
--

LOCK TABLES `perfilsalud` WRITE;
/*!40000 ALTER TABLE `perfilsalud` DISABLE KEYS */;
INSERT INTO `perfilsalud` VALUES (1,1,1.80,'Masculino',72.50,'Ninguna','Diabetes'),(2,3,1.68,'Femenino',60.30,'Ninguna','Ninguna'),(3,1,1.75,'Masculino',72.50,'Ninguna','Ninguna'),(4,2,1.65,'Femenino',60.00,'L?cteos','Hipertensi?n'),(5,5,1.60,'Femenino',80.03,'Ninguna','Hipertension'),(6,4,1.72,'Masculino',50.00,'Ninguna','Anemia'),(7,7,1.52,'Masculino',71.03,'Ninguna','Ninguna'),(8,8,1.30,'Femenino',45.50,'Ninguna','Anemia');
/*!40000 ALTER TABLE `perfilsalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroUsuario`
--

DROP TABLE IF EXISTS `registroUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroUsuario` (
  `idRegistro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idRegistro`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroUsuario`
--

LOCK TABLES `registroUsuario` WRITE;
/*!40000 ALTER TABLE `registroUsuario` DISABLE KEYS */;
INSERT INTO `registroUsuario` VALUES (1,'Juan Pérez','juanperez@example.com','12345'),(2,'Die','d.floresf@upam.edu.com','$2y$10$k.41hLR39ttbq21xuYFS8OkszbpA.wX.voKM4Z09C6MYmdjJd6Uly'),(3,'Arely','arelyfl@gmail.com','$2y$10$uQIfiztU5C9SKd1eHFV4TebW0U9esluYCL2lxc6.Yk.PiH.SaYsTq'),(4,'Flores','floresd@gmail.com','$2y$10$H53wNt7sL.WF2D7YcEh7kuG4PaBXNr1hu3E3AGrc.qNuxuiTDLF6O'),(5,'Raul','raulG@upam.edu','$2y$10$vgxeihKYNbzxkSBMcaFTK.pDfJzk1gpk5FpBZ/x8A4zAy5AiJFu9S'),(6,'sf','d.floresf@','$2y$10$m3fJVX1J62zflTNzgiq4fujSL4jE6CDpWyrGMuGyuHcJ.GkpGXwmO'),(7,'aASASD','d.floresf@upa','$2y$10$SuMWIrpifaY3z6zf6UCP/OgGrVMvzW0ikSK/Wfd91jt9NkY1kowCq'),(8,'sdasa','d.floresf@upam','$2y$10$SrkzPnHxf.m0IasQJOIwFehAPWj20x.aBi3OkJoOqCmhpRq9X07Ae'),(9,'Diego','doego@gmail.com','$2y$10$VaYDGpMXcRxqKkhwuV2uweER3iuu153H17vE0ZBCg8aUSDTctZ89a');
/*!40000 ALTER TABLE `registroUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registronombre`
--

DROP TABLE IF EXISTS `registronombre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registronombre` (
  `idRegistroNombre` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoPaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoMaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idRegistroNombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registronombre`
--

LOCK TABLES `registronombre` WRITE;
/*!40000 ALTER TABLE `registronombre` DISABLE KEYS */;
INSERT INTO `registronombre` VALUES (1,'Diego','Flores','Flores'),(2,'Raul','Jimenes','Flores'),(3,'Pablo','Jimenes','Escobar'),(4,'Pedro','Garc?a','Mart?nez'),(5,'Luc?a','Hern?ndez','Rojas'),(6,'Yogui','Insano','Gutierres'),(7,'Yerbani','lopez','Flores'),(8,'Ramon','Sanchez','Ronaldo'),(9,'Gustambo','Sanchez','Ronaldo'),(10,'Yogui','Insano','Gutierres'),(11,'Yerbani','lopez','Flores'),(12,'Ramon','Sanchez','Ronaldo'),(13,'Gustambo','Sanchez','Ronaldo'),(14,'Yogui','Insano','Gutierres'),(15,'Yerbani','lopez','Flores'),(16,'Ramon','Sanchez','Ronaldo'),(17,'Gustambo','Sanchez','Ronaldo');
/*!40000 ALTER TABLE `registronombre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idRegistroNombre` int DEFAULT NULL,
  `idFechaRegistro` int DEFAULT NULL,
  `idPerfilSalud` int DEFAULT NULL,
  `idAsistenteIA` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoPaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoMaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idComida` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRegistroNombre` (`idRegistroNombre`),
  KEY `idFechaRegistro` (`idFechaRegistro`),
  KEY `idPerfilSalud` (`idPerfilSalud`),
  KEY `idAsistenteIA` (`idAsistenteIA`),
  KEY `idComida` (`idComida`),
  CONSTRAINT `idComida` FOREIGN KEY (`idComida`) REFERENCES `comida` (`idComida`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRegistroNombre`) REFERENCES `registronombre` (`idRegistroNombre`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idFechaRegistro`) REFERENCES `fecharegistro` (`idFechaRegistro`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idPerfilSalud`) REFERENCES `perfilsalud` (`idPerfilSalud`),
  CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`idAsistenteIA`) REFERENCES `asistenteia` (`idAsistenteIA`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,3,3,3,3,'Pablo','Ramires','Santos',1),(2,4,4,4,4,'Sherk','Solovino','Gutierres',2),(3,4,4,4,4,'Gustambo','Sanchez','Ronaldo',3),(4,5,5,5,5,'Yogui','Insano','Gutierres',4),(5,6,6,6,6,'Jesus','Celestino','Flores',5),(6,7,7,7,7,'Ramon','Valdes','Santana',6),(7,8,8,8,8,'Diego','Flores','Flores',7),(10,1,1,1,1,'Pedro','Garc?a','Mart?nez',NULL),(11,2,2,2,2,'Luc?a','Hern?ndez','Rojas',NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4);
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

-- Dump completed on 2025-12-01 21:31:01
