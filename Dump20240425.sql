CREATE DATABASE  IF NOT EXISTS `cinemax` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinemax`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cinemax
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (1,'John Travolta',67,'Estadounidense'),(2,'Al Pacino',82,'Estadounidense'),(3,'Elijah Wood',41,'Estadounidense');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directores`
--

DROP TABLE IF EXISTS `directores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directores` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_director`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directores`
--

LOCK TABLES `directores` WRITE;
/*!40000 ALTER TABLE `directores` DISABLE KEYS */;
INSERT INTO `directores` VALUES (1,'Quentin Tarantino','Estadounidense'),(2,'Francis Ford Coppola','Estadounidense'),(3,'Peter Jackson','Neozelandés');
/*!40000 ALTER TABLE `directores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `año` int DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'Pulp Fiction',1994,'Quentin Tarantino','Crimen, Drama'),(2,'El Padrino',1972,'Francis Ford Coppola','Crimen, Drama'),(3,'El Señor de los Anillos: La Comunidad del Anillo',2001,'Peter Jackson','Fantasía, Aventura');
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id_personaje` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  `id_pelicula_o_serie` int DEFAULT NULL,
  PRIMARY KEY (`id_personaje`),
  KEY `id_actor` (`id_actor`),
  KEY `id_pelicula_o_serie` (`id_pelicula_o_serie`),
  CONSTRAINT `personajes_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`),
  CONSTRAINT `personajes_ibfk_2` FOREIGN KEY (`id_pelicula_o_serie`) REFERENCES `peliculas` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Vincent Vega',1,1),(2,'Michael Corleone',2,2),(3,'Frodo Bolsón',3,3);
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_peliculas_actores`
--

DROP TABLE IF EXISTS `relacion_peliculas_actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_peliculas_actores` (
  `id_relacion` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  `papel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_relacion`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `relacion_peliculas_actores_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`),
  CONSTRAINT `relacion_peliculas_actores_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_peliculas_actores`
--

LOCK TABLES `relacion_peliculas_actores` WRITE;
/*!40000 ALTER TABLE `relacion_peliculas_actores` DISABLE KEYS */;
INSERT INTO `relacion_peliculas_actores` VALUES (1,1,1,'Vincent Vega'),(2,2,2,'Michael Corleone'),(3,3,3,'Frodo Bolsón');
/*!40000 ALTER TABLE `relacion_peliculas_actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cinemax'
--

--
-- Dumping routines for database 'cinemax'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 22:38:10
use cinemax;
CREATE VIEW `detalle_peliculas` AS
SELECT p.id_pelicula, p.titulo AS titulo_pelicula, p.año AS año_estreno, p.genero,
       d.nombre AS nombre_director,
       GROUP_CONCAT(a.nombre SEPARATOR ', ') AS actores
FROM peliculas p
JOIN directores d ON p.director = d.nombre
JOIN relacion_peliculas_actores rpa ON p.id_pelicula = rpa.id_pelicula
JOIN actores a ON rpa.id_actor = a.id_actor
GROUP BY p.id_pelicula;
-- Vista detalle_personajes_peliculas
CREATE VIEW `detalle_personajes_peliculas` AS
SELECT pj.id_personaje, pj.nombre AS nombre_personaje,
       pel.titulo AS titulo_pelicula, act.nombre AS nombre_actor
FROM personajes pj
JOIN peliculas pel ON pj.id_pelicula_o_serie = pel.id_pelicula
JOIN actores act ON pj.id_actor = act.id_actor;

-- Vista detalle_genero_actores_peliculas
CREATE VIEW `detalle_genero_actores_peliculas` AS
SELECT pel.id_pelicula, pel.titulo AS titulo_pelicula, pel.genero,
       COUNT(rpa.id_actor) AS cantidad_actores
FROM peliculas pel
LEFT JOIN relacion_peliculas_actores rpa ON pel.id_pelicula = rpa.id_pelicula
GROUP BY pel.id_pelicula;
DELIMITER //

CREATE FUNCTION peliculas_por_actor(actor_name VARCHAR(255)) RETURNS VARCHAR(1000) DETERMINISTIC
BEGIN
    DECLARE movie_list VARCHAR(1000);
    
    SELECT GROUP_CONCAT(p.titulo SEPARATOR ', ') INTO movie_list
    FROM peliculas p
    JOIN relacion_peliculas_actores rpa ON p.id_pelicula = rpa.id_pelicula
    JOIN actores a ON rpa.id_actor = a.id_actor
    WHERE a.nombre = actor_name;
    
    IF movie_list IS NULL THEN
        RETURN 'El actor no ha participado en ninguna pelicula.';
    ELSE
        RETURN movie_list;
    END IF;
END
DELIMITER //

CREATE PROCEDURE generar_informe_actor(IN actor_name VARCHAR(255))
BEGIN
    SELECT p.titulo AS Titulo, p.año AS Año, p.genero AS Genero
    FROM peliculas p
    JOIN relacion_peliculas_actores rpa ON p.id_pelicula = rpa.id_pelicula
    JOIN actores a ON rpa.id_actor = a.id_actor
    WHERE a.nombre = actor_name;
END //

DELIMITER ;
CREATE TABLE registro_peliculas (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT,
    titulo_pelicula VARCHAR(255),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER after_insert_pelicula
AFTER INSERT ON peliculas
FOR EACH ROW
BEGIN
    INSERT INTO registro_peliculas (id_pelicula, titulo_pelicula)
    VALUES (NEW.id_pelicula, NEW.titulo);
END;
//

DELIMITER ;
-- Testeando triggers: Insertar una nueva película
INSERT INTO peliculas (titulo, año, director, genero)
VALUES ('El Gran Escape', 1963, 'John Sturges', 'Drama, Acción, Aventura');