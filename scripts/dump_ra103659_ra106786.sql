-- MySQL dump 10.14  Distrib 5.5.35-MariaDB, for Linux (x86_64)
--
-- Host: sql2.lab.ic.unicamp.br    Database: mc536db07
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `ArtistGenre`
--

DROP TABLE IF EXISTS `ArtistGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArtistGenre` (
  `id` int(11) NOT NULL auto_increment,
  `artist_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `artist_id` (`artist_id`,`genre_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL auto_increment,
  `blocker_id` int(11) NOT NULL,
  `blocked_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `blocker_id` (`blocker_id`),
  KEY `blocked_id` (`blocked_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL auto_increment,
  `city_name` varchar(40) default NULL,
  `country_id` int(11) default NULL,
  `resource` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `city_name` (`city_name`),
  UNIQUE KEY `resource` (`resource`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Oslo',1,'http://dbpedia.org/resource/Oslo'),(2,'City of Bridgeport',2,'http://dbpedia.org/resource/Bridgeport,_Connecticut'),(3,'Município de Belo Horizonte',3,'http://dbpedia.org/resource/Belo_Horizonte'),(4,'State of Minas Gerais',3,'http://dbpedia.org/resource/Minas_Gerais'),(5,'Oklahoma City',2,'http://dbpedia.org/resource/Oklahoma_City'),(6,'London',4,'http://dbpedia.org/resource/London'),(7,'Leyton',4,'http://dbpedia.org/resource/Leyton'),(8,'Perth',5,'http://dbpedia.org/resource/Perth'),(9,'Göteborg',6,'http://dbpedia.org/resource/Gothenburg'),(10,'Bergen',1,'http://dbpedia.org/resource/Bergen'),(11,'Los Angeles',2,'http://dbpedia.org/resource/Los_Angeles'),(12,'City of Tampa',2,'http://dbpedia.org/resource/Tampa,_Florida'),(13,'City of Atlanta',2,'http://dbpedia.org/resource/Atlanta'),(14,'Uberlândia',3,'http://dbpedia.org/resource/Uberl%C3%A2ndia'),(15,'Kings County',2,'http://dbpedia.org/resource/Brooklyn'),(16,'Paris',7,'http://dbpedia.org/resource/Paris'),(17,'City of Orlando',2,'http://dbpedia.org/resource/Orlando,_Florida'),(18,'Bilfawst or Bilfaust',4,'http://dbpedia.org/resource/Belfast'),(19,'Melbourne',5,'http://dbpedia.org/resource/Melbourne'),(20,'City of Houston',2,'http://dbpedia.org/resource/Houston'),(21,'Município do Rio de Janeiro',3,'http://dbpedia.org/resource/Rio_de_Janeiro'),(22,'State of Rio de Janeiro',3,'http://dbpedia.org/resource/Rio_de_Janeiro_(state)'),(23,'Hibbing, Minnesota',2,'http://dbpedia.org/resource/Hibbing,_Minnesota'),(24,'State of São Paulo',3,'http://dbpedia.org/resource/S%C3%A3o_Paulo_(state)'),(25,'Santos',3,'http://dbpedia.org/resource/Santos,_S%C3%A3o_Paulo'),(26,'The Hague',8,'http://dbpedia.org/resource/The_Hague'),(27,'Miami',2,'http://dbpedia.org/resource/Miami'),(28,'Aberdeen, Washington',2,'http://dbpedia.org/resource/Aberdeen,_Washington'),(29,'Town of Oyster Bay',2,'http://dbpedia.org/resource/Oyster_Bay_(town),_New_York'),(30,'City of Newport Beach',2,'http://dbpedia.org/resource/Newport_Beach,_California'),(31,'Seattle',2,'http://dbpedia.org/resource/Seattle'),(32,'Keflavík',9,'http://dbpedia.org/resource/Keflav%C3%ADk'),(33,'Garðabær',9,'http://dbpedia.org/resource/Gar%C3%B0ab%C3%A6r'),(34,'Escatawpa, Mississippi',2,'http://dbpedia.org/resource/Escatawpa,_Mississippi'),(35,'San Diego, California',2,'http://dbpedia.org/resource/San_Diego'),(36,'Dublin',10,'http://dbpedia.org/resource/Dublin'),(37,'Las Vegas',2,'http://dbpedia.org/resource/Las_Vegas'),(38,'O Município do Porto Alegre',3,'http://dbpedia.org/resource/Porto_Alegre'),(39,'Hannover',11,'http://dbpedia.org/resource/Hanover'),(40,'Leeds',4,'http://dbpedia.org/resource/Leeds'),(41,'Varginha',3,'http://dbpedia.org/resource/Varginha'),(42,'Koudekerk aan den Rijn',8,'http://dbpedia.org/resource/Koudekerk_aan_den_Rijn'),(43,'Goiânia, Brazil',3,'http://dbpedia.org/resource/Goi%C3%A2nia'),(44,'State of Goiás',3,'http://dbpedia.org/resource/Goi%C3%A1s'),(45,'City of Rancho Santa Margarita',2,'http://dbpedia.org/resource/Rancho_Santa_Margarita,_California'),(46,'Montreal',12,'http://dbpedia.org/resource/Montreal'),(47,'Brighton',4,'http://dbpedia.org/resource/Brighton'),(48,'Krefeld',11,'http://dbpedia.org/resource/Krefeld'),(49,'Hanna',12,'http://dbpedia.org/resource/Hanna,_Alberta'),(50,'Middletown, Connecticut',2,'http://dbpedia.org/resource/Middletown,_Connecticut'),(51,'City of Philadelphia',2,'http://dbpedia.org/resource/Philadelphia'),(52,'Antibes',7,'http://dbpedia.org/resource/Antibes'),(53,'Forest Hills',2,'http://dbpedia.org/resource/Forest_Hills,_Queens'),(54,'City of Ruston',2,'http://dbpedia.org/resource/Ruston,_Louisiana'),(55,'St Kilda',5,'http://dbpedia.org/resource/St_Kilda,_Victoria'),(56,'City of Boston',2,'http://dbpedia.org/resource/Boston'),(57,'Glasgow',13,'http://dbpedia.org/resource/Glasgow'),(58,'Stratford',12,'http://dbpedia.org/resource/Stratford,_Ontario'),(59,'City of Winnipeg',12,'http://dbpedia.org/resource/Winnipeg'),(60,'Crouch End',4,'http://dbpedia.org/resource/Crouch_End'),(61,'State of Pará',3,'http://dbpedia.org/resource/Par%C3%A1'),(62,'GUARULHOS',3,'http://dbpedia.org/resource/Guarulhos'),(63,'Jacksonville',2,'http://dbpedia.org/resource/Jacksonville,_Florida'),(64,'Brasília',3,'http://dbpedia.org/resource/Bras%C3%ADlia'),(65,'Distrito Federal',3,'http://dbpedia.org/resource/Federal_District_(Brazil)'),(66,'Darien, Connecticut',2,'http://dbpedia.org/resource/Darien,_Connecticut'),(67,'State of Rio Grande do Sul',3,'http://dbpedia.org/resource/Rio_Grande_do_Sul'),(68,'The Municipality of Ijuí',3,'http://dbpedia.org/resource/Iju%C3%AD'),(69,'Akron',2,'http://dbpedia.org/resource/Akron,_Ohio'),(70,'Cleveland',2,'http://dbpedia.org/resource/Cleveland'),(71,'City of Little Rock, Arkansas',2,'http://dbpedia.org/resource/Little_Rock,_Arkansas'),(72,'Topeka, Kansas',2,'http://dbpedia.org/resource/Topeka,_Kansas'),(73,'City of Macon',2,'http://dbpedia.org/resource/Macon,_Georgia'),(74,'District of Columbia',2,'http://dbpedia.org/resource/Washington,_D.C.'),(75,'City of Toronto',12,'http://dbpedia.org/resource/Toronto'),(76,'Dùn Dè',14,'http://dbpedia.org/resource/Dundee'),(77,'San Francisco',2,'http://dbpedia.org/resource/San_Francisco'),(78,'City of Austin',2,'http://dbpedia.org/resource/Austin,_Texas'),(79,'Ealing',4,'http://dbpedia.org/resource/Ealing'),(80,'Ville d\'Ottawa',12,'http://dbpedia.org/resource/Ottawa'),(81,'Eau Claire, Wisconsin',2,'http://dbpedia.org/resource/Eau_Claire,_Wisconsin'),(82,'Stockholm',6,'http://dbpedia.org/resource/Stockholm'),(83,'Abingdon-on-Thames',4,'http://dbpedia.org/resource/Abingdon-on-Thames'),(84,'Cambridge, Massachusetts',2,'http://dbpedia.org/resource/Cambridge,_Massachusetts'),(85,'Wilmette, Illinois',2,'http://dbpedia.org/resource/Wilmette,_Illinois'),(86,'City of Palm Desert',2,'http://dbpedia.org/resource/Palm_Desert,_California'),(87,'Tallahassee',2,'http://dbpedia.org/resource/Tallahassee,_Florida'),(88,'Versailles',7,'http://dbpedia.org/resource/Versailles_(city)'),(89,'Freie und Hansestadt Hamburg',11,'http://dbpedia.org/resource/Hamburg'),(90,'Greenville, Florida',2,'http://dbpedia.org/resource/Greenville,_Florida'),(91,'Eschwege',11,'http://dbpedia.org/resource/Eschwege'),(92,'Teignmouth',15,'http://dbpedia.org/resource/Teignmouth'),(93,'City of Detroit',2,'http://dbpedia.org/resource/Detroit'),(94,'Bowling Green, Kentucky',2,'http://dbpedia.org/resource/Bowling_Green,_Kentucky'),(95,'Eskilstuna',6,'http://dbpedia.org/resource/Eskilstuna'),(96,'Town of Whitby',12,'http://dbpedia.org/resource/Whitby,_Ontario'),(97,'City of Ukiah',2,'http://dbpedia.org/resource/Ukiah,_California'),(98,'Ajax',12,'http://dbpedia.org/resource/Ajax,_Ontario'),(99,'County Down',4,'http://dbpedia.org/resource/County_Down'),(100,'Donaghadee',4,'http://dbpedia.org/resource/Donaghadee'),(101,'Bangor',16,'http://dbpedia.org/resource/Bangor,_County_Down'),(102,'Buffalo, New York',2,'http://dbpedia.org/resource/Buffalo,_New_York'),(103,'??',17,'http://dbpedia.org/resource/Seoul'),(104,'Hertford',4,'http://dbpedia.org/resource/Hertford'),(105,'Flushing',2,'http://dbpedia.org/resource/Flushing,_Queens'),(106,'Wakefield',18,'http://dbpedia.org/resource/Wakefield');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int(11) NOT NULL auto_increment,
  `country_name` varchar(40) default NULL,
  `resource` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `resource` (`resource`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Norway','http://dbpedia.org/resource/Norway'),(2,'the United States','http://dbpedia.org/resource/United_States'),(3,'Brazil','http://dbpedia.org/resource/Brazil'),(4,'the United Kingdom','http://dbpedia.org/resource/United_Kingdom'),(5,'Australia','http://dbpedia.org/resource/Australia'),(6,'Sweden','http://dbpedia.org/resource/Sweden'),(7,'France','http://dbpedia.org/resource/France'),(8,'the Netherlands','http://dbpedia.org/resource/Netherlands'),(9,'Iceland','http://dbpedia.org/resource/Iceland'),(10,'Ireland','http://dbpedia.org/resource/Republic_of_Ireland'),(11,'Germany','http://dbpedia.org/resource/Germany'),(12,'Canada','http://dbpedia.org/resource/Canada'),(13,'Scotland','http://dbpedia.org/resource/Scotland_national_football_team'),(14,'Alba','http://dbpedia.org/resource/Scotland'),(15,'Devon','http://dbpedia.org/resource/Devon'),(16,'Norlin Airlann\'\'','http://dbpedia.org/resource/Northern_Ireland'),(17,'Daehan Minguk','http://dbpedia.org/resource/South_Korea'),(18,'England','http://dbpedia.org/resource/England');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Knows`
--

DROP TABLE IF EXISTS `Knows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Knows` (
  `id` int(11) NOT NULL auto_increment,
  `person_id` int(11) NOT NULL,
  `colleague_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `person_id` (`person_id`,`colleague_id`),
  KEY `colleague_id` (`colleague_id`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Knows`
--

LOCK TABLES `Knows` WRITE;
/*!40000 ALTER TABLE `Knows` DISABLE KEYS */;
INSERT INTO `Knows` VALUES (1,33,36),(2,33,8),(3,38,47),(4,38,17),(5,38,39),(6,38,18),(7,38,45),(8,38,41),(9,38,19),(10,38,26),(11,38,42),(12,38,43),(13,38,20),(14,38,21),(15,38,22),(16,38,15),(17,38,23),(18,17,38),(19,17,39),(20,17,40),(21,17,18),(22,17,24),(23,17,45),(24,17,41),(25,17,19),(26,17,26),(27,17,25),(28,17,42),(29,17,43),(30,17,20),(31,17,21),(32,17,44),(33,17,22),(34,17,15),(35,17,23),(36,40,47),(37,40,38),(38,40,17),(39,40,39),(40,40,18),(41,40,37),(42,40,24),(43,40,45),(44,40,41),(45,40,19),(46,40,26),(47,40,25),(48,40,42),(49,40,43),(50,40,20),(51,40,21),(52,40,44),(53,40,22),(54,40,15),(55,40,23),(56,51,47),(57,51,38),(58,51,7),(59,51,4),(60,51,13),(61,51,49),(62,51,11),(63,51,10),(64,51,8),(65,51,9),(66,51,32),(67,1,7),(68,18,17),(69,18,39),(70,18,26),(71,18,42),(72,18,20),(73,18,22),(74,18,23),(75,37,47),(76,37,24),(77,37,45),(78,37,3),(79,37,19),(80,37,30),(81,37,26),(82,37,25),(83,37,43),(84,37,23),(85,45,50),(86,3,47),(87,3,37),(88,3,16),(89,3,28),(90,19,47),(91,19,38),(92,19,17),(93,19,39),(94,19,40),(95,19,18),(96,19,24),(97,19,45),(98,19,41),(99,19,26),(100,19,25),(101,19,42),(102,19,43),(103,19,20),(104,19,21),(105,19,48),(106,19,15),(107,19,23),(108,30,47),(109,30,37),(110,30,4),(111,30,10),(112,36,16),(113,36,14),(114,36,28),(115,26,47),(116,26,38),(117,26,17),(118,26,39),(119,26,40),(120,26,18),(121,26,37),(122,26,24),(123,26,41),(124,26,19),(125,26,25),(126,26,43),(127,26,20),(128,26,21),(129,26,23),(130,2,47),(131,2,1),(132,2,46),(133,16,3),(134,16,36),(135,16,43),(136,16,28),(137,43,47),(138,43,38),(139,43,17),(140,43,39),(141,43,40),(142,43,18),(143,43,37),(144,43,24),(145,43,45),(146,43,41),(147,43,19),(148,43,36),(149,43,26),(150,43,25),(151,43,42),(152,43,16),(153,43,20),(154,43,46),(155,43,21),(156,43,48),(157,43,22),(158,43,15),(159,43,23),(160,46,47),(161,46,48),(162,46,10),(163,49,51),(164,49,4),(165,49,13),(166,49,11),(167,49,8),(168,49,9),(169,21,19),(170,21,20),(171,22,47),(172,22,17),(173,22,39),(174,22,18),(175,22,42),(176,8,33),(177,8,9),(178,6,47),(179,6,46),(180,6,8),(181,6,29),(182,6,32),(183,9,47),(184,9,7),(185,9,51),(186,9,37),(187,9,4),(188,9,13),(189,9,46),(190,9,49),(191,9,11),(192,9,8),(193,9,32),(194,23,47),(195,23,38),(196,23,17),(197,23,39),(198,23,40),(199,23,18),(200,23,37),(201,23,24),(202,23,45),(203,23,41),(204,23,19),(205,23,26),(206,23,25),(207,23,42),(208,23,43),(209,23,20),(210,23,21),(211,23,44),(212,23,22),(213,23,15),(214,50,45),(215,28,47),(216,28,40),(217,28,24),(218,28,3),(219,28,36),(220,28,25),(221,28,16);
/*!40000 ALTER TABLE `Knows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikesMusic`
--

DROP TABLE IF EXISTS `LikesMusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LikesMusic` (
  `id` int(11) NOT NULL auto_increment,
  `person_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `person_id` (`person_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=628 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikesMusic`
--

LOCK TABLES `LikesMusic` WRITE;
/*!40000 ALTER TABLE `LikesMusic` DISABLE KEYS */;
INSERT INTO `LikesMusic` VALUES (1,33,1),(2,33,2),(3,33,3),(4,33,4),(5,33,5),(6,33,6),(7,33,7),(8,33,8),(9,38,9),(10,38,10),(11,38,11),(12,38,12),(13,38,13),(14,38,14),(15,38,15),(16,38,16),(17,38,17),(18,38,18),(19,38,19),(20,38,20),(21,17,21),(22,17,22),(23,17,23),(24,17,24),(25,17,25),(26,17,26),(27,17,27),(28,17,28),(29,40,29),(30,40,30),(31,40,31),(32,40,32),(33,40,33),(34,40,34),(35,40,35),(36,40,36),(37,40,37),(38,40,38),(39,51,39),(40,51,9),(41,51,40),(42,51,41),(43,51,42),(44,51,43),(45,51,44),(46,51,45),(47,51,46),(48,51,47),(49,51,25),(50,51,48),(51,51,49),(52,51,12),(53,51,50),(54,51,13),(55,51,51),(56,51,52),(57,51,53),(58,51,54),(59,51,28),(60,1,55),(61,1,56),(62,1,57),(63,1,58),(64,1,59),(65,1,60),(66,1,11),(67,1,33),(68,1,14),(69,1,61),(70,1,62),(71,37,63),(72,37,64),(73,37,65),(74,37,23),(75,37,66),(76,37,33),(77,37,52),(78,37,6),(79,37,17),(80,37,67),(81,37,68),(82,37,69),(83,37,20),(84,37,70),(85,37,71),(86,37,72),(87,24,73),(88,24,29),(89,24,39),(90,24,74),(91,24,75),(92,24,76),(93,24,77),(94,24,78),(95,24,79),(96,24,60),(97,24,80),(98,24,31),(99,24,81),(100,24,82),(101,24,83),(102,24,84),(103,24,25),(104,24,85),(105,24,86),(106,24,33),(107,24,50),(108,24,14),(109,24,51),(110,24,87),(111,24,88),(112,24,6),(113,24,16),(114,24,89),(115,24,90),(116,24,53),(117,24,91),(118,24,92),(119,24,93),(120,24,94),(121,24,95),(122,24,54),(123,24,96),(124,24,97),(125,24,98),(126,24,99),(127,24,100),(128,24,101),(129,24,102),(130,24,103),(131,24,104),(132,24,105),(133,45,106),(134,45,107),(135,45,9),(136,45,108),(137,45,109),(138,45,110),(139,45,42),(140,45,111),(141,45,112),(142,45,113),(143,45,45),(144,45,114),(145,45,115),(146,45,31),(147,45,83),(148,45,33),(149,45,116),(150,45,117),(151,45,118),(152,45,119),(153,45,120),(154,45,121),(155,45,122),(156,45,123),(157,45,102),(158,3,124),(159,3,41),(160,3,125),(161,3,23),(162,3,25),(163,3,53),(164,3,126),(165,3,127),(166,3,128),(167,3,28),(168,41,63),(169,41,129),(170,41,9),(171,41,130),(172,41,131),(173,41,132),(174,41,133),(175,41,74),(176,41,110),(177,41,134),(178,41,135),(179,41,136),(180,41,137),(181,41,138),(182,41,139),(183,41,140),(184,41,141),(185,41,83),(186,41,142),(187,41,143),(188,41,144),(189,41,145),(190,41,13),(191,41,146),(192,41,16),(193,41,17),(194,41,147),(195,41,148),(196,41,149),(197,41,150),(198,41,151),(199,19,152),(200,19,153),(201,19,154),(202,19,60),(203,19,155),(204,19,156),(205,19,157),(206,19,158),(207,19,159),(208,19,160),(209,19,86),(210,19,161),(211,19,162),(212,19,163),(213,19,164),(214,19,165),(215,19,166),(216,19,167),(217,30,44),(218,30,168),(219,30,169),(220,30,52),(221,30,170),(222,30,171),(223,30,62),(224,30,172),(225,36,173),(226,36,109),(227,36,174),(228,36,175),(229,36,176),(230,36,31),(231,36,83),(232,36,25),(233,36,53),(234,36,102),(235,26,39),(236,26,82),(237,26,83),(238,26,177),(239,26,178),(240,26,179),(241,26,180),(242,25,39),(243,25,181),(244,25,42),(245,25,182),(246,25,183),(247,25,78),(248,25,60),(249,25,10),(250,25,184),(251,25,82),(252,25,158),(253,25,33),(254,25,185),(255,25,53),(256,25,104),(257,42,186),(258,42,187),(259,42,188),(260,42,189),(261,42,190),(262,42,191),(263,42,192),(264,42,74),(265,42,42),(266,42,56),(267,42,75),(268,42,76),(269,42,193),(270,42,194),(271,42,24),(272,42,183),(273,42,195),(274,42,60),(275,42,196),(276,42,197),(277,42,198),(278,42,199),(279,42,157),(280,42,200),(281,42,48),(282,42,201),(283,42,202),(284,42,203),(285,42,204),(286,42,35),(287,42,205),(288,42,206),(289,42,207),(290,42,208),(291,42,209),(292,42,210),(293,42,211),(294,42,95),(295,42,20),(296,42,212),(297,42,213),(298,42,214),(299,2,106),(300,2,39),(301,2,74),(302,2,215),(303,2,42),(304,2,175),(305,2,216),(306,2,60),(307,2,30),(308,2,217),(309,2,83),(310,2,218),(311,2,219),(312,2,52),(313,2,118),(314,16,220),(315,16,9),(316,16,221),(317,16,222),(318,16,223),(319,16,224),(320,16,225),(321,16,11),(322,16,88),(323,16,226),(324,16,227),(325,43,228),(326,43,229),(327,43,230),(328,43,231),(329,43,155),(330,43,156),(331,43,232),(332,43,25),(333,43,159),(334,43,233),(335,43,35),(336,43,234),(337,43,235),(338,43,207),(339,43,236),(340,20,237),(341,20,75),(342,20,238),(343,20,239),(344,20,25),(345,20,240),(346,20,86),(347,20,241),(348,20,242),(349,20,243),(350,46,244),(351,46,199),(352,46,235),(353,49,245),(354,49,246),(355,49,39),(356,49,247),(357,49,248),(358,49,249),(359,49,250),(360,49,124),(361,49,251),(362,49,41),(363,49,109),(364,49,76),(365,49,44),(366,49,252),(367,49,23),(368,49,175),(369,49,253),(370,49,254),(371,49,194),(372,49,45),(373,49,255),(374,49,78),(375,49,256),(376,49,60),(377,49,224),(378,49,47),(379,49,257),(380,49,258),(381,49,259),(382,49,260),(383,49,83),(384,49,261),(385,49,262),(386,49,33),(387,49,263),(388,49,14),(389,49,51),(390,49,264),(391,49,265),(392,49,88),(393,49,52),(394,49,6),(395,49,17),(396,49,235),(397,49,266),(398,49,267),(399,49,268),(400,49,122),(401,49,95),(402,49,269),(403,49,270),(404,49,271),(405,49,272),(406,49,273),(407,49,274),(408,49,28),(409,49,275),(410,21,181),(411,21,276),(412,21,111),(413,21,182),(414,21,78),(415,21,239),(416,21,83),(417,21,11),(418,21,277),(419,21,278),(420,22,279),(421,22,280),(422,22,190),(423,22,189),(424,22,281),(425,22,282),(426,22,191),(427,22,192),(428,22,283),(429,22,284),(430,22,285),(431,22,42),(432,22,286),(433,22,287),(434,22,228),(435,22,44),(436,22,288),(437,22,24),(438,22,183),(439,22,289),(440,22,114),(441,22,290),(442,22,10),(443,22,291),(444,22,82),(445,22,157),(446,22,200),(447,22,292),(448,22,293),(449,22,50),(450,22,35),(451,22,205),(452,22,207),(453,22,294),(454,22,209),(455,22,278),(456,22,95),(457,22,20),(458,22,295),(459,22,296),(460,22,297),(461,15,298),(462,15,299),(463,15,129),(464,15,9),(465,15,300),(466,15,301),(467,15,302),(468,15,285),(469,15,303),(470,15,304),(471,15,305),(472,15,306),(473,15,307),(474,15,308),(475,15,309),(476,15,193),(477,15,310),(478,15,44),(479,15,311),(480,15,312),(481,15,46),(482,15,289),(483,15,114),(484,15,313),(485,15,2),(486,15,314),(487,15,315),(488,15,316),(489,15,317),(490,15,318),(491,15,319),(492,15,320),(493,15,321),(494,15,322),(495,15,323),(496,15,324),(497,15,25),(498,15,325),(499,15,326),(500,15,11),(501,15,327),(502,15,328),(503,15,202),(504,15,293),(505,15,329),(506,15,330),(507,15,331),(508,15,332),(509,15,205),(510,15,16),(511,15,333),(512,15,17),(513,15,334),(514,15,278),(515,15,148),(516,15,8),(517,15,18),(518,15,335),(519,15,336),(520,15,337),(521,15,338),(522,15,339),(523,15,95),(524,15,340),(525,15,19),(526,15,341),(527,15,54),(528,15,342),(529,15,343),(530,15,344),(531,15,345),(532,15,346),(533,15,20),(534,15,347),(535,15,348),(536,15,349),(537,15,350),(538,15,295),(539,15,297),(540,15,351),(541,15,352),(542,15,353),(543,8,9),(544,8,41),(545,8,76),(546,8,354),(547,8,355),(548,8,356),(549,8,205),(550,8,297),(551,9,106),(552,9,39),(553,9,109),(554,9,215),(555,9,357),(556,9,358),(557,9,44),(558,9,359),(559,9,175),(560,9,253),(561,9,194),(562,9,154),(563,9,45),(564,9,78),(565,9,60),(566,9,31),(567,9,360),(568,9,258),(569,9,361),(570,9,83),(571,9,158),(572,9,33),(573,9,144),(574,9,293),(575,9,13),(576,9,14),(577,9,51),(578,9,88),(579,9,52),(580,9,6),(581,9,17),(582,9,362),(583,9,53),(584,9,120),(585,9,92),(586,9,363),(587,9,364),(588,9,365),(589,9,122),(590,9,95),(591,9,366),(592,9,212),(593,9,270),(594,9,272),(595,9,275),(596,23,106),(597,23,9),(598,23,25),(599,23,12),(600,23,17),(601,23,367),(602,23,368),(603,23,8),(604,23,18),(605,23,20),(606,50,369),(607,50,111),(608,50,370),(609,50,371),(610,50,33),(611,50,6),(612,28,106),(613,28,39),(614,28,372),(615,28,133),(616,28,76),(617,28,373),(618,28,31),(619,28,33),(620,28,87),(621,28,88),(622,28,52),(623,28,89),(624,28,374),(625,28,375),(626,28,278),(627,28,122);
/*!40000 ALTER TABLE `LikesMusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicalArtist`
--

DROP TABLE IF EXISTS `MusicalArtist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicalArtist` (
  `id` int(11) NOT NULL auto_increment,
  `artistic_name` varchar(40) default NULL,
  `genre_id` varchar(40) default NULL,
  `city_id` int(11) default NULL,
  `creation_date` date default NULL,
  `wiki_address` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `wiki_address` (`wiki_address`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicalArtist`
--

LOCK TABLES `MusicalArtist` WRITE;
/*!40000 ALTER TABLE `MusicalArtist` DISABLE KEYS */;
INSERT INTO `MusicalArtist` VALUES (1,'Acid Black Cherry',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Acid_Black_Cherry'),(2,'Gorillaz',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/Gorillaz'),(3,'Nightmare',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/Nightmare_(Japanese_band)'),(4,'Orange Range',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Orange_Range'),(5,'Paul McCartney',NULL,NULL,'1957-02-00','http://en.wikipedia.org/wiki/Paul_McCartney'),(6,'Queen',NULL,NULL,'1970-02-00','http://en.wikipedia.org/wiki/Queen_(band)'),(7,'Sound Horizon',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Sound_Horizon'),(8,'The Beatles',NULL,NULL,'1960-02-00','http://en.wikipedia.org/wiki/The_Beatles'),(9,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Arctic_monkeys'),(10,'Imagine Dragons',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Imagine_Dragons'),(11,'Los Hermanos',NULL,21,'1997-02-00','http://en.wikipedia.org/wiki/Los_Hermanos'),(12,'Muse',NULL,92,'1994-02-00','http://en.wikipedia.org/wiki/Muse_(band)'),(13,'Nine Inch Nails',NULL,70,'1988-02-00','http://en.wikipedia.org/wiki/Nine_inch_nails'),(14,'Nirvana',NULL,28,'1987-02-00','http://en.wikipedia.org/wiki/Nirvana_(band)'),(15,'Placebo',NULL,6,'1994-02-00','http://en.wikipedia.org/wiki/Placebo_(band)'),(16,'Queens of the Stone Age',NULL,86,'1996-02-00','http://en.wikipedia.org/wiki/Queens_of_the_stone_age'),(17,'Radiohead',NULL,83,'1985-02-00','http://en.wikipedia.org/wiki/Radiohead'),(18,'The Black Keys',NULL,69,'2001-02-00','http://en.wikipedia.org/wiki/The_Black_Keys'),(19,'The Kooks',NULL,47,'2002-02-00','http://en.wikipedia.org/wiki/The_Kooks'),(20,'The Strokes',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/The_Strokes'),(21,'Apink',NULL,103,'2011-02-00','http://en.wikipedia.org/wiki/A_Pink'),(22,'Claudia Leitte',NULL,22,'2001-02-00','http://en.wikipedia.org/wiki/Claudia_Leitte'),(23,'deadmau5',NULL,75,'2005-02-00','http://en.wikipedia.org/wiki/Deadmau5'),(24,'Eminem',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Eminem'),(25,'Linkin Park',NULL,NULL,'1996-02-00','http://en.wikipedia.org/wiki/Linkin_Park'),(26,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Two_Steps_From_Hell'),(27,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Yousei_Teikoku'),(28,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Zedd_(musician)'),(29,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC-DC'),(30,'Helloween',NULL,89,'1984-02-00','http://en.wikipedia.org/wiki/Helloween'),(31,'Iron Maiden',NULL,7,'1975-02-00','http://en.wikipedia.org/wiki/Iron_Maiden'),(32,'Karnivool',NULL,8,'1997-02-00','http://en.wikipedia.org/wiki/Karnivool'),(33,'Metallica',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Metallica'),(34,'Pain of Salvation',NULL,95,'1984-02-00','http://en.wikipedia.org/wiki/Pain_of_Salvation'),(35,'Paramore',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Paramore'),(36,'Protest the Hero',NULL,96,'2001-02-00','http://en.wikipedia.org/wiki/Protest_the_Hero'),(37,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tesseract'),(38,'The Safety Fire',NULL,6,'2006-02-00','http://en.wikipedia.org/wiki/The_Safety_Fire'),(39,'Aerosmith',NULL,56,'1970-02-00','http://en.wikipedia.org/wiki/Aerosmith'),(40,'Audioslave',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Audioslave'),(41,'Avicii',NULL,82,'2007-02-00','http://en.wikipedia.org/wiki/Avicii'),(42,'Bon Jovi',NULL,NULL,'1983-02-00','http://en.wikipedia.org/wiki/Bon_jovi'),(43,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chris_cornell'),(44,'Daft Punk',NULL,16,'1993-02-00','http://en.wikipedia.org/wiki/Daft_punk'),(45,'Eric Clapton',NULL,NULL,'1962-02-00','http://en.wikipedia.org/wiki/Eric_clapton'),(46,'Florence and the Machine',NULL,6,'2007-02-00','http://en.wikipedia.org/wiki/Florence_and_the_Machine'),(47,'Hardwell',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/Hardwell'),(48,'Kara\'s Flowers',NULL,11,'1994-02-00','http://en.wikipedia.org/wiki/Maroon_5'),(49,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Matchbox_20'),(50,'Nickelback',NULL,49,'1995-02-00','http://en.wikipedia.org/wiki/Nickelback'),(51,'Oasis',NULL,NULL,'1991-02-00','http://en.wikipedia.org/wiki/Oasis_(band)'),(52,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Pink_Floyd'),(53,'Red Hot Chili Peppers',NULL,11,'1983-02-00','http://en.wikipedia.org/wiki/Red_Hot_Chili_Peppers'),(54,'The Offspring',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/The_Offspring'),(55,'Alanis Morissette',NULL,80,'1987-02-00','http://en.wikipedia.org/wiki/Alanis_Morissette'),(56,'Britney Spears',NULL,NULL,'1992-02-00','http://en.wikipedia.org/wiki/Britney_Spears'),(57,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/C%C3%A9u'),(58,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Clarice_Falc%C3%A3o'),(59,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Fernando_e_Sorocaba'),(60,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Guns_N%27_Roses'),(61,'O Rappa',NULL,21,'1993-02-00','http://en.wikipedia.org/wiki/O_Rappa'),(62,'Shakira',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Shakira'),(63,'Alice in Chains',NULL,31,'1987-02-00','http://en.wikipedia.org/wiki/Alice_in_Chains'),(64,'Bad Company',NULL,NULL,'1973-02-00','http://en.wikipedia.org/wiki/Bad_Company'),(65,'Badlands',NULL,11,'1988-02-00','http://en.wikipedia.org/wiki/Badlands_(American_band)'),(66,'Explosions in the Sky',NULL,78,'1999-02-00','http://en.wikipedia.org/wiki/Explosions_in_the_Sky'),(67,'Serafin',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/Serafin_(band)'),(68,'Soundgarden',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Soundgarden'),(69,'Stone Temple Pilots',NULL,35,'1986-02-00','http://en.wikipedia.org/wiki/Stone_Temple_Pilots'),(70,'Third Eye Blind',NULL,77,'1993-02-00','http://en.wikipedia.org/wiki/Third_Eye_Blind'),(71,'Tool',NULL,NULL,'1990-02-00','http://en.wikipedia.org/wiki/Tool_(band)'),(72,'Velvet Revolver',NULL,45,'2002-02-00','http://en.wikipedia.org/wiki/Velvet_Revolver'),(73,'3 Doors Down',NULL,34,'1996-02-00','http://en.wikipedia.org/wiki/3_Doors_Down'),(74,'Black Sabbath',NULL,NULL,'1968-02-00','http://en.wikipedia.org/wiki/Black_Sabbath'),(75,'Capital Inicial',NULL,65,'1982-02-00','http://en.wikipedia.org/wiki/Capital_Inicial'),(76,'Coldplay',NULL,6,'1996-02-00','http://en.wikipedia.org/wiki/Coldplay'),(77,'Creed',NULL,87,'1994-02-00','http://en.wikipedia.org/wiki/Creed_(band)'),(78,'Foo Fighters',NULL,31,'1994-02-00','http://en.wikipedia.org/wiki/Foo_Fighters'),(79,'Goo Goo Dolls',NULL,102,'1986-02-00','http://en.wikipedia.org/wiki/Goo_Goo_Dolls'),(80,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ira_(band)'),(81,'Kansas',NULL,13,'1973-02-00','http://en.wikipedia.org/wiki/Kansas_(band)'),(82,'Kiss',NULL,NULL,'1973-02-00','http://en.wikipedia.org/wiki/Kiss_(band)'),(83,'Led Zeppelin',NULL,NULL,'1968-02-00','http://en.wikipedia.org/wiki/Led_Zeppelin'),(84,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Legiao_urbana'),(85,'Living Colour',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Living_Colour'),(86,'Mamonas Assassinas',NULL,62,'1994-02-00','http://en.wikipedia.org/wiki/Mamonas_Assassinas'),(87,'Ozzy Osbourne',NULL,NULL,'1967-02-00','http://en.wikipedia.org/wiki/Ozzy_Osbourne'),(88,'Pearl Jam',NULL,31,'1990-02-00','http://en.wikipedia.org/wiki/Pearl_Jam'),(89,'Rage Against the Machine',NULL,11,'1991-02-00','http://en.wikipedia.org/wiki/Rage_Against_the_Machine'),(90,'Raul Seixas',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/Raul_Seixas'),(91,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Scorpions'),(92,'Sex Pistols',NULL,NULL,'1975-02-00','http://en.wikipedia.org/wiki/Sex_pistols'),(93,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Skid_row'),(94,'The Calling',NULL,11,'2000-02-00','http://en.wikipedia.org/wiki/The_Calling'),(95,'The Killers',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/The_Killers'),(96,'The Rolling Stones',NULL,6,'1962-02-00','http://en.wikipedia.org/wiki/The_Rolling_Stones'),(97,'The White Stripes',NULL,93,'1997-02-00','http://en.wikipedia.org/wiki/The_White_Stripes'),(98,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_police'),(99,'Thin Lizzy',NULL,36,'1969-02-00','http://en.wikipedia.org/wiki/Thin_Lizzy'),(100,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Titas_(band)'),(101,'Twisted Sister',NULL,29,'1972-02-00','http://en.wikipedia.org/wiki/Twisted_Sister'),(102,'U2',NULL,36,'1976-02-00','http://en.wikipedia.org/wiki/U2'),(103,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Van_halen'),(104,'Whitesnake',NULL,NULL,'1978-02-00','http://en.wikipedia.org/wiki/Whitesnake'),(105,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Yes_band'),(106,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC/DC'),(107,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Angra_%28band%29'),(108,'Avantasia',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avantasia'),(109,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Beatles'),(110,'Blind Guardian',NULL,48,'1984-02-00','http://en.wikipedia.org/wiki/Blind_guardian'),(111,'Dream Theater',NULL,56,'1985-02-00','http://en.wikipedia.org/wiki/Dream_Theater'),(112,'Eddie Van Halen',NULL,NULL,'1972-02-00','http://en.wikipedia.org/wiki/Eddie_Van_Halen'),(113,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Edguy'),(114,'Foster the People',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Foster_the_people'),(115,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Franz_Ferdinand_%28band%29'),(116,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Motorhead'),(117,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Nirvana_%28band%29'),(118,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Queen_%28band%29'),(119,'Ramones',NULL,53,'1974-02-00','http://en.wikipedia.org/wiki/Ramones'),(120,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Rolling_Stones'),(121,'Sonata Arctica',NULL,NULL,'1995-02-00','http://en.wikipedia.org/wiki/Sonata_Arctica'),(122,'The Doors',NULL,11,'1965-02-00','http://en.wikipedia.org/wiki/The_doors'),(123,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_foo_fighters'),(124,'Armin van Buuren',NULL,42,'1995-02-00','http://en.wikipedia.org/wiki/Armin_van_buuren'),(125,'Charlie Brown Jr.',NULL,25,'1992-02-00','http://en.wikipedia.org/wiki/Charlie_Brown_Jr.'),(126,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tiesto'),(127,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/X_japan'),(128,'Yui',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Yui_(singer)'),(129,'Arcade Fire',NULL,46,'2001-02-00','http://en.wikipedia.org/wiki/Arcade_Fire'),(130,'Bad Brains',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Bad_Brains'),(131,'Black Drawing Chalks',NULL,44,'2005-02-00','http://en.wikipedia.org/wiki/Black_Drawing_Chalks'),(132,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Black_Flag'),(133,'Black Label Society',NULL,11,'1998-02-00','http://en.wikipedia.org/wiki/Black_Label_Society'),(134,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Death'),(135,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Down'),(136,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Exodus'),(137,'Hatebreed',NULL,2,'1994-02-00','http://en.wikipedia.org/wiki/Hatebreed'),(138,'Iced Earth',NULL,12,'1985-02-00','http://en.wikipedia.org/wiki/Iced_Earth'),(139,'James Marshall Hendrix',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/Jimi_Hendrix'),(140,'Kreator',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/Kreator'),(141,'Krisiun',NULL,68,'1990-02-00','http://en.wikipedia.org/wiki/Krisiun'),(142,'Lynyrd Skynyrd',NULL,63,'1964-02-00','http://en.wikipedia.org/wiki/Lynyrd_Skynyrd'),(143,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Macaco_Bong'),(144,'Miles Dewey Davis III Davis',NULL,NULL,'1944-02-00','http://en.wikipedia.org/wiki/Miles_Davis'),(145,'Minor Threat',NULL,74,'1980-02-00','http://en.wikipedia.org/wiki/Minor_Threat'),(146,'Pantera',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Pantera'),(147,'Slayer',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Slayer'),(148,'Tame Impala',NULL,8,'2007-02-00','http://en.wikipedia.org/wiki/Tame_Impala'),(149,'The Allman Brothers Band',NULL,73,'1969-02-00','http://en.wikipedia.org/wiki/The_Allman_Brothers_Band'),(150,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Misfits'),(151,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_National'),(152,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Bruno_e_Marrone'),(153,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chit%C3%A3ozinho_e_Xoror%C3%B3'),(154,'Elvis Aaron Presley',NULL,NULL,'1953-02-00','http://en.wikipedia.org/wiki/Elvis_Presley'),(155,'Gusttavo Lima',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Gusttavo_Lima'),(156,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Jorge_e_Mateus'),(157,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Leandro_e_Leonardo'),(158,'Legião Urbana',NULL,65,'1982-02-00','http://en.wikipedia.org/wiki/Legi%C3%A3o_Urbana'),(159,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Luan_Santana'),(160,'Lulu Santos',NULL,NULL,'1972-02-00','http://en.wikipedia.org/wiki/Lulu_Santos'),(161,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Roberto_Carlos'),(162,'Roupa Nova',NULL,22,'1980-02-00','http://en.wikipedia.org/wiki/Roupa_Nova'),(163,'Só Pra Contrariar',NULL,14,'1989-02-00','http://en.wikipedia.org/wiki/S%C3%B3_Pra_Contrariar'),(164,'Skank',NULL,4,'1991-02-00','http://en.wikipedia.org/wiki/Skank_(band)'),(165,'Titãs',NULL,24,'1981-02-00','http://en.wikipedia.org/wiki/Tit%C3%A3s'),(166,'Tribalistas',NULL,NULL,'2002-02-00','http://en.wikipedia.org/wiki/Tribalistas_(band)'),(167,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Zez%C3%A9_Di_Camargo_%26_Luciano'),(168,'Godsmack',NULL,NULL,'1995-02-00','http://en.wikipedia.org/wiki/Godsmack'),(169,'Matanza',NULL,21,'1996-02-00','http://en.wikipedia.org/wiki/Matanza_(band)'),(170,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/RATM'),(171,'Sepultura',NULL,3,'1984-02-00','http://en.wikipedia.org/wiki/Sepultura'),(172,'Suicidal Tendencies',NULL,NULL,'1981-02-00','http://en.wikipedia.org/wiki/Suicidal_Tendencies'),(173,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Acdc'),(174,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cold_play'),(175,'Deep Purple',NULL,104,'1968-02-00','http://en.wikipedia.org/wiki/Deep_Purple'),(176,'Enya',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/Enya'),(177,'Nando Reis',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/Nando_Reis'),(178,'Paulo Vanzolini',NULL,NULL,'1942-02-00','http://en.wikipedia.org/wiki/Paulo_Vanzolini'),(179,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Queen'),(180,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tom_Jobin'),(181,'Banda Calypso',NULL,61,'1999-02-00','http://en.wikipedia.org/wiki/Banda_Calypso'),(182,'Engenheiros do Hawaii',NULL,38,'1985-02-00','http://en.wikipedia.org/wiki/Engenheiros_do_Hawaii'),(183,'Evanescence',NULL,71,'1995-02-00','http://en.wikipedia.org/wiki/Evanescence'),(184,'Jonas Brothers',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Jonas_Brothers'),(185,'Nightwish',NULL,NULL,'1996-02-00','http://en.wikipedia.org/wiki/Nightwish'),(186,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/%C3%89_o_Tchan'),(187,'3OH!3',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/3OH!3'),(188,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/50_cent'),(189,'ABBA',NULL,82,'1972-02-00','http://en.wikipedia.org/wiki/ABBA'),(190,'AFI',NULL,97,'1991-02-00','http://en.wikipedia.org/wiki/AFI_(band)'),(191,'Avril Lavigne',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avril_Lavigne'),(192,'Backstreet Boys',NULL,17,'1993-02-00','http://en.wikipedia.org/wiki/Backstreet_boys'),(193,'Crystal Castles',NULL,75,'2004-02-00','http://en.wikipedia.org/wiki/Crystal_Castles_(band)'),(194,'Sir Elton John',NULL,NULL,'1964-02-00','http://en.wikipedia.org/wiki/Elton_John'),(195,'Fall Out Boy',NULL,85,'2001-02-00','http://en.wikipedia.org/wiki/Fall_Out_Boy'),(196,'Jennifer Lopez',NULL,NULL,'1986-02-00','http://en.wikipedia.org/wiki/Jennifer_Lopez'),(197,'Kesha Rose Sebert',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Kesha'),(198,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Kiss_band'),(199,'Lady Gaga',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Lady_Gaga'),(200,'Madonna',NULL,NULL,'1979-02-00','http://en.wikipedia.org/wiki/Madonna_(entertainer)'),(201,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Metalicca'),(202,'Miley Cyrus',NULL,NULL,'2001-02-00','http://en.wikipedia.org/wiki/Miley_cyrus'),(203,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ozzy'),(204,'Panic! at the Disco',NULL,37,'2004-02-00','http://en.wikipedia.org/wiki/Panic!_at_the_Disco'),(205,'Phoenix',NULL,88,'1999-02-00','http://en.wikipedia.org/wiki/Phoenix_(band)'),(206,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Plain_White_T%27s'),(207,'Rihanna',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Rihanna'),(208,'Saosin',NULL,30,'2003-02-00','http://en.wikipedia.org/wiki/Saosin'),(209,'Spice Girls',NULL,6,'1994-02-00','http://en.wikipedia.org/wiki/Spice_girls'),(210,'Sum 41',NULL,98,'1996-02-00','http://en.wikipedia.org/wiki/Sum_41'),(211,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/T.a.t.u.'),(212,'The Smiths',NULL,NULL,'1982-02-00','http://en.wikipedia.org/wiki/The_smiths'),(213,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_used'),(214,'Usher',NULL,13,'1991-02-00','http://en.wikipedia.org/wiki/Usher_(entertainer)'),(215,'Bob Dylan',NULL,23,'1961-02-00','http://en.wikipedia.org/wiki/Bob_Dylan'),(216,'Fleetwood Mac',NULL,NULL,'1967-02-00','http://en.wikipedia.org/wiki/Fleetwood_Mac'),(217,'King Crimson',NULL,NULL,'1969-02-00','http://en.wikipedia.org/wiki/King_Crimson'),(218,'Moby',NULL,66,'1982-02-00','http://en.wikipedia.org/wiki/Moby'),(219,'Neil Young',NULL,59,'1960-02-00','http://en.wikipedia.org/wiki/Neil_Young'),(220,'Angra',NULL,24,'1991-02-00','http://en.wikipedia.org/wiki/Angra_(band)'),(221,'Blink-182',NULL,NULL,'1992-02-00','http://en.wikipedia.org/wiki/Blink-182'),(222,'Bob Marley',NULL,NULL,'1962-02-00','http://en.wikipedia.org/wiki/Bob_Marley'),(223,'Chico Buarque',NULL,21,'1962-02-00','http://en.wikipedia.org/wiki/Chico_Buarque'),(224,'Hans Zimmer',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Hans_Zimmer'),(225,'Korpiklaani',NULL,NULL,'1993-02-00','http://en.wikipedia.org/wiki/Korpiklaani'),(226,'Pixies',NULL,56,'1986-02-00','http://en.wikipedia.org/wiki/Pixies'),(227,'Tuatha de Danann',NULL,41,'1995-02-00','http://en.wikipedia.org/wiki/Tuatha_de_Danann_(band)'),(228,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chris_Brown'),(229,'David Guetta',NULL,NULL,'1984-02-00','http://en.wikipedia.org/wiki/David_Guetta'),(230,'Enrique Iglesias',NULL,27,'1994-02-00','http://en.wikipedia.org/wiki/Enrique_Iglesias'),(231,'Tramar Dillard',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/Flo_Rida'),(232,'Jota Quest',NULL,3,'1996-02-00','http://en.wikipedia.org/wiki/Jota_Quest'),(233,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ne-yo'),(234,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Pitbull_(rapper)'),(235,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Red_Hot_Chilli_Peppers'),(236,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ylvis'),(237,'A-ha',NULL,1,'1982-02-00','http://en.wikipedia.org/wiki/A-ha'),(238,'Dire Straits',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Dire_Straits'),(239,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ghost_BC'),(240,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/MC_Daleste'),(241,'Oficina G3',NULL,NULL,'1987-02-00','http://en.wikipedia.org/wiki/Oficina_G3'),(242,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Scorpions_%28band%29'),(243,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Tom_Jobim'),(244,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Chiclete_com_banana'),(245,'Nilsen Ørjan',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/%C3%98rjan_Nilsen'),(246,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Above_%26_Beyond_(band)'),(247,'Alex M.O.R.P.H.',NULL,NULL,'2003-02-00','http://en.wikipedia.org/wiki/Alex_M.O.R.P.H.'),(248,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Aly_%26_Fila'),(249,'Andrew Rayel',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Andrew_Rayel'),(250,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Andy_Moor_(DJ)'),(251,'Arty',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Arty_(musician)'),(252,'Dash Berlin',NULL,26,'2007-02-00','http://en.wikipedia.org/wiki/Dash_Berlin'),(253,'Eagles',NULL,NULL,'1971-02-00','http://en.wikipedia.org/wiki/Eagles_(band)'),(254,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Electric_light_orchestra'),(255,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ferry_corsten'),(256,'Giuseppe Ottaviani',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Giuseppe_Ottaviani'),(257,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/John_O%27Callaghan_(musician)'),(258,'John Williams',NULL,105,'1952-02-00','http://en.wikipedia.org/wiki/John_williams'),(259,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Jorn_van_Deynhoven'),(260,'Journey',NULL,77,'1973-02-00','http://en.wikipedia.org/wiki/Journey_(band)'),(261,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Lynrd_Skynyrd'),(262,'Markus Schulz',NULL,91,'1990-02-00','http://en.wikipedia.org/wiki/Markus_Schulz'),(263,'NERVO',NULL,19,'2005-02-00','http://en.wikipedia.org/wiki/Nervo_(duo)'),(264,'OceanLab',NULL,6,'2000-02-00','http://en.wikipedia.org/wiki/OceanLab'),(265,'Paul van Dyk',NULL,NULL,'1991-02-00','http://en.wikipedia.org/wiki/Paul_van_Dyk'),(266,'Sander van Doorn',NULL,NULL,'2004-02-00','http://en.wikipedia.org/wiki/Sander_van_Doorn'),(267,'Simon Patterson',NULL,18,'2000-02-00','http://en.wikipedia.org/wiki/Simon_Patterson_(musician)'),(268,'Supertramp',NULL,NULL,'1969-02-00','http://en.wikipedia.org/wiki/Supertramp'),(269,'The Trammps',NULL,51,'1972-02-00','http://en.wikipedia.org/wiki/The_Trammps'),(270,'The Who',NULL,6,'1964-02-00','http://en.wikipedia.org/wiki/The_Who'),(271,'Tiësto',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/Ti%C3%ABsto'),(272,'Tim Maia',NULL,21,'1956-02-00','http://en.wikipedia.org/wiki/Tim_Maia'),(273,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Ummet_Ozcan'),(274,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/W%26W'),(275,'ZZ Top',NULL,20,'1969-02-00','http://en.wikipedia.org/wiki/Zz_top'),(276,'Yusuf Islam',NULL,NULL,'1966-02-00','http://en.wikipedia.org/wiki/Cat_Stevens'),(277,'Megadeth',NULL,11,'1983-02-00','http://en.wikipedia.org/wiki/Megadeth'),(278,'System of a Down',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/System_of_a_Down'),(279,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/%C3%89_o_Tchan!'),(280,'30 Seconds to Mars',NULL,11,'1998-02-00','http://en.wikipedia.org/wiki/30_Seconds_to_Mars'),(281,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Alt_J'),(282,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Arctic_Monkey'),(283,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Beyonce'),(284,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Black_keys'),(285,'Bombay Bicycle Club',NULL,60,'2005-02-00','http://en.wikipedia.org/wiki/Bombay_Bicycle_Club'),(286,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Canon_Blue'),(287,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cansei_de_ser_sexy'),(288,'Ellie Goulding',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/Ellie_Goulding'),(289,'Foals',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Foals'),(290,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Guns_and_roses'),(291,'Katy Perry',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Katy_Perry'),(292,'Michael Joseph Jackson',NULL,NULL,'1964-02-00','http://en.wikipedia.org/wiki/Michael_Jackson'),(293,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Muse'),(294,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Sandy_e_Junior'),(295,'The xx',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_xx'),(296,'Two Door Cinema Club',NULL,101,'2007-02-00','http://en.wikipedia.org/wiki/Two_Door_Cinema_Club'),(297,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Vampire_Weekend'),(298,'Albert Hammond, Jr.',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Albert_Hammond,_Jr.'),(299,'?',NULL,40,'2007-02-00','http://en.wikipedia.org/wiki/Alt-J'),(300,'Babyshambles',NULL,6,'2003-02-00','http://en.wikipedia.org/wiki/Babyshambles'),(301,'Best Coast',NULL,NULL,'2009-02-00','http://en.wikipedia.org/wiki/Best_Coast'),(302,'Bjork',NULL,NULL,'1977-02-00','http://en.wikipedia.org/wiki/Bj%C3%B6rk'),(303,'Bon Iver',NULL,81,'2007-02-00','http://en.wikipedia.org/wiki/Bon_Iver'),(304,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Breakbot'),(305,'CSS',NULL,24,'2003-02-00','http://en.wikipedia.org/wiki/CSS_(band)'),(306,'Cage the Elephant',NULL,94,'2006-02-00','http://en.wikipedia.org/wiki/Cage_the_Elephant'),(307,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Cake'),(308,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Carissa%27s_Wierd'),(309,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Courteeners'),(310,'Cults',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/Cults_(band)'),(311,'Delta Spirit',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/Delta_Spirit'),(312,'Detektivbyrån',NULL,9,'2005-02-00','http://en.wikipedia.org/wiki/Detektivbyr%C3%A5n'),(313,'Franz Ferdinand',NULL,57,'2002-02-00','http://en.wikipedia.org/wiki/Franz_Ferdinand_(band)'),(314,'Haim',NULL,11,'2006-02-00','http://en.wikipedia.org/wiki/Haim_(band)'),(315,'Interpol',NULL,NULL,'1997-02-00','http://en.wikipedia.org/wiki/Interpol_(band)'),(316,'Jake Bugg',NULL,NULL,'2011-02-00','http://en.wikipedia.org/wiki/Jake_Bugg'),(317,'Julian Casablancas',NULL,NULL,'1998-02-00','http://en.wikipedia.org/wiki/Julian_Casablancas'),(318,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Justice'),(319,'Justin Bieber',NULL,58,'2008-02-00','http://en.wikipedia.org/wiki/Justin_Bieber'),(320,'Kaiser Chiefs',NULL,40,'1996-02-00','http://en.wikipedia.org/wiki/Kaiser_Chiefs'),(321,'Kakkmaddafakka',NULL,10,'2004-02-00','http://en.wikipedia.org/wiki/Kakkmaddafakka'),(322,'Kasabian',NULL,NULL,'1997-02-00','http://en.wikipedia.org/wiki/Kasabian'),(323,'Kid Cudi',NULL,15,'2003-02-00','http://en.wikipedia.org/wiki/Kid_Cudi'),(324,'Kings of Convenience',NULL,10,'1999-02-00','http://en.wikipedia.org/wiki/Kings_of_Convenience'),(325,'Little Joy',NULL,11,'2007-02-00','http://en.wikipedia.org/wiki/Little_Joy'),(326,'Locksley',NULL,NULL,'2003-02-00','http://en.wikipedia.org/wiki/Locksley_(band)'),(327,'M83',NULL,52,'2001-02-00','http://en.wikipedia.org/wiki/M83_(band)'),(328,'MGMT',NULL,50,'2004-02-00','http://en.wikipedia.org/wiki/MGMT'),(329,'Neutral Milk Hotel',NULL,54,'1989-02-00','http://en.wikipedia.org/wiki/Neutral_Milk_Hotel'),(330,'Of Monsters and Men',NULL,33,'2010-02-00','http://en.wikipedia.org/wiki/Of_Monsters_and_Men'),(331,'One Direction',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/One_Direction'),(332,'Passion Pit',NULL,84,'2007-02-00','http://en.wikipedia.org/wiki/Passion_Pit'),(333,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Raconteurs'),(334,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Rebbeca_Black'),(335,'The Cribs',NULL,106,'2002-02-00','http://en.wikipedia.org/wiki/The_Cribs'),(336,'The Enemy',NULL,NULL,'2006-02-00','http://en.wikipedia.org/wiki/The_Enemy_(UK_band)'),(337,'The Films',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/The_Films_(band)'),(338,'The Flaming Lips',NULL,5,'1983-02-00','http://en.wikipedia.org/wiki/The_Flaming_Lips'),(339,'The Fratellis',NULL,57,'2005-02-00','http://en.wikipedia.org/wiki/The_Fratellis'),(340,'The Kills',NULL,NULL,'2000-02-00','http://en.wikipedia.org/wiki/The_Kills'),(341,'The Last Shadow Puppets',NULL,NULL,'2007-02-00','http://en.wikipedia.org/wiki/The_Last_Shadow_Puppets'),(342,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Paddingtons'),(343,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Pixies'),(344,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Royal_Concept'),(345,'The Royalty',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_Royalty'),(346,'The Soft Pack',NULL,35,'2007-02-00','http://en.wikipedia.org/wiki/The_Soft_Pack'),(347,'The Vaccines',NULL,NULL,'2010-02-00','http://en.wikipedia.org/wiki/The_Vaccines'),(348,'The View',NULL,76,'2005-02-00','http://en.wikipedia.org/wiki/The_View_(band)'),(349,'The Virgins',NULL,NULL,'2005-02-00','http://en.wikipedia.org/wiki/The_Virgins'),(350,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_libertines'),(351,'Weezer',NULL,11,'1992-02-00','http://en.wikipedia.org/wiki/Weezer'),(352,'White Lies',NULL,79,'2007-02-00','http://en.wikipedia.org/wiki/White_Lies_(band)'),(353,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/White_Stripes'),(354,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Fratellis'),(355,'Macklemore',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Macklemore'),(356,'Men at Work',NULL,19,'1979-02-00','http://en.wikipedia.org/wiki/Men_at_Work'),(357,'Charlie Parker',NULL,NULL,'1937-02-00','http://en.wikipedia.org/wiki/Charlie_Parker'),(358,'Chet Baker',NULL,NULL,'1949-02-00','http://en.wikipedia.org/wiki/Chet_Baker'),(359,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/David_Matthews_Band'),(360,'John Coltrane',NULL,NULL,'1946-02-00','http://en.wikipedia.org/wiki/John_Coltrane'),(361,'Johnny Cash',NULL,NULL,'1954-02-00','http://en.wikipedia.org/wiki/Johnny_Cash'),(362,'Ray Charles',NULL,90,'1947-02-00','http://en.wikipedia.org/wiki/Ray_Charles'),(363,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Simon_and_Garfunkel'),(364,'The Animals',NULL,NULL,'1963-02-00','http://en.wikipedia.org/wiki/The_Animals'),(365,'The Cure',NULL,NULL,'1976-02-00','http://en.wikipedia.org/wiki/The_Cure'),(366,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/The_Mamas_%26_the_Papas'),(367,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Snow_patrol'),(368,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/System_of_Down'),(369,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/AC_DC'),(370,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Led_Zepellin'),(371,NULL,NULL,NULL,NULL,'http://en.wikipedia.org/wiki/Mega_deth'),(372,'Avenged Sevenfold',NULL,NULL,'1999-02-00','http://en.wikipedia.org/wiki/Avenged_Sevenfold'),(373,'Guns N\' Roses',NULL,NULL,'1985-02-00','http://en.wikipedia.org/wiki/Guns_N\'_Roses'),(374,'Rammstein',NULL,NULL,'1994-02-00','http://en.wikipedia.org/wiki/Rammstein'),(375,'Scorpions',NULL,39,'1965-02-00','http://en.wikipedia.org/wiki/Scorpions_(band)');
/*!40000 ALTER TABLE `MusicalArtist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicalGenre`
--

DROP TABLE IF EXISTS `MusicalGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicalGenre` (
  `id` int(11) NOT NULL auto_increment,
  `genre_name` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL auto_increment,
  `real_name` varchar(40) NOT NULL,
  `style_id` varchar(40) default NULL,
  `birth_date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `name` varchar(40) default NULL,
  `hometown` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'eduardapodesta','eduarda viana podesta',''),(2,'ivancerboncini','ivan de campos cerboncini',''),(3,'felipehiga','felipe kenji higa',''),(4,'fernandothiers','fernando barbosa thiers',''),(5,'erikaalbizzati','erika couto albizzati',''),(6,'thiagobalbo','thiago duarte balbo',''),(7,'danielferreira','daniel breves ferreira',''),(8,'ramonmaciel','ramon carvalho maciel',''),(9,'tiagoferreira','tiago de lima ferreira',''),(10,'rafaelxavier','rafael xavier',''),(11,'nicholasmizoguchi','nicholas matuzita mizoguchi',''),(12,'tuliosilva','tulio bazan da silva',''),(13,'leonnardorabello','leonnardo chagas rabello',''),(14,'lukaslopes','lukas antunes lopes',''),(15,'rafaelgarcia','rafael matheus garcia',''),(16,'joaodalben','joao henrique dalben',''),(17,'caioteixeira','caio teixeira',''),(18,'elisadellarriva','elisa dellarriva',''),(19,'fernandogoncalves','fernando henrique dos santos goncalves',''),(20,'luanbicesto','luan gustavo bicesto',''),(21,'lucianosabenca','luciano padua sabenca',''),(22,'pedroalmeida','pedro cordeiro de almeida',''),(23,'tomasqueiroga','tomas silva queiroga',''),(24,'fabiolira','fabio maffei lira',''),(25,'guilhermemendes','guilherme da rocha alves mendes',''),(26,'guilhermemazzariol','guilherme sbrolini mazzariol',''),(27,'raphaelfranco','raphael marques franco',''),(28,'willianszati','willians hidalgo zati',''),(29,'victortavares','victor guilherme oliveira semedo tavares',''),(30,'fernandohoyo','fernando luiz del hoyo','campinas'),(31,'lucasmello','lucas de campos mello',''),(32,'wilsonneto','wilson jose prata neto',''),(33,'andreiauratsuka','andreia yukie uratsuka',''),(34,'victorsilva','victor akira hassuda silva',''),(35,'leonardosilva','leonardo de oliveira silva',''),(36,'gabrielbezerra','gabriel massaki wakano bezerra',''),(37,'elvisrabello','elvis rabello',''),(38,'caiopalissari','caio vinicius uvini palissari',''),(39,'cibellebegalli','cibelle begalli',''),(40,'diegorocha','diego rocha',''),(41,'fellipecaetano','fellipe santiago scarpa caetano',''),(42,'gustavonunes','gustavo cesar nunes',''),(43,'juceliofonseca','jucelio evangelista fonseca',''),(44,'murilocruz','murilo de lima cruz',''),(45,'felipecaminada','felipe caminada',''),(46,'lucasbatista','lucas oliveira batista',''),(47,'andresantanche','andre santanche',''),(48,'luizgomes','Luiz Celso Gomes Jr',''),(49,'lucaslima','Lucas Domingues Lima','Campinas'),(50,'viniciussantos','Vinicius Pereira dos Santos','Campinas'),(51,'diegosanches','Diego Sanches','Campinas');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaysIn`
--

DROP TABLE IF EXISTS `PlaysIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaysIn` (
  `id` int(11) NOT NULL auto_increment,
  `musician_id` int(11) NOT NULL,
  `musical_artist_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `musician_id` (`musician_id`),
  KEY `musical_artist_id` (`musical_artist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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

-- Dump completed on 2014-05-16 21:42:34
