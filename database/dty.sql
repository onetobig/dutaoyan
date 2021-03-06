-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: dty
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Current Database: `dty`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dty` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dty`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'日常','日常生活','2018-11-27 10:21:33','2018-11-27 06:49:34'),(2,NULL,1,'技术','技术分享','2018-11-27 10:21:33','2018-11-27 07:15:41'),(3,NULL,1,'思考','蛋疼思考','2018-11-27 06:50:07','2018-11-27 07:16:11');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','名称',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','密码',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','创建于',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','创建于',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','头像',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','角色',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','语言',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(14,2,'name','text','名称',1,1,1,1,1,1,NULL,2),(15,2,'created_at','timestamp','创建于',0,0,0,0,0,0,NULL,3),(16,2,'updated_at','timestamp','创建于',0,0,0,0,0,0,NULL,4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','名称',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','创建于',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','创建于',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','显示名称',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','角色',1,1,1,1,1,1,NULL,9),(23,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(24,4,'parent_id','select_dropdown','父',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(25,4,'order','text','排序',1,1,1,1,1,1,'{\"default\":1}',3),(26,4,'name','text','名称',1,1,1,1,1,1,NULL,4),(27,4,'slug','text','别名',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(28,4,'created_at','timestamp','创建于',0,0,1,0,0,0,NULL,6),(29,4,'updated_at','timestamp','更新于',0,0,0,0,0,0,NULL,7),(30,5,'id','number','ID',1,0,0,0,0,0,'{}',1),(31,5,'author_id','text','作者',1,0,1,1,0,1,'{}',2),(32,5,'category_id','text','分类目录',0,0,1,1,1,0,'{}',3),(33,5,'title','text','标题',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"\\u6807\\u9898 \\u4e0d\\u80fd\\u4e3a\\u7a7a\"}}}',4),(34,5,'excerpt','text_area','摘要',0,0,1,1,1,1,'{}',5),(35,5,'body','rich_text_box','主体内容',1,0,1,1,1,1,'{\"validation\":{\"rule\":\"required\"}}',6),(36,5,'image','image','文章图像',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(37,5,'slug','text','别名',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"required|unique:posts,slug\"}}',8),(38,5,'meta_description','text_area','Meta Description',0,0,1,1,1,1,'{}',9),(39,5,'meta_keywords','text_area','Meta Keywords',0,0,1,1,1,1,'{}',10),(40,5,'status','select_dropdown','状态',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(41,5,'created_at','timestamp','创建于',0,1,1,0,0,0,'{}',12),(42,5,'updated_at','timestamp','更新于',0,0,0,0,0,0,'{}',13),(43,5,'seo_title','text','SEO Title',0,1,1,1,1,1,'{}',14),(44,5,'featured','checkbox','特色',1,1,1,1,1,1,'{}',15),(45,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(46,6,'author_id','text','作者',1,0,0,0,0,0,NULL,2),(47,6,'title','text','标题',1,1,1,1,1,1,NULL,3),(48,6,'excerpt','text_area','摘要',1,0,1,1,1,1,NULL,4),(49,6,'body','rich_text_box','主体内容',1,0,1,1,1,1,NULL,5),(50,6,'slug','text','别名',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(51,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(52,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(53,6,'status','select_dropdown','状态',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(54,6,'created_at','timestamp','创建于',1,1,1,0,0,0,NULL,10),(55,6,'updated_at','timestamp','更新于',1,0,0,0,0,0,NULL,11),(56,6,'image','image','文章图像',0,1,1,1,1,1,NULL,12);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','用户','用户','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2018-11-27 10:21:32','2018-11-27 10:21:32'),(2,'menus','menus','菜单','菜单','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2018-11-27 10:21:32','2018-11-27 10:21:32'),(3,'roles','roles','角色','角色','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2018-11-27 10:21:32','2018-11-27 10:21:32'),(4,'categories','categories','分类','分类','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(5,'posts','posts','文章','文章','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null}','2018-11-27 10:21:33','2018-11-27 05:59:46'),(6,'pages','pages','页面','页面','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'控制面板','','_self','voyager-boat',NULL,NULL,1,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.dashboard',NULL),(2,1,'媒体','','_self','voyager-images',NULL,NULL,5,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.media.index',NULL),(3,1,'用户','','_self','voyager-person',NULL,NULL,3,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.users.index',NULL),(4,1,'角色','','_self','voyager-lock',NULL,NULL,2,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.roles.index',NULL),(5,1,'工具','','_self','voyager-tools',NULL,NULL,9,'2018-11-27 10:21:33','2018-11-27 10:21:33',NULL,NULL),(6,1,'菜单管理','','_self','voyager-list',NULL,5,10,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.menus.index',NULL),(7,1,'数据库','','_self','voyager-data',NULL,5,11,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.database.index',NULL),(8,1,'指南针','','_self','voyager-compass',NULL,5,12,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.bread.index',NULL),(10,1,'设置','','_self','voyager-settings',NULL,NULL,14,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.settings.index',NULL),(11,1,'分类','','_self','voyager-categories',NULL,NULL,8,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.categories.index',NULL),(12,1,'文章','','_self','voyager-news',NULL,NULL,6,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.posts.index',NULL),(13,1,'页面','','_self','voyager-file-text',NULL,NULL,7,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.pages.index',NULL),(14,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2018-11-27 10:21:33','2018-11-27 10:21:33','voyager.hooks',NULL),(15,2,'日常','','_self',NULL,'#000000',NULL,15,'2018-11-27 10:37:57','2018-11-27 07:05:45','posts.index','{\"category\":1}'),(16,2,'技术分享','','_self','voyager-tools','#000000',NULL,16,'2018-11-27 07:07:04','2018-11-27 07:07:04','posts.index','{\"category\":2}'),(17,2,'蛋疼思考','','_self',NULL,'#000000',NULL,17,'2018-11-27 07:08:27','2018-11-27 07:08:27','posts.index','{\"category\":3}');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2018-11-27 10:21:33','2018-11-27 10:21:33'),(2,'front','2018-11-27 10:37:10','2018-11-27 10:38:47');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(17,'2017_03_06_000000_add_controller_to_data_types_table',1),(18,'2017_04_11_000000_alter_post_nullable_fields_table',1),(19,'2017_04_21_000000_add_order_to_data_rows_table',1),(20,'2017_07_05_210000_add_policyname_to_data_types_table',1),(21,'2017_08_05_000000_add_group_to_settings_table',1),(22,'2017_11_26_013050_add_user_role_relationship',1),(23,'2017_11_26_015000_create_user_roles_table',1),(24,'2018_03_11_000000_add_user_settings',1),(25,'2018_03_14_000000_add_details_to_data_types_table',1),(26,'2018_03_16_000000_make_settings_value_nullable',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2018-11-27 10:21:33','2018-11-27 10:21:33');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(2,'browse_bread',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(3,'browse_database',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(4,'browse_media',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(5,'browse_compass',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33'),(6,'browse_menus','menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(7,'read_menus','menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(8,'edit_menus','menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(9,'add_menus','menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(10,'delete_menus','menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(11,'browse_roles','roles','2018-11-27 10:21:33','2018-11-27 10:21:33'),(12,'read_roles','roles','2018-11-27 10:21:33','2018-11-27 10:21:33'),(13,'edit_roles','roles','2018-11-27 10:21:33','2018-11-27 10:21:33'),(14,'add_roles','roles','2018-11-27 10:21:33','2018-11-27 10:21:33'),(15,'delete_roles','roles','2018-11-27 10:21:33','2018-11-27 10:21:33'),(16,'browse_users','users','2018-11-27 10:21:33','2018-11-27 10:21:33'),(17,'read_users','users','2018-11-27 10:21:33','2018-11-27 10:21:33'),(18,'edit_users','users','2018-11-27 10:21:33','2018-11-27 10:21:33'),(19,'add_users','users','2018-11-27 10:21:33','2018-11-27 10:21:33'),(20,'delete_users','users','2018-11-27 10:21:33','2018-11-27 10:21:33'),(21,'browse_settings','settings','2018-11-27 10:21:33','2018-11-27 10:21:33'),(22,'read_settings','settings','2018-11-27 10:21:33','2018-11-27 10:21:33'),(23,'edit_settings','settings','2018-11-27 10:21:33','2018-11-27 10:21:33'),(24,'add_settings','settings','2018-11-27 10:21:33','2018-11-27 10:21:33'),(25,'delete_settings','settings','2018-11-27 10:21:33','2018-11-27 10:21:33'),(26,'browse_categories','categories','2018-11-27 10:21:33','2018-11-27 10:21:33'),(27,'read_categories','categories','2018-11-27 10:21:33','2018-11-27 10:21:33'),(28,'edit_categories','categories','2018-11-27 10:21:33','2018-11-27 10:21:33'),(29,'add_categories','categories','2018-11-27 10:21:33','2018-11-27 10:21:33'),(30,'delete_categories','categories','2018-11-27 10:21:33','2018-11-27 10:21:33'),(31,'browse_posts','posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(32,'read_posts','posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(33,'edit_posts','posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(34,'add_posts','posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(35,'delete_posts','posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(36,'browse_pages','pages','2018-11-27 10:21:33','2018-11-27 10:21:33'),(37,'read_pages','pages','2018-11-27 10:21:33','2018-11-27 10:21:33'),(38,'edit_pages','pages','2018-11-27 10:21:33','2018-11-27 10:21:33'),(39,'add_pages','pages','2018-11-27 10:21:33','2018-11-27 10:21:33'),(40,'delete_pages','pages','2018-11-27 10:21:33','2018-11-27 10:21:33'),(41,'browse_hooks',NULL,'2018-11-27 10:21:33','2018-11-27 10:21:33');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,1,1,'焘彦的手画收支表一张',NULL,'焘彦手画收支表一张','<p>收支表一张</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://dutaoyan.com/storage/taoyan/JcXoDqoIlQTCYKVcCKC9rZ95H6qdGXDDOWgHtSps.jpeg\" width=\"800\" /></p>\r\n<p>&nbsp;</p>','posts/November2018/wEWTFUF5CT12PDiY105o.png','收支表',NULL,NULL,'PUBLISHED',1,'2018-11-27 03:13:15','2018-11-27 05:55:21'),(6,1,1,'昨天下大雨',NULL,'下大雨，挤公交，不舍焘彦以后遭遇','<p>&nbsp;</p>\r\n<p>昨天下大雨，公交很挤。想到焘彦以后可能也要跟我一样挤公交，心疼不舍。</p>','posts/November2018/jAPN0i28Rkx9i98i83BS.gif','rain-hard',NULL,NULL,'PUBLISHED',0,'2018-11-27 03:23:10','2018-11-27 07:09:42'),(7,1,3,'蛋疼思考1：如果一年后还拿着这样的工资能接受吗?',NULL,NULL,'<p>如果一年后还拿着现在的工资能接受吗？不能接受的话，就现在开始马不停蹄的学习吧！</p>',NULL,'if-i-can-accept-the-same-salary-one-year-later',NULL,NULL,'PUBLISHED',0,'2018-11-27 07:14:59','2018-11-27 07:51:01'),(8,1,1,'我的书',NULL,NULL,'<h2>精装书和平装书</h2>\r\n<p>《莎士比亚》朱生豪译 平装</p>\r\n<p>《汪曾祺全集》 精装</p>\r\n<p>《史记》 精装</p>\r\n<p>《三毛集》 平装</p>\r\n<p>《朱子读书法》《小仓山房尺牍》 浙江人民美术出版社 平装</p>\r\n<p>《皮囊》精装</p>\r\n<p>《茶花女》林纾译 精装</p>\r\n<p>《春秋左传》平装</p>\r\n<p>《孟子正义》广陵书社 精装</p>\r\n<p>《论语译注》杨伯峻 平装</p>\r\n<p>《耕堂劫后十种》孙犁 精装</p>\r\n<p>《一生可以读多少书》范福潮 精装（印刷不好）</p>\r\n<p>《古诗源》中华书局 繁体竖排</p>\r\n<p>&nbsp;</p>','posts/November2018/Bt6SyK6sxv6tqEdLc63Q.jpg','my-books',NULL,NULL,'PUBLISHED',0,'2018-11-28 06:06:14','2018-11-28 06:33:48');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2018-11-27 10:21:33','2018-11-27 10:21:33'),(2,'user','Normal User','2018-11-27 10:21:33','2018-11-27 10:21:33');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2018-11-27 10:21:33','2018-11-27 10:21:33'),(2,'data_types','display_name_singular',6,'pt','Página','2018-11-27 10:21:33','2018-11-27 10:21:33'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2018-11-27 10:21:33','2018-11-27 10:21:33'),(4,'data_types','display_name_singular',4,'pt','Categoria','2018-11-27 10:21:33','2018-11-27 10:21:33'),(5,'data_types','display_name_singular',2,'pt','Menu','2018-11-27 10:21:33','2018-11-27 10:21:33'),(6,'data_types','display_name_singular',3,'pt','Função','2018-11-27 10:21:33','2018-11-27 10:21:33'),(7,'data_types','display_name_plural',5,'pt','Posts','2018-11-27 10:21:33','2018-11-27 10:21:33'),(8,'data_types','display_name_plural',6,'pt','Páginas','2018-11-27 10:21:33','2018-11-27 10:21:33'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2018-11-27 10:21:33','2018-11-27 10:21:33'),(10,'data_types','display_name_plural',4,'pt','Categorias','2018-11-27 10:21:33','2018-11-27 10:21:33'),(11,'data_types','display_name_plural',2,'pt','Menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(12,'data_types','display_name_plural',3,'pt','Funções','2018-11-27 10:21:33','2018-11-27 10:21:33'),(13,'categories','slug',1,'pt','categoria-1','2018-11-27 10:21:33','2018-11-27 10:21:33'),(14,'categories','name',1,'pt','Categoria 1','2018-11-27 10:21:33','2018-11-27 10:21:33'),(15,'categories','slug',2,'pt','categoria-2','2018-11-27 10:21:33','2018-11-27 10:21:33'),(16,'categories','name',2,'pt','Categoria 2','2018-11-27 10:21:33','2018-11-27 10:21:33'),(17,'pages','title',1,'pt','Olá Mundo','2018-11-27 10:21:33','2018-11-27 10:21:33'),(18,'pages','slug',1,'pt','ola-mundo','2018-11-27 10:21:33','2018-11-27 10:21:33'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2018-11-27 10:21:33','2018-11-27 10:21:33'),(20,'menu_items','title',1,'pt','Painel de Controle','2018-11-27 10:21:33','2018-11-27 10:21:33'),(21,'menu_items','title',2,'pt','Media','2018-11-27 10:21:33','2018-11-27 10:21:33'),(22,'menu_items','title',12,'pt','Publicações','2018-11-27 10:21:33','2018-11-27 10:21:33'),(23,'menu_items','title',3,'pt','Utilizadores','2018-11-27 10:21:33','2018-11-27 10:21:33'),(24,'menu_items','title',11,'pt','Categorias','2018-11-27 10:21:33','2018-11-27 10:21:33'),(25,'menu_items','title',13,'pt','Páginas','2018-11-27 10:21:33','2018-11-27 10:21:33'),(26,'menu_items','title',4,'pt','Funções','2018-11-27 10:21:33','2018-11-27 10:21:33'),(27,'menu_items','title',5,'pt','Ferramentas','2018-11-27 10:21:33','2018-11-27 10:21:33'),(28,'menu_items','title',6,'pt','Menus','2018-11-27 10:21:33','2018-11-27 10:21:33'),(29,'menu_items','title',7,'pt','Base de dados','2018-11-27 10:21:33','2018-11-27 10:21:33'),(30,'menu_items','title',10,'pt','Configurações','2018-11-27 10:21:33','2018-11-27 10:21:33');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png','$2y$10$LzrhF450hACHCbg.DMBwU.iajtwq0/G.OtMlVZ2krg0/CVMk07P12','dE2vF83z9ozs8KgCXrdRordo6pD2DPqczMYBqmHG1VonuTAkS1sgcHdd97f5','{\"locale\":\"zh_CN\"}','2018-11-27 10:21:33','2018-11-27 10:36:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-06 14:13:13
