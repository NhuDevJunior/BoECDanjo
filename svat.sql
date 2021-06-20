-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: svat
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_at` datetime(6) NOT NULL,
  `view` int NOT NULL,
  `article_category_id` int NOT NULL,
  `thumbnail_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_category_id_365a0c8c_fk_article_category_id` (`article_category_id`),
  KEY `article_thumbnail_id_b2fce9c2_fk_media_id` (`thumbnail_id`),
  KEY `article_author_id_01185df5_fk_users_id` (`author_id`),
  CONSTRAINT `article_article_category_id_365a0c8c_fk_article_category_id` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  CONSTRAINT `article_author_id_01185df5_fk_users_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `article_thumbnail_id_b2fce9c2_fk_media_id` FOREIGN KEY (`thumbnail_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_en` longtext NOT NULL,
  `name_vi` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_language`
--

DROP TABLE IF EXISTS `article_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `content` longtext,
  `article_id` int NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_language_article_id_477922c1_fk_article_id` (`article_id`),
  KEY `article_language_language_id_64c5442c_fk_language_id` (`language_id`),
  CONSTRAINT `article_language_article_id_477922c1_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_language_language_id_64c5442c_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_language`
--

LOCK TABLES `article_language` WRITE;
/*!40000 ALTER TABLE `article_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_user'),(2,'Can change user',1,'change_user'),(3,'Can delete user',1,'delete_user'),(4,'Can view user',1,'view_user'),(5,'Can add article',2,'add_article'),(6,'Can change article',2,'change_article'),(7,'Can delete article',2,'delete_article'),(8,'Can view article',2,'view_article'),(9,'Can add article category',3,'add_articlecategory'),(10,'Can change article category',3,'change_articlecategory'),(11,'Can delete article category',3,'delete_articlecategory'),(12,'Can view article category',3,'view_articlecategory'),(13,'Can add import order',4,'add_importorder'),(14,'Can change import order',4,'change_importorder'),(15,'Can delete import order',4,'delete_importorder'),(16,'Can view import order',4,'view_importorder'),(17,'Can add language',5,'add_language'),(18,'Can change language',5,'change_language'),(19,'Can delete language',5,'delete_language'),(20,'Can view language',5,'view_language'),(21,'Can add media',6,'add_media'),(22,'Can change media',6,'change_media'),(23,'Can delete media',6,'delete_media'),(24,'Can view media',6,'view_media'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add product category',9,'add_productcategory'),(34,'Can change product category',9,'change_productcategory'),(35,'Can delete product category',9,'delete_productcategory'),(36,'Can view product category',9,'view_productcategory'),(37,'Can add product language',10,'add_productlanguage'),(38,'Can change product language',10,'change_productlanguage'),(39,'Can delete product language',10,'delete_productlanguage'),(40,'Can view product language',10,'view_productlanguage'),(41,'Can add product image',11,'add_productimage'),(42,'Can change product image',11,'change_productimage'),(43,'Can delete product image',11,'delete_productimage'),(44,'Can view product image',11,'view_productimage'),(45,'Can add order product',12,'add_orderproduct'),(46,'Can change order product',12,'change_orderproduct'),(47,'Can delete order product',12,'delete_orderproduct'),(48,'Can view order product',12,'view_orderproduct'),(49,'Can add import order product',13,'add_importorderproduct'),(50,'Can change import order product',13,'change_importorderproduct'),(51,'Can delete import order product',13,'delete_importorderproduct'),(52,'Can view import order product',13,'view_importorderproduct'),(53,'Can add article language',14,'add_articlelanguage'),(54,'Can change article language',14,'change_articlelanguage'),(55,'Can delete article language',14,'delete_articlelanguage'),(56,'Can view article language',14,'view_articlelanguage'),(57,'Can add message',15,'add_message'),(58,'Can change message',15,'change_message'),(59,'Can delete message',15,'delete_message'),(60,'Can view message',15,'view_message'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment'),(65,'Can add permission',17,'add_permission'),(66,'Can change permission',17,'change_permission'),(67,'Can delete permission',17,'delete_permission'),(68,'Can view permission',17,'view_permission'),(69,'Can add group',18,'add_group'),(70,'Can change group',18,'change_group'),(71,'Can delete group',18,'delete_group'),(72,'Can view group',18,'view_group'),(73,'Can add log entry',19,'add_logentry'),(74,'Can change log entry',19,'change_logentry'),(75,'Can delete log entry',19,'delete_logentry'),(76,'Can view log entry',19,'view_logentry'),(77,'Can add content type',20,'add_contenttype'),(78,'Can change content type',20,'change_contenttype'),(79,'Can delete content type',20,'delete_contenttype'),(80,'Can view content type',20,'view_contenttype'),(81,'Can add session',21,'add_session'),(82,'Can change session',21,'change_session'),(83,'Can delete session',21,'delete_session'),(84,'Can view session',21,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_product_id_62c0c379_fk_product_id` (`product_id`),
  KEY `comment_user_id_2224f9d1_fk_users_id` (`user_id`),
  CONSTRAINT `comment_product_id_62c0c379_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_user_id_2224f9d1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'sang',1,4,'2021-06-15 05:04:07.116404'),(2,'sang',1,4,'2021-06-15 05:04:09.204289'),(3,'sang',1,4,'2021-06-15 05:04:09.395552'),(4,'ok',1,7,'2021-06-15 13:22:07.781003');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (19,'admin','logentry'),(18,'auth','group'),(17,'auth','permission'),(20,'contenttypes','contenttype'),(2,'my_admin','article'),(3,'my_admin','articlecategory'),(14,'my_admin','articlelanguage'),(16,'my_admin','comment'),(4,'my_admin','importorder'),(13,'my_admin','importorderproduct'),(5,'my_admin','language'),(6,'my_admin','media'),(15,'my_admin','message'),(7,'my_admin','order'),(12,'my_admin','orderproduct'),(8,'my_admin','product'),(9,'my_admin','productcategory'),(11,'my_admin','productimage'),(10,'my_admin','productlanguage'),(1,'my_admin','user'),(21,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-13 12:55:05.526872'),(2,'contenttypes','0002_remove_content_type_name','2021-06-13 12:55:06.156391'),(3,'auth','0001_initial','2021-06-13 12:55:10.375600'),(4,'auth','0002_alter_permission_name_max_length','2021-06-13 12:55:11.462536'),(5,'auth','0003_alter_user_email_max_length','2021-06-13 12:55:11.500743'),(6,'auth','0004_alter_user_username_opts','2021-06-13 12:55:11.532496'),(7,'auth','0005_alter_user_last_login_null','2021-06-13 12:55:11.566211'),(8,'auth','0006_require_contenttypes_0002','2021-06-13 12:55:11.594898'),(9,'auth','0007_alter_validators_add_error_messages','2021-06-13 12:55:11.769732'),(10,'auth','0008_alter_user_username_max_length','2021-06-13 12:55:11.860603'),(11,'auth','0009_alter_user_last_name_max_length','2021-06-13 12:55:11.892282'),(12,'auth','0010_alter_group_name_max_length','2021-06-13 12:55:12.028455'),(13,'auth','0011_update_proxy_permissions','2021-06-13 12:55:12.097817'),(14,'auth','0012_alter_user_first_name_max_length','2021-06-13 12:55:12.137770'),(15,'my_admin','0001_initial','2021-06-13 12:55:38.644404'),(16,'admin','0001_initial','2021-06-13 12:55:40.884177'),(17,'admin','0002_logentry_remove_auto_add','2021-06-13 12:55:40.938588'),(18,'admin','0003_logentry_add_action_flag_choices','2021-06-13 12:55:40.984405'),(19,'my_admin','0002_auto_20210520_0035','2021-06-13 12:55:41.912885'),(20,'my_admin','0003_auto_20210523_0925','2021-06-13 12:55:42.211431'),(21,'my_admin','0004_auto_20210603_1820','2021-06-13 12:55:44.094379'),(22,'my_admin','0005_order_shipping_fee','2021-06-13 12:55:44.347422'),(23,'my_admin','0006_order_total','2021-06-13 12:55:44.517822'),(24,'my_admin','0007_order_total_products','2021-06-13 12:55:44.654170'),(25,'my_admin','0008_order_note','2021-06-13 12:55:44.753668'),(26,'my_admin','0004_auto_20210604_2316','2021-06-13 12:55:44.995878'),(27,'my_admin','0004_auto_20210603_1500','2021-06-13 12:55:46.739534'),(28,'my_admin','0009_merge_20210605_2317','2021-06-13 12:55:46.774693'),(29,'my_admin','0009_merge_0004_auto_20210603_1500_0008_order_note','2021-06-13 12:55:46.812612'),(30,'my_admin','0010_merge_20210607_2326','2021-06-13 12:55:46.839540'),(31,'my_admin','0011_comment','2021-06-13 12:55:49.542999'),(32,'my_admin','0012_comment_created','2021-06-13 12:55:50.051235'),(33,'sessions','0001_initial','2021-06-13 12:55:50.541475');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_order`
--

DROP TABLE IF EXISTS `import_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_order_user_id_1339f1d9_fk_users_id` (`user_id`),
  CONSTRAINT `import_order_user_id_1339f1d9_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_order`
--

LOCK TABLES `import_order` WRITE;
/*!40000 ALTER TABLE `import_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_order_product`
--

DROP TABLE IF EXISTS `import_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `import_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_order_product_import_order_id_793591da_fk_import_order_id` (`import_order_id`),
  KEY `import_order_product_product_id_660eb6c0_fk_product_id` (`product_id`),
  CONSTRAINT `import_order_product_import_order_id_793591da_fk_import_order_id` FOREIGN KEY (`import_order_id`) REFERENCES `import_order` (`id`),
  CONSTRAINT `import_order_product_product_id_660eb6c0_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_order_product`
--

LOCK TABLES `import_order_product` WRITE;
/*!40000 ALTER TABLE `import_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Vietnamese','vi'),(2,'English','en'),(3,'Vietnamese','vi'),(4,'English','en');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_path` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'uploads\\1623733423.7148535.vietnamflag.jpg'),(2,'uploads\\1623820178.5747616.1.jpg'),(3,'uploads\\1623839824.9749463.product2.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `email` varchar(256) NOT NULL,
  `message` varchar(256) NOT NULL,
  `status` int NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Nhu','hancongnhu1999@gmail.com','hệ thống không phản hồi mấy thế',0,'2021-06-16 11:31:52.411720'),(2,'Nhu','hancongnhu1999@gmail.com','hệ thống không phản hồi mấy thế',0,'2021-06-16 11:31:54.545191');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone_number` varchar(256) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `name` longtext NOT NULL,
  `status` int NOT NULL,
  `shipping_fee` int NOT NULL,
  `total` int NOT NULL,
  `total_products` int NOT NULL,
  `note` longtext,
  PRIMARY KEY (`id`),
  KEY `order_user_id_e323497c_fk_users_id` (`user_id`),
  CONSTRAINT `order_user_id_e323497c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Hà Đông','hancongnhu1999@gmail.com','0389681657',NULL,'2021-06-17 03:00:47.762063','nhu',0,0,50000,50000,''),(2,'Hà Đông','hancongnhu1999@gmail.com','0389681657',NULL,'2021-06-17 03:00:45.730801','nhu',0,0,50000,50000,'');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_f65b4f18_fk_order_id` (`order_id`),
  KEY `order_product_product_id_53139cb6_fk_product_id` (`product_id`),
  CONSTRAINT `order_product_order_id_f65b4f18_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_product_product_id_53139cb6_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,1,2),(2,1,2,2);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cost` decimal(20,2) NOT NULL,
  `quantity` int NOT NULL,
  `view` int NOT NULL,
  `des` longtext NOT NULL,
  `product_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_category_id_1ba01076_fk_product_category_id` (`product_category_id`),
  CONSTRAINT `product_product_category_id_1ba01076_fk_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,50000.00,0,0,'',1),(2,50000.00,0,0,'',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_en` longtext NOT NULL,
  `name_vi` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'curriculum','Giáo trình'),(2,'Comic','Truyện tranh'),(3,'Novel','Tiểu thuyết');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_image_media_id_05f1fd0a_fk_media_id` (`media_id`),
  KEY `product_image_product_id_8b9355c5_fk_product_id` (`product_id`),
  CONSTRAINT `product_image_media_id_05f1fd0a_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `product_image_product_id_8b9355c5_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,1),(3,3,2);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_language`
--

DROP TABLE IF EXISTS `product_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `des` longtext,
  `language_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_language_language_id_4b9b66ad_fk_language_id` (`language_id`),
  KEY `product_language_product_id_7c23486b_fk_product_id` (`product_id`),
  CONSTRAINT `product_language_language_id_4b9b66ad_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `product_language_product_id_7c23486b_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_language`
--

LOCK TABLES `product_language` WRITE;
/*!40000 ALTER TABLE `product_language` DISABLE KEYS */;
INSERT INTO `product_language` VALUES (1,'Giải tích','<p>Rất hay</p>\n',1,1),(2,' Caculus','<p>a</p>\n',2,1),(3,'Đại số','<p>tốt</p>\n',1,2),(4,'algebra','<p>good</p>\n',2,2);
/*!40000 ALTER TABLE `product_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` longtext NOT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `address` longtext,
  `phone_number` longtext,
  `note` longtext,
  `role` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  `is_verify` int DEFAULT NULL,
  `verified_token` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `users_avatar_id_34367965` (`avatar_id`),
  CONSTRAINT `users_avatar_id_34367965_fk_media_id` FOREIGN KEY (`avatar_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=',NULL,0,'user@svat.com','','',0,1,'2021-06-15 15:45:01.894631',1,'user@svat.com','user',NULL,NULL,'',NULL,NULL,1,NULL,1,NULL),('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=','2021-06-15 15:48:58.618401',1,'admin@svat.com','','',1,1,'2021-06-15 15:45:01.894631',2,'admin@svat.com','admin',NULL,NULL,'',NULL,NULL,10,NULL,1,NULL),('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=',NULL,1,'admin_lvl2@svat.com','','',1,1,'2021-06-15 15:45:01.894631',3,'admin_lvl2@svat.com','admin_2',NULL,NULL,'',NULL,NULL,11,NULL,1,NULL),('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=','2021-06-16 11:32:19.213508',1,'admin_lvl3@svat.com','','',1,1,'2021-06-15 15:45:01.910255',4,'admin_lvl3@svat.com','admin_3',NULL,NULL,'',NULL,NULL,12,NULL,1,NULL),('pbkdf2_sha256$260000$puU6LsccxMQRqUe2BwKxiU$u5UPXPoFw5InHcOPpnyGy1crbvXKHR4QU6kd0M+yTeg=',NULL,0,'nhuhc@zent.vn','','',0,1,'2021-06-15 13:17:41.146317',6,'nhuhc@zent.vn','nhu',NULL,NULL,'','0389681657',NULL,1,NULL,0,'deXPNHyC6oN0w0Q9hDtYBihkteNEW4SQ'),('pbkdf2_sha256$260000$i3qEx6xVg89RWnRLJpq32G$7BLAaGqtfg5aTIaXyrzz/eRCJ5AmZck+F8R8/8VYBek=','2021-06-16 11:30:58.870303',0,'hancongnhu1999@gmail.com','','',0,1,'2021-06-15 13:19:35.429815',7,'hancongnhu1999@gmail.com','nhuok',NULL,NULL,'','0334545544',NULL,1,NULL,1,'qwZYDUDi9kdwe55cEQ22V4uqXHmxZo73');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-20  8:08:47
