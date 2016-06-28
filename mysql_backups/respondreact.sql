-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: respondreact
-- ------------------------------------------------------
-- Server version	5.7.9

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
  `locality_id` int(11),
  PRIMARY KEY (`id`),
  KEY `address_address_7e3ea948` (`locality_id`),
  CONSTRAINT `address_addr_locality_id_1ee77782aa875625_fk_address_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `address_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_address`
--

LOCK TABLES `address_address` WRITE;
/*!40000 ALTER TABLE `address_address` DISABLE KEYS */;
INSERT INTO `address_address` VALUES (1,'','','1234','1234',NULL,NULL,NULL),(2,'1322 20th ave','','','',NULL,NULL,NULL),(12,'','','1010 Ashbury St, San Francisco, CA 94117, US','',37.763868,-122.4461222,NULL),(13,'','','3849 E 135th way, Thornton, CO, 80241, US','',39.942608,-104.943849,NULL),(14,'','','2993-C W 81st Ave, Westminster, CO 80030, US','',39.8437523,-105.0240087,NULL),(15,'','','Portland, Oregon','',45.5230622,-122.6764816,NULL),(16,'','','Balboa Hollow, San Francisco, CA 94118, USA','',37.7771598,-122.4650762,NULL),(17,'','','North of the Panhandle, San Francisco, CA, USA','',37.7757272,-122.4424773,NULL),(18,'','','Stanford, CA, USA','',37.424106,-122.1660756,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
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
  UNIQUE KEY `address_locality_name_294493a5b63f9602_uniq` (`name`,`state_id`),
  KEY `address_locality_d5582625` (`state_id`),
  CONSTRAINT `address_locality_state_id_352a6316eb84cebc_fk_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `address_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_locality`
--

LOCK TABLES `address_locality` WRITE;
/*!40000 ALTER TABLE `address_locality` DISABLE KEYS */;
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
  UNIQUE KEY `address_state_name_3ad74107e2aada7c_uniq` (`name`,`country_id`),
  KEY `address_state_country_id_5f80ca93b47077f7_fk_address_country_id` (`country_id`),
  CONSTRAINT `address_state_country_id_5f80ca93b47077f7_fk_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_state`
--

LOCK TABLES `address_state` WRITE;
/*!40000 ALTER TABLE `address_state` DISABLE KEYS */;
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
  KEY `auth_group__permission_id_34fd77c1091b9a21_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_34fd77c1091b9a21_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_1d9630cdf5503c74_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `auth_pe_content_type_id_c61ab2c1148250_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add token',6,'add_token'),(17,'Can change token',6,'change_token'),(18,'Can delete token',6,'delete_token'),(19,'Can add cors model',7,'add_corsmodel'),(20,'Can change cors model',7,'change_corsmodel'),(21,'Can delete cors model',7,'delete_corsmodel'),(22,'Can add topic',8,'add_topic'),(23,'Can change topic',8,'change_topic'),(24,'Can delete topic',8,'delete_topic'),(25,'Can add action',9,'add_action'),(26,'Can change action',9,'change_action'),(27,'Can delete action',9,'delete_action'),(28,'Can add vote',10,'add_vote'),(29,'Can change vote',10,'change_vote'),(30,'Can delete vote',10,'delete_vote'),(31,'Can add Tag',11,'add_tag'),(32,'Can change Tag',11,'change_tag'),(33,'Can delete Tag',11,'delete_tag'),(34,'Can add Tagged Item',12,'add_taggeditem'),(35,'Can change Tagged Item',12,'change_taggeditem'),(36,'Can delete Tagged Item',12,'delete_taggeditem'),(37,'Can add user',13,'add_customuser'),(38,'Can change user',13,'change_customuser'),(39,'Can delete user',13,'delete_customuser'),(40,'Can add user social auth',14,'add_usersocialauth'),(41,'Can change user social auth',14,'change_usersocialauth'),(42,'Can delete user social auth',14,'delete_usersocialauth'),(43,'Can add nonce',15,'add_nonce'),(44,'Can change nonce',15,'change_nonce'),(45,'Can delete nonce',15,'delete_nonce'),(46,'Can add association',16,'add_association'),(47,'Can change association',16,'change_association'),(48,'Can delete association',16,'delete_association'),(49,'Can add code',17,'add_code'),(50,'Can change code',17,'change_code'),(51,'Can delete code',17,'delete_code'),(52,'Can add application',18,'add_application'),(53,'Can change application',18,'change_application'),(54,'Can delete application',18,'delete_application'),(55,'Can add grant',19,'add_grant'),(56,'Can change grant',19,'change_grant'),(57,'Can delete grant',19,'delete_grant'),(58,'Can add access token',20,'add_accesstoken'),(59,'Can change access token',20,'change_accesstoken'),(60,'Can delete access token',20,'delete_accesstoken'),(61,'Can add refresh token',21,'add_refreshtoken'),(62,'Can change refresh token',21,'change_refreshtoken'),(63,'Can delete refresh token',21,'delete_refreshtoken'),(64,'Can add country',22,'add_country'),(65,'Can change country',22,'change_country'),(66,'Can delete country',22,'delete_country'),(67,'Can add state',23,'add_state'),(68,'Can change state',23,'change_state'),(69,'Can delete state',23,'delete_state'),(70,'Can add locality',24,'add_locality'),(71,'Can change locality',24,'change_locality'),(72,'Can delete locality',24,'delete_locality'),(73,'Can add address',25,'add_address'),(74,'Can change address',25,'change_address'),(75,'Can delete address',25,'delete_address');
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
  CONSTRAINT `authtoken_t_user_id_3fa3e68543bc893c_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
INSERT INTO `customuser_customuser` VALUES (1,'pbkdf2_sha256$20000$lSSiPWRBcnai$T6wlJGggePOhVulm7Qy6clvtc0MuWDW2H60nZJwF8Jw=','2016-05-25 23:42:35.968683',1,'admin','Chris','Johnson','admin@test.com',1,1,'2016-05-12 00:48:39.000000','http://graph.facebook.com/10201476415109883/picture?type=normal',1),(4,'!YA58PZJ70365VH1KOXIOlEpqrnRzcDvWF9pTuJ8T',NULL,0,'KevinCook','Kevin','Cook','kevinac4@gmail.com',0,1,'2016-05-19 15:25:35.499699','http://graph.facebook.com/10102615181971353/picture?type=normal',NULL);
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
  KEY `django_content_type_id_d9a7526dafaa17c_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admi_user_id_206d165a65977d6d_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `django_admi_user_id_206d165a65977d6d_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`),
  CONSTRAINT `django_content_type_id_d9a7526dafaa17c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-19 15:24:48.800889','3','KevinCookf4c1e2bb78424a89',3,'',13,1),(2,'2016-05-19 15:24:48.802298','2','KevinCook',3,'',13,1),(3,'2016-05-19 15:25:08.017349','1','admin',2,'Changed first_name, last_name and address.',13,1),(4,'2016-05-25 18:35:53.374791','11','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(5,'2016-05-25 18:35:53.376805','10','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(6,'2016-05-25 18:35:53.378201','9','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(7,'2016-05-25 18:35:53.380339','8','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(8,'2016-05-25 18:35:53.381457','7','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(9,'2016-05-25 18:35:53.382519','6','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(10,'2016-05-25 18:35:53.383465','5','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(11,'2016-05-25 18:35:53.384372','4','1324 20th ave, San Francisco, CA, 94122, US',3,'',25,1),(12,'2016-05-25 18:35:53.385415','3','1322 20th ave, San Francisco, CA, 94122, US',3,'',25,1);
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
  UNIQUE KEY `django_content_type_app_label_45720246905e408c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (25,'address','address'),(22,'address','country'),(24,'address','locality'),(23,'address','state'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(4,'contenttypes','contenttype'),(7,'corsheaders','corsmodel'),(13,'customuser','customuser'),(16,'default','association'),(17,'default','code'),(15,'default','nonce'),(14,'default','usersocialauth'),(20,'oauth2_provider','accesstoken'),(18,'oauth2_provider','application'),(19,'oauth2_provider','grant'),(21,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(11,'taggit','tag'),(12,'taggit','taggeditem'),(9,'topics','action'),(8,'topics','topic'),(10,'updown','vote');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'address','0001_initial','2016-05-12 00:48:04.457624'),(2,'contenttypes','0001_initial','2016-05-12 00:48:04.480405'),(3,'admin','0001_initial','2016-05-12 00:48:04.521550'),(4,'contenttypes','0002_remove_content_type_name','2016-05-12 00:48:04.562430'),(5,'auth','0001_initial','2016-05-12 00:48:04.645964'),(6,'auth','0002_alter_permission_name_max_length','2016-05-12 00:48:04.662626'),(7,'auth','0003_alter_user_email_max_length','2016-05-12 00:48:04.674859'),(8,'auth','0004_alter_user_username_opts','2016-05-12 00:48:04.686469'),(9,'auth','0005_alter_user_last_login_null','2016-05-12 00:48:04.702236'),(10,'auth','0006_require_contenttypes_0002','2016-05-12 00:48:04.704334'),(11,'authtoken','0001_initial','2016-05-12 00:48:04.735334'),(12,'default','0001_initial','2016-05-12 00:48:04.845738'),(13,'default','0002_add_related_name','2016-05-12 00:48:04.878875'),(14,'default','0003_alter_email_max_length','2016-05-12 00:48:04.892872'),(15,'oauth2_provider','0001_initial','2016-05-12 00:48:05.110443'),(16,'oauth2_provider','0002_08_updates','2016-05-12 00:48:05.230511'),(17,'sessions','0001_initial','2016-05-12 00:48:05.253699'),(18,'taggit','0001_initial','2016-05-12 00:48:05.327421'),(19,'taggit','0002_auto_20150616_2121','2016-05-12 00:48:05.356518');
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
INSERT INTO `django_session` VALUES ('c4n6dpkn68bcaln15kxnekfjuo7ilwra','MDRkZWEyYTUzYjljMWI3MDM5NTFhYjEwZmZiZjJjMTQwMDRkMjc0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-06-02 15:24:10.341620'),('c73esizrtqk2zzw927i94zr0hqy0pmvz','ZTZlZDIwNjIwMTA1MDZhNTg2ZDFiNTNjNTg2MzZmYWMxMDE5ZTcxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTA2NjE0ZDFlNTRjNTRkNTYyZDlhZDYxYzUyMDBhZjgwOWRjNjIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-05-26 00:48:51.256734'),('hflrqu1cw1lx4vrtr4jo3r57kwp1drcp','MDRkZWEyYTUzYjljMWI3MDM5NTFhYjEwZmZiZjJjMTQwMDRkMjc0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-06-08 23:42:35.970617'),('ph8v857s4ft1p54ebwpwncprbjv8pmgq','NmM1NTNmOTk1YjhjMDk5OWIzZjQ2ZDkxM2Q3ZjY5NWZmYzQyYWE1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MDY2MTRkMWU1NGM1NGQ1NjJkOWFkNjFjNTIwMGFmODA5ZGM2MjI5In0=','2016-06-08 18:02:29.108234'),('zfqxqz3eyv38q4hw5mnauuwrmdp85kfz','ODJiYWMyNTdmOTE0ZmJlNWZmMDQ3OWJjNTQ3Y2MyZTdmMWMwNzRhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-27 16:10:57.423673');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `D941ed379ce19235dccc07804090d717` (`application_id`),
  KEY `oauth2_provider_accesstoken_94a08da1` (`token`),
  KEY `oauth2_prov_user_id_45fc42f6c51ec93e_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `D941ed379ce19235dccc07804090d717` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_prov_user_id_45fc42f6c51ec93e_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_9d667c2b` (`client_secret`),
  KEY `oauth2_prov_user_id_496844b52eb11b92_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `oauth2_prov_user_id_496844b52eb11b92_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D696ae96faf869f7d833cf8920ca7f80` (`application_id`),
  KEY `oauth2_prov_user_id_6668b23b7fe5d865_fk_customuser_customuser_id` (`user_id`),
  KEY `oauth2_provider_grant_c1336794` (`code`),
  CONSTRAINT `D696ae96faf869f7d833cf8920ca7f80` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_prov_user_id_6668b23b7fe5d865_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `D8cd34b25c1ffe7ea1c23931cb8a458a` (`application_id`),
  KEY `oauth2_prov_user_id_551a0401df7c0580_fk_customuser_customuser_id` (`user_id`),
  KEY `oauth2_provider_refreshtoken_94a08da1` (`token`),
  CONSTRAINT `D8cd34b25c1ffe7ea1c23931cb8a458a` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `c9001a2b62dd3354a4c418fac7c35c79` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_prov_user_id_551a0401df7c0580_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
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
  UNIQUE KEY `social_auth_code_email_251da2c7e6e28bff_uniq` (`email`,`code`),
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
  UNIQUE KEY `social_auth_nonce_server_url_51daf308ad3e9f2b_uniq` (`server_url`,`timestamp`,`salt`)
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
  UNIQUE KEY `social_auth_usersocialauth_provider_366453172618d498_uniq` (`provider`,`uid`),
  KEY `social_auth_user_id_1bb143a0efb29df5_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `social_auth_user_id_1bb143a0efb29df5_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (6,'facebook','10201476415109883','{\"access_token\": \"EAAVgPVtcZB7ABAJnAlIU8VZCZCrbgYGZAHBkqL8BJiVf14iLpZBcL9AFYkkzMVMh0eQK1GaWjp8z6A3JO1uNRb2aqBstpbr369AM31VOssjc5N2Pc0yZBRR61jCZBzegzNT5LjOAJcH1Uw9QuVAJpU6pT3dcTZCTzwwZD\", \"id\": \"10201476415109883\", \"expires\": null}',1),(8,'facebook','10102615181971353','{\"access_token\": \"EAAVgPVtcZB7ABAJ8xZCZCfpc7iQAlEpYYM86hqltRloZA4HZAWW8sSDteD1sSbQDguaEmylqVWrDAAYVaMHGSGcM3H8YsQ4uRmxQWMwMzR015wqzkstxdWqSn0f57nvor7S9wJM1CGUqtwIkDdBZC4887yboBjHLMZD\", \"id\": \"10102615181971353\", \"expires\": null}',4);
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
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'hatred','hatred'),(2,'cruz','cruz'),(3,'george-zimmerman','george-zimmerman'),(4,'trayvon-martin','trayvon-martin'),(5,'trump','trump'),(6,'undefined','undefined'),(7,'election2016','election2016'),(8,'election','election'),(9,'punch','punch'),(10,'sports','sports'),(11,'bautista','bautista'),(12,'odor','odor'),(13,'skating','skating'),(14,'stupid','stupid'),(15,'nypd','nypd'),(16,'mexico','mexico'),(17,'Change.org','changeorg'),(18,'Petition','petition'),(19,'Facebook Event','facebook-event'),(20,'Ichiro','ichiro'),(21,'bernie','bernie'),(22,'dogs','dogs');
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
  KEY `taggit_taggeditem_tag_id_4d517fafdaa55e9d_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_af31437c` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_69735aa66b13e33e_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggi_content_type_id_528dc67fde647a0e_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_4d517fafdaa55e9d_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,8,1),(2,1,8,2),(3,2,8,3),(4,2,8,4),(5,3,8,5),(6,1,9,2),(7,1,9,5),(8,2,9,6),(9,3,9,2),(10,3,9,7),(11,4,9,8),(12,4,9,2),(13,4,9,5),(14,5,9,8),(15,5,9,2),(16,5,9,5),(17,4,8,8),(18,4,8,5),(19,5,8,9),(20,5,8,10),(21,5,8,11),(22,6,9,9),(23,6,9,12),(24,6,8,13),(25,7,8,14),(26,7,8,15),(27,8,8,16),(28,8,8,5),(29,7,9,17),(30,7,9,18),(31,8,9,19),(32,9,9,20),(33,10,9,21),(34,11,9,22),(35,13,9,6),(36,14,9,19),(37,15,9,17),(38,15,9,18);
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
  `topic_id` int(11) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `image_url` varchar(200) NOT NULL,
  `scope` varchar(9) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_action`
--

LOCK TABLES `topics_action` WRITE;
/*!40000 ALTER TABLE `topics_action` DISABLE KEYS */;
INSERT INTO `topics_action` VALUES (1,'Ted Cruz Threatens Return in First Campaign Ad of 2020','The blob monster defeated, the scene fades to black as a title card reading, “THE END,” fills the screen. Seconds later, a faint gurgling begins, soon joined an ominous coda: “OR IS IT??”','http://gawker.com/ted-cruz-threatens-return-in-first-campaign-ad-of-2020-1776803138',1,'2016-05-16 15:10:01.832099',3,'static/image_YmRtEX6.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--qOq35kGx--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/wtcy2safkcblnpisdavf.jpg','national',NULL,0,0),(2,'Ted Cruz Threatens Return in First Campaign Ad of 2020','The blob monster defeated, the scene fades to black as a title card reading, “THE END,” fills the screen. Seconds later, a faint gurgling begins, soon joined an ominous coda: “OR IS IT??”','http://gawker.com/ted-cruz-threatens-return-in-first-campaign-ad-of-2020-1776803138',1,'2016-05-16 16:43:30.166446',3,'static/image_NaUSZMi.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--qOq35kGx--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/wtcy2safkcblnpisdavf.jpg','national',NULL,0,0),(3,'Ted Cruz Files Papers For Continued Public Humiliation','Ted Cruz, bless his heart, has been out of the public eye for more than a week now. But it’s just a temporary reprieve: He’ll be back out brutally owning himself on the campaign trail soon.','http://gawker.com/ted-cruz-files-papers-for-continued-public-humiliation-1776114634',1,'2016-05-16 18:00:23.649143',3,'static/image_tWAdqd2.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--H-jyd_nq--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/vzoejcprfwk0bkof8xjv.jpg','national',NULL,0,0),(4,'The Meeting Between Paul Ryan and Donald Trump Was Great, Why Do You Ask?','Donald Trump and Paul Ryan met today in Washington D.C. and things went well—the meeting was great, and they both walked away feeling good about things. Why, did someone say differently?','http://gawker.com/the-meeting-between-paul-ryan-and-donald-trump-was-grea-1776261335',1,'2016-05-16 18:22:35.892606',3,'static/image_Exeeopk.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--rUFSYk1U--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/zal8dzb8sazkqc4bdcq8.jpg','national',NULL,0,0),(5,'The Meeting Between Paul Ryan and Donald Trump Was Great, Why Do You Ask?','Donald Trump and Paul Ryan met today in Washington D.C. and things went well—the meeting was great, and they both walked away feeling good about things. Why, did someone say differently?','http://gawker.com/the-meeting-between-paul-ryan-and-donald-trump-was-grea-1776261335',1,'2016-05-16 18:30:52.283286',3,'static/image_lfqf8u5.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--rUFSYk1U--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/zal8dzb8sazkqc4bdcq8.jpg','national',NULL,0,0),(6,'Rougned Odor’s Punch Was Not A Sucker Punch','Time for your weekly edition of the Deadspin Funbag. Got something on your mind? Email the Funbag. Today, we’re covering trash cans, baked potatoes, cocktail sauce, friendship, and more.','http://adequateman.deadspin.com/rougned-odor-s-punch-was-not-a-sucker-punch-1777048382',1,'2016-05-17 19:35:44.581962',5,'static/image_4Axoq8F.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--i1rfeBD3--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/ug1pvr5bk5klumi6p0aj.gif','local',NULL,0,0),(7,'Stand Against Donald Trump','Donald Trump said that abortion should be illegal -- and if a woman gets one, “there has to be some form of punishment.” \n You read that right: DONALD TRUMP WANTS TO PUNISH WOMEN FOR MAKING OUR OWN HEALTH CARE DECISIONS. \n He made sure to point out that the only way abortion will be outlawed in America...','https://www.change.org/p/stand-against-donald-trump',1,'2016-05-22 01:36:46.285251',8,'static/image_DgHQ8xM.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/6/nl/yv/XbNlYVTNCmCZuvq-1600x900-noPad.jpg?1459464160','national',NULL,1,0),(8,'Vote Early For Bernie! #SuppressThis','VOTE EARLY TO PROTECT YOUR VOTE!\nSTARTS MONDAY MAY 9TH!\nYou don\'t have to wait until June 7th.\nAvoid lines and other problems at the polls.\n\nStarting May 9th, you may vote early either by mailing in your Democratic ballot or by going in person to your county\'s designated early voting offices.\n\n3 STEPS TO HELP BERNIE WIN:\n1) NOW: RSVP \"Going\" to this event.\n2) TODAY: INVITE & SHARE this event in Bernie Groups, Pages, and to your Bernie Friends.\n3) ASAP: VOTE EARLY either by mail or in-person.\n\nYou can VERIFY YOUR MAIL-IN VOTE was received:\nhttp://www.sos.ca.gov/elections/ballot-status/\n\nMORE INFO BY COUNTY:\nhttp://VoteEarly.BernieSandersVideo.com\n\nSCROLL DOWN TO LEARN\nWHERE TO VOTE EARLY AND IN PERSON\nIN EACH COUNTY IN CALIFORNIA...\n\nThe counties marked \"Confirmed\" have been contacted and have verified that, YES, they do permit people to vote early and, yes, they have received ballots and are ready to enable people to cast their ballots. Some of the county offices have not received their ballots. Some of them don\'t seem to have a clue about early voting. It is probably a good idea to call your local office before going to vote early. \n\n\nAlameda County - Confirmed\nEarly Voting - Presidential Primary Election \nEarly voting for the June 7, 2016 Statewide Presidential Primary Election starts Monday, May 9th.\nOur office is open 8:30AM to 5PM Monday thru Friday.\nThe Registrar of Voter\'s office will be closed on Monday, May 30th in observance of Memorial Day.\n\nTim Dupuis, Registrar of Voters\n1225 Fallon Street, Room G-1\nOakland, California 94612\n\nMonday - Friday\n8:30AM - 5PM\nSaturday-Sunday\nCLOSED\n\n510-272-6933\n510-272-6982 Fax\n\nhttp://www.acgov.org/rov/index.htm\nAlpine County\nWe have not been able to confirm in person early voting details in Alpine County.\nTeola L. Tremayne, County Clerk\n99 Water (Federal Express Only)\nMarkleeville, California 96120\n\nMonday - Friday\n8:30AM - NOON. / 1PM - 5PM\nSaturday-Sunday\nCLOSED\n\n530-694-2281\n530-694-2491 Fax\n\ncoclerk@alpinecountyca.gov\nhttp://www.alpinecountyca.gov/index.aspx?NID=388\n\nAmador County\nIn theory, early voting will be available, but they have not received their ballots yet (as of Friday May 6, 2016).\nKimberly L. Grady, Registrar of Voters\n810 Court Street\nJackson, California 95642-2132\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n209-223-6465\n209-223-6467 Fax\n\nElections@amadorgov.org\nhttp://www.co.amador.ca.us/government/elections\n\n\nButte County - Confirmed\nCandace J. Grubbs, County Clerk-Recorder/Registrar of Voters\n155 Nelson Ave\nOroville, California 95965-3411\n\nMonday - Friday\n9AM - 5PM\nSaturday-Sunday\nCLOSED\n\n530-538-7761\n530-538-6853 Fax\n\nelections@buttecounty.net\nhttp://clerk-recorder.buttecounty.net/elections/voting_info.html\n\n\nCalaveras County\nWe have not been able to confirm in person early voting details in Calaveras County\nRebecca Turner, County Clerk/Recorder\nElections Department\n891 Mountain Ranch Road\nSan Andreas, California 95249\n\nMonday - Friday\n8AM - 4PM\nSaturday-Sunday\nCLOSED\n\n209-754-6376\n209-754-6733 Fax\n\nelections@co.calaveras.ca.us\nhttp://clerk.calaverasgov.us/ClerkRecorderHome.aspx\n\n\nColusa County\nWe have not been able to confirm in person early voting details in Colusa County\nRose Gallo-Vasquez, County Clerk/Recorder\n546 Jay Street, Suite 200\nColusa, California 95932\n\nMonday - Friday\n8:30AM - 4PM\nSaturday-Sunday\nCLOSED\n\n530-458-0500\n530-458-0512 Fax\n\nccclerk@countyofcolusa.org\nhttp://www.countyofcolusa.org/index.aspx?nid=197\n\nContra Costa County - Confirmed\nBE ALERT - PROTECT YOUR VOTING RIGHTS.  Contra Costa County is being very, very sneaky. On their website, they do seem to offer early voting, but only AFTER the registration deadline. CALL THE REGISTRAR\'S OFFICE AND/OR SHOW UP AT THEIR OFFICES AND DEMAND YOUR RIGHT TO VOTE EARLY. YOU WILL NOT BE ABLE TO CORRECT ANY MISTAKES IN YOUR PARTY AFFILIATION AFTER MAY 23, 2016.\nEARLY VOTING DETAILS...\nhttp://www.cocovote.us/current-election/vote-before-election-day/\n   \nJoseph E. Canciamilla, County Clerk, Recorder and Registrar of Voters\n555 Escobar Street\nMartinez, CA 94553\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n925-335-7800\n877-335-7802\n925-335-7838 Fax\n\nvoter.services@vote.cccounty.us\nhttp://www.cocovote.us\n\n\nDel Norte County\nDel Norte County is not expecting to receive their printed ballots until Wednesday, May 18, 2016\nAlissia Northrup, County Clerk-Recorder\n981 H Street, Room 160\nCrescent City, California 95531\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n707-464-7216\n707-465-0383\n707-465-0321 Fax\n\nanorthrup@co.del-norte.ca.us\nhttp://www.co.del-norte.ca.us\n\nEl Dorado County - Confirmed\nEarly Voting - Voters May Begin to Cast Their Ballot 29 Days Before the Election, Beginning on May 9th, 2016.  There are Two Early Voting Locations in El Dorado County:\n\nhttp://www.edcgov.us/Elections/Election_June_7_2016/Election_June_7_2016.aspx\n\n\nWilliam E. Schultz, Recorder-Clerk/Registrar of Voters\n2850 Fairlane Court\nPlacerville, CA 95667\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n530-621-7480\n530-626-5514 Fax\n\nEl Dorado County Elections Department  (same as above)\n2850 Fairlane Court\nPlacerville CA. 95667\nMonday – Friday\n8am to 5pm\n530-621-7480\n\nEl Dorado County Recorder/Clerk SLT\n3368 Lake Tahoe Blvd. #108\nSouth Lake Tahoe, CA 96150\nMonday – Friday\n8am – 12pm , 1pm – 5pm\n530-573-3409\n\nelections@edcgov.us\nhttp://www.edcgov.us/elections\n\nFresno County - Confirmed\nBrandi L. Orth, County Clerk/Registrar of Voters\n2221 Kern Street\nFresno, CA 93721\n\nMonday - Friday\n8:30AM - 5PM\nSaturday-Sunday\nCLOSED\n\n559-600-8683\n559-488-3279 Fax\n\nborth@co.fresno.ca.us\nhttp://www.co.fresno.ca.us/elections\n\nGlenn County\nThey did not sound all that clear on the concept of early voting in person. They have not yet received their ballots as of Friday, May 6, 2016.\nSheryl Thur, County Clerk-Recorder\n516 W. Sycamore Street\nWillows, CA 95988\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 934-6414\n(530) 934-6571 Fax\n\nelections@countyofglenn.net\nhttp://www.countyofglenn.net/govt/departments/elections/\n\n\nHumboldt County - Confirmed\nKelly Sanders, County Clerk, Recorder and Registrar of Voters\n3033 H Street, Room 20\nEureka, CA 95501\n\nMonday - Friday\n8:30AM - NOON / 1PM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 445-7481\n(707) 445-7204 Fax\n\nhumboldt_elections@co.humboldt.ca.us\nhttp://www.co.humboldt.ca.us/election\n\nImperial County\nWe have not been able to confirm in person early voting details in Imperial County.\nDebra Porter, Registrar of Voters\n442-265-1074 (Direct Number)\n940 Main Street, Suite 206\nEl Centro, CA 92243\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n760-482-4226\n760-337-4182 Fax\n\nDebbiePorter@co.imperial.ca.us\nhttp://www.co.imperial.ca.us/regvoters/\n\n\nInyo County - Confirmed\nInyo County Courthouse\nKammi Foote, Clerk/Recorder & Registrar of Voters\n168 N. Edwards Street\nIndependence, CA 93526\n\nMonday - Friday\n8AM - NOON / 1PM - 5PM\nSaturday-Sunday\nCLOSED\n\n760-878-0224\n760-878-1805 Fax\n\nkfoote@inyocounty.us\nhttp://elections.inyocounty.us/\n\nVOTE EARLY DETAILS:\nhttp://elections.inyocounty.us/p/where-to-vote-early.html\n\nKern County - Confirmed\nRegistrar of Voters - Mary B. Bedard, CPA\n1115 Truxtun Avenue  1st Floor\nBakersfield, California 93301-4639\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n661-868-3590\n800-452-8683 \n661-868-3768 Fax\nhttp://elections.co.kern.ca.us/elections/\n\nKings County\nThey have not yet received their ballots. Their best guess is that they will be receiving their ballots by May 12, 2016.\nKristine Lee, Assessor/Clerk-Recorder/Registrar of Voters\nGovernment Center\n1400 W. Lacey Blvd.\nHanford, CA 93230\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n559-582-3211 Ext. 4401\n559-585-8453 Fax\n\nelections2008@co.kings.ca.us\nhttp://www.countyofkings.com/departments/assessor/elections\n\nLake County - Confirmed\nDiane C. Fridley, Registrar of Voters\n255 N. Forbes Street Second Floor Room 209\nLakeport, CA 95453\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 263-2372\n(707) 263-2742 Fax\n\ndianef@co.lake.ca.us\nhttp://www.co.lake.ca.us/Government/Directory/ROV/voterinfo/general.htm\nhttp://www.co.lake.ca.us/Government/Directory/ROV.htm\n\nLassen County\nAs of Friday, May 6, 2016 they have not yet received their ballots. They should receive them soon. Call to confirm before you try to vote in person.\nJulie Bustamante, County Clerk-Recorder\n220 S. Lassen Street, Suite 5\nSusanville, CA 96130\n\nMonday - Friday\n9AM - NOON / 1PM - 4PM\nSaturday-Sunday\nCLOSED\n\n530-251-8217\n530-257-3480 Fax\n\nlcclerk@co.lassen.ca.us\nhttp://www.lassencounty.org/dept/registrar-voters/elections\n\nLos Angeles County - Confirmed\n12400 Imperial Highway Room 3002 (3rd Floor)\nNorwalk, California 90650\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n562-466-1323\n\nhttps://lavote.net/home/voting-elections/voting-options/early-voting\n\nMadera County - Confirmed\nRebecca Martinez, County Clerk-Recorder\n200 W. 4th Street\nMadera, CA 93637\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(559) 675-7720\n(559) 675-7870 Fax\n\nelectionsinfo@co.madera.ca.gov\nhttp://www.votemadera.com\n\nMarin County - Confirmed\nLynda Roberts, Registrar of Voters\n3501 Civic Center Drive, Room 121\nSan Rafael, CA 94903\n\nMonday - Friday\n8AM - 4:30PM\nSaturday-Sunday\nCLOSED\n\n(415) 473-6456\n(415) 473-6447 Fax\n\nelections@marincounty.org\nhttp://www.marinvotes.org\n\nMariposa County - Confirmed\nKeith Williams, County Clerk\nHall of Records\n4982 10th Street\nMariposa, CA 95338\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(209) 966-2007\n(209) 966-6496 Fax\n\ncprogner@mariposacounty.org\nhttp://www.mariposacounty.org/index.asp?nid=87\n\nMendocino County\nSusan M. Ranochak, Assessor-County Clerk-Recorder\nElections Department\n501 Low Gap Road, Room 1020\nUkiah, CA 95482\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 234-6819\n(707) 463-4257 Fax\n\nacr@co.mendocino.ca.us\nhttp://www.co.mendocino.ca.us/acr/elections.htm\n\nMerced County\nBarbara J. Levey, Registrar of Voters\n2222 M Street, Room 14\nMerced, CA 95340\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(209) 385-7541\n(209) 385-7387 Fax\n\nwebmaster@co.merced.ca.us\nhttp://www.co.merced.ca.us/elections/\n\nModoc County\nWe have not been able to confirm in person early voting details in Modoc County.\nStephanie Wellemeyer, County Auditor/Clerk/Recorder\n108 E. Modoc Street\nAlturas, CA 96101\n\nMonday - Friday\n8:30AM - NOON / 1PM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 233-6205\n(530) 233-6666 Fax\n\ndarcylocken@co.modoc.ca.us\nhttp://www.co.modoc.ca.us/departments/elections\n\nMono County - Confirmed\nAs of Friday, May 6, 2016 they have not yet received their ballots. They should receive them by May 12, 2016. Call to confirm before you try to vote in person.\nBob Musil, County Clerk-Recorder-Registrar\n(Library Building)\n74 N. School Street, Annex I\nBridgeport, CA 93517\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n760-932-5537\n760-932-5531 Fax\n\nbmusil@mono.ca.gov\nhttp://www.monocounty.ca.gov/departments/elections/elections.html\n\nMonterey County - Confirmed\nEarly Voting\nEarly Voting begins 29 days before an election. Voters may come to the Monterey County Elections Department at 1370 B South Main Street in Salinas (in the Nob Hill Shopping Center). Here they may pick up a vote by mail ballot or use our touch screen voting machine that can help voters with sight and mobility impairments.\nhttp://www.montereycountyelections.us/early_votingEN.htm\n  \nClaudio Valenzuela, Registrar of Voters\n1370 S. Main Street # B\nSalinas, CA 93901\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(831) 796-1499\n(831) 755-5485 Fax\n\nelections@co.monterey.ca.us\nhttp://www.montereycountyelections.us\n\nNapa County\nJohn Tuteur, Assessor-Recorder-County Clerk\nNapa County Registrar of Voters\n900 Coombs St Ste 256\nNapa, CA 94559\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 253-4321\n(707) 253-4390 Fax\n\nelections@co.napa.ca.us\nhttp://www.countyofnapa.org/Elections/\n\nNevada County - Confirmed\nGregory J. Diaz, Clerk-Recorder, Registrar of Voters\nNevada County Government Center\n950 Maidu Avenue, Suite 250\nNevada City, CA 95959\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 265-1298\n(530) 265-9829 Fax\n\ngregory.diaz@co.nevada.ca.us\nhttp://www.mynevadacounty.com/nc/elections/Pages/Home.aspx\n\nOrange County\nThe Orange County registrar\'s office seems confused. On the phone, they \"say\" that they are not offering early voting. Please go to their offices on or after Monday, May 9, 2016 and help us find out for sure.\nCounty Government Office\nNeal Kelley, Registrar of Voters\n1300 S Grand Avenue, Bldg. C\nSanta Ana, California 92705\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n714-567-7600\n714-567-7556 Fax\n\nocvoter@ocgov.com\nhttp://www.ocvote.com\nhttp://www.ocvote.com/registration/voter-registration-info/\n\nPlacer County - Confirmed\nJim McCauley, County Clerk-Recorder-Registrar\n2956 Richardson Drive\nAuburn, CA 95603\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 886-5650\n(530) 886-5688 Fax\n\nelection@placer.ca.gov\nhttp://www.placerelections.com\nhttp://www.placerelections.com/voting-before-election-day.aspx\nVoting Before Election Day\nEarly Voting allows any registered voter in Placer County the opportunity to vote in a polling place setting prior to Election Day and is especially convenient for voters that believe they will not be able to vote at their polling place on Election Day.\n\nPlumas County\nWe have not been able to confirm in person early voting details in Plumas County.\nKathleen Williams, County Clerk-Recorder-Registrar of Voters\n520 Main Street, Room 102\nQuincy, CA 95971\n\nMonday - Friday\n8AM - 5PM\nClosed Wednesday 11-NOON for staff training\nClosed on Holidays\nSaturday-Sunday\nCLOSED\n\n(530) 283-6256\n(530) 283-6155 Fax\n\nelections@countyofplumas.com\nhttp://www.countyofplumas.com/index.aspx?NID=142\n\nRiverside County - Confirmed\nCOUNTY OF RIVERSIDE REGISTRAR OF VOTERS OFFICE \nRebecca Spencer, Registrar of Voters\n2724 Gateway Drive\nRiverside, CA 92507-0918\n\n(951) 486-7200\n(951) 486-7335 Fax\n\nEarly voting will be available at the above location\nMay 9 through June 6 (excluding Holidays) \nMonday through Friday 8:00 a.m. to 5:00 p.m. \nSaturday, May 28 9:00 a.m. to 4:00 p.m. \nSaturday June 4 9:00 a.m. to 4:00 p.m. \n\nand at the following shopping mall locations\n \n1299 Galleria at Tyler\nRiverside, California 92503 \nMay 27 - 29\nFriday through Sunday\n10AM to 4PM\n\n72-840 Highway 111\nPalm Desert, California 92260\nMay 27 - 29\nFriday through Sunday\n10AM to 4PM\n\n40820 Winchester Road\nTemecula, CA 92591 \nMay 27 - 29\nFriday through Sunday\n10AM to 4PM\n\nrovweb@co.riverside.ca.us\nhttp://www.voteinfo.net\n\nSacramento County\nThey plan to have additional locations on the two weekends prior to election day. To be announced.\nJill LaVine, Registrar of Voters\n7000 65th Street, Suite A\nSacramento, CA 95823-2315\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(916) 875-6451\n(916) 875-6228 Fax\n\nvoterinfo@saccounty.net\nhttp://www.elections.saccounty.net/default.htm\n\nSan Benito County\nWe have not been able to confirm in person early voting details in San Benito County.\nJoe Paul Gonzalez, County Clerk-Auditor-Recorder\nBi-Lingual Contact Guadalupe Maldonado\nHall of Records (old Courthouse)\n440 Fifth Street, 2nd Floor, Room 206\nHollister, CA 95023-3843\n\nMonday - Friday\n9AM - NOON / 1PM - 4PM\n\n(831) 636-4016\n(831) 636-2939 Fax\n\nacurro@cosb.us\nhttp://www.sbcvote.us\n\nSan Bernardino County - Confirmed\nAny registered voter can cast their ballot prior to Election Day at one of the locations listed below.\nSan Bernardino County Elections Office\nMichael J. Scarpello, Registrar of Voters\n777 E. Rialto Avenue\nSan Bernardino, California  92415Beginning Monday, May 9, 2016 \nMonday through Friday from 7:30 a.m. to 5:30 p.m.\nSaturday, June 4, 2016, from 7:30 a.m. to 5:30 p.m.\nElection Day, Tuesday, June 7, from 7 a.m. to 8 p.m.\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(909) 387-8300\n(909) 387-2022 Fax\n\nE-Mail: rovwebmail@rov.sbcounty.gov\nWebsite: www.sbcountyelections.com/\nOntario Conference Center\n1947 E. Convention Center Way\nOntario, California  91764\nBeginning Tuesday, May 31, 2016 \nTuesday through Saturday from 7:30 a.m. to 5:30 p.m.\nMonday, June 6, 2016, from 7:30 a.m. to 5:30 p.m.\nElection Day, Tuesday, June 7, from 7 a.m. to 8 p.m.\nVictorville City Hall\n14343 Civic Drive\nVictorville, California  92393\nBeginning Tuesday, May 31, 2016 \nTuesday through Saturday from 7:30 a.m. to 5:30 p.m.\nMonday, June 6, 2016, from 7:30 a.m. to 5:30 p.m.\nElection Day, Tuesday, June 7, from 7 a.m. to 8 p.m.\nhttps://www.sbcountyelections.com/Voting/Early.aspx\nSan Diego County - Confirmed\nMichael Vu, Registrar of Voters\n5600 Overland Ave,\nSan Diego, California 92123\n\nTake Ruffin Road north\nturn left on Hazard way.\nLook for two big head statues and a banner that says \"vote here.\"\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n858-565-5800\n(800) 696-0136\n(858) 694-2955 Fax\n\nrovmail@sdcounty.ca.gov\nhttp://www.sdvote.com\n\nSan Francisco County - Confirmed\nCan I vote early at City Hall?\nAll eligible San Franciscans can vote at the City Hall Voting Center beginning 29 days before each election. Voting hours are from 8 a.m. until 5 p.m. Monday through Friday, from 10 a.m. until 4 p.m. the last two weekends before the election, and Election Day from 7 a.m. until 8 p.m.\nSan Francisco City Hall\nJohn Arntz, Director of Elections\n1 Dr. Carlton B Goodlett Place, \nCity Hall, Room 48\nSan Francisco, California 94102-4635\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n415-554-4375\n(415) 554-7344 Fax\n\nsfvote@sfgov.org\nhttp://sfgov.org/elections/frequently-asked-questions-faq#Question13\n\nSan Joaquin County\nWe have not been able to confirm in person early voting details in San Juaquin County.\nAustin Erdman, Registrar of Voters\n44 N. San Joaquin Street, Suite 350\nStockton, CA 95202\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(209) 468-2885\n(209) 468-2889 Fax\n\nwww.sjcrov.org\n\nSan Luis Obispo County\nWe have not been able to confirm in person early voting details in San Luis Obispo County.\nTommy Gong, County Clerk-Recorder\n1055 Monterey Street, Room D-120\nSan Luis Obispo, CA 93408\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(805) 781-5228\n(805) 781-1111 Fax\n\nelections@co.slo.ca.us\nhttp://www.slocounty.ca.gov/clerk.htm\n\nSan Mateo County\nWe have not been able to confirm in person early voting details in San Mateo County.\nMark Church, Chief Elections Officer & Assessor-County Clerk-Recorder\nRegistration-Elections Division\n40 Tower Road\nSan Mateo, CA 94402\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(650) 312-5222\n(650) 312-5348 Fax\n\nregistrar@smcare.org\nhttp://www.shapethefuture.org\n\nSanta Barbara County\nWe have not been able to confirm in person early voting details in Santa Barbara County.\nJoseph E. Holland, County Clerk, Recorder and Assessor\n4440-A Calle Real\nSanta Barbara, CA 93110\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(805) 568-2200\n(800) 722-8683\n(805) 568-2209 Fax\n\nelectionssupport@co.santa-barbara.ca.us\nhttp://www.sbcvote.com\nSanta Clara County - Confirmed\nShannon Bushey, Registrar of Voters\n1555 Berger Drive, Bldg. 2\nSan Jose, CA 95112\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(408) 299-8683\n(866) 430-8683\n(408) 998-7314 Fax\n\nE-Mail: registrar@rov.sccgov.org\nWebsite: www.sccvote.org\nhttps://www.sccgov.org/sites/rov/VBM/Pages/VoteEarly.aspx\n\n   \n\nSanta Cruz County\nWe have not been able to confirm in person early voting details in Santa Cruz County.\nGail Pellerin, County Clerk\n701 Ocean Street, Room 210\nSanta Cruz, CA 95060-4076\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(831) 454-2060\n(831) 454-2445 Fax\n\ngail.pellerin@santacruzcounty.us\nhttp://www.votescount.com\nhttp://www.votescount.com/Home/UpcomingElections/June7,2016PresidentialPrimaryElection/VoteEarly.aspx\nYou may vote early at two locations\nMay 9 – June 7\n\nSanta Cruz County Clerk/Elections\n701 Ocean St., Room 210, Santa Cruz\nMonday – Friday 8am to 5pm\n\nWatsonville City Clerk’s Office\n275 Main St., Watsonville\nMonday – Friday, 8am to 5pm\n\nBoth locations will also be open\nSaturday and Sunday, June 4 & 5, 9am to 5pm\n\nShasta County\nWe have not been able to confirm in person early voting details in Shasta County.\nCathy Darling-Allen, County Clerk\n1643 Market Street\nRedding, CA 96001\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 225-5730\n(530) 225-5454 Fax\n\ncountyclerk@co.shasta.ca.us\nhttp://www.elections.co.shasta.ca.us\nSierra County\nWe have not been able to confirm in person early voting details in Sierra County.\nHeather Foster, County Clerk-Recorder\n100 Courthouse Square, Room 11\nP.O. Drawer D\nDownieville, CA 95936-0398\n\nMonday - Friday\n9AM - NOON / 1PM - 4PM\nSaturday-Sunday\nCLOSED\n\n(530) 289-3295\n(530) 289-2830 Fax\n\nhfoster@sierracounty.ws\nhttp://www.sierracounty.ws\n\nSiskiyou County\nWe have not been able to confirm in person early voting details in Siskiyou County.\nColleen Setzer, County Clerk\n510 N. Main Street\nYreka, CA 96097-9910\n\nMonday - Friday\n9AM - NOON / 1PM - 4PM\nSaturday-Sunday\nCLOSED\n\n(530) 842-8084\n(530) 841-4110 Fax\n\ncsetzer@co.siskiyou.ca.us\nwww.co.siskiyou.ca.us/page/elections-registrar-of-voters-0\n\nSolano County\nWe have not been able to confirm in person early voting details in Solano County.\nIra Rosenthal, Registrar of Voters\n675 Texas Street, Suite 2600\nFairfield, CA 94533\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 784-6675\n(707) 784-6678 Fax\n\nelections@solanocounty.com\nhttp://www.solanocounty.com/depts/rov/default.asp\n\nSonoma County\nWe have not been able to confirm in person early voting details in Sonoma County.\nWilliam F. Rousseau, County Clerk, Recorder, Assessor, Registrar of Voters\nGloria Colter, Assistant Registrar of Voters\n435 Fiscal Drive\nSanta Rosa, CA 95403\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(707) 565-6800\n(707) 565-6843 Fax\n\nrov-voterreg@sonoma-county.org\nhttp://www.sonoma-county.org/regvoter/index.htm\n\nStanislaus County\nWe have not been able to confirm in person early voting details in Stanislaus County.\nLee Lundrigan, County Clerk-Recorder\n1021 I Street, Suite 101\nModesto, CA 95354-2331\n\nMonday - Friday\n8AM - 4PM\nSaturday-Sunday\nCLOSED\n\n(209) 525-5200\n(209) 525-5802 Fax\n\nstanvote@stancounty.com\nhttp://stanvote.com\n\nSutter County\nWe have not been able to confirm in person early voting details in Sutter County.\nDonna M. Johnston, County Clerk-Recorder\n1435 Veterans Memorial Circle\nYuba City, CA 95993\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 822-7122\n(530) 822-7587 Fax\n\nWebsite: www.co.sutter.ca.us\n\nTehama County\nWe have not been able to confirm in person early voting details in Tehama County.\nJennifer Vise, ROV/Clerk/Recorder\n444 Oak Street, Room C\nRed Bluff, CA 96080\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 527-8190\n(530) 527-1140 Fax\n\njvise@co.tehama.ca.us\nhttp://www.co.tehama.ca.us\n\nTrinity County\nWe have not been able to confirm in person early voting details in Trinity County.\nShanna White, Registrar of Voters\n11 Court Street\nWeaverville, CA 96093\n\nMonday - Friday\n9AM - 1PM / 2PM - 4PM\nSaturday-Sunday\nCLOSED\n\n(530) 623-1220\n(530) 623-8398 Fax\n\nelections@trinitycounty.org\nhttp://www.trinitycounty.org/index.aspx?page=58\n\nTulare County\nWe have not been able to confirm in person early voting details in Tulare County.\nRita A. Woodard, Registrar of Voters\n5951 S. Mooney Blvd.\nVisalia, CA 93277\n\nMonday-Thursday 7:30AM - 5:30PM\nFriday 8AM - NOON\nSaturday-Sunday\nCLOSED\n\n(559) 624-7300\n(559) 737-4498 Fax\n\nabsentee@co.tulare.ca.us\nhttp://www.tularecounty.ca.gov/registrarofvoters\n\nTuolumne County\nWe have not been able to confirm in person early voting details in Tuolumne County.\nDeborah Bautista, County Clerk-Auditor-Controller\nElections Department\n2 S. Green Street\nSonora, CA 95370-4696\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(209) 533-5570\n(209) 694-8931 Fax\n\nclerk@tuolumnecounty.ca.gov\nhttp://www.co.tuolumne.ca.us/index.aspx?nid=194\n\nVentura County\nWe have not been able to confirm in person early voting details in Ventura County.\nMark A. Lunn, County Clerk-Recorder-Registrar of Voters\n800 S. Victoria Avenue, L-1200\nVentura, CA 93009-1200\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(805) 654-2781\n(805) 648-9200 Fax\n\nhttp://recorder.countyofventura.org/elections.htm\n\nYolo County\nWe have not been able to confirm in person early voting details in Yolo County.\nFreddie Oakley, County Clerk-Recorder\n625 Court Street, Room B05\nWoodland, CA 95695\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 666-8133\n(530) 666-8123 Fax\n\ncntyclrk@yoloelections.org\nhttp://www.yoloelections.org\n\nYuba County\nWe have not been able to confirm in person early voting details in Yuba County.\nTerry A. Hansen, County Clerk-Recorder\n915 8th Street, Suite 107\nMarysville, CA 95901-5273\n\nMonday - Friday\n8AM - 5PM\nSaturday-Sunday\nCLOSED\n\n(530) 749-7855\n(530) 749-7854 Fax\n\nelections@co.yuba.ca.us\nhttp://elections.co.yuba.ca.us/','https://www.facebook.com/events/1092249797506085/',1,'2016-05-22 01:44:05.011424',6,'static/image_Y2DeVx2.jpg','https://scontent.xx.fbcdn.net/v/t1.0-9/p720x720/13124757_509787219206107_7425133133965706852_n.jpg?oh=a351ac41e77a86366c23309c2e217e7e&oe=5799699F','local',NULL,1,0),(9,'Ichiro Is Old And Good','The strangest final acts of all-time great careers usually involve career-tarnishing performances in bizarre uniforms. You know the type: Johnny Unitas as a Charger, Patrick Ewing with the Magic, W…','http://fivethirtyeight.com/features/ichiro-is-old-and-good/?ex_cid=538fb',1,'2016-05-25 23:30:33.061638',6,'static/image_JJNGU21.jpg','https://espnfivethirtyeight.files.wordpress.com/2016/05/gettyimages-533960714-e1464192928999.jpg?w=1200','national',13,0,0),(10,'Sanders Isn’t Doing Well With True Independents','A lot has been made of Bernie Sanders’s appeal with independent voters during the Democratic presidential primary. He has won people who identify as independents in state after state, while Hillary…','http://fivethirtyeight.com/features/sanders-isnt-doing-well-with-true-independents/',1,'2016-05-25 23:45:03.842616',6,'static/image_m0ReBdp.jpg','https://espnfivethirtyeight.files.wordpress.com/2016/05/ap_16144801214205.jpg?w=1200','local',14,0,0),(11,'Ollie Was Moments From Death. Then a Veterinary Student Made a \'Miraculous\' Find','Awesome.','http://www.newser.com/story/225660/miraculous-find-saves-dog-moments-before-being-put-down.html',1,'2016-05-26 01:30:38.593463',6,'static/image_Zyk85Am.jpg','http://img2-azcdn.newser.com/image/1069629-12-20160525185904.jpeg','local',15,1,0),(12,'Republican Financiers Aren\'t Sure Where to Send Their Money Because the Trump Campaign Keeps Disavowing Super PACs','Since he declared his candidacy for president, a number of “scam PACs” have taken advantage of the havoc Donald Trump—who needs to raise $1 billion if he wants to even be competitive in the general election—has wrought upon the Republican donor class. Now, as more of these groups insinuate themselves into the fundraising chaos, the financiers who have resigned themselves to a Trump candidacy aren’t sure where to send their money.','http://gawker.com/republican-financiers-arent-sure-where-to-send-their-mo-1776830029',1,'2016-06-05 20:20:30.967362',6,'','https://i.kinja-img.com/gawker-media/image/upload/s--Cpy-R2Lg--/c_fill,fl_progressive,g_center,h_450,q_80,w_800/pbn5uonmcvim353wsnr3.jpg','national',16,0,0),(13,'Republican Financiers Aren\'t Sure Where to Send Their Money Because the Trump Campaign Keeps Disavowing Super PACs','Since he declared his candidacy for president, a number of “scam PACs” have taken advantage of the havoc Donald Trump—who needs to raise $1 billion if he wants to even be competitive in the general election—has wrought upon the Republican donor class. Now, as more of these groups insinuate themselves into the fundraising chaos, the financiers who have resigned themselves to a Trump candidacy aren’t sure where to send their money.','http://gawker.com/republican-financiers-arent-sure-where-to-send-their-mo-1776830029',1,'2016-06-05 20:23:40.483277',6,'static/image_bhP8ETA.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--Cpy-R2Lg--/c_fill,fl_progressive,g_center,h_450,q_80,w_800/pbn5uonmcvim353wsnr3.jpg','national',16,1,0),(14,'Cultivate Awareness and Creativity through Meditation','Cultivate Awareness and Creativity through Meditation\n\nMeditation is an experience that help us cultivate awareness. This form of mental training allows us to understand our thoughts, emotions, and urges as well as how to balance them. We begin to unveil immense detail about ourselves and our reactions, while simultaneously fostering creativity, kindness, and acceptance.\n\nThese experiences also help us improve other areas of daily life, including yoga, running, sports, work, and conflict resolution. In this meditation workshop, you will learn how to define meditation for yourself as well as learn techniques to work toward positive transformation through mindfulness, breath-work, and meditation.\n\nAll levels welcome, including beginners!\nAdvanced Price: $40\nDay of Event Price: $45','https://www.facebook.com/events/250066838717478/',1,'2016-06-05 20:27:54.398898',6,'static/image_V2eXhxE.jpg','https://scontent.xx.fbcdn.net/t31.0-8/s720x720/13235469_181584805573999_2771724990288150172_o.jpg','local',17,0,0),(15,'California State House: Recall Judge Aaron Persky','We the people would like to petition that Judge Aaron Persky be removed from his Judicial position for the lenient sentence he allowed in the Brock Turner rape case. Despite a unanimous guilty verdict, three felony convictions, the objections of 250 Stanford students, Jeff Rosen the district attorney...','https://www.change.org/p/california-state-house-recall-judge-aaron-persky',1,'2016-06-07 00:43:47.331878',6,'static/image_l4kaOpe.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/6/ii/ck/ggiIcKCWPjFrclw-1600x900-noPad.jpg?1465147955','national',18,1,0);
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
  `image_url` varchar(200) NOT NULL,
  `scope` varchar(9) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_created_by_id_417960b5fa45206f_fk_customuser_customuser_id` (`created_by_id`),
  CONSTRAINT `topic_created_by_id_417960b5fa45206f_fk_customuser_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_topic`
--

LOCK TABLES `topics_topic` WRITE;
/*!40000 ALTER TABLE `topics_topic` DISABLE KEYS */;
INSERT INTO `topics_topic` VALUES (1,'Everybody Still Hates Ted Cruz','http://gawker.com/everyone-still-hates-ted-cruz-1776351940',1,'2016-05-13 16:13:43.272012','static/image_qySTie1.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--VqPn2TXl--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/x59w88q9uq56wpyq7nrh.gif','national',NULL,0,2),(2,'\"Racist McShootFace\" Drives Auction Price of George Zimmerman\'s Gun Past $65 Million Before Being Suspended','http://gawker.com/racist-mcshootface-drives-auction-price-of-george-zim-1776436650',1,'2016-05-13 16:37:45.035300','static/image_hK1FMmL.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--MDooAf5D--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/c4kpjikbemd5kdzu3wqd.jpg','national',NULL,0,2),(3,'Donald Trump\'s rough few days','http://www.cnn.com/2016/05/16/politics/donald-trump-rough-few-days/index.html',1,'2016-05-16 15:09:20.143021','static/image_YEn6qHZ.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160515132406-donald-trump-brexit-piers-morgan-intv-00020011-large-169.jpg','national',NULL,0,2),(4,'Republican Financiers Aren\'t Sure Where to Send Their Money Because the Trump Campaign Keeps Disavowing Super PACs','http://gawker.com/republican-financiers-arent-sure-where-to-send-their-mo-1776830029',1,'2016-05-16 18:34:23.941931','static/image_eqzeKvr.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--DCA-q4fB--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/pbn5uonmcvim353wsnr3.jpg','national',NULL,0,2),(5,'Blue Jays And Rangers Brawl, Completely Ignore Game [UPDATE: They Brawled Again]','http://screengrabber.deadspin.com/blue-jays-and-rangers-brawl-completely-ignore-game-1776771655',1,'2016-05-16 19:33:15.988457','static/image_MKplyuu.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--u12OjsM0--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/dzytltukqx096x7lbsyd.gif','national',NULL,2,0),(6,'This 12-Year-Old\'s Skateboarding Skills Defy Reason','http://sploid.gizmodo.com/12-year-olds-skateboarding-skills-defy-reason-1777169900',1,'2016-05-17 21:59:33.058736','static/image_9StnhjI.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--qbRUKGTD--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/elu3dd5jwbs4lhhhwxgp.gif','national',NULL,2,0),(7,'The NYPD Just Ran Over a Bunch of Dirt Bikes With a Bulldozer Live on Facebook','http://gawker.com/the-nypd-just-ran-over-a-bunch-of-dirt-bikes-with-a-bul-1777109682',4,'2016-05-19 16:47:29.216429','static/image_86zlDKN.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--QCLAps7N--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/eyudf53fbchvngiqylju.gif','local',NULL,0,0),(8,'Donald Trump to Voters He Once Called Rapists: \'You\'re Gonna Like President Trump\'','http://gawker.com/donald-trump-to-voters-he-once-called-rapists-youre-go-1777973318',4,'2016-05-22 01:35:50.564668','static/image_8rvYbKM.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--xCJWufL9--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/smv0mpxetrpqusf78t6r.jpg','national',NULL,1,0),(9,'This is a test topic','',1,'2016-05-25 18:02:14.001332','','','',NULL,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updown_vote`
--

LOCK TABLES `updown_vote` WRITE;
/*!40000 ALTER TABLE `updown_vote` DISABLE KEYS */;
INSERT INTO `updown_vote` VALUES (1,8,4,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-05-16 18:34:43.374613','2016-05-19 15:26:04.132847'),(2,8,2,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-05-16 18:34:44.347297','2016-05-19 15:26:07.131092'),(3,8,1,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-05-16 18:34:45.293185','2016-05-19 15:26:09.178324'),(4,8,3,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-05-16 18:34:48.185742','2016-05-19 15:26:05.139876'),(5,8,6,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-05-17 21:59:40.822017','2016-05-19 15:26:00.135242'),(6,8,6,'2c5504ab9a86164db22a92dc8793843d',1,4,'127.0.0.1','2016-05-19 15:25:59.181886','2016-05-19 15:25:59.181919'),(7,8,5,'2c5504ab9a86164db22a92dc8793843d',1,4,'127.0.0.1','2016-05-19 15:26:02.396758','2016-05-19 15:26:02.396783'),(8,8,5,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-05-19 15:26:03.130756','2016-05-19 15:26:03.130781'),(10,8,4,'2c5504ab9a86164db22a92dc8793843d',-1,4,'127.0.0.1','2016-05-19 15:26:03.376279','2016-05-19 15:26:03.376305'),(11,8,3,'2c5504ab9a86164db22a92dc8793843d',-1,4,'127.0.0.1','2016-05-19 15:26:04.615190','2016-05-19 15:26:04.615215'),(12,8,2,'2c5504ab9a86164db22a92dc8793843d',-1,4,'127.0.0.1','2016-05-19 15:26:06.198734','2016-05-19 15:26:06.198759'),(13,8,1,'2c5504ab9a86164db22a92dc8793843d',-1,4,'127.0.0.1','2016-05-19 15:26:08.595387','2016-05-19 15:26:08.595411'),(14,8,8,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-05-22 01:37:11.964976','2016-05-22 01:37:11.965009'),(15,9,7,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-05-22 01:37:16.600406','2016-05-22 01:37:29.544071'),(16,9,7,'2c5504ab9a86164db22a92dc8793843d',1,4,'127.0.0.1','2016-05-22 01:37:16.609098','2016-05-22 01:37:29.552115'),(17,9,8,'2c5504ab9a86164db22a92dc8793843d',1,4,'127.0.0.1','2016-05-22 01:44:11.201587','2016-05-26 17:14:56.694114'),(18,9,11,'2c5504ab9a86164db22a92dc8793843d',1,4,'127.0.0.1','2016-05-26 01:31:45.727436','2016-05-26 01:31:45.727515'),(19,9,13,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-06-07 16:02:09.618150','2016-06-07 16:02:09.618231'),(20,9,15,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-06-07 16:02:13.637629','2016-06-07 16:02:13.637672');
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

-- Dump completed on 2016-06-10  7:59:28
