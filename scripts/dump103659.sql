-- MySQL dump 10.13  Distrib 5.6.17, for osx10.7 (x86_64)
--
-- Host: localhost    Database: mc536db07
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `ArtistGenre`
--

DROP TABLE IF EXISTS `ArtistGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArtistGenre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artist_id` (`artist_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `artistgenre_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `MusicalArtist` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artistgenre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `MusicalGenre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtistGenre`
--

LOCK TABLES `ArtistGenre` WRITE;
/*!40000 ALTER TABLE `ArtistGenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArtistGenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blocks`
--

DROP TABLE IF EXISTS `Blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocker_id` int(11) NOT NULL,
  `blocked_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blocker_id` (`blocker_id`),
  KEY `blocked_id` (`blocked_id`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`blocker_id`) REFERENCES `Person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blocks_ibfk_2` FOREIGN KEY (`blocked_id`) REFERENCES `Person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blocks`
--

LOCK TABLES `Blocks` WRITE;
/*!40000 ALTER TABLE `Blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(40) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `resource` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_name` (`city_name`),
  UNIQUE KEY `resource` (`resource`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Oslo',1,'http://dbpedia.org/resource/Oslo'),(2,'City of Bridgeport',2,'http://dbpedia.org/resource/Bridgeport,_Connecticut'),(3,'Município de Belo Horizonte',3,'http://dbpedia.org/resource/Belo_Horizonte'),(4,'State of Minas Gerais',3,'http://dbpedia.org/resource/Minas_Gerais'),(5,'Oklahoma City',2,'http://dbpedia.org/resource/Oklahoma_City'),(6,'London',6,'http://dbpedia.org/resource/London'),(7,'Leyton',6,'http://dbpedia.org/resource/Leyton'),(8,'Perth',8,'http://dbpedia.org/resource/Perth'),(9,'Göteborg',9,'http://dbpedia.org/resource/Gothenburg'),(10,'Bergen',1,'http://dbpedia.org/resource/Bergen'),(11,'Los Angeles',2,'http://dbpedia.org/resource/Los_Angeles'),(12,'City of Tampa',2,'http://dbpedia.org/resource/Tampa,_Florida'),(13,'City of Atlanta',2,'http://dbpedia.org/resource/Atlanta'),(15,'Uberlândia',3,'http://dbpedia.org/resource/Uberl%C3%A2ndia'),(16,'Kings County',2,'http://dbpedia.org/resource/Brooklyn'),(17,'Paris',17,'http://dbpedia.org/resource/Paris'),(18,'City of Orlando',2,'http://dbpedia.org/resource/Orlando,_Florida'),(19,'Bilfawst or Bilfaust',6,'http://dbpedia.org/resource/Belfast'),(21,'Melbourne',8,'http://dbpedia.org/resource/Melbourne'),(22,'City of Houston',2,'http://dbpedia.org/resource/Houston'),(23,'Município do Rio de Janeiro',3,'http://dbpedia.org/resource/Rio_de_Janeiro'),(24,'State of Rio de Janeiro',3,'http://dbpedia.org/resource/Rio_de_Janeiro_(state)'),(25,'Hibbing, Minnesota',2,'http://dbpedia.org/resource/Hibbing,_Minnesota'),(26,'State of São Paulo',3,'http://dbpedia.org/resource/S%C3%A3o_Paulo_(state)'),(27,'Santos',3,'http://dbpedia.org/resource/Santos,_S%C3%A3o_Paulo'),(29,'The Hague',29,'http://dbpedia.org/resource/The_Hague'),(30,'Miami',2,'http://dbpedia.org/resource/Miami'),(31,'Aberdeen, Washington',2,'http://dbpedia.org/resource/Aberdeen,_Washington'),(32,'Town of Oyster Bay',2,'http://dbpedia.org/resource/Oyster_Bay_(town),_New_York'),(33,'City of Newport Beach',2,'http://dbpedia.org/resource/Newport_Beach,_California'),(35,'Seattle',2,'http://dbpedia.org/resource/Seattle'),(36,'Keflavík',36,'http://dbpedia.org/resource/Keflav%C3%ADk'),(37,'Garðabær',36,'http://dbpedia.org/resource/Gar%C3%B0ab%C3%A6r'),(38,'Escatawpa, Mississippi',2,'http://dbpedia.org/resource/Escatawpa,_Mississippi'),(39,'San Diego, California',2,'http://dbpedia.org/resource/San_Diego'),(40,'Dublin',40,'http://dbpedia.org/resource/Dublin'),(41,'Las Vegas',2,'http://dbpedia.org/resource/Las_Vegas'),(42,'O Município do Porto Alegre',3,'http://dbpedia.org/resource/Porto_Alegre'),(44,'Hannover',44,'http://dbpedia.org/resource/Hanover'),(45,'Leeds',6,'http://dbpedia.org/resource/Leeds'),(47,'Varginha',3,'http://dbpedia.org/resource/Varginha'),(48,'Koudekerk aan den Rijn',29,'http://dbpedia.org/resource/Koudekerk_aan_den_Rijn'),(49,'Goiânia, Brazil',3,'http://dbpedia.org/resource/Goi%C3%A2nia'),(50,'State of Goiás',3,'http://dbpedia.org/resource/Goi%C3%A1s'),(51,'City of Rancho Santa Margarita',2,'http://dbpedia.org/resource/Rancho_Santa_Margarita,_California'),(53,'Montreal',53,'http://dbpedia.org/resource/Montreal'),(56,'Brighton',6,'http://dbpedia.org/resource/Brighton'),(57,'Krefeld',44,'http://dbpedia.org/resource/Krefeld'),(58,'Hanna',53,'http://dbpedia.org/resource/Hanna,_Alberta'),(59,'Middletown, Connecticut',2,'http://dbpedia.org/resource/Middletown,_Connecticut'),(63,'City of Philadelphia',2,'http://dbpedia.org/resource/Philadelphia'),(64,'Antibes',17,'http://dbpedia.org/resource/Antibes'),(65,'Forest Hills',2,'http://dbpedia.org/resource/Forest_Hills,_Queens'),(67,'City of Ruston',2,'http://dbpedia.org/resource/Ruston,_Louisiana'),(68,'St Kilda',8,'http://dbpedia.org/resource/St_Kilda,_Victoria'),(70,'City of Boston',2,'http://dbpedia.org/resource/Boston'),(71,'Glasgow',71,'http://dbpedia.org/resource/Glasgow'),(73,'Stratford',53,'http://dbpedia.org/resource/Stratford,_Ontario'),(74,'City of Winnipeg',53,'http://dbpedia.org/resource/Winnipeg'),(76,'Crouch End',6,'http://dbpedia.org/resource/Crouch_End'),(78,'State of Pará',3,'http://dbpedia.org/resource/Par%C3%A1'),(80,'GUARULHOS',3,'http://dbpedia.org/resource/Guarulhos'),(81,'Jacksonville',2,'http://dbpedia.org/resource/Jacksonville,_Florida'),(82,'Brasília',3,'http://dbpedia.org/resource/Bras%C3%ADlia'),(83,'Distrito Federal',3,'http://dbpedia.org/resource/Federal_District_(Brazil)'),(84,'Darien, Connecticut',2,'http://dbpedia.org/resource/Darien,_Connecticut'),(85,'State of Rio Grande do Sul',3,'http://dbpedia.org/resource/Rio_Grande_do_Sul'),(86,'The Municipality of Ijuí',3,'http://dbpedia.org/resource/Iju%C3%AD'),(87,'Akron',2,'http://dbpedia.org/resource/Akron,_Ohio'),(89,'Cleveland',2,'http://dbpedia.org/resource/Cleveland'),(90,'City of Little Rock, Arkansas',2,'http://dbpedia.org/resource/Little_Rock,_Arkansas'),(93,'Topeka, Kansas',2,'http://dbpedia.org/resource/Topeka,_Kansas'),(95,'City of Macon',2,'http://dbpedia.org/resource/Macon,_Georgia'),(96,'District of Columbia',2,'http://dbpedia.org/resource/Washington,_D.C.'),(99,'City of Toronto',53,'http://dbpedia.org/resource/Toronto'),(100,'Dùn Dè',100,'http://dbpedia.org/resource/Dundee'),(101,'San Francisco',2,'http://dbpedia.org/resource/San_Francisco'),(103,'City of Austin',2,'http://dbpedia.org/resource/Austin,_Texas'),(105,'Ealing',6,'http://dbpedia.org/resource/Ealing'),(107,'Ville d\'Ottawa',53,'http://dbpedia.org/resource/Ottawa'),(108,'Eau Claire, Wisconsin',2,'http://dbpedia.org/resource/Eau_Claire,_Wisconsin'),(111,'Stockholm',9,'http://dbpedia.org/resource/Stockholm'),(113,'Abingdon-on-Thames',6,'http://dbpedia.org/resource/Abingdon-on-Thames'),(116,'Cambridge, Massachusetts',2,'http://dbpedia.org/resource/Cambridge,_Massachusetts'),(117,'Wilmette, Illinois',2,'http://dbpedia.org/resource/Wilmette,_Illinois'),(120,'City of Palm Desert',2,'http://dbpedia.org/resource/Palm_Desert,_California'),(122,'Tallahassee',2,'http://dbpedia.org/resource/Tallahassee,_Florida'),(124,'Versailles',17,'http://dbpedia.org/resource/Versailles_(city)'),(125,'Freie und Hansestadt Hamburg',44,'http://dbpedia.org/resource/Hamburg'),(126,'Greenville, Florida',2,'http://dbpedia.org/resource/Greenville,_Florida'),(131,'Eschwege',44,'http://dbpedia.org/resource/Eschwege'),(132,'Teignmouth',132,'http://dbpedia.org/resource/Teignmouth'),(137,'City of Detroit',2,'http://dbpedia.org/resource/Detroit'),(139,'Bowling Green, Kentucky',2,'http://dbpedia.org/resource/Bowling_Green,_Kentucky'),(140,'Eskilstuna',9,'http://dbpedia.org/resource/Eskilstuna'),(141,'Town of Whitby',53,'http://dbpedia.org/resource/Whitby,_Ontario'),(143,'City of Ukiah',2,'http://dbpedia.org/resource/Ukiah,_California'),(144,'Ajax',53,'http://dbpedia.org/resource/Ajax,_Ontario'),(145,'County Down',6,'http://dbpedia.org/resource/County_Down'),(146,'Donaghadee',6,'http://dbpedia.org/resource/Donaghadee'),(147,'Bangor',147,'http://dbpedia.org/resource/Bangor,_County_Down'),(149,'Buffalo, New York',2,'http://dbpedia.org/resource/Buffalo,_New_York'),(152,'Hertford',6,'http://dbpedia.org/resource/Hertford'),(153,'Flushing',2,'http://dbpedia.org/resource/Flushing,_Queens'),(155,'Wakefield',156,'http://dbpedia.org/resource/Wakefield');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(40) DEFAULT NULL,
  `resource` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource` (`resource`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Norway','http://dbpedia.org/resource/Norway'),(2,'the United States','http://dbpedia.org/resource/United_States'),(3,'Brazil','http://dbpedia.org/resource/Brazil'),(6,'the United Kingdom','http://dbpedia.org/resource/United_Kingdom'),(8,'Australia','http://dbpedia.org/resource/Australia'),(9,'Sweden','http://dbpedia.org/resource/Sweden'),(17,'France','http://dbpedia.org/resource/France'),(29,'the Netherlands','http://dbpedia.org/resource/Netherlands'),(36,'Iceland','http://dbpedia.org/resource/Iceland'),(40,'Ireland','http://dbpedia.org/resource/Republic_of_Ireland'),(44,'Germany','http://dbpedia.org/resource/Germany'),(53,'Canada','http://dbpedia.org/resource/Canada'),(71,'Scotland','http://dbpedia.org/resource/Scotland_national_football_team'),(100,'Alba','http://dbpedia.org/resource/Scotland'),(132,'Devon','http://dbpedia.org/resource/Devon'),(147,'Norlin Airlann\'\'','http://dbpedia.org/resource/Northern_Ireland'),(152,'Daehan Minguk','http://dbpedia.org/resource/South_Korea'),(156,'England','http://dbpedia.org/resource/England');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Knows`
--

DROP TABLE IF EXISTS `Knows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Knows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `colleague_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`,`colleague_id`),
  KEY `colleague_id` (`colleague_id`),
  CONSTRAINT `knows_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `knows_ibfk_2` FOREIGN KEY (`colleague_id`) REFERENCES `Person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Knows`
--

LOCK TABLES `Knows` WRITE;
/*!40000 ALTER TABLE `Knows` DISABLE KEYS */;
INSERT INTO `Knows` VALUES (56,1,7),(120,2,1),(121,2,46),(119,2,47),(77,3,16),(78,3,28),(76,3,37),(75,3,47),(168,6,8),(169,6,29),(170,6,32),(167,6,46),(166,6,47),(165,8,9),(164,8,33),(174,9,4),(172,9,7),(179,9,8),(178,9,11),(175,9,13),(180,9,32),(173,9,37),(176,9,46),(171,9,47),(177,9,49),(122,16,3),(125,16,28),(123,16,36),(124,16,43),(34,17,15),(21,17,18),(25,17,19),(30,17,20),(31,17,21),(33,17,22),(35,17,23),(22,17,24),(27,17,25),(26,17,26),(18,17,38),(19,17,39),(20,17,40),(24,17,41),(28,17,42),(29,17,43),(32,17,44),(23,17,45),(57,18,17),(61,18,20),(62,18,22),(63,18,23),(59,18,26),(58,18,39),(60,18,42),(95,19,15),(81,19,17),(84,19,18),(92,19,20),(93,19,21),(96,19,23),(85,19,24),(89,19,25),(88,19,26),(80,19,38),(82,19,39),(83,19,40),(87,19,41),(90,19,42),(91,19,43),(86,19,45),(79,19,47),(94,19,48),(157,21,19),(158,21,20),(160,22,17),(162,22,18),(161,22,39),(163,22,42),(159,22,47),(200,23,15),(183,23,17),(186,23,18),(191,23,19),(196,23,20),(197,23,21),(199,23,22),(188,23,24),(193,23,25),(192,23,26),(187,23,37),(182,23,38),(184,23,39),(185,23,40),(190,23,41),(194,23,42),(195,23,43),(198,23,44),(189,23,45),(181,23,47),(106,26,17),(109,26,18),(113,26,19),(116,26,20),(117,26,21),(118,26,23),(111,26,24),(114,26,25),(110,26,37),(105,26,38),(107,26,39),(108,26,40),(112,26,41),(115,26,43),(104,26,47),(205,28,3),(208,28,16),(204,28,24),(207,28,25),(206,28,36),(203,28,40),(202,28,47),(99,30,4),(100,30,10),(98,30,37),(97,30,47),(2,33,8),(1,33,36),(102,36,14),(101,36,16),(103,36,28),(67,37,3),(68,37,19),(73,37,23),(65,37,24),(71,37,25),(70,37,26),(69,37,30),(72,37,43),(66,37,45),(64,37,47),(16,38,15),(4,38,17),(6,38,18),(9,38,19),(13,38,20),(14,38,21),(15,38,22),(17,38,23),(10,38,26),(5,38,39),(8,38,41),(11,38,42),(12,38,43),(7,38,45),(3,38,47),(54,40,15),(38,40,17),(40,40,18),(45,40,19),(50,40,20),(51,40,21),(53,40,22),(55,40,23),(42,40,24),(47,40,25),(46,40,26),(41,40,37),(37,40,38),(39,40,39),(44,40,41),(48,40,42),(49,40,43),(52,40,44),(43,40,45),(36,40,47),(147,43,15),(141,43,16),(128,43,17),(131,43,18),(136,43,19),(142,43,20),(144,43,21),(146,43,22),(148,43,23),(133,43,24),(139,43,25),(138,43,26),(137,43,36),(132,43,37),(127,43,38),(129,43,39),(130,43,40),(135,43,41),(140,43,42),(134,43,45),(143,43,46),(126,43,47),(145,43,48),(74,45,50),(151,46,10),(149,46,47),(150,46,48),(152,49,4),(155,49,8),(156,49,9),(154,49,11),(153,49,13),(201,50,45);
/*!40000 ALTER TABLE `Knows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikesMusic`
--

DROP TABLE IF EXISTS `LikesMusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LikesMusic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `likesmusic_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likesmusic_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `MusicalArtist` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikesMusic`
--

LOCK TABLES `LikesMusic` WRITE;
/*!40000 ALTER TABLE `LikesMusic` DISABLE KEYS */;
INSERT INTO `LikesMusic` VALUES (1,33,1),(2,33,2),(3,33,3),(4,33,4),(5,33,5),(6,33,6),(7,33,7),(8,33,8),(9,38,9),(10,38,10),(11,38,11),(12,38,12),(13,38,13),(14,38,14),(15,38,15),(16,38,16),(17,38,17),(18,38,18),(19,38,19),(20,38,20),(21,17,21),(22,17,22),(23,17,23),(24,17,24),(25,17,25),(26,17,26),(27,17,27),(28,17,28),(29,40,29),(30,40,30),(31,40,31),(32,40,32),(33,40,33),(34,40,34),(35,40,35),(36,40,36),(37,40,37),(38,40,38),(39,1,60),(40,1,61),(41,1,62),(42,1,63),(43,1,64),(44,1,65),(45,1,11),(46,1,33),(47,1,14),(48,1,69),(49,1,70),(50,37,71),(51,37,72),(52,37,73),(53,37,23),(54,37,75),(55,37,33),(56,37,56),(57,37,6),(58,37,17),(59,37,80),(60,37,81),(61,37,82),(62,37,20),(63,37,84),(64,37,85),(65,37,86),(66,24,87),(67,24,29),(68,24,39),(69,24,90),(70,24,91),(71,24,92),(72,24,93),(73,24,94),(74,24,95),(75,24,65),(76,24,97),(77,24,31),(78,24,99),(79,24,100),(80,24,101),(81,24,102),(82,24,25),(83,24,104),(84,24,105),(85,24,33),(86,24,53),(87,24,14),(88,24,55),(89,24,110),(90,24,111),(91,24,6),(92,24,16),(93,24,114),(94,24,115),(95,24,57),(96,24,117),(97,24,118),(98,24,119),(99,24,120),(100,24,121),(101,24,58),(102,24,123),(103,24,124),(104,24,125),(105,24,126),(106,24,127),(107,24,128),(108,24,129),(109,24,130),(110,24,131),(111,24,132),(112,45,133),(113,45,134),(114,45,9),(115,45,136),(116,45,137),(117,45,138),(118,45,43),(119,45,140),(120,45,141),(121,45,142),(122,45,46),(123,45,144),(124,45,145),(125,45,31),(126,45,101),(127,45,33),(128,45,149),(129,45,150),(130,45,151),(131,45,152),(132,45,153),(133,45,154),(134,45,155),(135,45,156),(136,45,129),(137,3,158),(138,3,42),(139,3,160),(140,3,23),(141,3,25),(142,3,57),(143,3,164),(144,3,165),(145,3,166),(146,3,28),(147,41,71),(148,41,169),(149,41,9),(150,41,171),(151,41,172),(152,41,173),(153,41,174),(154,41,90),(155,41,138),(156,41,177),(157,41,178),(158,41,179),(159,41,180),(160,41,181),(161,41,182),(162,41,183),(163,41,184),(164,41,101),(165,41,186),(166,41,187),(167,41,188),(168,41,189),(169,41,13),(170,41,191),(171,41,16),(172,41,17),(173,41,194),(174,41,195),(175,41,196),(176,41,197),(177,41,198),(178,19,199),(179,19,200),(180,19,201),(181,19,65),(182,19,203),(183,19,204),(184,19,205),(185,19,206),(186,19,207),(187,19,208),(188,19,105),(189,19,210),(190,19,211),(191,19,212),(192,19,213),(193,19,214),(194,19,215),(195,19,216),(196,30,45),(197,30,218),(198,30,219),(199,30,56),(200,30,221),(201,30,222),(202,30,70),(203,30,224),(204,36,225),(205,36,137),(206,36,227),(207,36,228),(208,36,229),(209,36,31),(210,36,101),(211,36,25),(212,36,57),(213,36,129),(214,26,39),(215,26,100),(216,26,101),(217,26,238),(218,26,239),(219,26,240),(220,26,241),(221,25,39),(222,25,243),(223,25,43),(224,25,245),(225,25,246),(226,25,94),(227,25,65),(228,25,10),(229,25,250),(230,25,100),(231,25,206),(232,25,33),(233,25,254),(234,25,57),(235,25,131),(236,42,257),(237,42,258),(238,42,259),(239,42,260),(240,42,261),(241,42,262),(242,42,263),(243,42,90),(244,42,43),(245,42,61),(246,42,91),(247,42,92),(248,42,269),(249,42,270),(250,42,24),(251,42,246),(252,42,273),(253,42,65),(254,42,275),(255,42,276),(256,42,277),(257,42,278),(258,42,205),(259,42,280),(260,42,50),(261,42,282),(262,42,283),(263,42,284),(264,42,285),(265,42,35),(266,42,287),(267,42,288),(268,42,289),(269,42,290),(270,42,291),(271,42,292),(272,42,293),(273,42,121),(274,42,20),(275,42,296),(276,42,297),(277,42,298),(278,2,133),(279,2,39),(280,2,90),(281,2,302),(282,2,43),(283,2,228),(284,2,305),(285,2,65),(286,2,30),(287,2,308),(288,2,101),(289,2,310),(290,2,311),(291,2,56),(292,2,151),(293,16,314),(294,16,9),(295,16,316),(296,16,317),(297,16,318),(298,16,319),(299,16,320),(300,16,11),(301,16,111),(302,16,323),(303,16,324),(304,43,325),(305,43,326),(306,43,327),(307,43,328),(308,43,203),(309,43,204),(310,43,331),(311,43,25),(312,43,207),(313,43,334),(314,43,35),(315,43,336),(316,43,337),(317,43,289),(318,43,339),(319,20,340),(320,20,91),(321,20,342),(322,20,343),(323,20,25),(324,20,345),(325,20,105),(326,20,347),(327,20,348),(328,20,349),(329,46,350),(330,46,278),(331,46,337),(332,49,353),(333,49,354),(334,49,39),(335,49,356),(336,49,357),(337,49,358),(338,49,359),(339,49,158),(340,49,361),(341,49,42),(342,49,137),(343,49,92),(344,49,45),(345,49,366),(346,49,23),(347,49,228),(348,49,369),(349,49,370),(350,49,270),(351,49,46),(352,49,373),(353,49,94),(354,49,375),(355,49,65),(356,49,319),(357,49,48),(358,49,379),(359,49,380),(360,49,381),(361,49,382),(362,49,101),(363,49,384),(364,49,385),(365,49,33),(366,49,387),(367,49,14),(368,49,55),(369,49,390),(370,49,391),(371,49,111),(372,49,56),(373,49,6),(374,49,17),(375,49,337),(376,49,397),(377,49,398),(378,49,399),(379,49,155),(380,49,121),(381,49,402),(382,49,403),(383,49,404),(384,49,405),(385,49,406),(386,49,407),(387,49,28),(388,49,409),(389,21,243),(390,21,411),(391,21,140),(392,21,245),(393,21,94),(394,21,343),(395,21,101),(396,21,11),(397,21,418),(398,21,419),(399,22,420),(400,22,421),(401,22,261),(402,22,260),(403,22,424),(404,22,425),(405,22,262),(406,22,263),(407,22,428),(408,22,429),(409,22,430),(410,22,43),(411,22,432),(412,22,433),(413,22,325),(414,22,45),(415,22,436),(416,22,24),(417,22,246),(418,22,439),(419,22,144),(420,22,441),(421,22,10),(422,22,443),(423,22,100),(424,22,205),(425,22,280),(426,22,447),(427,22,448),(428,22,53),(429,22,35),(430,22,287),(431,22,289),(432,22,453),(433,22,291),(434,22,419),(435,22,121),(436,22,20),(437,22,458),(438,22,459),(439,22,460),(440,15,461),(441,15,462),(442,15,169),(443,15,9),(444,15,465),(445,15,466),(446,15,467),(447,15,430),(448,15,469),(449,15,470),(450,15,471),(451,15,472),(452,15,473),(453,15,474),(454,15,475),(455,15,269),(456,15,477),(457,15,45),(458,15,479),(459,15,480),(460,15,47),(461,15,439),(462,15,144),(463,15,484),(464,15,2),(465,15,486),(466,15,487),(467,15,488),(468,15,489),(469,15,490),(470,15,491),(471,15,492),(472,15,493),(473,15,494),(474,15,495),(475,15,496),(476,15,25),(477,15,498),(478,15,499),(479,15,11),(480,15,501),(481,15,502),(482,15,283),(483,15,448),(484,15,505),(485,15,506),(486,15,507),(487,15,508),(488,15,287),(489,15,16),(490,15,511),(491,15,17),(492,15,513),(493,15,419),(494,15,195),(495,15,8),(496,15,18),(497,15,518),(498,15,519),(499,15,520),(500,15,521),(501,15,522),(502,15,121),(503,15,524),(504,15,19),(505,15,526),(506,15,58),(507,15,528),(508,15,529),(509,15,530),(510,15,531),(511,15,532),(512,15,20),(513,15,534),(514,15,535),(515,15,536),(516,15,537),(517,15,458),(518,15,460),(519,15,540),(520,15,541),(521,15,542),(522,8,9),(523,8,42),(524,8,92),(525,8,546),(526,8,547),(527,8,548),(528,8,287),(529,8,460),(530,9,133),(531,9,39),(532,9,137),(533,9,302),(534,9,555),(535,9,556),(536,9,45),(537,9,558),(538,9,228),(539,9,369),(540,9,270),(541,9,201),(542,9,46),(543,9,94),(544,9,65),(545,9,31),(546,9,567),(547,9,380),(548,9,569),(549,9,101),(550,9,206),(551,9,33),(552,9,188),(553,9,448),(554,9,13),(555,9,14),(556,9,55),(557,9,111),(558,9,56),(559,9,6),(560,9,17),(561,9,582),(562,9,57),(563,9,153),(564,9,118),(565,9,586),(566,9,587),(567,9,588),(568,9,155),(569,9,121),(570,9,591),(571,9,296),(572,9,403),(573,9,405),(574,9,409),(575,23,133),(576,23,9),(577,23,25),(578,23,12),(579,23,17),(580,23,601),(581,23,602),(582,23,8),(583,23,18),(584,23,20),(585,50,606),(586,50,140),(587,50,608),(588,50,609),(589,50,33),(590,50,6),(591,28,133),(592,28,39),(593,28,614),(594,28,174),(595,28,92),(596,28,617),(597,28,31),(598,28,33),(599,28,110),(600,28,111),(601,28,56),(602,28,114),(603,28,624),(604,28,625),(605,28,419),(606,28,155);
/*!40000 ALTER TABLE `LikesMusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicalArtist`
--

DROP TABLE IF EXISTS `MusicalArtist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicalArtist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artistic_name` varchar(40) DEFAULT NULL,
  `genre_id` varchar(40) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `wiki_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_address` (`wiki_address`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `musicalartist_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicalArtist`
--

LOCK TABLES `MusicalArtist` WRITE;
/*!40000 ALTER TABLE `MusicalArtist` DISABLE KEYS */;
INSERT INTO `MusicalArtist` VALUES (1,'Acid Black Cherry',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Acid_Black_Cherry'),(2,'Gorillaz',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/Gorillaz'),(3,'Nightmare',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/Nightmare_(Japanese_band)'),(4,'Orange Range',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Orange_Range'),(5,'Paul McCartney',NULL,NULL,'1957-02-00','http://en.wikipedia.org/wiki/Paul_McCartney'),(6,'Queen',NULL,NULL,'1970-02-00','http://en.wikipedia.org/wiki/Queen_(band)'),(7,'Sound Horizon',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Sound_Horizon'),(8,'The Beatles',NULL,NULL,'1960-02-00','http://en.wikipedia.org/wiki/The_Beatles'),(9,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Arctic_monkeys'),(10,'Imagine Dragons',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Imagine_Dragons'),(11,'Los Hermanos',NULL,23,'1997-02-00','http://en.wikipedia.org/wiki/Los_Hermanos'),(12,'Muse',NULL,132,'1994-02-00','http://en.wikipedia.org/wiki/Muse_(band)'),(13,'Nine Inch Nails',NULL,89,'1988-02-00','http://en.wikipedia.org/wiki/Nine_inch_nails'),(14,'Nirvana',NULL,31,'1987-02-00','http://en.wikipedia.org/wiki/Nirvana_(band)'),(15,'Placebo',NULL,6,'1994-02-00','http://en.wikipedia.org/wiki/Placebo_(band)'),(16,'Queens of the Stone Age',NULL,120,'1996-02-00','http://en.wikipedia.org/wiki/Queens_of_the_stone_age'),(17,'Radiohead',NULL,113,'1985-02-00','http://en.wikipedia.org/wiki/Radiohead'),(18,'The Black Keys',NULL,87,'2001-02-00','http://en.wikipedia.org/wiki/The_Black_Keys'),(19,'The Kooks',NULL,56,'2002-02-00','http://en.wikipedia.org/wiki/The_Kooks'),(20,'The Strokes',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/The_Strokes'),(21,'Apink',NULL,NULL,'2011-02-00','http://en.wikipedia.org/wiki/A_Pink'),(22,'Claudia Leitte',NULL,24,'2001-02-00','http://en.wikipedia.org/wiki/Claudia_Leitte'),(23,'deadmau5',NULL,99,'2005-02-00','http://en.wikipedia.org/wiki/Deadmau5'),(24,'Eminem',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Eminem'),(25,'Linkin Park',NULL,NULL,'1996-02-00','http://en.wikipedia.org/wiki/Linkin_Park'),(26,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Two_Steps_From_Hell'),(27,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Yousei_Teikoku'),(28,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Zedd_(musician)'),(29,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC-DC'),(30,'Helloween',NULL,125,'1984-02-00','http://en.wikipedia.org/wiki/Helloween'),(31,'Iron Maiden',NULL,7,'1975-02-00','http://en.wikipedia.org/wiki/Iron_Maiden'),(32,'Karnivool',NULL,8,'1997-02-00','http://en.wikipedia.org/wiki/Karnivool'),(33,'Metallica',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Metallica'),(34,'Pain of Salvation',NULL,140,'1984-02-00','http://en.wikipedia.org/wiki/Pain_of_Salvation'),(35,'Paramore',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Paramore'),(36,'Protest the Hero',NULL,141,'2001-02-00','http://en.wikipedia.org/wiki/Protest_the_Hero'),(37,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tesseract'),(38,'The Safety Fire',NULL,6,'2006-02-00','http://en.wikipedia.org/wiki/The_Safety_Fire'),(39,'Aerosmith',NULL,70,'1970-02-00','http://en.wikipedia.org/wiki/Aerosmith'),(41,'Audioslave',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Audioslave'),(42,'Avicii',NULL,111,'2007-02-00','http://en.wikipedia.org/wiki/Avicii'),(43,'Bon Jovi',NULL,NULL,'1983-02-00','http://en.wikipedia.org/wiki/Bon_jovi'),(44,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chris_cornell'),(45,'Daft Punk',NULL,17,'1993-02-00','http://en.wikipedia.org/wiki/Daft_punk'),(46,'Eric Clapton',NULL,NULL,'1962-02-00','http://en.wikipedia.org/wiki/Eric_clapton'),(47,'Florence and the Machine',NULL,6,'2007-02-00','http://en.wikipedia.org/wiki/Florence_and_the_Machine'),(48,'Hardwell',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/Hardwell'),(50,'Kara\'s Flowers',NULL,11,'1994-02-00','http://en.wikipedia.org/wiki/Maroon_5'),(51,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Matchbox_20'),(53,'Nickelback',NULL,58,'1995-02-00','http://en.wikipedia.org/wiki/Nickelback'),(55,'Oasis',NULL,NULL,'1991-02-00','http://en.wikipedia.org/wiki/Oasis_(band)'),(56,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Pink_Floyd'),(57,'Red Hot Chili Peppers',NULL,11,'1983-02-00','http://en.wikipedia.org/wiki/Red_Hot_Chili_Peppers'),(58,'The Offspring',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/The_Offspring'),(60,'Alanis Morissette',NULL,107,'1987-02-00','http://en.wikipedia.org/wiki/Alanis_Morissette'),(61,'Britney Spears',NULL,NULL,'1992-02-00','http://en.wikipedia.org/wiki/Britney_Spears'),(62,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/C%C3%A9u'),(63,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Clarice_Falc%C3%A3o'),(64,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Fernando_e_Sorocaba'),(65,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Guns_N%27_Roses'),(69,'O Rappa',NULL,23,'1993-02-00','http://en.wikipedia.org/wiki/O_Rappa'),(70,'Shakira',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Shakira'),(71,'Alice in Chains',NULL,35,'1987-02-00','http://en.wikipedia.org/wiki/Alice_in_Chains'),(72,'Bad Company',NULL,NULL,'1973-02-00','http://en.wikipedia.org/wiki/Bad_Company'),(73,'Badlands',NULL,11,'1988-02-00','http://en.wikipedia.org/wiki/Badlands_(American_band)'),(75,'Explosions in the Sky',NULL,103,'1999-02-00','http://en.wikipedia.org/wiki/Explosions_in_the_Sky'),(80,'Serafin',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/Serafin_(band)'),(81,'Soundgarden',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Soundgarden'),(82,'Stone Temple Pilots',NULL,39,'1986-02-00','http://en.wikipedia.org/wiki/Stone_Temple_Pilots'),(84,'Third Eye Blind',NULL,101,'1993-02-00','http://en.wikipedia.org/wiki/Third_Eye_Blind'),(85,'Tool',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Tool_(band)'),(86,'Velvet Revolver',NULL,51,'2002-02-00','http://en.wikipedia.org/wiki/Velvet_Revolver'),(87,'3 Doors Down',NULL,38,'1996-02-00','http://en.wikipedia.org/wiki/3_Doors_Down'),(90,'Black Sabbath',NULL,NULL,'1968-02-00','http://en.wikipedia.org/wiki/Black_Sabbath'),(91,'Capital Inicial',NULL,83,'1982-02-00','http://en.wikipedia.org/wiki/Capital_Inicial'),(92,'Coldplay',NULL,6,'1996-02-00','http://en.wikipedia.org/wiki/Coldplay'),(93,'Creed',NULL,122,'1994-02-00','http://en.wikipedia.org/wiki/Creed_(band)'),(94,'Foo Fighters',NULL,35,'1994-02-00','http://en.wikipedia.org/wiki/Foo_Fighters'),(95,'Goo Goo Dolls',NULL,149,'1986-02-00','http://en.wikipedia.org/wiki/Goo_Goo_Dolls'),(97,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ira_(band)'),(99,'Kansas',NULL,13,'1973-02-00','http://en.wikipedia.org/wiki/Kansas_(band)'),(100,'Kiss',NULL,NULL,'1973-02-00','http://en.wikipedia.org/wiki/Kiss_(band)'),(101,'Led Zeppelin',NULL,NULL,'1968-02-00','http://en.wikipedia.org/wiki/Led_Zeppelin'),(102,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Legiao_urbana'),(104,'Living Colour',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Living_Colour'),(105,'Mamonas Assassinas',NULL,80,'1994-02-00','http://en.wikipedia.org/wiki/Mamonas_Assassinas'),(110,'Ozzy Osbourne',NULL,NULL,'1967-02-00','http://en.wikipedia.org/wiki/Ozzy_Osbourne'),(111,'Pearl Jam',NULL,35,'1990-02-00','http://en.wikipedia.org/wiki/Pearl_Jam'),(114,'Rage Against the Machine',NULL,11,'1991-02-00','http://en.wikipedia.org/wiki/Rage_Against_the_Machine'),(115,'Raul Seixas',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/Raul_Seixas'),(117,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Scorpions'),(118,'Sex Pistols',NULL,NULL,'1975-02-00','http://en.wikipedia.org/wiki/Sex_pistols'),(119,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Skid_row'),(120,'The Calling',NULL,11,'2000-02-00','http://en.wikipedia.org/wiki/The_Calling'),(121,'The Killers',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/The_Killers'),(123,'The Rolling Stones',NULL,6,'1962-02-00','http://en.wikipedia.org/wiki/The_Rolling_Stones'),(124,'The White Stripes',NULL,137,'1997-02-00','http://en.wikipedia.org/wiki/The_White_Stripes'),(125,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_police'),(126,'Thin Lizzy',NULL,40,'1969-02-00','http://en.wikipedia.org/wiki/Thin_Lizzy'),(127,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Titas_(band)'),(128,'Twisted Sister',NULL,32,'1972-02-00','http://en.wikipedia.org/wiki/Twisted_Sister'),(129,'U2',NULL,40,'1976-02-00','http://en.wikipedia.org/wiki/U2'),(130,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Van_halen'),(131,'Whitesnake',NULL,NULL,'1978-02-00','http://en.wikipedia.org/wiki/Whitesnake'),(132,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Yes_band'),(133,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC/DC'),(134,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Angra_%28band%29'),(136,'Avantasia',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avantasia'),(137,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Beatles'),(138,'Blind Guardian',NULL,57,'1984-02-00','http://en.wikipedia.org/wiki/Blind_guardian'),(140,'Dream Theater',NULL,70,'1985-02-00','http://en.wikipedia.org/wiki/Dream_Theater'),(141,'Eddie Van Halen',NULL,NULL,'1972-02-00','http://en.wikipedia.org/wiki/Eddie_Van_Halen'),(142,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Edguy'),(144,'Foster the People',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Foster_the_people'),(145,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Franz_Ferdinand_%28band%29'),(149,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Motorhead'),(150,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Nirvana_%28band%29'),(151,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Queen_%28band%29'),(152,'Ramones',NULL,65,'1974-02-00','http://en.wikipedia.org/wiki/Ramones'),(153,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Rolling_Stones'),(154,'Sonata Arctica',NULL,NULL,'1995-02-00','http://en.wikipedia.org/wiki/Sonata_Arctica'),(155,'The Doors',NULL,11,'1965-02-00','http://en.wikipedia.org/wiki/The_doors'),(156,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_foo_fighters'),(158,'Armin van Buuren',NULL,48,'1995-02-00','http://en.wikipedia.org/wiki/Armin_van_buuren'),(160,'Charlie Brown Jr.',NULL,27,'1992-02-00','http://en.wikipedia.org/wiki/Charlie_Brown_Jr.'),(164,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tiesto'),(165,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/X_japan'),(166,'Yui',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Yui_(singer)'),(169,'Arcade Fire',NULL,53,'2001-02-00','http://en.wikipedia.org/wiki/Arcade_Fire'),(171,'Bad Brains',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Bad_Brains'),(172,'Black Drawing Chalks',NULL,50,'2005-02-00','http://en.wikipedia.org/wiki/Black_Drawing_Chalks'),(173,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Black_Flag'),(174,'Black Label Society',NULL,11,'1998-02-00','http://en.wikipedia.org/wiki/Black_Label_Society'),(177,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Death'),(178,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Down'),(179,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Exodus'),(180,'Hatebreed',NULL,2,'1994-02-00','http://en.wikipedia.org/wiki/Hatebreed'),(181,'Iced Earth',NULL,12,'1985-02-00','http://en.wikipedia.org/wiki/Iced_Earth'),(182,'James Marshall Hendrix',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/Jimi_Hendrix'),(183,'Kreator',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/Kreator'),(184,'Krisiun',NULL,86,'1990-02-00','http://en.wikipedia.org/wiki/Krisiun'),(186,'Lynyrd Skynyrd',NULL,81,'1964-02-00','http://en.wikipedia.org/wiki/Lynyrd_Skynyrd'),(187,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Macaco_Bong'),(188,'Miles Dewey Davis III Davis',NULL,NULL,'1944-02-00','http://en.wikipedia.org/wiki/Miles_Davis'),(189,'Minor Threat',NULL,96,'1980-02-00','http://en.wikipedia.org/wiki/Minor_Threat'),(191,'Pantera',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Pantera'),(194,'Slayer',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Slayer'),(195,'Tame Impala',NULL,8,'2007-02-00','http://en.wikipedia.org/wiki/Tame_Impala'),(196,'The Allman Brothers Band',NULL,95,'1969-02-00','http://en.wikipedia.org/wiki/The_Allman_Brothers_Band'),(197,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Misfits'),(198,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_National'),(199,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Bruno_e_Marrone'),(200,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chit%C3%A3ozinho_e_Xoror%C3%B3'),(201,'Elvis Aaron Presley',NULL,NULL,'1953-02-00','http://en.wikipedia.org/wiki/Elvis_Presley'),(203,'Gusttavo Lima',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Gusttavo_Lima'),(204,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Jorge_e_Mateus'),(205,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Leandro_e_Leonardo'),(206,'Legião Urbana',NULL,83,'1982-02-00','http://en.wikipedia.org/wiki/Legi%C3%A3o_Urbana'),(207,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Luan_Santana'),(208,'Lulu Santos',NULL,NULL,'1972-02-00','http://en.wikipedia.org/wiki/Lulu_Santos'),(210,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Roberto_Carlos'),(211,'Roupa Nova',NULL,24,'1980-02-00','http://en.wikipedia.org/wiki/Roupa_Nova'),(212,'Só Pra Contrariar',NULL,15,'1989-02-00','http://en.wikipedia.org/wiki/S%C3%B3_Pra_Contrariar'),(213,'Skank',NULL,4,'1991-02-00','http://en.wikipedia.org/wiki/Skank_(band)'),(214,'Titãs',NULL,26,'1981-02-00','http://en.wikipedia.org/wiki/Tit%C3%A3s'),(215,'Tribalistas',NULL,NULL,'2002-02-00','http://en.wikipedia.org/wiki/Tribalistas_(band)'),(216,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Zez%C3%A9_Di_Camargo_%26_Luciano'),(218,'Godsmack',NULL,NULL,'1995-02-00','http://en.wikipedia.org/wiki/Godsmack'),(219,'Matanza',NULL,23,'1996-02-00','http://en.wikipedia.org/wiki/Matanza_(band)'),(221,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/RATM'),(222,'Sepultura',NULL,3,'1984-02-00','http://en.wikipedia.org/wiki/Sepultura'),(224,'Suicidal Tendencies',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Suicidal_Tendencies'),(225,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Acdc'),(227,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cold_play'),(228,'Deep Purple',NULL,152,'1968-02-00','http://en.wikipedia.org/wiki/Deep_Purple'),(229,'Enya',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/Enya'),(238,'Nando Reis',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Nando_Reis'),(239,'Paulo Vanzolini',NULL,NULL,'1942-02-00','http://en.wikipedia.org/wiki/Paulo_Vanzolini'),(240,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Queen'),(241,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tom_Jobin'),(243,'Banda Calypso',NULL,78,'1999-02-00','http://en.wikipedia.org/wiki/Banda_Calypso'),(245,'Engenheiros do Hawaii',NULL,42,'1985-02-00','http://en.wikipedia.org/wiki/Engenheiros_do_Hawaii'),(246,'Evanescence',NULL,90,'1995-02-00','http://en.wikipedia.org/wiki/Evanescence'),(250,'Jonas Brothers',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Jonas_Brothers'),(254,'Nightwish',NULL,NULL,'1996-02-00','http://en.wikipedia.org/wiki/Nightwish'),(257,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/%C3%89_o_Tchan'),(258,'3OH!3',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/3OH!3'),(259,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/50_cent'),(260,'ABBA',NULL,111,'1972-02-00','http://en.wikipedia.org/wiki/ABBA'),(261,'AFI',NULL,143,'1991-02-00','http://en.wikipedia.org/wiki/AFI_(band)'),(262,'Avril Lavigne',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avril_Lavigne'),(263,'Backstreet Boys',NULL,18,'1993-02-00','http://en.wikipedia.org/wiki/Backstreet_boys'),(269,'Crystal Castles',NULL,99,'2004-02-00','http://en.wikipedia.org/wiki/Crystal_Castles_(band)'),(270,'Sir Elton John',NULL,NULL,'1964-02-00','http://en.wikipedia.org/wiki/Elton_John'),(273,'Fall Out Boy',NULL,117,'2001-02-00','http://en.wikipedia.org/wiki/Fall_Out_Boy'),(275,'Jennifer Lopez',NULL,NULL,'1986-02-00','http://en.wikipedia.org/wiki/Jennifer_Lopez'),(276,'Kesha Rose Sebert',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Kesha'),(277,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Kiss_band'),(278,'Lady Gaga',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Lady_Gaga'),(280,'Madonna',NULL,NULL,'1979-02-00','http://en.wikipedia.org/wiki/Madonna_(entertainer)'),(282,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Metalicca'),(283,'Miley Cyrus',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Miley_cyrus'),(284,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ozzy'),(285,'Panic! at the Disco',NULL,41,'2004-02-00','http://en.wikipedia.org/wiki/Panic!_at_the_Disco'),(287,'Phoenix',NULL,124,'1999-02-00','http://en.wikipedia.org/wiki/Phoenix_(band)'),(288,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Plain_White_T%27s'),(289,'Rihanna',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Rihanna'),(290,'Saosin',NULL,33,'2003-02-00','http://en.wikipedia.org/wiki/Saosin'),(291,'Spice Girls',NULL,6,'1994-02-00','http://en.wikipedia.org/wiki/Spice_girls'),(292,'Sum 41',NULL,144,'1996-02-00','http://en.wikipedia.org/wiki/Sum_41'),(293,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/T.a.t.u.'),(296,'The Smiths',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/The_smiths'),(297,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_used'),(298,'Usher',NULL,13,'1991-02-00','http://en.wikipedia.org/wiki/Usher_(entertainer)'),(302,'Bob Dylan',NULL,25,'1961-02-00','http://en.wikipedia.org/wiki/Bob_Dylan'),(305,'Fleetwood Mac',NULL,NULL,'1967-02-00','http://en.wikipedia.org/wiki/Fleetwood_Mac'),(308,'King Crimson',NULL,NULL,'1969-02-00','http://en.wikipedia.org/wiki/King_Crimson'),(310,'Moby',NULL,84,'1982-02-00','http://en.wikipedia.org/wiki/Moby'),(311,'Neil Young',NULL,74,'1960-02-00','http://en.wikipedia.org/wiki/Neil_Young'),(314,'Angra',NULL,26,'1991-02-00','http://en.wikipedia.org/wiki/Angra_(band)'),(316,'Blink-182',NULL,NULL,'1992-02-00','http://en.wikipedia.org/wiki/Blink-182'),(317,'Bob Marley',NULL,NULL,'1962-02-00','http://en.wikipedia.org/wiki/Bob_Marley'),(318,'Chico Buarque',NULL,23,'1962-02-00','http://en.wikipedia.org/wiki/Chico_Buarque'),(319,'Hans Zimmer',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Hans_Zimmer'),(320,'Korpiklaani',NULL,NULL,'1993-02-00','http://en.wikipedia.org/wiki/Korpiklaani'),(323,'Pixies',NULL,70,'1986-02-00','http://en.wikipedia.org/wiki/Pixies'),(324,'Tuatha de Danann',NULL,47,'1995-02-00','http://en.wikipedia.org/wiki/Tuatha_de_Danann_(band)'),(325,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chris_Brown'),(326,'David Guetta',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/David_Guetta'),(327,'Enrique Iglesias',NULL,30,'1994-02-00','http://en.wikipedia.org/wiki/Enrique_Iglesias'),(328,'Tramar Dillard',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/Flo_Rida'),(331,'Jota Quest',NULL,3,'1996-02-00','http://en.wikipedia.org/wiki/Jota_Quest'),(334,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ne-yo'),(336,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Pitbull_(rapper)'),(337,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Red_Hot_Chilli_Peppers'),(339,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ylvis'),(340,'A-ha',NULL,1,'1982-02-00','http://en.wikipedia.org/wiki/A-ha'),(342,'Dire Straits',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Dire_Straits'),(343,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ghost_BC'),(345,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/MC_Daleste'),(347,'Oficina G3',NULL,NULL,'1987-02-00','http://en.wikipedia.org/wiki/Oficina_G3'),(348,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Scorpions_%28band%29'),(349,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tom_Jobim'),(350,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chiclete_com_banana'),(353,'Nilsen Ørjan',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/%C3%98rjan_Nilsen'),(354,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Above_%26_Beyond_(band)'),(356,'Alex M.O.R.P.H.',NULL,NULL,'2003-02-00','http://en.wikipedia.org/wiki/Alex_M.O.R.P.H.'),(357,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Aly_%26_Fila'),(358,'Andrew Rayel',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Andrew_Rayel'),(359,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Andy_Moor_(DJ)'),(361,'Arty',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Arty_(musician)'),(366,'Dash Berlin',NULL,29,'2007-02-00','http://en.wikipedia.org/wiki/Dash_Berlin'),(369,'Eagles',NULL,NULL,'1971-02-00','http://en.wikipedia.org/wiki/Eagles_(band)'),(370,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Electric_light_orchestra'),(373,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ferry_corsten'),(375,'Giuseppe Ottaviani',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Giuseppe_Ottaviani'),(379,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/John_O%27Callaghan_(musician)'),(380,'John Williams',NULL,153,'1952-02-00','http://en.wikipedia.org/wiki/John_williams'),(381,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Jorn_van_Deynhoven'),(382,'Journey',NULL,101,'1973-02-00','http://en.wikipedia.org/wiki/Journey_(band)'),(384,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Lynrd_Skynyrd'),(385,'Markus Schulz',NULL,131,'1990-02-00','http://en.wikipedia.org/wiki/Markus_Schulz'),(387,'NERVO',NULL,21,'2005-02-00','http://en.wikipedia.org/wiki/Nervo_(duo)'),(390,'OceanLab',NULL,6,'2000-02-00','http://en.wikipedia.org/wiki/OceanLab'),(391,'Paul van Dyk',NULL,NULL,'1991-02-00','http://en.wikipedia.org/wiki/Paul_van_Dyk'),(397,'Sander van Doorn',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Sander_van_Doorn'),(398,'Simon Patterson',NULL,19,'2000-02-00','http://en.wikipedia.org/wiki/Simon_Patterson_(musician)'),(399,'Supertramp',NULL,NULL,'1969-02-00','http://en.wikipedia.org/wiki/Supertramp'),(402,'The Trammps',NULL,63,'1972-02-00','http://en.wikipedia.org/wiki/The_Trammps'),(403,'The Who',NULL,6,'1964-02-00','http://en.wikipedia.org/wiki/The_Who'),(404,'Tiësto',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/Ti%C3%ABsto'),(405,'Tim Maia',NULL,23,'1956-02-00','http://en.wikipedia.org/wiki/Tim_Maia'),(406,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ummet_Ozcan'),(407,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/W%26W'),(409,'ZZ Top',NULL,22,'1969-02-00','http://en.wikipedia.org/wiki/Zz_top'),(411,'Yusuf Islam',NULL,NULL,'1966-02-00','http://en.wikipedia.org/wiki/Cat_Stevens'),(418,'Megadeth',NULL,11,'1983-02-00','http://en.wikipedia.org/wiki/Megadeth'),(419,'System of a Down',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/System_of_a_Down'),(420,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/%C3%89_o_Tchan!'),(421,'30 Seconds to Mars',NULL,11,'1998-02-00','http://en.wikipedia.org/wiki/30_Seconds_to_Mars'),(424,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Alt_J'),(425,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Arctic_Monkey'),(428,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Beyonce'),(429,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Black_keys'),(430,'Bombay Bicycle Club',NULL,76,'2005-02-00','http://en.wikipedia.org/wiki/Bombay_Bicycle_Club'),(432,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Canon_Blue'),(433,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cansei_de_ser_sexy'),(436,'Ellie Goulding',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Ellie_Goulding'),(439,'Foals',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Foals'),(441,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Guns_and_roses'),(443,'Katy Perry',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Katy_Perry'),(447,'Michael Joseph Jackson',NULL,NULL,'1964-02-00','http://en.wikipedia.org/wiki/Michael_Jackson'),(448,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Muse'),(453,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Sandy_e_Junior'),(458,'The xx',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_xx'),(459,'Two Door Cinema Club',NULL,147,'2007-02-00','http://en.wikipedia.org/wiki/Two_Door_Cinema_Club'),(460,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Vampire_Weekend'),(461,'Albert Hammond, Jr.',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Albert_Hammond,_Jr.'),(462,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Alt-J'),(465,'Babyshambles',NULL,6,'2003-02-00','http://en.wikipedia.org/wiki/Babyshambles'),(466,'Best Coast',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Best_Coast'),(467,'Bjork',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Bj%C3%B6rk'),(469,'Bon Iver',NULL,108,'2007-02-00','http://en.wikipedia.org/wiki/Bon_Iver'),(470,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Breakbot'),(471,'CSS',NULL,26,'2003-02-00','http://en.wikipedia.org/wiki/CSS_(band)'),(472,'Cage the Elephant',NULL,139,'2006-02-00','http://en.wikipedia.org/wiki/Cage_the_Elephant'),(473,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cake'),(474,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Carissa%27s_Wierd'),(475,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Courteeners'),(477,'Cults',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/Cults_(band)'),(479,'Delta Spirit',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Delta_Spirit'),(480,'Detektivbyrån',NULL,9,'2005-02-00','http://en.wikipedia.org/wiki/Detektivbyr%C3%A5n'),(484,'Franz Ferdinand',NULL,71,'2002-02-00','http://en.wikipedia.org/wiki/Franz_Ferdinand_(band)'),(486,'Haim',NULL,11,'2006-02-00','http://en.wikipedia.org/wiki/Haim_(band)'),(487,'Interpol',NULL,NULL,'1997-02-00','http://en.wikipedia.org/wiki/Interpol_(band)'),(488,'Jake Bugg',NULL,NULL,'2011-02-00','http://en.wikipedia.org/wiki/Jake_Bugg'),(489,'Julian Casablancas',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/Julian_Casablancas'),(490,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Justice'),(491,'Justin Bieber',NULL,73,'2008-02-00','http://en.wikipedia.org/wiki/Justin_Bieber'),(492,'Kaiser Chiefs',NULL,45,'1996-02-00','http://en.wikipedia.org/wiki/Kaiser_Chiefs'),(493,'Kakkmaddafakka',NULL,10,'2004-02-00','http://en.wikipedia.org/wiki/Kakkmaddafakka'),(494,'Kasabian',NULL,NULL,'1997-02-00','http://en.wikipedia.org/wiki/Kasabian'),(495,'Kid Cudi',NULL,16,'2003-02-00','http://en.wikipedia.org/wiki/Kid_Cudi'),(496,'Kings of Convenience',NULL,10,'1999-02-00','http://en.wikipedia.org/wiki/Kings_of_Convenience'),(498,'Little Joy',NULL,11,'2007-02-00','http://en.wikipedia.org/wiki/Little_Joy'),(499,'Locksley',NULL,NULL,'2003-02-00','http://en.wikipedia.org/wiki/Locksley_(band)'),(501,'M83',NULL,64,'2001-02-00','http://en.wikipedia.org/wiki/M83_(band)'),(502,'MGMT',NULL,59,'2004-02-00','http://en.wikipedia.org/wiki/MGMT'),(505,'Neutral Milk Hotel',NULL,67,'1989-02-00','http://en.wikipedia.org/wiki/Neutral_Milk_Hotel'),(506,'Of Monsters and Men',NULL,37,'2010-02-00','http://en.wikipedia.org/wiki/Of_Monsters_and_Men'),(507,'One Direction',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/One_Direction'),(508,'Passion Pit',NULL,116,'2007-02-00','http://en.wikipedia.org/wiki/Passion_Pit'),(511,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Raconteurs'),(513,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Rebbeca_Black'),(518,'The Cribs',NULL,155,'2002-02-00','http://en.wikipedia.org/wiki/The_Cribs'),(519,'The Enemy',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/The_Enemy_(UK_band)'),(520,'The Films',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/The_Films_(band)'),(521,'The Flaming Lips',NULL,5,'1983-02-00','http://en.wikipedia.org/wiki/The_Flaming_Lips'),(522,'The Fratellis',NULL,71,'2005-02-00','http://en.wikipedia.org/wiki/The_Fratellis'),(524,'The Kills',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/The_Kills'),(526,'The Last Shadow Puppets',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/The_Last_Shadow_Puppets'),(528,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Paddingtons'),(529,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Pixies'),(530,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Royal_Concept'),(531,'The Royalty',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_Royalty'),(532,'The Soft Pack',NULL,39,'2007-02-00','http://en.wikipedia.org/wiki/The_Soft_Pack'),(534,'The Vaccines',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/The_Vaccines'),(535,'The View',NULL,100,'2005-02-00','http://en.wikipedia.org/wiki/The_View_(band)'),(536,'The Virgins',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_Virgins'),(537,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_libertines'),(540,'Weezer',NULL,11,'1992-02-00','http://en.wikipedia.org/wiki/Weezer'),(541,'White Lies',NULL,105,'2007-02-00','http://en.wikipedia.org/wiki/White_Lies_(band)'),(542,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/White_Stripes'),(546,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Fratellis'),(547,'Macklemore',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Macklemore'),(548,'Men at Work',NULL,21,'1979-02-00','http://en.wikipedia.org/wiki/Men_at_Work'),(555,'Charlie Parker',NULL,NULL,'1937-02-00','http://en.wikipedia.org/wiki/Charlie_Parker'),(556,'Chet Baker',NULL,NULL,'1949-02-00','http://en.wikipedia.org/wiki/Chet_Baker'),(558,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/David_Matthews_Band'),(567,'John Coltrane',NULL,NULL,'1946-02-00','http://en.wikipedia.org/wiki/John_Coltrane'),(569,'Johnny Cash',NULL,NULL,'1954-02-00','http://en.wikipedia.org/wiki/Johnny_Cash'),(582,'Ray Charles',NULL,126,'1947-02-00','http://en.wikipedia.org/wiki/Ray_Charles'),(586,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Simon_and_Garfunkel'),(587,'The Animals',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/The_Animals'),(588,'The Cure',NULL,NULL,'1976-02-00','http://en.wikipedia.org/wiki/The_Cure'),(591,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Mamas_%26_the_Papas'),(601,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Snow_patrol'),(602,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/System_of_Down'),(606,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC_DC'),(608,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Led_Zepellin'),(609,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Mega_deth'),(614,'Avenged Sevenfold',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avenged_Sevenfold'),(617,'Guns N\' Roses',NULL,NULL,'1985-02-00','http://en.wikipedia.org/wiki/Guns_N\'_Roses'),(624,'Rammstein',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/Rammstein'),(625,'Scorpions',NULL,44,'1965-02-00','http://en.wikipedia.org/wiki/Scorpions_(band)');
/*!40000 ALTER TABLE `MusicalArtist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicalGenre`
--

DROP TABLE IF EXISTS `MusicalGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicalGenre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicalGenre`
--

LOCK TABLES `MusicalGenre` WRITE;
/*!40000 ALTER TABLE `MusicalGenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicalGenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musician`
--

DROP TABLE IF EXISTS `Musician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Musician` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(40) NOT NULL,
  `style_id` varchar(40) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musician`
--

LOCK TABLES `Musician` WRITE;
/*!40000 ALTER TABLE `Musician` DISABLE KEYS */;
/*!40000 ALTER TABLE `Musician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `hometown` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'eduardapodesta','eduarda viana podesta',''),(2,'ivancerboncini','ivan de campos cerboncini',''),(3,'felipehiga','felipe kenji higa',''),(4,'fernandothiers','fernando barbosa thiers',''),(5,'erikaalbizzati','erika couto albizzati',''),(6,'thiagobalbo','thiago duarte balbo',''),(7,'danielferreira','daniel breves ferreira',''),(8,'ramonmaciel','ramon carvalho maciel',''),(9,'tiagoferreira','tiago de lima ferreira',''),(10,'rafaelxavier','rafael xavier',''),(11,'nicholasmizoguchi','nicholas matuzita mizoguchi',''),(12,'tuliosilva','tulio bazan da silva',''),(13,'leonnardorabello','leonnardo chagas rabello',''),(14,'lukaslopes','lukas antunes lopes',''),(15,'rafaelgarcia','rafael matheus garcia',''),(16,'joaodalben','joao henrique dalben',''),(17,'caioteixeira','caio teixeira',''),(18,'elisadellarriva','elisa dellarriva',''),(19,'fernandogoncalves','fernando henrique dos santos goncalves',''),(20,'luanbicesto','luan gustavo bicesto',''),(21,'lucianosabenca','luciano padua sabenca',''),(22,'pedroalmeida','pedro cordeiro de almeida',''),(23,'tomasqueiroga','tomas silva queiroga',''),(24,'fabiolira','fabio maffei lira',''),(25,'guilhermemendes','guilherme da rocha alves mendes',''),(26,'guilhermemazzariol','guilherme sbrolini mazzariol',''),(27,'raphaelfranco','raphael marques franco',''),(28,'willianszati','willians hidalgo zati',''),(29,'victortavares','victor guilherme oliveira semedo tavares',''),(30,'fernandohoyo','fernando luiz del hoyo','campinas'),(31,'lucasmello','lucas de campos mello',''),(32,'wilsonneto','wilson jose prata neto',''),(33,'andreiauratsuka','andreia yukie uratsuka',''),(34,'victorsilva','victor akira hassuda silva',''),(35,'leonardosilva','leonardo de oliveira silva',''),(36,'gabrielbezerra','gabriel massaki wakano bezerra',''),(37,'elvisrabello','elvis rabello',''),(38,'caiopalissari','caio vinicius uvini palissari',''),(39,'cibellebegalli','cibelle begalli',''),(40,'diegorocha','diego rocha',''),(41,'fellipecaetano','fellipe santiago scarpa caetano',''),(42,'gustavonunes','gustavo cesar nunes',''),(43,'juceliofonseca','jucelio evangelista fonseca',''),(44,'murilocruz','murilo de lima cruz',''),(45,'felipecaminada','felipe caminada',''),(46,'lucasbatista','lucas oliveira batista',''),(47,'andresantanche','andre santanche',''),(48,'luizgomes','Luiz Celso Gomes Jr',''),(49,'lucaslima','Lucas Domingues Lima','Campinas'),(50,'viniciussantos','Vinicius Pereira dos Santos','Campinas');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaysIn`
--

DROP TABLE IF EXISTS `PlaysIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaysIn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musician_id` int(11) NOT NULL,
  `musical_artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `musician_id` (`musician_id`),
  KEY `musical_artist_id` (`musical_artist_id`),
  CONSTRAINT `playsin_ibfk_1` FOREIGN KEY (`musician_id`) REFERENCES `Musician` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playsin_ibfk_2` FOREIGN KEY (`musical_artist_id`) REFERENCES `MusicalArtist` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaysIn`
--

LOCK TABLES `PlaysIn` WRITE;
/*!40000 ALTER TABLE `PlaysIn` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlaysIn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-16 17:43:01
