-- MySQL dump 10.13  Distrib 5.6.22, for osx10.10 (x86_64)
--
-- Host: localhost    Database: respondreact
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `address_address`
--

DROP TABLE IF EXISTS `address_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_number` varchar(20) NOT NULL,
  `route` varchar(100) NOT NULL,
  `raw` varchar(200) NOT NULL,
  `formatted` varchar(200) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_address_7e3ea948` (`locality_id`),
  CONSTRAINT `address_addr_locality_id_2788ceb8665daae7_fk_address_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `address_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_address`
--

LOCK TABLES `address_address` WRITE;
/*!40000 ALTER TABLE `address_address` DISABLE KEYS */;
INSERT INTO `address_address` VALUES (1,'','','Baton Rouge, LA, United States','',30.4582829,-91.1403196,NULL),(2,'','','2665 Mission Street, San Francisco, CA, United States','',37.7543922,-122.4185027,1),(3,'','','St Paul, MN, United States','',44.9537029,-93.0899578,NULL),(4,'','','2665 Mission Street, San Francisco, CA, United States','',37.7543922,-122.4185027,1),(5,'','','Lower Haight, San Francisco, CA, United States','',37.7720656,-122.4311526,NULL),(6,'','','San Francisco, CA 94110, United States','',37.7485824,-122.4184108,1),(9,'','','London, United Kingdom','',51.5073509,-0.127758299999982,NULL),(10,'','','St Paul, MN, United States','',44.9537029,-93.0899578,NULL),(11,'','','Stanford, CA, United States','',37.424106,-122.1660756,NULL),(12,'','','Stanford, CA, United States','',37.424106,-122.1660756,NULL),(13,'','','Stanford, CA, United States','',37.424106,-122.1660756,NULL),(14,'','','San Francisco, CA 94110, United States','',37.7485824,-122.4184108,1),(15,'','','Nice, France','',43.7101728,7.26195319999999,NULL),(16,'','','Baton Rouge, LA, United States','',30.4582829,-91.1403196,NULL),(17,'','','Baton Rouge, LA, United States','',30.4582829,-91.1403196,NULL),(18,'','','Cleveland, OH, United States','',41.49932,-81.6943605,NULL),(65,'','','Munich, Germany','',48.1351253,11.5819806,NULL),(66,'','','1100 Alamo Drive, Vacaville, CA, United States','',38.341014,-121.9942357,51),(67,'','','555 Airport Blvd, Austin, TX, United States','',30.2511447,-97.6925109,52),(68,'','','715 E 8th St, Austin, TX, United States','',30.26792,-97.7356446,53),(69,'','','Kings Pub, Hawthorn Drive, Ipswich, United Kingdom','',52.045809,1.12295670000003,54),(70,'','','Westminster Abbey, London, United Kingdom','',51.4994174,-0.127570500000047,55),(71,'','','San Francisco, CA 94122, United States','',37.7597481,-122.4750292,56),(72,'','','Convention Avenue, Philadelphia, PA, United States','',39.9484212,-75.1921671,57),(73,'','','1219 23rd Street Northwest, D.C., DC, United States','',38.905891,-77.0500848,58),(74,'','','Sacramento, CA 95811, United States','',38.5967128,-121.4941738,59),(75,'','','San Francisco, CA 94117, United States','',37.7717185,-122.4438929,37),(76,'','','Rockefeller Center, New York, NY, United States','',40.7586101,-73.9782093,NULL),(77,'','','Trump Tower, New York, NY, United States','',40.7625,-73.974167,60),(78,'','','Thornton, CO 80241, United States','',39.9311729,-104.9739333,23),(79,'','','Denver, CO 80209, United States','',39.7069307,-104.9564084,61);
/*!40000 ALTER TABLE `address_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_country`
--

DROP TABLE IF EXISTS `address_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES (1,'Kenya','KY'),(2,'United Kingdom','GB'),(3,'France','FR'),(4,'Swedeen','SW'),(5,'United States','US'),(6,'Germany','DE');
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_locality`
--

DROP TABLE IF EXISTS `address_locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(165) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_postal_code_state` (`name`,`postal_code`,`state_id`),
  KEY `address_locality_d5582625` (`state_id`),
  CONSTRAINT `address_locality_state_id_345ede112f647e90_fk_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `address_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_locality`
--

LOCK TABLES `address_locality` WRITE;
/*!40000 ALTER TABLE `address_locality` DISABLE KEYS */;
INSERT INTO `address_locality` VALUES (53,'Austin','78701',12),(52,'Austin','78721',12),(27,'Broomfield','80020',7),(55,'Deans Yd','SW1P 3PA',4),(61,'Denver','80209',7),(32,'Detroit','48238',8),(29,'Fort Collins','80521',7),(54,'Ipswich','IP2 0QG',4),(60,'New York','10022',17),(57,'Philadelphia','19104',15),(59,'Sacramento','95811',2),(1,'San Francisco','94110',2),(37,'San Francisco','94117',2),(56,'San Francisco','94122',2),(23,'Thornton','80241',7),(51,'Vacaville','95687',2),(58,'Washington','20037',16),(28,'Westminster','80030',7);
/*!40000 ALTER TABLE `address_locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_state`
--

DROP TABLE IF EXISTS `address_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(165) NOT NULL,
  `code` varchar(3) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_state_name_7d0940bcbdfc2e7e_uniq` (`name`,`country_id`),
  KEY `address_state_country_id_2b9bd29be87f712b_fk_address_country_id` (`country_id`),
  CONSTRAINT `address_state_country_id_2b9bd29be87f712b_fk_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_state`
--

LOCK TABLES `address_state` WRITE;
/*!40000 ALTER TABLE `address_state` DISABLE KEYS */;
INSERT INTO `address_state` VALUES (1,'Louisiana','LA',5),(2,'California','CA',5),(3,'Minnesota','MN',5),(4,'England','En',2),(5,'Provence-Alpes-Côte d\'Azur','Pr',3),(6,'Ohio','OH',5),(7,'Colorado','CO',5),(8,'Michigan','MI',5),(9,'Illinois','IL',5),(11,'Bavaria','BY',6),(12,'Texas','TX',5),(15,'Pennsylvania','PA',5),(16,'District of Columbia','DC',5),(17,'New York','NY',5);
/*!40000 ALTER TABLE `address_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_5a458f888cc8ee18_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_5a458f888cc8ee18_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_2a1a6c20905b105b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_33b03390e33a30a0_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add token',6,'add_token'),(17,'Can change token',6,'change_token'),(18,'Can delete token',6,'delete_token'),(19,'Can add cors model',7,'add_corsmodel'),(20,'Can change cors model',7,'change_corsmodel'),(21,'Can delete cors model',7,'delete_corsmodel'),(22,'Can add topic',8,'add_topic'),(23,'Can change topic',8,'change_topic'),(24,'Can delete topic',8,'delete_topic'),(25,'Can add action',9,'add_action'),(26,'Can change action',9,'change_action'),(27,'Can delete action',9,'delete_action'),(28,'Can add vote',10,'add_vote'),(29,'Can change vote',10,'change_vote'),(30,'Can delete vote',10,'delete_vote'),(31,'Can add Tag',11,'add_tag'),(32,'Can change Tag',11,'change_tag'),(33,'Can delete Tag',11,'delete_tag'),(34,'Can add Tagged Item',12,'add_taggeditem'),(35,'Can change Tagged Item',12,'change_taggeditem'),(36,'Can delete Tagged Item',12,'delete_taggeditem'),(37,'Can add user',13,'add_customuser'),(38,'Can change user',13,'change_customuser'),(39,'Can delete user',13,'delete_customuser'),(40,'Can add user social auth',14,'add_usersocialauth'),(41,'Can change user social auth',14,'change_usersocialauth'),(42,'Can delete user social auth',14,'delete_usersocialauth'),(43,'Can add nonce',15,'add_nonce'),(44,'Can change nonce',15,'change_nonce'),(45,'Can delete nonce',15,'delete_nonce'),(46,'Can add association',16,'add_association'),(47,'Can change association',16,'change_association'),(48,'Can delete association',16,'delete_association'),(49,'Can add code',17,'add_code'),(50,'Can change code',17,'change_code'),(51,'Can delete code',17,'delete_code'),(52,'Can add country',18,'add_country'),(53,'Can change country',18,'change_country'),(54,'Can delete country',18,'delete_country'),(55,'Can add state',19,'add_state'),(56,'Can change state',19,'change_state'),(57,'Can delete state',19,'delete_state'),(58,'Can add locality',20,'add_locality'),(59,'Can change locality',20,'change_locality'),(60,'Can delete locality',20,'delete_locality'),(61,'Can add address',21,'add_address'),(62,'Can change address',21,'change_address'),(63,'Can delete address',21,'delete_address');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_t_user_id_6b78d6fba9cbdc9a_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customuser_customuser`
--

DROP TABLE IF EXISTS `customuser_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customuser_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `social_thumb` varchar(200) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser_customuser`
--

LOCK TABLES `customuser_customuser` WRITE;
/*!40000 ALTER TABLE `customuser_customuser` DISABLE KEYS */;
INSERT INTO `customuser_customuser` VALUES (1,'pbkdf2_sha256$20000$k91lEq4Zkp25$6iwsG7lpMLv/i7wyVoR2iPmClBf/NA97ZB9Iswbg9w4=','2016-08-02 13:31:27.556847',1,'admin','Admin','User','admin@test.com',1,1,'2016-07-13 23:57:16.202437','http://graph.facebook.com/10102615181971353/picture?type=normal',75),(2,'!b0b81rEM6gCVjyHwTDjQl5nxTOrDgtsVgN3BfS5A',NULL,0,'KevinCook','Kevin','Cook','kevinac4@gmail.com',0,1,'2016-07-14 00:13:17.441512','http://graph.facebook.com/10102615181971353/picture?type=normal',71),(3,'!AWqObl4GLlspjiB0ixwNYliAjH5I7bRKMYXCdG0j',NULL,0,'ChrisJohnson','Chris','Johnson','keubo4@gmail.com',0,1,'2016-08-01 22:12:03.406200','http://graph.facebook.com/10201476415109883/picture?type=normal',78),(4,'!k3KxMZuJyBklD8Cgok1LoMgt6TOrt9kQlVLPLmtb',NULL,0,'CatherineCheyenne','Catherine','Cheyenne','cvds88@gmail.com',0,1,'2016-08-02 03:35:05.875685','http://graph.facebook.com/10104187279914383/picture?type=normal',71);
/*!40000 ALTER TABLE `customuser_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customuser_customuser_groups`
--

DROP TABLE IF EXISTS `customuser_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customuser_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser_customuser_groups`
--

LOCK TABLES `customuser_customuser_groups` WRITE;
/*!40000 ALTER TABLE `customuser_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customuser_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customuser_customuser_user_permissions`
--

DROP TABLE IF EXISTS `customuser_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customuser_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser_customuser_user_permissions`
--

LOCK TABLES `customuser_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `customuser_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `customuser_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_65bee276b7a407d8_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admi_user_id_18165e9631f86b08_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_65bee276b7a407d8_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admi_user_id_18165e9631f86b08_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-21 19:04:58.349997','36','San Francisco, California 94117, United States',3,'',20,1),(2,'2016-07-21 19:04:58.353402','35','San Francisco, California 94117, United States',3,'',20,1),(3,'2016-07-21 19:04:58.354821','34','San Francisco, California 94117, United States',3,'',20,1),(4,'2016-07-21 19:04:58.355865','31','San Francisco, California 94122, United States',3,'',20,1),(5,'2016-07-21 19:04:58.356884','30','San Francisco, California 94122, United States',3,'',20,1),(6,'2016-07-21 19:04:58.357881','22','San Francisco, California 94122, United States',3,'',20,1),(7,'2016-07-21 19:04:58.358926','21','San Francisco, California 94117, United States',3,'',20,1),(8,'2016-07-21 19:04:58.359898','20','San Francisco, California 94122, United States',3,'',20,1),(9,'2016-07-21 19:04:58.360900','19','San Francisco, California 94122, United States',3,'',20,1),(10,'2016-07-21 19:04:58.361893','18','San Francisco, California 94122, United States',3,'',20,1),(11,'2016-07-21 19:04:58.362998','17','San Francisco, California 94122, United States',3,'',20,1),(12,'2016-07-21 19:04:58.364056','16','San Francisco, California 94122, United States',3,'',20,1),(13,'2016-07-21 19:04:58.365044','15','San Francisco, California 94122, United States',3,'',20,1),(14,'2016-07-21 19:04:58.366029','14','San Francisco, California 94122, United States',3,'',20,1),(15,'2016-07-21 19:04:58.367011','13','San Francisco, California 94122, United States',3,'',20,1),(16,'2016-07-21 19:04:58.370812','12','San Francisco, California 94122, United States',3,'',20,1),(17,'2016-07-21 19:04:58.371980','11','San Francisco, California 94122, United States',3,'',20,1),(18,'2016-07-21 19:04:58.373059','10','San Francisco, California 94122, United States',3,'',20,1),(19,'2016-07-21 19:04:58.374146','9','San Francisco, California 94110, United States',3,'',20,1),(20,'2016-07-21 19:04:58.375159','8','San Francisco, California 94122, United States',3,'',20,1),(21,'2016-07-21 19:04:58.376176','7','San Francisco, California 94122, United States',3,'',20,1),(22,'2016-07-21 19:04:58.377161','6','San Francisco, California 94110, United States',3,'',20,1),(23,'2016-07-21 19:04:58.378223','5','San Francisco, California 94110, United States',3,'',20,1),(24,'2016-07-21 19:04:58.379299','4','San Francisco, California 94110, United States',3,'',20,1),(25,'2016-07-21 19:04:58.380328','3','San Francisco, California 94122, United States',3,'',20,1),(26,'2016-07-21 19:04:58.381333','2','San Francisco, California 94122, United States',3,'',20,1),(27,'2016-07-21 19:04:58.382396','26','Thornton, Colorado 80241, United States',3,'',20,1),(28,'2016-07-21 19:04:58.383466','25','Thornton, Colorado 80241, United States',3,'',20,1),(29,'2016-07-21 19:04:58.384553','24','Thornton, Colorado 80241, United States',3,'',20,1),(30,'2016-07-21 19:04:58.385657','33','Detroit, Michigan 48238, United States',3,'',20,1),(31,'2016-07-22 19:18:42.582420','51','Evanston, IL, United States',3,'',21,1),(32,'2016-07-22 19:18:42.588804','22','San Francisco, CA 94110, United States',3,'',21,1),(33,'2016-07-22 19:18:42.589944','21','San Francisco, CA 94110, United States',3,'',21,1),(34,'2016-07-22 19:18:42.590979','8','London, United Kingdom',3,'',21,1),(35,'2016-07-22 19:18:42.592022','7','London, United Kingdom',3,'',21,1),(36,'2016-07-22 19:18:42.593061','44','Broomfield, Colorado 80020, Kenya',3,'',21,1),(37,'2016-07-22 19:18:42.594849','46','Fort Collins, Colorado 80521, Kenya',3,'',21,1),(38,'2016-07-22 19:18:42.595926','40','Thornton, Colorado 80241, Kenya',3,'',21,1),(39,'2016-07-22 19:18:42.596924','45','Westminster, Colorado 80030, Kenya',3,'',21,1),(40,'2016-07-22 19:18:42.597974','49','Detroit, Michigan 48238, Kenya',3,'',21,1),(41,'2016-07-22 19:18:42.599044','63','Bolinas, California 94924, United States',3,'',21,1),(42,'2016-07-22 19:18:42.600084','62','San Francisco, California 94112, United States',3,'',21,1),(43,'2016-07-22 19:18:42.601091','61','San Francisco, California 94122, United States',3,'',21,1),(44,'2016-07-22 19:18:42.602079','60','San Francisco, California 94117, United States',3,'',21,1),(45,'2016-07-22 19:41:08.698272','10','California, United States',3,'',19,1),(46,'2016-07-25 20:11:16.937008','14','Petition: EU Referendum Rules triggering a 2nd EU Referendum',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_7e2f2b34cfbcd61_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'address','address'),(18,'address','country'),(20,'address','locality'),(19,'address','state'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(4,'contenttypes','contenttype'),(7,'corsheaders','corsmodel'),(13,'customuser','customuser'),(16,'default','association'),(17,'default','code'),(15,'default','nonce'),(14,'default','usersocialauth'),(5,'sessions','session'),(11,'taggit','tag'),(12,'taggit','taggeditem'),(9,'topics','action'),(8,'topics','topic'),(10,'updown','vote');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'address','0001_initial','2016-07-13 23:57:11.178066'),(2,'contenttypes','0001_initial','2016-07-13 23:57:11.228217'),(3,'admin','0001_initial','2016-07-13 23:57:11.293207'),(4,'contenttypes','0002_remove_content_type_name','2016-07-13 23:57:11.363741'),(5,'auth','0001_initial','2016-07-13 23:57:11.533740'),(6,'auth','0002_alter_permission_name_max_length','2016-07-13 23:57:11.570604'),(7,'auth','0003_alter_user_email_max_length','2016-07-13 23:57:11.592209'),(8,'auth','0004_alter_user_username_opts','2016-07-13 23:57:11.609154'),(9,'auth','0005_alter_user_last_login_null','2016-07-13 23:57:11.624422'),(10,'auth','0006_require_contenttypes_0002','2016-07-13 23:57:11.627225'),(11,'authtoken','0001_initial','2016-07-13 23:57:11.682082'),(12,'default','0001_initial','2016-07-13 23:57:11.921335'),(13,'default','0002_add_related_name','2016-07-13 23:57:11.987672'),(14,'default','0003_alter_email_max_length','2016-07-13 23:57:12.018265'),(15,'sessions','0001_initial','2016-07-13 23:57:12.059303'),(16,'taggit','0001_initial','2016-07-13 23:57:12.203199'),(17,'taggit','0002_auto_20150616_2121','2016-07-13 23:57:12.240123');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2snf77aynxolzn1jkorwd3vql095r6fi','MjYzNGU3NDlmNmY5ZTQ4MzRkZTUyODJhMjA5MjBmZDZlZWY1ZmUzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjQwODUxZTRjZWQ2NWEyZTY4YjU5N2JlM2UyYzczZWVkNDRhNjFiIn0=','2016-08-01 02:21:04.305473'),('8dtqyxpefit4w9zb2dkny48yppwgtle9','Y2ExODcwM2Y0MmZkMGU4MDg5OGY3YjU0ZjVkMzg5MWIyNWM4YTI0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2I0MDg1MWU0Y2VkNjVhMmU2OGI1OTdiZTNlMmM3M2VlZDQ0YTYxYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-08-08 20:01:21.438682'),('g68fdl2p98mrvxpphle9tefef0h7tywv','MjYzNGU3NDlmNmY5ZTQ4MzRkZTUyODJhMjA5MjBmZDZlZWY1ZmUzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjQwODUxZTRjZWQ2NWEyZTY4YjU5N2JlM2UyYzczZWVkNDRhNjFiIn0=','2016-08-05 21:45:27.396638'),('ry3vtzpfbsv1cyaqgp228ksp2uvzfwjw','ZWE4MDg5Y2QxYWIyYWZmMjI2NmExZDQ2NmM1YTU3NzJlOTEzOWYxMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNiNDA4NTFlNGNlZDY1YTJlNjhiNTk3YmUzZTJjNzNlZWQ0NGE2MWIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-08-16 13:31:27.558941'),('um6vvixs851cwigncvgi6ng4dog1b939','MjYzNGU3NDlmNmY5ZTQ4MzRkZTUyODJhMjA5MjBmZDZlZWY1ZmUzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjQwODUxZTRjZWQ2NWEyZTY4YjU5N2JlM2UyYzczZWVkNDRhNjFiIn0=','2016-07-28 06:28:00.593320'),('ypmv4ow73rwhsb6uihhke226wyidu8yf','ZWY5M2ZjODU1YmFmMzg5MmZmOGNmOTlmMDRhY2EyNGU2MjI1NGYyZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImNiNDA4NTFlNGNlZDY1YTJlNjhiNTk3YmUzZTJjNzNlZWQ0NGE2MWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-11 23:35:40.432897');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_45d9fde4b17d543d_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_63d7dfa001e4ff03_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_1d59bc873578774d_uniq` (`provider`,`uid`),
  KEY `social_auth_user_id_2e4ccda17e525752_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `social_auth_user_id_2e4ccda17e525752_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'facebook','10102615181971353','{\"id\": \"10102615181971353\", \"expires\": null, \"access_token\": \"EAAVgPVtcZB7ABAJYZBHkmRG7t35KszikgU2pZAtfUGNpJlfcdRHI0kgIpqowXVbRgRPcxMJ99F0JnMHSmiIeP75h3IWPyPeasZB3DS9XbfYUZBjTzB3KnhCLW4JcHYHamsheh8dTDWm1KVdSZCN2LduCIfygS5FOsZD\"}',2),(3,'facebook','10201476415109883','{\"id\": \"10201476415109883\", \"expires\": null, \"access_token\": \"EAAVgPVtcZB7ABAAWQTlYCQ0T2jv7zaKS01zmGEzcxk558DZBFmB6QZBt9gv1vhOZCeZAuEFdZCPI66VxDVBwqEebxETAKRTdZBZA6s4sPVgqXuas7zRqbeI35Dve0SbeQkZBGiBNXDY6mgeBnZA2AUwJPWoNh0FDYfZC5AZD\"}',3),(4,'facebook','10104187279914383','{\"id\": \"10104187279914383\", \"expires\": null, \"access_token\": \"EAAVgPVtcZB7ABAMMiiatyIRE6Bq5NWk4wcQcQXCFzagPJ5ZCmp2l3gPzLbZArCbP5g5YgM73Y2UOuPab5a1ZCnG2PDcl1LKT5BZAAKRHVafEEpxZA4xygfQ030xwSIBzyVE5ZBB0nxfZC7lZBZA50Qev3SK6UFFkArHOoZD\"}',4);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'police brutality','police-brutality'),(2,'alton sterling','alton-sterling'),(3,'philando castile','philando-castile'),(4,'biking','biking'),(5,'idaho stop','idaho-stop'),(6,'bicycling','bicycling'),(7,'brexit','brexit'),(8,'rapist','rapist'),(9,'brock turner','brock-turner'),(10,'moveon.org','moveonorg'),(11,'petition','petition'),(12,'eviction','eviction'),(13,'bastille day','bastille-day'),(14,'nice','nice'),(15,'#blacklivesmatter','blacklivesmatter'),(16,'police shooting','police-shooting'),(17,'pence','pence'),(18,'rnc','rnc'),(19,'trump','trump'),(20,'mass shooting','mass-shooting'),(21,'vacaville fire','vacaville-fire'),(22,'dnc2016','dnc2016'),(23,'bernieorbust','bernieorbust'),(24,'facebook event','facebook-event'),(25,'hillaryforpresident','hillaryforpresident'),(26,'change.org','changeorg'),(27,'violence','violence'),(28,'denver','denver');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_tag_id_2c4fab0996e59c60_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_af31437c` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_50e9238c1c4fc41d_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggi_content_type_id_1699939e01a41d4a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_2c4fab0996e59c60_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,8,1),(2,1,8,2),(3,1,9,1),(4,1,9,2),(5,2,8,1),(6,2,8,3),(7,2,9,1),(8,3,8,4),(9,3,8,5),(10,3,9,5),(11,3,9,6),(12,4,8,7),(13,4,9,3),(14,5,8,8),(15,5,8,9),(16,5,9,9),(17,6,9,10),(18,6,9,11),(19,6,8,12),(20,7,8,13),(21,7,8,14),(22,8,8,15),(23,9,8,16),(24,10,8,17),(25,10,8,18),(26,10,8,19),(27,11,8,20),(28,12,8,21),(29,13,8,1),(31,15,8,7),(32,16,8,22),(33,16,8,23),(34,7,9,24),(35,7,9,25),(36,8,9,24),(37,17,8,23),(38,9,9,26),(39,9,9,11),(40,18,8,19),(41,19,8,27),(42,19,8,28);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics_action`
--

DROP TABLE IF EXISTS `topics_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `description` longtext NOT NULL,
  `article_link` longtext NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `scope` varchar(9) NOT NULL,
  `respond_react` varchar(7) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_action`
--

LOCK TABLES `topics_action` WRITE;
/*!40000 ALTER TABLE `topics_action` DISABLE KEYS */;
INSERT INTO `topics_action` VALUES (1,'Let’s Take Action: Meeting to Support #blacklivesmatter','Black lives matter. Let\'s stand up.\n\nPlease come to this emergency meeting, where we will discuss ways to take action on police brutality and support #blacklivesmatter.\nInvite your friends and spread the word!\n\nCommunity leader Edwin Lindo, members of Showing Up for Racial Justice (SURJ), and others will be present to facilitate the discussion, provide context, and highlight areas where we can help.\n(Note that this is not an official Black Lives Matter meeting, but a meeting for our community to support.)\n\nWe know we can’t fix everything in a day. We will discuss how to educate ourselves, use our resources to help the movement, and work for change. \nThis is our small first step in a much larger effort. We look forward to having you join us on this journey.\n\n7:15 Small-group discussion & sharing\n7:45 Overview of the movement from community leaders\n8:00 Create action items (facilitated discussion)\n8:30 Breakout sessions to plan action\n9:10 Groups report back & set next steps\n\nThank you to Gray Area Art + Technology for providing space for this discussion!','https://www.facebook.com/events/1721237601464688/',1,'2016-07-14 00:02:24.922200','2016-07-14 02:00:30.111000',NULL,1,'static/image_ZalnVVT.jpg','https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/13590390_10101089517425151_220703314080929381_n.jpg?oh=9b13b687b513ab922809a8fca4267aa8&oe=582C33C4','local',NULL,2,0,0),(2,'Let’s Take Action: Meeting to Support #blacklivesmatter','Black lives matter. Let\'s stand up.\n\nPlease come to this emergency meeting, where we will discuss ways to take action on police brutality and support #blacklivesmatter.\nInvite your friends and spread the word!\n\nCommunity leader Edwin Lindo, members of Showing Up for Racial Justice (SURJ), and others will be present to facilitate the discussion, provide context, and highlight areas where we can help.\n(Note that this is not an official Black Lives Matter meeting, but a meeting for our community to support.)\n\nWe know we can’t fix everything in a day. We will discuss how to educate ourselves, use our resources to help the movement, and work for change. \nThis is our small first step in a much larger effort. We look forward to having you join us on this journey.\n\n7:15 Small-group discussion & sharing\n7:45 Overview of the movement from community leaders\n8:00 Create action items (facilitated discussion)\n8:30 Breakout sessions to plan action\n9:10 Groups report back & set next steps\n\nThank you to Gray Area Art + Technology for providing space for this discussion!','https://www.facebook.com/events/1721237601464688/',1,'2016-07-14 00:06:17.358561','2016-07-14 02:00:00.000000',NULL,2,'static/image_UJr2iz0.jpg','https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/13590390_10101089517425151_220703314080929381_n.jpg?oh=9b13b687b513ab922809a8fca4267aa8&oe=582C33C4','national',NULL,4,1,0),(3,'Support Fulton Fire Survivors','Many of you have heard about the recent 3 alarm fire on Fulton Street which displaced 17 people on the evening of Saturday, February 13. The majority of these long-time NOPA residents lost most, if not all, of their personal belongings in the fire.\n\nJoin NOPNA to support the survivors of this tragic fire by coming to this community fundraiser, graciously hosted by The Independent. There will also be representatives from city and local organizations in attendance to offer resources to fire victims and provide information to community members.\n\nNOTE: The event only last two hours, so be sure to stop by as early as you can.','https://www.facebook.com/events/986440581410101/',1,'2016-07-14 00:12:10.218113',NULL,NULL,3,'static/image_kIjjFqX.jpg','https://scontent.xx.fbcdn.net/v/t1.0-0/p180x540/12795522_547009312135746_34566440842515573_n.png?oh=09f7725a757d8a3914e9004ba32a509b&oe=582D0A22','local',NULL,6,0,0),(4,'Sign the petition: Justice for Philando Castile','I just signed a petition to The Minnesota State House, The Minnesota State Senate, and Governor Mark Dayton: This petition is to hold the police officer accountable for the murder of Philando Castile in Falcon Heights, MN. Stop giving officers paid administrative leave and not charging them with the crimes they commit in the community!','http://petitions.moveon.org/sign/justice-for-philando?source=homepage',2,'2016-07-14 06:29:54.878858',NULL,NULL,2,'static/image_lKtcoJB.jpg','http://petitions.moveon.org/images/AddYourName_10.gif','national',NULL,10,0,0),(5,'California State House: Recall Judge Aaron Persky','We the people would like to petition that Judge Aaron Persky be removed from his Judicial position for the lenient sentence he allowed in the Brock Turner rape case. Despite a unanimous guilty verdict, three felony convictions, the objections of 250 Stanford students, Jeff Rosen the district attorney...','https://www.change.org/p/california-state-house-recall-judge-aaron-persky?source_location=discover_feed',2,'2016-07-14 06:31:21.209521',NULL,NULL,5,'static/image_T4mriUm.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/3/me/hm/MLmEHMcWNsHMpKd-1600x900-noPad.jpg?1465593346','local',NULL,12,1,0),(6,'Sign the petition: Demand an end to rape culture. Remove Judge Aaron Persky now.','Judge Aaron Persky\'s failure to hold Brock Turner accountable for raping an unconscious woman and his dismissive comments at sentencing show that he cannot be trusted to dispense justice. He must be removed from the bench immediately.','http://petitions.moveon.org/sign/demand-an-end-to-rape?source=homepage',2,'2016-07-14 06:38:22.130504',NULL,NULL,5,'static/image_rVp9GqS.jpg','https://s3.amazonaws.com/s3.moveon.org/images/Persky_1200x630.png','local',NULL,13,0,1),(7,'Hillary Clinton Speech Watch Party','Join us on this Thursday, July 28th, to watch Hillary Clinton formally accept her presidential nomination and make history! We\'ll be watching her speech at the home of Dawn Burgess-Krop starting at 6:00. Please bring food and drinks!','https://www.facebook.com/events/156856654720355/',2,'2016-07-25 21:45:35.385472',NULL,NULL,16,'static/image_z376jnI.jpg','https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/13754146_1775811469323329_4037512506975372677_n.jpg?oh=6fd9c6388dae136eafa50c94ffe7531b&oe=58377820','national',NULL,73,0,0),(8,'#blacklivesmatter Yoga Benefit Class','The word \"yoga\" means to bring together. This class is intended to bring together a group of like-minded healers in an effort to raise the collective consciousness that Black Lives Matter. \n\nSign up for the class at https://clients.mindbodyonline.com/classic/home?studioid=1692\n\nIf for some reason you\'re unable to make it after signing up, be sure to remove yourself from the class so others can join. \n\nWe\'ll be taking cash donations at the door or you can make them in advance. \n\nSuggested donation is $20. Donations can be made to Black Lives Matter Sacramento at:\nhttps://inciteinsight.nationbuilder.com/donate','https://www.facebook.com/events/1622080684771808/',2,'2016-07-26 00:55:36.447975',NULL,NULL,2,'static/image_8beYyyw.jpg','https://scontent.xx.fbcdn.net/v/t1.0-9/13669800_10210019471866370_7622201563891609168_n.jpg?oh=7929a4df3af0ddd6579e64edd3cb715f&oe=58213FFE','local',NULL,74,0,1),(9,'Bernie Sanders: Break the corporate duopoly: Run for president in 2016 with nominations from the Green Party, the Vermont Progressive Party, and perhaps another left-wing alternative party','To continue the \"political revolution\" Bernie Sanders calls for, he should support the Green Party and its likely candidate for president, Jill Stein, if he loses the Democratic primary. He must reject the so-called \"lesser-evil\" of neoliberal Hillary Clinton and help us build an alternative political...','https://www.change.org/p/bernie-sanders-break-the-corporate-duopoly-run-for-president-in-2016-with-nominations-from-the-green-party-the-vermont-progressive-party-and-perhaps-another-left-wing-alternative-party?source_location=search_index&algorithm=promoted&grid_position=1',2,'2016-07-27 06:19:25.927930',NULL,NULL,17,'static/image_b2Nukkb.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/2/id/oj/jjiDoJXenLFPAlq-1600x900-noPad.jpg?1423796323','national',NULL,72,1,0);
/*!40000 ALTER TABLE `topics_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics_topic`
--

DROP TABLE IF EXISTS `topics_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `article_link` longtext NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `scope` varchar(9) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_created_by_id_42c31101217c8a13_fk_customuser_customuser_id` (`created_by_id`),
  CONSTRAINT `topic_created_by_id_42c31101217c8a13_fk_customuser_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_topic`
--

LOCK TABLES `topics_topic` WRITE;
/*!40000 ALTER TABLE `topics_topic` DISABLE KEYS */;
INSERT INTO `topics_topic` VALUES (1,'Alton Sterling shooting: Homeless man made 911 call, source says','http://www.cnn.com/2016/07/07/us/baton-rouge-alton-sterling-shooting/index.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+rss%2Fedition_us+(RSS%3A+CNNi+-+U.S.)',1,'2016-07-14 00:01:05.446654','static/image_XxEbfib.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160706030340-officers-on-leave-after-fatal-shooting-wafb-dnt-00001917-large-tease.jpg','national',1,2,0),(2,'Philando Castile shooting: What happened when filming stopped?','http://www.cnn.com/2016/07/13/us/police-shootings-investigations/',1,'2016-07-14 00:03:29.730678','static/image_tY5WNLr.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160708180432-philando-castile-shooting-facebook-live-large-tease.jpg','national',3,2,0),(3,'Mayor Promises Veto of SF\'s Idaho Bicycle Stop Law, Putting its Future in Flux','http://uptownalmanac.com/2015/09/idaho-stop-legislation-dead-arrival-mayor-promises-veto',1,'2016-07-14 00:10:33.668550','static/image_EnyvfAA.jpg','http://uptownalmanac.com/sites/default/files/images-on-cdn/wiggle_0.jpg','local',5,0,2),(4,'Theresa May appeals to centre ground but cabinet tilts to the right','http://www.theguardian.com/politics/2016/jul/13/theresa-may-becomes-britains-prime-minister',2,'2016-07-14 00:34:47.483185','static/image_mZQeoLU.jpg','https://i.guim.co.uk/img/media/cdb8a4443381ece9e87e77de3189df783e4f4c89/0_224_3500_2100/3500.jpg?w=1200&h=630&q=55&auto=format&usm=12&fit=crop&bm=normal&ba=bottom%2Cleft&blend64=aHR0cHM6Ly91cGxvYWRzLmd1aW0uY28udWsvMjAxNi8wNS8yNS9vdmVybGF5LWxvZ28tMTIwMC05MF9vcHQucG5n&s=4c478d8c0ccb96f339ddfb6400fcb6cf','worldwide',9,1,0),(5,'Here Is the Mugshot of a Man Who Sexually Assaulted an Unconscious Woman','http://gawker.com/here-is-the-mugshot-of-a-man-who-sexually-assaulted-an-1780882046',2,'2016-07-14 06:30:56.965197','static/image_6aKHrpC.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--wDmpgtxi--/c_fill,fl_progressive,g_center,h_450,q_80,w_800/oy5xtvzusrkuokllfnfp.png','local',11,1,0),(6,'Tenants in San Francisco’s Mission, Sunset neighborhoods get most eviction notices','http://www.sfgate.com/news/article/Tenants-in-San-Francisco-s-Mission-Sunset-8352957.php',2,'2016-07-14 06:56:07.590624','static/image_Fexx9np.jpg','http://ww4.hdnux.com/photos/31/07/72/6586043/3/rawImage.jpg','local',14,0,0),(7,'Reports: At Least 73 Dead After Attacker Crashes Truck Through Parade in Nice, France [UPDATED]','http://gawker.com/reports-dozens-dead-after-attacker-crashes-truck-throu-1783698480',1,'2016-07-15 00:53:51.697251','static/image_IbQRUTy.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--nChJVL-b--/c_fill,fl_progressive,g_center,h_450,q_80,w_800/gl1vbsb06bpvnw4euqhe.jpg','national',15,0,0),(8,'Quantifying Black Lives Matter','http://www.economist.com/news/united-states/21702219-are-black-americans-more-likely-be-shot-or-roughed-up-police-quantifying-black-lives?fsrc=scn/fb/te/pe/ed/quantifyingblacklivesmatter',1,'2016-07-17 17:02:40.827576','static/image_f7sW8RK.jpg','http://cdn.static-economist.com/sites/default/files/cf_images/images-magazine/2016/07/16/US/20160716_USP003_facebook.jpg','national',16,0,0),(9,'Multiple police officers are dead in Baton Rouge: What we know so far','http://qz.com/734469/multiple-police-officers-are-dead-in-baton-rouge-what-we-know-so-far/',1,'2016-07-17 21:00:34.295566','static/image_ort9Kau.jpg','https://qzprod.files.wordpress.com/2016/07/rtsieg3-e1468773393677.jpg?quality=80&strip=all&w=1600','national',17,0,0),(10,'All the Most Excruciating Moments From the Trump/Pence Nightmare 60 Minutes Interview','http://gawker.com/all-the-most-excruciating-moments-from-the-trump-pence-1783831489',1,'2016-07-18 23:21:28.187476','static/image_9zWP5L7.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--7pT_7gN2--/c_fill,fl_progressive,g_center,h_358,q_80,w_636/podluwplvja2gemvkmut.jpg','national',18,0,0),(11,'Munich shooting: Police operation underway, at least 6 dead','http://www.cnn.com/2016/07/22/europe/germany-munich-shooting/index.html',2,'2016-07-22 20:18:39.474885','static/image_cXcoL25.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160722124651-01-munich-shooting-large-tease.jpeg','national',65,0,0),(12,'Vacaville brush fire prompts mandatory evacuations','http://www.sfgate.com/bayarea/article/Vacaville-brush-fire-prompts-mandatory-evacuations-8403836.php',2,'2016-07-22 21:53:51.218077','static/image_SRCE04Q.jpg','http://ww3.hdnux.com/photos/50/43/33/10630862/3/rawImage.jpg','local',66,0,0),(13,'Black Elementary School Teacher Body-Slammed By Cop and Lectured on \"Violent Tendencies\" of Black People','http://gawker.com/black-elementary-school-teacher-body-slammed-by-cops-an-1784155467',2,'2016-07-22 22:58:44.113654','static/image_VcWvpsC.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--I6B2eOBh--/c_fill,fl_progressive,g_center,h_450,q_80,w_800/qftwe1oyyuruwwe3ncc3.png','national',68,0,0),(15,'The battle for Downing Street','http://www.economist.com/news/britain/21701786-theresa-may-now-seems-most-likely-person-lead-tories-and-country-she-will',2,'2016-07-25 20:01:00.774469','static/image_OFAhFs8.jpg','http://cdn.static-economist.com/sites/default/files/cf_images/images-magazine/2016/07/09/BR/20160709_BRP007_facebook.jpg','national',70,0,0),(16,'Bernie Sanders aims to cool tensions in Philadelphia','http://www.cnn.com/2016/07/25/politics/bernie-sanders-democratic-national-convention-speech/index.html',2,'2016-07-25 21:41:39.671417','static/image_DwIHKJQ.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160725132408-bernie-sanders-large-tease.jpg','national',72,0,0),(17,'Hey! A Message to Bernie or Bust Die-Hards','https://www.youtube.com/watch?v=HvV2JY8kbgI',1,'2016-07-27 06:15:32.079102','static/image_hZw1ehE.jpg','https://i.ytimg.com/vi/HvV2JY8kbgI/maxresdefault.jpg','national',76,0,1),(18,'Donald Trump\'s bad 72 hours','http://www.cnn.com/2016/08/01/politics/donald-trump-khizr-khan-ukraine/index.html',3,'2016-08-01 22:13:41.484161','static/image_Y7m8bLF.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160801145835-donald-trump-july-29-2016-large-tease.jpg','national',77,0,1),(19,'String of deadly domestic violence incidents in Colorado','http://www.9news.com/news/investigations/string-of-deadly-domestic-violence-incidents-in-colorado/285574355',3,'2016-08-02 00:45:15.275118','static/image_qm9hnfJ.jpg','http://content.9news.com/photo/2016/08/01/Still0801_00000_1470090609708_4433917_ver1.0_640_360.jpg','local',79,0,0);
/*!40000 ALTER TABLE `topics_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updown_vote`
--

DROP TABLE IF EXISTS `updown_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updown_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `key` varchar(32) NOT NULL,
  `score` smallint(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` char(15) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`object_id`,`key`,`user_id`,`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updown_vote`
--

LOCK TABLES `updown_vote` WRITE;
/*!40000 ALTER TABLE `updown_vote` DISABLE KEYS */;
INSERT INTO `updown_vote` VALUES (1,8,1,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-07-14 00:13:04.335055','2016-07-14 00:13:04.335104'),(2,8,2,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-07-14 00:13:05.001345','2016-07-14 00:13:05.001374'),(3,8,3,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-07-14 00:13:07.010883','2016-07-14 00:13:07.010914'),(4,8,2,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 00:13:21.732747','2016-07-21 18:51:45.671655'),(5,8,1,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 00:13:23.770156','2016-07-14 00:13:23.770190'),(6,8,3,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-07-14 00:13:24.632555','2016-07-17 22:45:26.571157'),(7,9,2,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 00:22:37.187854','2016-07-14 00:22:37.187885'),(8,8,4,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 00:38:55.656368','2016-07-14 00:38:55.656417'),(9,9,5,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 06:31:30.240850','2016-07-14 06:31:30.240884'),(10,8,5,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-14 06:32:05.620071','2016-07-14 06:32:05.620105'),(11,9,6,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-07-14 06:38:41.062368','2016-07-14 06:38:41.062397'),(12,9,8,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-07-26 00:55:43.262191','2016-07-26 00:55:43.262246'),(13,8,17,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-07-27 06:31:09.857065','2016-07-27 06:31:09.857107'),(14,9,9,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-07-27 07:42:15.083196','2016-07-27 07:42:15.083235'),(15,8,18,'2c5504ab9a86164db22a92dc8793843d',-1,3,'127.0.0.1','2016-08-01 22:13:53.259092','2016-08-01 22:13:53.259134');
/*!40000 ALTER TABLE `updown_vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-02  6:33:40
