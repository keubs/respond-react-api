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
  CONSTRAINT `address_addr_locality_id_313a0669fa798183_fk_address_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `address_locality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_address`
--

LOCK TABLES `address_address` WRITE;
/*!40000 ALTER TABLE `address_address` DISABLE KEYS */;
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
  UNIQUE KEY `address_locality_name_7b2fb9deb9f61761_uniq` (`name`,`state_id`),
  KEY `address_locality_d5582625` (`state_id`),
  CONSTRAINT `address_locality_state_id_4953b65fc4d85a2d_fk_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `address_state` (`id`)
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
  UNIQUE KEY `address_state_name_6e949ce9c81b87f8_uniq` (`name`,`country_id`),
  KEY `address_state_country_id_643c7ba6f7da4727_fk_address_country_id` (`country_id`),
  CONSTRAINT `address_state_country_id_643c7ba6f7da4727_fk_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`id`)
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
  KEY `auth_group__permission_id_4c360cbbb17f100e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_4c360cbbb17f100e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_3edb33b8476769a6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `auth_p_content_type_id_cf7a1cbeb0a9a5b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add token',6,'add_token'),(17,'Can change token',6,'change_token'),(18,'Can delete token',6,'delete_token'),(19,'Can add cors model',7,'add_corsmodel'),(20,'Can change cors model',7,'change_corsmodel'),(21,'Can delete cors model',7,'delete_corsmodel'),(22,'Can add topic',8,'add_topic'),(23,'Can change topic',8,'change_topic'),(24,'Can delete topic',8,'delete_topic'),(25,'Can add action',9,'add_action'),(26,'Can change action',9,'change_action'),(27,'Can delete action',9,'delete_action'),(28,'Can add vote',10,'add_vote'),(29,'Can change vote',10,'change_vote'),(30,'Can delete vote',10,'delete_vote'),(31,'Can add Tag',11,'add_tag'),(32,'Can change Tag',11,'change_tag'),(33,'Can delete Tag',11,'delete_tag'),(34,'Can add Tagged Item',12,'add_taggeditem'),(35,'Can change Tagged Item',12,'change_taggeditem'),(36,'Can delete Tagged Item',12,'delete_taggeditem'),(37,'Can add user',13,'add_customuser'),(38,'Can change user',13,'change_customuser'),(39,'Can delete user',13,'delete_customuser'),(40,'Can add user social auth',14,'add_usersocialauth'),(41,'Can change user social auth',14,'change_usersocialauth'),(42,'Can delete user social auth',14,'delete_usersocialauth'),(43,'Can add nonce',15,'add_nonce'),(44,'Can change nonce',15,'change_nonce'),(45,'Can delete nonce',15,'delete_nonce'),(46,'Can add association',16,'add_association'),(47,'Can change association',16,'change_association'),(48,'Can delete association',16,'delete_association'),(49,'Can add code',17,'add_code'),(50,'Can change code',17,'change_code'),(51,'Can delete code',17,'delete_code'),(52,'Can add application',18,'add_application'),(53,'Can change application',18,'change_application'),(54,'Can delete application',18,'delete_application'),(55,'Can add grant',19,'add_grant'),(56,'Can change grant',19,'change_grant'),(57,'Can delete grant',19,'delete_grant'),(58,'Can add access token',20,'add_accesstoken'),(59,'Can change access token',20,'change_accesstoken'),(60,'Can delete access token',20,'delete_accesstoken'),(61,'Can add refresh token',21,'add_refreshtoken'),(62,'Can change refresh token',21,'change_refreshtoken'),(63,'Can delete refresh token',21,'delete_refreshtoken'),(67,'Can add country',23,'add_country'),(68,'Can change country',23,'change_country'),(69,'Can delete country',23,'delete_country'),(70,'Can add state',24,'add_state'),(71,'Can change state',24,'change_state'),(72,'Can delete state',24,'delete_state'),(73,'Can add locality',25,'add_locality'),(74,'Can change locality',25,'change_locality'),(75,'Can delete locality',25,'delete_locality'),(76,'Can add address',26,'add_address'),(77,'Can change address',26,'change_address'),(78,'Can delete address',26,'delete_address');
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
  CONSTRAINT `authtoken_t_user_id_4f14cf5b9e6df4d4_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser_customuser`
--

LOCK TABLES `customuser_customuser` WRITE;
/*!40000 ALTER TABLE `customuser_customuser` DISABLE KEYS */;
INSERT INTO `customuser_customuser` VALUES (1,'pbkdf2_sha256$20000$BbMTlSLKBIEF$9ZgCNnUfNBD0/JcIY0FkFvEWuywLIg3NFzT3CSM7G/Q=','2016-05-10 15:44:00.758233',1,'admin','','','admin@test.com',1,1,'2016-03-25 00:33:04.000000','','94122'),(2,'!3In7MHtylOLBeX9bdze6knQik0TTdquXPBWX3Njf',NULL,0,'KevinCook','Kevin','Cook','kevinac4@gmail.com',0,1,'2016-03-25 00:38:37.000000','http://graph.facebook.com/10102615181971353/picture?type=normal','94122'),(3,'!oGRvySQyVbaP9XYfsp4wE6VFU4HUjqvGrp6A1mbG',NULL,0,'ChrisJohnson','Chris','Johnson','keubo4@gmail.com',0,1,'2016-03-25 00:42:05.346169','http://graph.facebook.com/10201476415109883/picture?type=normal','');
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
  UNIQUE KEY `customuser_id` (`customuser_id`,`group_id`),
  KEY `customuser_customuser_group_id_15d40c5abaf55cf3_fk_auth_group_id` (`group_id`),
  CONSTRAINT `custo_customuser_id_3bbf2f4dd8d8ef02_fk_customuser_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `customuser_customuser` (`id`),
  CONSTRAINT `customuser_customuser_group_id_15d40c5abaf55cf3_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `customuser_id` (`customuser_id`,`permission_id`),
  KEY `customuser__permission_id_36e7c862de269c4a_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `custo_customuser_id_4a0a7aaa71c02521_fk_customuser_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `customuser_customuser` (`id`),
  CONSTRAINT `customuser__permission_id_36e7c862de269c4a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  KEY `djang_content_type_id_3145d1be421df8f8_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admi_user_id_14350be922147419_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_3145d1be421df8f8_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admi_user_id_14350be922147419_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-25 16:18:21.298452','1','admin',2,'Changed zip.',13,1),(2,'2016-05-10 15:44:13.652007','2','KevinCook',2,'Changed zip.',13,1);
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
  UNIQUE KEY `django_content_type_app_label_3ccb478e2864dd6e_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (26,'address','address'),(23,'address','country'),(25,'address','locality'),(24,'address','state'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(4,'contenttypes','contenttype'),(7,'corsheaders','corsmodel'),(13,'customuser','customuser'),(16,'default','association'),(17,'default','code'),(15,'default','nonce'),(14,'default','usersocialauth'),(20,'oauth2_provider','accesstoken'),(18,'oauth2_provider','application'),(19,'oauth2_provider','grant'),(21,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(11,'taggit','tag'),(12,'taggit','taggeditem'),(9,'topics','action'),(8,'topics','topic'),(10,'updown','vote');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-25 00:29:15.047335'),(2,'contenttypes','0002_remove_content_type_name','2016-03-25 00:29:15.075540'),(3,'auth','0001_initial','2016-03-25 00:29:15.150378'),(4,'auth','0002_alter_permission_name_max_length','2016-03-25 00:29:15.163949'),(5,'auth','0003_alter_user_email_max_length','2016-03-25 00:29:15.172111'),(6,'auth','0004_alter_user_username_opts','2016-03-25 00:29:15.179625'),(7,'auth','0005_alter_user_last_login_null','2016-03-25 00:29:15.188921'),(8,'auth','0006_require_contenttypes_0002','2016-03-25 00:29:15.190743'),(9,'customuser','0001_initial','2016-03-25 00:29:15.269192'),(10,'admin','0001_initial','2016-03-25 00:29:15.308688'),(11,'authtoken','0001_initial','2016-03-25 00:29:15.342856'),(12,'customuser','0002_customuser_zip','2016-03-25 00:29:15.375826'),(13,'default','0001_initial','2016-03-25 00:29:15.503523'),(14,'default','0002_add_related_name','2016-03-25 00:29:15.542407'),(15,'default','0003_alter_email_max_length','2016-03-25 00:29:15.556379'),(16,'oauth2_provider','0001_initial','2016-03-25 00:29:15.786435'),(17,'oauth2_provider','0002_08_updates','2016-03-25 00:29:15.918957'),(18,'sessions','0001_initial','2016-03-25 00:29:15.941452'),(19,'taggit','0001_initial','2016-03-25 00:29:16.016459'),(20,'taggit','0002_auto_20150616_2121','2016-03-25 00:29:16.045362'),(21,'topics','0001_initial','2016-03-25 00:29:16.226185'),(22,'address','0001_initial','2016-05-10 23:46:57.988588');
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
INSERT INTO `django_session` VALUES ('0sm32htw5hd4lor6xxonq2wx2xhkj0xg','YWFmMDYwMmIyYWQ1OTk1MmFlNjNlYzY0NWU4NDQwYzAxYjU5NzA5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2MyOTBiMzA3ZTBlOGMxNTJjMDdmM2YwZDk1OGU4NjNmNmQ1M2Q4YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-04-08 16:18:11.596665'),('bulbs8g10slnqwpr1fj74xpnwwfd9brs','YTM0MGY2NzlkMjA3MzczMzc2NWFiYTc3YzkzYzc5OWI2MTAyNjdmNDp7fQ==','2016-04-09 17:48:17.205305'),('pkx43rxkczuibixvw0hry62vhtn8zij0','M2RkZTA2MDgyNWI2ZDViNDczZDM0NzQ0MTUwMzIwMDgxNzUzOGFjNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjMjkwYjMwN2UwZThjMTUyYzA3ZjNmMGQ5NThlODYzZjZkNTNkOGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-24 15:44:00.760151');
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
  KEY `D83cbece5f96aec20b23bf1b3012238d` (`application_id`),
  KEY `oauth2_provider_accesstoken_94a08da1` (`token`),
  KEY `oauth2_prov_user_id_7984258f49b9ebdb_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `D83cbece5f96aec20b23bf1b3012238d` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_prov_user_id_7984258f49b9ebdb_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
  KEY `oauth2_provi_user_id_70dc7102b410fd7_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `oauth2_provi_user_id_70dc7102b410fd7_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
  KEY `f35784b04183fbfc54c739a060374b66` (`application_id`),
  KEY `oauth2_prov_user_id_2ed6407b0d16a0f5_fk_customuser_customuser_id` (`user_id`),
  KEY `oauth2_provider_grant_c1336794` (`code`),
  CONSTRAINT `f35784b04183fbfc54c739a060374b66` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_prov_user_id_2ed6407b0d16a0f5_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
  KEY `D0cdbfff37b6cad768a24c58794459de` (`application_id`),
  KEY `oauth2_provi_user_id_4aba22ac2be7fbb_fk_customuser_customuser_id` (`user_id`),
  KEY `oauth2_provider_refreshtoken_94a08da1` (`token`),
  CONSTRAINT `D0cdbfff37b6cad768a24c58794459de` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `D6b5ca2019bbd8856c8dd6587aaa8354` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provi_user_id_4aba22ac2be7fbb_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
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
  UNIQUE KEY `social_auth_code_email_381a00f3e3cf3a6e_uniq` (`email`,`code`),
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
  UNIQUE KEY `social_auth_nonce_server_url_21fc7a9e4ba8964a_uniq` (`server_url`,`timestamp`,`salt`)
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
  UNIQUE KEY `social_auth_usersocialauth_provider_490d4500cd3ba2fe_uniq` (`provider`,`uid`),
  KEY `social_auth_user_id_2ceeea390e25cb55_fk_customuser_customuser_id` (`user_id`),
  CONSTRAINT `social_auth_user_id_2ceeea390e25cb55_fk_customuser_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'facebook','10102615181971353','{\"expires\": null, \"id\": \"10102615181971353\", \"access_token\": \"EAAVgPVtcZB7ABABLRDyZCTPEZCgSbngqbLtosvwBbzSsZCn21qDK0ZAhV2dHbIoKRJ7VWoRBFPDRyJXBP6TOaViZBWdR5HLejCJRR8fAGBkYe2rtyYgu6zjud0eXC2VG552KjoP6eP0jBAmne9ZB7VZCdVZBR8nWsGoIZD\"}',2),(2,'facebook','10201476415109883','{\"id\": \"10201476415109883\", \"access_token\": \"CAAVgPVtcZB7ABAIN1pPaRmPbuzvSsZAZAO4xwAGqrRcUGtVTnGcjZBIIAcEPkLHlOUgby7GS6p3LgF5iqHSBbtkNg0ygjUEgSwwr38Um7adbVL1vkcSLNaCcACM8ZAzCkMZCwBlrDk45Ok8eCzCtt0d99l0yiHgVMBeZBRKhaDoLy9nKVBWkCibtGKATaOZBEP4ZD\", \"expires\": null}',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'belgium','belgium'),(2,'brussels','brussels'),(5,'Help','help'),(6,'coltrane-church','coltrane-church'),(7,'san-francisco','san-francisco'),(8,'Petition','petition'),(9,'Change.org','changeorg'),(10,'georgia','georgia'),(11,'lgbt','lgbt'),(12,'lewandowski','lewandowski'),(13,'trump','trump'),(14,'savage','savage'),(15,'cruz','cruz');
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
  KEY `taggit_taggeditem_tag_id_5da2866e183e68e6_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_af31437c` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_771aaa31b84ce3e1_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_content_type_id_7d36c0e5351ce63_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_5da2866e183e68e6_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,8,1),(2,1,8,2),(3,2,9,5),(4,2,8,6),(5,2,8,7),(6,3,9,8),(7,3,9,9),(8,3,8,10),(9,3,8,11),(10,4,9,8),(11,4,9,9),(12,4,8,12),(13,4,8,13),(14,5,9,8),(15,5,9,9),(16,5,8,14),(17,5,8,15);
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
  `created_on` datetime(6) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `image_url` varchar(200) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `scope` varchar(9) NOT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_created_by_id_1b4794d3b9a7f013_fk_customuser_customuser_id` (`created_by_id`),
  KEY `topics_action_19b4d727` (`topic_id`),
  CONSTRAINT `topic_created_by_id_1b4794d3b9a7f013_fk_customuser_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `customuser_customuser` (`id`),
  CONSTRAINT `topics_action_topic_id_2af22cda0db863e4_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_action`
--

LOCK TABLES `topics_action` WRITE;
/*!40000 ALTER TABLE `topics_action` DISABLE KEYS */;
INSERT INTO `topics_action` VALUES (1,'How to Help Victims of the Brussels Attacks','You can donate money or offer temporary housing','http://time.com/4268642/brussels-attacks-how-to-help/','2016-03-25 00:41:34.672305','','https://timedotcom.files.wordpress.com/2016/03/brussels-attacks-how-to-help.jpg?quality=75&strip=color&w=1012','1930','national',0,2,1,1),(2,'How to Help Victims of the Brussels Attacks','You can donate money or offer temporary housing','http://time.com/4268642/brussels-attacks-how-to-help/','2016-03-25 00:42:47.754772','static/image_U0DYaoa.jpg','https://timedotcom.files.wordpress.com/2016/03/brussels-attacks-how-to-help.jpg?quality=75&strip=color&w=1012','1930','national',2,0,1,1),(3,'West Bay Confrence Center, London Breed, Edwin Lee, Nadia Sesay: Hands Off The \"Coltrane Church\"','Petition successful','https://www.change.org/p/west-bay-confrence-center-london-breed-edwin-lee-nadia-sesay-hands-off-the-coltrane-church','2016-03-26 17:46:22.486571','static/image_sbAhOZ5.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/6/pn/jo/LnpNjoGphXLAgTM-1600x900-noPad.jpg?1454467753','94122','local',1,0,1,2),(4,'Stop Georgia from passing one of the most dangerous discriminatory bills of the decade.','On February 19, 2016, the Georgia Senate approved a version of HB 757 that would allow for further discrimination against the LGBT community in the name of \"religious freedom.\"\nOn March 16, 2016, the Georgia Senate approved another version of HB 757, which had been revised earlier by the Georgia HOR.\nNow,...','https://www.change.org/p/stop-georgia-from-passing-one-of-the-most-dangerous-discriminatory-bills-of-the-decade','2016-03-28 17:23:32.947008','static/image_EeHxjdc.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/0/hw/ry/tJhwRyrTTlcKnag-1600x900-noPad.jpg?1456608379','30334','national',1,0,1,3),(5,'Campaign Manager  Corey R. Lewandowski: Dump Donald Trump: The joke isn\'t funny anymore!','Caption: We shall over comb Trump 2016 \n   \n Okay America, we had a good laugh but now it\'s time to get to business. When I first heard that Donald Trump announced his intent to run in the 2016 Presidential Election, I laughed and brushed it off like many sane, rational Americans. However,  as his name...','https://www.change.org/p/campaign-manager-corey-r-lewandowski-dump-donald-trump-the-joke-isn-t-funny-anymore','2016-03-29 23:11:05.483384','static/image_pof6hDG.jpg','http://d22r54gnmuhwmk.cloudfront.net/photos/7/yn/fd/eBYNfdmlLzyyqAh-1600x900-noPad.jpg?1447730916','20300','national',0,1,1,4);
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
  `created_on` datetime(6) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `image_url` varchar(200) NOT NULL,
  `scope` varchar(9) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `rating_likes` int(10) unsigned NOT NULL,
  `rating_dislikes` int(10) unsigned NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_created_by_id_219685f9845926b6_fk_customuser_customuser_id` (`created_by_id`),
  CONSTRAINT `topic_created_by_id_219685f9845926b6_fk_customuser_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `customuser_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics_topic`
--

LOCK TABLES `topics_topic` WRITE;
/*!40000 ALTER TABLE `topics_topic` DISABLE KEYS */;
INSERT INTO `topics_topic` VALUES (1,'Man in \"Advanced Stages\" of Terrorist Attack Arrested in France','http://gawker.com/man-in-advanced-stages-of-terrorist-attack-arrested-i-1766944769','2016-03-25 00:40:23.840349','static/image_zL13O3z.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--yhJEeFyV--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/icw0srtpprfsrs1hm7sr.jpg','national','1930',3,0,2),(2,'S.F.’s St. John Coltrane Church fights eviction','http://www.sfgate.com/bayarea/article/S-F-s-St-John-Coltrane-Church-fights-eviction-6838007.php','2016-03-26 17:45:37.004111','static/image_7sgjizJ.jpg','http://ww1.hdnux.com/photos/43/73/30/9418300/5/rawImage.jpg','local','94122',1,0,1),(3,'Georgia governor to veto LGBT bill','http://www.cnn.com/2016/03/28/us/georgia-north-carolina-lgbt-bills/index.html','2016-03-28 17:22:08.423106','static/image_HzD6Kc9.jpg','http://i2.cdn.turner.com/cnnnext/dam/assets/160328104001-01-nathan-deal-0328-large-169.jpg','national','30334',1,0,2),(4,'Trump Campaign Manager Charged for Alleged Battery of Reporter, in Police Custody','http://gawker.com/trump-campaign-manager-charged-for-alleged-battery-of-r-1767724403','2016-03-29 23:09:57.315386','static/image_S5QlVVY.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--zPZixuZx--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/pftdgemefsuratthrerp.gif','national','20500',0,1,2),(5,'Failed Candidate Ted Cruz Elbows Wife in Face','http://gawker.com/failed-candidate-ted-cruz-elbows-wife-in-face-1774591248','2016-05-10 19:59:51.453434','static/image_89IpRbj.jpg','https://i.kinja-img.com/gawker-media/image/upload/s--GuipJpun--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/zmpzlbznqej5i6cflyhu.gif','national','20202',0,0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updown_vote`
--

LOCK TABLES `updown_vote` WRITE;
/*!40000 ALTER TABLE `updown_vote` DISABLE KEYS */;
INSERT INTO `updown_vote` VALUES (1,8,1,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-03-25 00:40:33.939896','2016-03-25 00:40:49.871702'),(2,8,1,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-03-25 00:41:03.703424','2016-03-25 00:41:03.703449'),(3,8,1,'2c5504ab9a86164db22a92dc8793843d',1,3,'127.0.0.1','2016-03-25 00:42:11.097118','2016-03-25 00:42:11.097144'),(4,9,2,'2c5504ab9a86164db22a92dc8793843d',1,3,'127.0.0.1','2016-03-25 00:44:35.018806','2016-03-25 00:44:48.854578'),(5,9,1,'2c5504ab9a86164db22a92dc8793843d',-1,3,'127.0.0.1','2016-03-25 00:44:36.055632','2016-03-25 00:44:49.775826'),(6,9,2,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-03-25 00:45:11.647318','2016-03-25 00:45:11.647340'),(7,9,1,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-03-25 00:45:12.650346','2016-03-25 00:45:12.650369'),(8,9,3,'2c5504ab9a86164db22a92dc8793843d',1,1,'127.0.0.1','2016-03-26 17:46:35.656612','2016-03-26 17:46:35.656655'),(9,9,4,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-03-28 17:23:43.244154','2016-03-28 17:23:43.244189'),(10,8,2,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-03-28 17:39:51.062606','2016-03-28 17:39:51.062638'),(11,8,3,'2c5504ab9a86164db22a92dc8793843d',1,2,'127.0.0.1','2016-03-28 17:39:51.656725','2016-03-28 17:39:51.656747'),(12,9,5,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-03-29 23:11:17.182660','2016-03-29 23:11:17.182711'),(13,8,4,'2c5504ab9a86164db22a92dc8793843d',-1,2,'127.0.0.1','2016-03-29 23:11:21.648724','2016-03-29 23:12:02.786402'),(14,8,4,'2c5504ab9a86164db22a92dc8793843d',-1,1,'127.0.0.1','2016-03-29 23:11:35.290050','2016-03-29 23:12:06.859533');
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

-- Dump completed on 2016-05-10 17:20:49
