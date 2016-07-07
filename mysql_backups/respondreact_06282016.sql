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
  CONSTRAINT `address_addr_locality_id_1ee77782aa875625_fk_address_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `address_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_address`
--

LOCK TABLES `address_address` WRITE;
/*!40000 ALTER TABLE `address_address` DISABLE KEYS */;
INSERT INTO `address_address` VALUES (61,'','','United Kingdom','',51.9442648790288,-0.52734375,NULL),(62,'','','United Kingdom','',51.3992056535538,0.263671875,NULL),(63,'','','United Kingdom','',51.7270281570477,-0.703125,NULL),(64,'','','United Kingdom','',52.2681573737682,0.3515625,NULL),(65,'','','United Kingdom','',51.3992056535538,-0.87890625,NULL),(66,'','','United Kingdom','',51.8357775204525,-0.3515625,NULL),(67,'','','United Kingdom','',51.8357775204525,-0.17578125,NULL),(68,'','','Orlando, FL 32810, USA','',28.6134594240044,-81.40869140625,10),(71,'','','2755 S Las Vegas Blvd, Las Vegas, NV 89109, USA','',36.1378747184073,-115.15869140625,15),(72,'','','San Jose, CA 95136, USA','',37.2653099556187,-121.83837890625,16),(73,'','','United Kingdom','',52.4827802220782,-1.23046875,NULL),(74,'','','Greater London, UK','',51.5634123286759,-0.0439453125,NULL),(75,'','','United Kingdom','',51.8357775204525,-0.17578125,NULL),(76,'','','Colorado, USA','',38.9252290471405,-103.88671875,NULL),(77,'','','Orlando, FL, USA','',27.8390760947778,-81.2109375,NULL),(78,'','','Denver, CO 80202, USA','',39.7578799920217,-105.00732421875,18),(79,'','','Orlando, FL, USA','',28.5362745129899,-81.49658203125,NULL),(80,'','','Orlando, FL, USA','',28.574874047447,-81.353759765625,NULL),(81,'','','1324 20th Ave, San Francisco, CA 94122, USA','',37.7630604171947,-122.478077709675,17);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES (19,'United Kingdom','GB'),(20,'United States','US');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_locality`
--

LOCK TABLES `address_locality` WRITE;
/*!40000 ALTER TABLE `address_locality` DISABLE KEYS */;
INSERT INTO `address_locality` VALUES (10,'Orlando','32810',10),(15,'Las Vegas','89109',11),(16,'San Jose','95136',12),(17,'San Francisco','94122',12),(18,'Denver','80202',14);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_state`
--

LOCK TABLES `address_state` WRITE;
/*!40000 ALTER TABLE `address_state` DISABLE KEYS */;
INSERT INTO `address_state` VALUES (10,'Florida','FL',20),(11,'Nevada','NV',20),(12,'California','CA',20),(13,'England','En',19),(14,'Colorado','CO',20);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser_customuser`
--

LOCK TABLES `customuser_customuser` WRITE;
/*!40000 ALTER TABLE `customuser_customuser` DISABLE KEYS */;
INSERT INTO `customuser_customuser` VALUES (5,'pbkdf2_sha256$20000$7S5SAEiF8PuT$ArTLHqw2NdrQOLL9q4NYkiAFRude+vwZS7W06rCgLJI=','2016-06-29 19:03:31.300007',1,'admin','Chris','Johnson','admin@test.com',1,1,'2016-06-23 21:05:56.023710','http://graph.facebook.com/10201476415109883/picture?type=normal',NULL),(9,'!A9FfnYRoj5yTeYxrwJLGRo0ZbF1WxYnudj7IiVCe',NULL,0,'KevinCook','Kevin','Cook','kevinac4@gmail.com',0,1,'2016-06-28 22:44:13.551992','http://graph.facebook.com/10102615181971353/picture?type=normal',81);
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (55,'2016-06-23 21:44:56.203398','48','Washington, DC 20011, USA',3,'',25,5),(56,'2016-06-23 21:47:45.394492','3','US',3,'',22,5),(57,'2016-06-23 21:47:45.398111','2','Portugal',3,'',22,5),(58,'2016-06-23 21:47:45.399285','1','United States of America',3,'',22,5),(59,'2016-06-23 21:53:17.189828','7','US',3,'',22,5),(60,'2016-06-23 21:58:58.344181','9','US',3,'',22,5),(61,'2016-06-23 22:14:28.195617','10','US',3,'',22,5),(62,'2016-06-23 22:19:46.186294','11','US',3,'',22,5),(63,'2016-06-23 22:20:26.514299','12','US',3,'',22,5),(64,'2016-06-23 22:20:59.075772','13','US',3,'',22,5),(65,'2016-06-25 14:58:31.041793','14','United States',3,'',22,5),(66,'2016-06-25 15:02:23.297923','6','San Francisco, California 94122, United States',3,'',24,5),(67,'2016-06-25 15:02:23.301917','7','Thornton, Colorado 80241, United States',3,'',24,5),(68,'2016-06-25 15:02:33.112789','15','United States',3,'',22,5),(69,'2016-06-26 02:14:53.129125','16','United States',3,'',22,5),(70,'2016-06-26 02:45:10.992278','23','David Cameron Resigns Following Brexit Vote',3,'',8,5),(71,'2016-06-26 03:03:41.123422','24','David Cameron Resigns Following Brexit Vote',3,'',8,5),(72,'2016-06-26 03:46:31.039186','25','David Cameron Resigns Following Brexit Vote',3,'',8,5),(73,'2016-06-26 17:26:50.283392','60','Greater London, UK',3,'',25,5),(74,'2016-06-26 17:26:50.288793','59','United Kingdom',3,'',25,5),(75,'2016-06-26 17:26:50.290240','58','United Kingdom',3,'',25,5),(76,'2016-06-26 17:26:50.291481','57','United Kingdom',3,'',25,5),(77,'2016-06-26 17:26:50.295061','56','United Kingdom',3,'',25,5),(78,'2016-06-26 17:26:50.296377','54','Spain',3,'',25,5),(79,'2016-06-26 17:26:50.299393','55','San Francisco, California 94122, United States',3,'',25,5),(80,'2016-06-26 17:26:58.323173','18','United Kingdom',3,'',22,5),(81,'2016-06-26 17:26:58.326708','17','United States',3,'',22,5),(82,'2016-06-27 23:31:26.210990','14','Las Vegas, Nevada 89106, United States',3,'',24,5),(83,'2016-06-28 18:43:12.311121','6','KevinCooke9aa9904bea84002',3,'',13,5),(84,'2016-06-28 18:44:13.786822','17','San Francisco, California 94122, United States',1,'',24,5),(85,'2016-06-28 18:50:55.911962','7','KevinCookf8c4a8c578394c22',3,'',13,5),(86,'2016-06-28 22:43:13.688769','8','KevinCook4b200c90f7e64bcd',3,'',13,5),(87,'2016-06-28 22:43:13.691774','4','KevinCook',3,'',13,5),(88,'2016-06-28 22:51:03.562822','29','The \'Game of Thrones\' Opening Credits Easter Egg You Might Have Missed',3,'',8,5),(89,'2016-06-29 19:03:42.634928','30','Orlando Police Held Positions As Islamic Terrorist Reloaded And Victims Bled Out',3,'',8,5);
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
INSERT INTO `django_session` VALUES ('0inr1qcwbfj5jcgpby2lg3uogldtdtzf','NWVkNzY5MGYwYmJkYjg0MTJlNjhmMjk5YTlhMDhkMGU4MzgxOGJiZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI5MDY2MTRkMWU1NGM1NGQ1NjJkOWFkNjFjNTIwMGFmODA5ZGM2MjI5In0=','2016-07-01 17:18:54.666294'),('5gnvpex0uu5hwcb5zhxjpn2kcvmqvkzr','N2MzNzhiMGY3ZjgwNTVmZGZlMzEzMzZmMWVhYTBiNGRkZDhlNmQyZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiIzZmY4MGVlYTQxMjlkZjUwMjQ1MjIyYzcxMjZlYjQwOGQzODkzMjljIn0=','2016-07-13 19:03:31.302464'),('aolf2w5a11qjr7yn1tu7wbyyp7cen94k','ZjgzNzZjNjIwZGVkMzVjMGNjMWZiNTA1ZmE4NjViNTk2NTA2M2IwYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZmODBlZWE0MTI5ZGY1MDI0NTIyMmM3MTI2ZWI0MDhkMzg5MzI5YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-07 21:06:00.025800'),('c4n6dpkn68bcaln15kxnekfjuo7ilwra','MDRkZWEyYTUzYjljMWI3MDM5NTFhYjEwZmZiZjJjMTQwMDRkMjc0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-06-02 15:24:10.341620'),('c73esizrtqk2zzw927i94zr0hqy0pmvz','ZTZlZDIwNjIwMTA1MDZhNTg2ZDFiNTNjNTg2MzZmYWMxMDE5ZTcxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTA2NjE0ZDFlNTRjNTRkNTYyZDlhZDYxYzUyMDBhZjgwOWRjNjIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-05-26 00:48:51.256734'),('fyw4xjv02qdrtc7r8nmiriib5oodtkw1','OWQ1NDVhYWRiMWM4Yjk5ZDFhNGE1NTljNzZhYzg3NTRlNzVmMmVkMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTA2NjE0ZDFlNTRjNTRkNTYyZDlhZDYxYzUyMDBhZjgwOWRjNjIyOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-05 05:58:44.328619'),('hflrqu1cw1lx4vrtr4jo3r57kwp1drcp','MDRkZWEyYTUzYjljMWI3MDM5NTFhYjEwZmZiZjJjMTQwMDRkMjc0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-06-08 23:42:35.970617'),('l9juxhujp2gj4ieprxigvyokl3ninmsg','MDRmMWE4YTJjMjkyNmZhMGNjYzRjZTAyOTM0NDI5NmU4MzA4MzllYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmZjgwZWVhNDEyOWRmNTAyNDUyMjJjNzEyNmViNDA4ZDM4OTMyOWMiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-07 21:54:19.805452'),('o0r15qafl8gj4ksh6ughyzg5i98o6mpj','ZjgzNzZjNjIwZGVkMzVjMGNjMWZiNTA1ZmE4NjViNTk2NTA2M2IwYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZmODBlZWE0MTI5ZGY1MDI0NTIyMmM3MTI2ZWI0MDhkMzg5MzI5YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-12 18:11:22.098300'),('ph8v857s4ft1p54ebwpwncprbjv8pmgq','NmM1NTNmOTk1YjhjMDk5OWIzZjQ2ZDkxM2Q3ZjY5NWZmYzQyYWE1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MDY2MTRkMWU1NGM1NGQ1NjJkOWFkNjFjNTIwMGFmODA5ZGM2MjI5In0=','2016-06-08 18:02:29.108234'),('s32ouqt8l7h9mx2pdil0gpvth7xc76sf','ZjgzNzZjNjIwZGVkMzVjMGNjMWZiNTA1ZmE4NjViNTk2NTA2M2IwYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZmODBlZWE0MTI5ZGY1MDI0NTIyMmM3MTI2ZWI0MDhkMzg5MzI5YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-12 18:18:07.259838'),('ypu6ffohzqnwzsajifunc0wniil7wjyo','N2MzNzhiMGY3ZjgwNTVmZGZlMzEzMzZmMWVhYTBiNGRkZDhlNmQyZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiIzZmY4MGVlYTQxMjlkZjUwMjQ1MjIyYzcxMjZlYjQwOGQzODkzMjljIn0=','2016-07-10 16:40:00.021008'),('zfqxqz3eyv38q4hw5mnauuwrmdp85kfz','ODJiYWMyNTdmOTE0ZmJlNWZmMDQ3OWJjNTQ3Y2MyZTdmMWMwNzRhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwNjYxNGQxZTU0YzU0ZDU2MmQ5YWQ2MWM1MjAwYWY4MDlkYzYyMjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-27 16:10:57.423673');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (12,'facebook','10201476415109883','{\"id\": \"10201476415109883\", \"expires\": null, \"access_token\": \"EAAVgPVtcZB7ABAPhwLZAbbNF9QWhNnqU006abEV6LYFP3cxQfxfjHFCXJbZCRXEG668vzX03MPJGCNLRtoYTNo2e92kzdLp8ROfA1GEzuuH4SJVLQEwqInGCZANxsTSHoIAH7Oo9YLTEyT3NzQg1vespQfEIy6QZD\"}',5),(16,'facebook','10102615181971353','{\"id\": \"10102615181971353\", \"expires\": null, \"access_token\": \"EAAVgPVtcZB7ABAGsMcmlrzgOhOydc9HJ1RA3tf4zRSQcN24XCVgL2t4K6ny9CTsc2zXBZB1SMNSKncPao2PPWdZBcDuwsORJSJL7M1uthgV50vzvRRocdrZAfE7R4icZCUFJTLqZCEOFEUKYI52SCZCcQTCi8SeZBPsZD\"}',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'hatred','hatred'),(2,'cruz','cruz'),(3,'george-zimmerman','george-zimmerman'),(4,'trayvon-martin','trayvon-martin'),(5,'trump','trump'),(6,'undefined','undefined'),(7,'election2016','election2016'),(8,'election','election'),(9,'punch','punch'),(10,'sports','sports'),(11,'bautista','bautista'),(12,'odor','odor'),(13,'skating','skating'),(14,'stupid','stupid'),(15,'nypd','nypd'),(16,'mexico','mexico'),(17,'Change.org','changeorg'),(18,'Petition','petition'),(19,'Facebook Event','facebook-event'),(20,'Ichiro','ichiro'),(21,'bernie','bernie'),(22,'dogs','dogs'),(25,'#feelthebern','feelthebern'),(26,'dolores-park','dolores-park'),(27,'san-francisco','san-francisco'),(28,'european-union','european-union'),(29,'brexit','brexit'),(30,'Biesbol','biesbol'),(31,'Baseball','baseball'),(32,'Cardinals','cardinals'),(33,'orlando','orlando'),(34,'nra','nra'),(36,'petition','petition_1'),(38,'change.org','changeorg_1'),(39,'moveon.org','moveonorg'),(40,'gary-johnson','gary-johnson'),(41,'nhl','nhl'),(42,'sea-lion','sea-lion'),(43,'denver','denver'),(44,'gun-control','gun-control'),(45,'suicide-squad','suicide-squad'),(46,'liquid-nitrogen','liquid-nitrogen'),(47,'john-lewis','john-lewis'),(48,'paul-ryan','paul-ryan'),(49,'david-cameron','david-cameron'),(50,'new york times','new-york-times'),(51,'colorado','colorado'),(52,'pulse','pulse'),(53,'shooting','shooting'),(54,'gun-violence','gun-violence'),(55,'stern-grove','stern-grove');
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (82,27,8,29),(88,31,8,53),(94,32,8,55);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_action`
--

LOCK TABLES `topics_action` WRITE;
/*!40000 ALTER TABLE `topics_action` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_topic`
--

LOCK TABLES `topics_topic` WRITE;
/*!40000 ALTER TABLE `topics_topic` DISABLE KEYS */;
INSERT INTO `topics_topic` VALUES (27,'Could the UK hold another Brexit vote?','http://www.cnn.com/2016/06/27/europe/britain-brexit-inevitable/index.html',5,'2016-06-27 23:43:11.258909','static/image_ArgJ82l.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160627163103-david-cameron-large-tease.jpg','worldwide',73,0,0),(31,'DPD: Shots fired at 15th and Wynkoop','http://www.9news.com/news/crime/dpd-investigating-report-of-man-with-gun-downtown/258270542',9,'2016-06-28 22:54:03.205862','static/image_QkrWOPU.jpg','http://content.9news.com/photo/2016/06/28/stacey_sheperd_1467148018148_3529959_ver1.0_640_360.jpg','local',78,0,0),(32,'Stern Grove Picnic Tables Torched, Smashed In Repeated Vandalism Incidents','http://www.sfgate.com/news/article/Stern-Grove-Picnic-Tables-Torched-Smashed-In-8332275.php',9,'2016-06-29 19:08:06.417593','static/image_L8R28jV.jpg','http://ww3.hdnux.com/photos/47/73/11/10465874/3/rawImage.jpg','local',81,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updown_vote`
--

LOCK TABLES `updown_vote` WRITE;
/*!40000 ALTER TABLE `updown_vote` DISABLE KEYS */;
INSERT INTO `updown_vote` VALUES (24,9,26,'2c5504ab9a86164db22a92dc8793843d',1,5,'127.0.0.1','2016-06-27 23:41:10.320328','2016-06-27 23:41:10.320375');
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

-- Dump completed on 2016-06-29 12:57:43
