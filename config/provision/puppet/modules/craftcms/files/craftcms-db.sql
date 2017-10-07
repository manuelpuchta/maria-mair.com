-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: craftcms
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `craft_assetfiles`
--

DROP TABLE IF EXISTS `craft_assetfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfiles`
--

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;
INSERT INTO `craft_assetfiles` VALUES (8,1,1,'maria-portrait.jpg','image',842,1123,206339,'2017-10-06 20:19:16','2017-10-06 20:19:16','2017-10-06 20:19:16','72e20c31-30bc-45de-abe1-ae1f6afc9c23');
/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetfolders`
--

DROP TABLE IF EXISTS `craft_assetfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfolders`
--

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;
INSERT INTO `craft_assetfolders` VALUES (1,NULL,1,'Bilder','','2017-08-12 17:15:44','2017-08-12 17:15:44','9f08331c-abc0-4e05-91cd-a9ac00edf77d'),(2,NULL,NULL,'Temporary source',NULL,'2017-08-12 17:15:50','2017-08-12 17:15:50','0068f79f-9273-44ac-b35b-64403cd666c0'),(3,2,NULL,'user_1','user_1/','2017-08-12 17:15:50','2017-08-12 17:15:50','d92c75d9-4b9e-43c0-8c8e-5ca2c146c377'),(4,3,NULL,'field_15','user_1/field_15/','2017-08-12 17:15:51','2017-08-12 17:15:51','f53954b9-e3c0-4e80-9020-0b6d25031e0d');
/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetsources`
--

DROP TABLE IF EXISTS `craft_assetsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetsources`
--

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;
INSERT INTO `craft_assetsources` VALUES (1,'Bilder','bilder','Local','{\"path\":\"images\\/\",\"publicURLs\":\"1\",\"url\":\"http:\\/\\/development.maria-mair.com\\/images\\/\"}',1,9,'2017-08-12 17:15:44','2017-08-12 17:48:07','89a309ae-e882-40d5-8c89-bafd0f7c1f59');
/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_i18n`
--

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_i18n`
--

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_portfolio` text COLLATE utf8_unicode_ci,
  `field_ueberMaria` text COLLATE utf8_unicode_ci,
  `field_footer` text COLLATE utf8_unicode_ci,
  `field_lektorat` text COLLATE utf8_unicode_ci,
  `field_korrektorat` text COLLATE utf8_unicode_ci,
  `field_uebersetzung` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-08 20:12:47','2017-08-12 16:03:22','ca1df5f3-70d7-411f-9d2d-55d6f9e9326c'),(2,2,'de','Maria Mair','<ul><li><strong>Stilistische Redaktion</strong> für SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags für New Adult Fantasy. <a href=\"https://www.carlsen.de/epub/snowfyre-elfe-aus-eis/83006#\">https://www.carlsen.de/epub/snowfyre-elfe-aus-eis/83006#</a></li><li><strong>Lektorat</strong> (Inhalt und stilistische Redaktion, einschließlich Autorenkommunikation) für Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags für Paranormal Romance, Coming of Age und New Adult. <a href=\"https://www.carlsen.de/epub/winterzauber-in-new-york/84930\">https://www.carlsen.de/epub/wi...</a></li><li><strong>Korrektorat</strong> von Sachtexten für den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen für andere Formate anbietet – seit Februar 2017. <a href=\"https://quayou.de/\">https://quayou.de/</a></li><li><strong>Korrektorat</strong> verschiedener Artikel und Texte für die Technische Universität Wien – im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair. <a href=\"http://www.gbl.tuwien.ac.at/Archiv/personen.html?name=Eva_Mair\">http://www.gbl.tuwien.ac.at/Ar...</a></li><li><strong>Korrektorat</strong> verschiedener Artikel für die feministische Online-Plattform TRUST THE GIRLS. <a href=\"http://trustthegirls.org/2017/03/angezogen-und-angelogen/\">http://trustthegirls.org/2017/...</a></li><li>Kleinere Textarbeiten, wie das <strong>Korrektorat</strong> von Drehbüchern, E-Mails, etc. und die Erstellung einer <strong>Pressemappe</strong>, für die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt. <a href=\"http://dok.at/film/fang-den-haider/\">http://dok.at/film/fang-den-ha...</a></li><li><strong>Korrektorat</strong> für den Druck des Theaterstücks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgeführt im April 2010 im Dschungel Wien.</li></ul>','<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region Südtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenfächern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zurückgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend überstanden.</p>\n<p>Lesende Haltung und dazugehöriger Sessel sind fünf Jahre später mit mir nach Hamburg weitergezogen, wo der Master in Deutschsprachige Literaturen mit Schwerpunkt Neuere Deutsche Literatur folgte. Wenn ich gerade nicht lese, findet man mich auf Hamburger Fahrradwegen, an Kletterwänden, in Kino- und Theatersälen oder der Kneipe nebenan.</p>','<ul><li>Maria Mair</li><li>Freie Lektorin</li><li>Oelkersallee 58, 22769 Hamburg</li><li>+49 152 269 423 62 - <a href=\"mailto:info@maria-mair.com\">info@maria-mair.com</a></li></ul>','<p>Ich suche nach guten Geschichten und nach jenen, die sie erzählen können. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination für Sprache und ihren Möglichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder auf Buchseiten und dann auch noch hin bis zu zeitlich und räumlich entfernten Leser*innen? Diese Frage stellt man sich bei Grenzerfahrungen, aber auch bei schönen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Schönheit der Sprache und jenen Menschen, die sowohl Talent für sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Rechercheführerin beistehen.</p>\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten und anderen Fachtexten.</p>','<p>Mein tägliches Brot verdiene ich auf der Suche nach Flüchtigkeitsfehlern, Verständnisfallen und grammatikalischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverlässig.</p>','<p>Ich spreche, lese und schreibe fließend Italienisch und Englisch und kann so auch bei Übersetzungsfragen beistehen und Übersetzungen in die deutsche Zielsprache übernehmen.</p>','2017-08-08 20:12:49','2017-10-06 20:19:57','60dcab3e-db61-4aa3-81a3-c0d33cf13cdd'),(8,8,'de','Maria Mair',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-06 20:19:16','2017-10-06 20:19:35','137420c8-f5ee-4dfd-8d67-066742ea5db5');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elementindexsettings`
--

DROP TABLE IF EXISTS `craft_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,'User',1,0,'2017-08-08 20:12:47','2017-08-12 16:03:22','04fd3da1-be0b-4f7c-b054-a4ca6aa9132f'),(2,'Entry',1,0,'2017-08-08 20:12:49','2017-10-06 20:19:57','16c15471-f7fe-42b7-925f-4e848de6441d'),(8,'Asset',1,0,'2017-10-06 20:19:16','2017-10-06 20:19:35','836ef0a1-d6f4-4c98-8371-4b90a1591b86');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_i18n`
--

DROP TABLE IF EXISTS `craft_elements_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_i18n`
--

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;
INSERT INTO `craft_elements_i18n` VALUES (1,1,'de','',NULL,1,'2017-08-08 20:12:47','2017-08-12 16:03:22','5e0287af-7333-452c-a7ab-f09b5ca4e7fd'),(2,2,'de','homepage','__home__',1,'2017-08-08 20:12:49','2017-10-06 20:19:58','823d481c-6299-43f5-8274-ac340a9e5d86'),(5,8,'de','maria-portrait',NULL,1,'2017-10-06 20:19:16','2017-10-06 20:19:35','eb9d42de-8f26-49b2-9213-2895161624e7');
/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_emailmessages`
--

DROP TABLE IF EXISTS `craft_emailmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_emailmessages`
--

LOCK TABLES `craft_emailmessages` WRITE;
/*!40000 ALTER TABLE `craft_emailmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_emailmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (2,1,NULL,NULL,'2017-08-08 20:12:49',NULL,'2017-08-08 20:12:49','2017-10-06 20:19:58','16f9d870-484c-47c0-a949-36c2e52db81f');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrydrafts`
--

DROP TABLE IF EXISTS `craft_entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,14,'Homepage','homepage',1,'Seitentitel',NULL,1,'2017-08-08 20:12:49','2017-09-25 20:26:22','71480dc7-afaf-4c7e-9263-06af64f8b50e');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entryversions`
--

DROP TABLE IF EXISTS `craft_entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
INSERT INTO `craft_entryversions` VALUES (1,2,1,1,'de',1,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-08-08 20:12:49','2017-08-08 20:12:49','46a3e130-b6ca-474b-ba4c-3b307b153b14'),(2,2,1,1,'de',2,NULL,'{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Development.maria-mair.com!\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":\"1\",\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Development.maria-mair.com will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}','2017-08-08 20:12:49','2017-08-08 20:12:49','c2c8c06b-35c2-452a-8326-cb40ab30a795'),(4,2,1,1,'de',3,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Development.maria-mair.com will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}','2017-08-12 16:29:15','2017-08-12 16:29:15','8ffea636-e78e-41fa-878f-23921b0eea18'),(5,2,1,1,'de',4,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"14\":\"Hallo\",\"15\":\"\",\"17\":\"\",\"6\":\"\",\"7\":\"\",\"10\":\"\",\"11\":\"\",\"8\":\"\",\"9\":\"\",\"16\":\"\",\"12\":\"\",\"13\":\"\"}}','2017-08-12 17:47:04','2017-08-12 17:47:04','aa3121b5-4d6b-4494-a1b2-4575a30d8fd6'),(6,2,1,1,'de',5,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"14\":\"Maria Mair\",\"15\":\"\",\"17\":\"\",\"6\":\"Die Lektorin\",\"7\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p><p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\",\"10\":\"\",\"11\":\"\",\"8\":\"\",\"9\":\"\",\"16\":\"\",\"12\":\"\",\"13\":\"\"}}','2017-08-12 17:57:46','2017-08-12 17:57:46','4a19ecae-c38c-4cb4-99ef-be4adeb39def'),(7,2,1,1,'de',6,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"14\":\"Maria Mair\",\"15\":\"\",\"17\":\"\",\"6\":\"Die Lektorin\",\"7\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\",\"10\":\"Korrektorat\",\"11\":\"<p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"8\":\"Lektorat\",\"9\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p><p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p>\",\"16\":\"\",\"12\":\"\\u00dcbersetzung\",\"13\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p><p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf <a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><br><\\/p>\"}}','2017-08-12 18:00:32','2017-08-12 18:00:32','0fd51669-04d0-45ae-bd82-fbeb0de24bd1'),(8,2,1,1,'de',7,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"14\":\"Maria Mair\",\"15\":\"\",\"17\":\"<ul><li><strong>Stilistische Redaktion<\\/strong> f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy. <a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong> (Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult. <a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017. <a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong> verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair. <a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS. <a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das <strong>Korrektorat<\\/strong> von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer <strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt. <a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"6\":\"Die Lektorin\",\"7\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\",\"10\":\"Korrektorat\",\"11\":\"<p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"8\":\"Lektorat\",\"9\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p>\",\"16\":\"Bisherige Auftr\\u00e4ge\",\"12\":\"\\u00dcbersetzung\",\"13\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p>\\r\\n<p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf <a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><br><\\/p>\"}}','2017-08-12 18:03:24','2017-08-12 18:03:24','0d2b1f08-e421-41b5-84e4-354d2c7fffbb'),(9,2,1,1,'de',8,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"14\":\"Maria Mair\",\"15\":[\"7\"],\"17\":\"<ul><li><strong>Stilistische Redaktion<\\/strong> f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy. <a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong> (Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult. <a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017. <a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong> verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair. <a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS. <a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das <strong>Korrektorat<\\/strong> von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer <strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt. <a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong> fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"6\":\"Die Lektorin\",\"7\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\",\"10\":\"Korrektorat\",\"11\":\"<p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"8\":\"Lektorat\",\"9\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p>\",\"16\":\"Bisherige Auftr\\u00e4ge\",\"12\":\"\\u00dcbersetzung\",\"13\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p>\\r\\n<p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf <a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><br><\\/p>\"}}','2017-08-13 19:42:14','2017-08-13 19:42:14','bda407a0-4869-4ce2-8969-fcaee8e5b423'),(10,2,1,1,'de',9,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"18\":\"<ul><li><b>Stilistische Redaktion<\\/b>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><b>Lektorat<\\/b>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><b>Korrektorat<\\/b>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><b>Korrektorat<\\/b>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><b>Korrektorat<\\/b>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<b>Korrektorat<\\/b>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<b>Pressemappe<\\/b>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><b>Korrektorat<\\/b>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"19\":\"<h2>Die Lektorin<\\/h2><p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p><h2>Lektorat<\\/h2><p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p><h2>Korrektorat<\\/h2><p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p><h2>\\u00dcbersetzung<\\/h2><p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p>\\r\\n<p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf&nbsp;<a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><\\/p>\"}}','2017-08-20 18:38:22','2017-08-20 18:38:22','f8b69eea-4c01-4790-905b-42f54b5734e9'),(11,2,1,1,'de',10,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"19\":\"<h2>Die Lektorin<\\/h2>\\r\\n<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\\r\\n<h2>Lektorat<\\/h2>\\r\\n<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p>\\r\\n<h2>Korrektorat<\\/h2>\\r\\n<p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\\r\\n<h2>\\u00dcbersetzung<\\/h2>\\r\\n<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p>\\r\\n<p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf&nbsp;<a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><\\/p>\"}}','2017-08-20 18:39:45','2017-08-20 18:39:45','82560a44-943b-4be3-971e-19844526e5ef'),(12,2,1,1,'de',11,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"20\":\"<p>Maria Mair<\\/p><p>Freie Lektorin<\\/p><p>Oelkersallee 58<\\/p><p>22769 Hamburg<\\/p><p>+49 152 269 423 62<\\/p><p><span><\\/span><a href=\\\"mailto:info@maria-mair.com\\\">info@maria-mair.com<\\/a><span><\\/span><\\/p>\",\"19\":\"<h2>Die Lektorin<\\/h2>\\r\\n<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden. Verlassen habe ich diese hin und wieder um Pflichtveranstaltungen an der Uni zu besuchen, in Bibliotheken unter schlechten Lichtern zu lesen oder \\u2013 neben den kulturell anderweitig wertvollen Kneipenbesuchen \\u2013 das Theater, das Kino oder kleine Konzerte aufzusuchen.&nbsp;<\\/p>\\r\\n<p>Die lesende Haltung und der dazugeh\\u00f6rige Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen wo der Master in Deutschsprachige Literaturen folgte, in dessen Verlauf ich mich vor allem mit Erinnerungskultur auseinandergesetzt habe.<\\/p>\\r\\n<h2>Lektorat<\\/h2>\\r\\n<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder von einem Menschen auf Buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und r\\u00e4umlich entfernten Leser*in? Diese Frage stellt man sich besonders schnell bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.&nbsp;<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten.<\\/p>\\r\\n<h2>Korrektorat<\\/h2>\\r\\n<p>Mein t\\u00e4gliches Brot verdiene ich sehr gerne auf der Suche nach Fl\\u00fcchtigkeitsfehler, Verst\\u00e4ndnisfallen und grammatischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\\r\\n<h2>\\u00dcbersetzung<\\/h2>\\r\\n<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in das Deutsche \\u00fcbernehmen.<\\/p>\\r\\n<p><em>Individuelle Preise divergieren je nach Texttyp und Anforderung und gibt es daher auf&nbsp;<a href=\\\"mailto:info@maria-mair.com\\\">Anfrage<\\/a>.<\\/em><\\/p>\"}}','2017-09-10 15:07:34','2017-09-10 15:07:34','7f294456-a02d-4d93-b558-30c03652ae42'),(13,2,1,1,'de',12,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"20\":\"<p>Maria Mair<\\/p>\\r\\n<p>Freie Lektorin<\\/p>\\r\\n<p>Oelkersallee 58,&nbsp;22769 Hamburg<\\/p>\\r\\n<p>+49 152 269 423 62<\\/p>\\r\\n<p><a href=\\\"mailto:info@maria-mair.com\\\">info@maria-mair.com<\\/a><\\/p>\",\"22\":\"<p>Mein t\\u00e4gliches Brot verdiene ich auf der Suche nach Fl\\u00fcchtigkeitsfehlern, Verst\\u00e4ndnisfallen und grammatikalischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"21\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder auf Buchseiten und dann auch noch hin bis zu zeitlich und r\\u00e4umlich entfernten Leser*innen? Diese Frage stellt man sich bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.<\\/p><p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten und anderen Fachtexten.<\\/p>\",\"19\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden.<\\/p><p>Lesende Haltung und dazugeh\\u00f6riger Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen, wo der Master in Deutschsprachige Literaturen mit Schwerpunkt Neuere Deutsche Literatur folgte. Wenn ich gerade nicht lese, findet man mich auf Hamburger Fahrradwegen, an Kletterw\\u00e4nden, in Kino- und Theaters\\u00e4len oder der Kneipe nebenan.<\\/p>\",\"23\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in die deutsche Zielsprache \\u00fcbernehmen.<\\/p>\"}}','2017-09-25 20:30:13','2017-09-25 20:30:13','0347d847-a262-4b50-b852-5bda1167be8c'),(14,2,1,1,'de',13,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"20\":\"<ul><li>Maria Mair<\\/li><li>Freie Lektorin<\\/li><li>Oelkersallee 58,&nbsp;22769 Hamburg<\\/li><li>+49 152 269 423 62<\\/li><li><a href=\\\"mailto:info@maria-mair.com\\\">info@maria-mair.com<\\/a><\\/li><\\/ul>\",\"22\":\"<p>Mein t\\u00e4gliches Brot verdiene ich auf der Suche nach Fl\\u00fcchtigkeitsfehlern, Verst\\u00e4ndnisfallen und grammatikalischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"21\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder auf Buchseiten und dann auch noch hin bis zu zeitlich und r\\u00e4umlich entfernten Leser*innen? Diese Frage stellt man sich bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten und anderen Fachtexten.<\\/p>\",\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"19\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden.<\\/p>\\r\\n<p>Lesende Haltung und dazugeh\\u00f6riger Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen, wo der Master in Deutschsprachige Literaturen mit Schwerpunkt Neuere Deutsche Literatur folgte. Wenn ich gerade nicht lese, findet man mich auf Hamburger Fahrradwegen, an Kletterw\\u00e4nden, in Kino- und Theaters\\u00e4len oder der Kneipe nebenan.<\\/p>\",\"23\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in die deutsche Zielsprache \\u00fcbernehmen.<\\/p>\"}}','2017-09-25 20:47:54','2017-09-25 20:47:54','a53cbf05-905e-4ba8-b067-399fe6d7e24c'),(15,2,1,1,'de',14,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"7\"],\"20\":\"<ul><li>Maria Mair<\\/li><li>Freie Lektorin<\\/li><li>Oelkersallee 58,&nbsp;22769 Hamburg<\\/li><li>+49 152 269 423 62 -&nbsp;<a href=\\\"mailto:info@maria-mair.com\\\" style=\\\"background-color: initial;\\\">info@maria-mair.com<\\/a><\\/li><\\/ul>\",\"22\":\"<p>Mein t\\u00e4gliches Brot verdiene ich auf der Suche nach Fl\\u00fcchtigkeitsfehlern, Verst\\u00e4ndnisfallen und grammatikalischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"21\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder auf Buchseiten und dann auch noch hin bis zu zeitlich und r\\u00e4umlich entfernten Leser*innen? Diese Frage stellt man sich bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten und anderen Fachtexten.<\\/p>\",\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"19\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden.<\\/p>\\r\\n<p>Lesende Haltung und dazugeh\\u00f6riger Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen, wo der Master in Deutschsprachige Literaturen mit Schwerpunkt Neuere Deutsche Literatur folgte. Wenn ich gerade nicht lese, findet man mich auf Hamburger Fahrradwegen, an Kletterw\\u00e4nden, in Kino- und Theaters\\u00e4len oder der Kneipe nebenan.<\\/p>\",\"23\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in die deutsche Zielsprache \\u00fcbernehmen.<\\/p>\"}}','2017-09-25 21:04:45','2017-09-25 21:04:45','7957c338-4e1c-452b-a806-1793d9c80940'),(16,2,1,1,'de',15,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Maria Mair\",\"slug\":\"homepage\",\"postDate\":1502223169,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"15\":[\"8\"],\"20\":\"<ul><li>Maria Mair<\\/li><li>Freie Lektorin<\\/li><li>Oelkersallee 58,&nbsp;22769 Hamburg<\\/li><li>+49 152 269 423 62 -&nbsp;<a href=\\\"mailto:info@maria-mair.com\\\">info@maria-mair.com<\\/a><\\/li><\\/ul>\",\"22\":\"<p>Mein t\\u00e4gliches Brot verdiene ich auf der Suche nach Fl\\u00fcchtigkeitsfehlern, Verst\\u00e4ndnisfallen und grammatikalischen Fehltritten. Ich korrigiere und redigiere Texte schnell und zuverl\\u00e4ssig.<\\/p>\",\"21\":\"<p>Ich suche nach guten Geschichten und nach jenen, die sie erz\\u00e4hlen k\\u00f6nnen. Schon in meiner wissenschaftlichen Arbeit hat mich stets die Faszination f\\u00fcr Sprache und ihren M\\u00f6glichkeiten der Vermittlung angetrieben: wie gelangen besondere Erfahrungen, Ideen, Bilder auf Buchseiten und dann auch noch hin bis zu zeitlich und r\\u00e4umlich entfernten Leser*innen? Diese Frage stellt man sich bei Grenzerfahrungen, aber auch bei sch\\u00f6nen, aufregenden, packenden oder romantischen Geschichten. Ich will dabei der Sch\\u00f6nheit der Sprache und jenen Menschen, die sowohl Talent f\\u00fcr sie als auch die notwendige Disziplin zur literarischen Arbeit besitzen, als verborgene Zuarbeiterin, Korrektorin, Motivatorin, Gedankenordnerin und Disziplinatorin sowie Recherchef\\u00fchrerin beistehen.<\\/p>\\r\\n<p>Neben dem literarischen Lektorat widme ich mich gerne und kompetent auch wissenschaftlichen Texten und anderen Fachtexten.<\\/p>\",\"18\":\"<ul><li><strong>Stilistische Redaktion<\\/strong>&nbsp;f\\u00fcr SnowFyre. Elfe aus Eis von Amy Erin Thyndal, erschienen bei Dark Diamonds, einem E-Book-Label des Carlsen Verlags f\\u00fcr New Adult Fantasy.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#\\\">https:\\/\\/www.carlsen.de\\/epub\\/snowfyre-elfe-aus-eis\\/83006#<\\/a><\\/li><li><strong>Lektorat<\\/strong>&nbsp;(Inhalt und stilistische Redaktion, einschlie\\u00dflich Autorenkommunikation) f\\u00fcr Winterzauber in New York von Julia K. Stein, erschienen als ePub bei Impress, einem Imprint des Carlsen Verlags f\\u00fcr Paranormal Romance, Coming of Age und New Adult.&nbsp;<a href=\\\"https:\\/\\/www.carlsen.de\\/epub\\/winterzauber-in-new-york\\/84930\\\">https:\\/\\/www.carlsen.de\\/epub\\/wi...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;von Sachtexten f\\u00fcr den Verlag quayou, der sich auf Business-Methoden konzentriert sowie Lektoratdienstleistungen f\\u00fcr andere Formate anbietet \\u2013 seit Februar 2017.&nbsp;<a href=\\\"https:\\/\\/quayou.de\\/\\\">https:\\/\\/quayou.de\\/<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel und Texte f\\u00fcr die Technische Universit\\u00e4t Wien \\u2013 im Auftrag von Univ.Ass. Arch. Dipl.-Ing. Eva Mair.&nbsp;<a href=\\\"http:\\/\\/www.gbl.tuwien.ac.at\\/Archiv\\/personen.html?name=Eva_Mair\\\">http:\\/\\/www.gbl.tuwien.ac.at\\/Ar...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;verschiedener Artikel f\\u00fcr die feministische Online-Plattform TRUST THE GIRLS.&nbsp;<a href=\\\"http:\\/\\/trustthegirls.org\\/2017\\/03\\/angezogen-und-angelogen\\/\\\">http:\\/\\/trustthegirls.org\\/2017\\/...<\\/a><\\/li><li>Kleinere Textarbeiten, wie das&nbsp;<strong>Korrektorat<\\/strong>&nbsp;von Drehb\\u00fcchern, E-Mails, etc. und die Erstellung einer&nbsp;<strong>Pressemappe<\\/strong>, f\\u00fcr die Regisseurin Nathalie Borgers, der ich von April bis Juni 2013 assistiert habe. Diese Arbeit wurde mit dem Beginn der Arbeit an dem Dokumentarfilm Fang den Haider (2016) in ein Praktikum bei der Produktionsfirma kurt mayer film umgewandelt.&nbsp;<a href=\\\"http:\\/\\/dok.at\\/film\\/fang-den-haider\\/\\\">http:\\/\\/dok.at\\/film\\/fang-den-ha...<\\/a><\\/li><li><strong>Korrektorat<\\/strong>&nbsp;fu\\u0308r den Druck des Theaterstu\\u0308cks Polaroid Panoptikum, verfasst von Florian Scheimpflug, aufgefu\\u0308hrt im April 2010 im Dschungel Wien.<\\/li><\\/ul>\",\"19\":\"<p>Geboren und aufgewachsen in der zweisprachigen norditalienischen Region S\\u00fcdtirol, habe ich 2008 das Nest verlassen und bin nach Wien gezogen, wo ich Germanistik und Vergleichende Literaturwissenschaft mit den Nebenf\\u00e4chern Kunstgeschichte und Theater-Film und Medienwissenschaften studiert habe. Die grauen Winter habe ich zur\\u00fcckgezogen in den kalten Altbauzimmern in Decken eingewickelt und stetig lesend \\u00fcberstanden.<\\/p>\\r\\n<p>Lesende Haltung und dazugeh\\u00f6riger Sessel sind f\\u00fcnf Jahre sp\\u00e4ter mit mir nach Hamburg weitergezogen, wo der Master in Deutschsprachige Literaturen mit Schwerpunkt Neuere Deutsche Literatur folgte. Wenn ich gerade nicht lese, findet man mich auf Hamburger Fahrradwegen, an Kletterw\\u00e4nden, in Kino- und Theaters\\u00e4len oder der Kneipe nebenan.<\\/p>\",\"23\":\"<p>Ich spreche, lese und schreibe flie\\u00dfend Italienisch und Englisch und kann so auch bei \\u00dcbersetzungsfragen beistehen und \\u00dcbersetzungen in die deutsche Zielsprache \\u00fcbernehmen.<\\/p>\"}}','2017-10-06 20:19:58','2017-10-06 20:19:58','cb2ca0a6-b36c-4264-a3a1-e7302cd2a25e');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (3,'Maria Mair','2017-08-12 16:46:41','2017-08-12 16:46:41','3d78a6b8-eff0-49d6-90e6-bcda097839dd');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (41,14,14,19,0,1,'2017-09-25 20:26:22','2017-09-25 20:26:22','3d78c3fe-1534-498d-a9d9-a6553f173137'),(42,14,14,15,0,2,'2017-09-25 20:26:22','2017-09-25 20:26:22','a9cd2113-ac88-4963-95d3-9a98842a4318'),(43,14,14,21,0,3,'2017-09-25 20:26:22','2017-09-25 20:26:22','558c0a4a-729e-4d6f-a9a7-fb7e2a13e111'),(44,14,14,22,0,4,'2017-09-25 20:26:22','2017-09-25 20:26:22','5b303b59-098a-4497-940c-8aa949b19e54'),(45,14,14,23,0,5,'2017-09-25 20:26:22','2017-09-25 20:26:22','8c49d9f3-d10b-45fd-a359-876c12026b51'),(46,14,14,18,0,6,'2017-09-25 20:26:22','2017-09-25 20:26:22','dd2917cf-61a7-4fd1-a008-f05eec333c67'),(47,14,14,20,0,7,'2017-09-25 20:26:22','2017-09-25 20:26:22','d3d4084b-6e26-46c0-bd75-686755eb0226');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'Tag','2017-08-08 20:12:49','2017-08-08 20:12:49','bc18c826-4428-491a-9d92-1f782254312b'),(9,'Asset','2017-08-12 17:48:07','2017-08-12 17:48:07','135fb9a1-86bc-4a4e-88e7-56b87cf84551'),(14,'Entry','2017-09-25 20:26:22','2017-09-25 20:26:22','5f5c7d03-f118-46d1-b8f8-274dcb8fa580');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (14,14,'Maria Mair',1,'2017-09-25 20:26:22','2017-09-25 20:26:22','e6c48d7f-f8fc-4fab-a1c2-b1441ca277f3');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (15,3,'Bild','bild','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"img\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-08-12 16:48:31','2017-08-13 19:41:52','435b6a29-bd5b-4987-a715-d29f67c47359'),(18,3,'Portfolio','portfolio','global','Hier kannst du deine bisherigen Aufträge auflisten.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-08-20 18:31:39','2017-09-25 20:30:32','18d55340-956b-4699-baaf-c793219f473c'),(19,3,'Über Maria','ueberMaria','global','Hier kannst du alles über Maria unterbringen.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-08-20 18:33:36','2017-08-20 18:35:43','50772f7b-af20-48da-9903-e33bd5652f22'),(20,3,'Footer','footer','global','Kontakt und impressumsrelevante Daten.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-09-10 15:05:53','2017-09-10 15:05:53','12760844-6b4d-4a93-a745-6879ddf81109'),(21,3,'Lektorat','lektorat','global','Hier kannst du den Navigationspunkt Lektorat pflegen.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-09-25 20:23:36','2017-09-25 20:23:36','821d65b6-5939-4945-ab6d-c0124487b272'),(22,3,'Korrektorat','korrektorat','global','Hier kannst du den Navigationspunkt Korrektorat pflegen.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-09-25 20:24:21','2017-09-25 20:24:21','b4d167a8-1d48-4a29-9958-a39e683a2b82'),(23,3,'Übersetzung','uebersetzung','global','Hier kannst du den Navigationspunkt Übersetzung pflegen.',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-09-25 20:24:46','2017-09-25 20:24:46','79411887-6a6e-4af1-be50-634250cafdfd');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'2.6.2991','2.6.10',0,'Maria Mair','http://development.maria-mair.com','UTC',1,0,'2017-08-08 20:12:46','2017-10-06 19:05:57','f04d20cf-77f2-4012-922a-3f4f3f0bbd5c');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_locales`
--

DROP TABLE IF EXISTS `craft_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_locales`
--

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;
INSERT INTO `craft_locales` VALUES ('de',1,'2017-08-08 20:12:46','2017-08-08 20:12:46','84feea2a-70fd-493f-9d2b-554a7bf65380');
/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'m000000_000000_base','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','d9f372c0-1d20-42f7-84fd-8f500b0bda73'),(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','84a20939-7682-4fa2-966b-aff0fe496afe'),(3,NULL,'m140815_000001_add_format_to_transforms','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','b2a055e1-5f3f-40ba-b55d-25fedb287b29'),(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','17159f06-bead-4bd4-9d16-a259609eeabd'),(5,NULL,'m140829_000001_single_title_formats','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','35404673-e11a-4d5c-9bbd-0a18a098780f'),(6,NULL,'m140831_000001_extended_cache_keys','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','7bd2f743-28cc-475a-ae66-134fb70dceaa'),(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','6c623adc-60ca-4983-b86c-feb20c7bfa63'),(8,NULL,'m141008_000001_elements_index_tune','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','d8a283a6-a193-4cad-8583-d45a4677bb9e'),(9,NULL,'m141009_000001_assets_source_handle','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','21fd0e54-61eb-478a-905e-8af954d5ac08'),(10,NULL,'m141024_000001_field_layout_tabs','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','72253d8c-f2a4-4ccc-82bb-1d9869aa6c11'),(11,NULL,'m141030_000000_plugin_schema_versions','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','fa0e053f-d362-49d0-8083-6e0d6126f125'),(12,NULL,'m141030_000001_drop_structure_move_permission','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','dbd542a8-47a5-4825-a0e6-433cfcb1b9ee'),(13,NULL,'m141103_000001_tag_titles','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','40888075-f31b-4a76-a74f-f638f4006196'),(14,NULL,'m141109_000001_user_status_shuffle','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','058b051d-1415-43ae-a7cd-95511171411a'),(15,NULL,'m141126_000001_user_week_start_day','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','faa121bf-bc9e-4796-b58d-bc50404d8bea'),(16,NULL,'m150210_000001_adjust_user_photo_size','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','1c1ae814-2cf5-48a9-a1eb-8b27b6368024'),(17,NULL,'m150724_000001_adjust_quality_settings','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','e7a6f550-b1d8-40f4-940a-a0d3330d1b95'),(18,NULL,'m150827_000000_element_index_settings','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','3a694a89-be09-4725-bb3e-8b1356258533'),(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','b4487523-ef8f-45dc-b5d5-e2e7d0d62bc8'),(20,NULL,'m151007_000000_clear_asset_caches','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','5ff22dbb-0312-47a2-9398-09e15a91ded2'),(21,NULL,'m151109_000000_text_url_formats','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','e01b529b-553f-4c76-9158-31349506d9a3'),(22,NULL,'m151110_000000_move_logo','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','b9021f50-a641-43b0-be7f-e2903435c035'),(23,NULL,'m151117_000000_adjust_image_widthheight','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','5f10bd9b-c139-4e4f-8b4c-0e5d908a3267'),(24,NULL,'m151127_000000_clear_license_key_status','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','3bec5634-f683-4f28-ba50-c7ed5dc9958b'),(25,NULL,'m151127_000000_plugin_license_keys','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','89ea80ad-af9a-4481-996f-e90907e228ee'),(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','6e28b7f0-4fb3-42e7-be2c-fdbe63c4955c'),(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','8a948411-605e-40b2-8cab-a5d9d847cdec'),(28,NULL,'m160223_000000_sortorder_to_smallint','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','e71f85f4-eacb-49bc-b64f-70cc52db3071'),(29,NULL,'m160229_000000_set_default_entry_statuses','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','c72bab3c-1977-4343-86e8-e7fb2d985893'),(30,NULL,'m160304_000000_client_permissions','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','4eaa45cc-2249-4b8b-a210-9f78a2a9ab33'),(31,NULL,'m160322_000000_asset_filesize','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','f1a4406f-fa44-4792-80cc-9d04b142800d'),(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','19869c69-5d1d-45e7-b7d0-1fbac6b1db74'),(33,NULL,'m160510_000000_tasksettings','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','b9d61162-d498-48e2-981a-9e9cc373d03c'),(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','d55a9e25-223a-41df-a5b9-b5a2bfd36137'),(35,NULL,'m160830_000000_asset_index_uri_increase','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','bd9678e9-5d23-44d0-a9c4-615a93e0326e'),(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','bb29336b-ce5a-43c2-b268-5a1d5dfcbca4'),(37,NULL,'m161108_000000_new_version_format','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','ba629bb5-2b37-4434-bfd9-2cb25a794f43'),(38,NULL,'m161109_000000_index_shuffle','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','2ae4fe77-c01a-4c2b-a73c-851aa944c900'),(39,NULL,'m170612_000000_route_index_shuffle','2017-08-08 20:12:46','2017-08-08 20:12:46','2017-08-08 20:12:46','b14e8fa4-0fba-410f-9702-fc9b6bbb6598');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_rackspaceaccess`
--

DROP TABLE IF EXISTS `craft_rackspaceaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_rackspaceaccess`
--

LOCK TABLES `craft_rackspaceaccess` WRITE;
/*!40000 ALTER TABLE `craft_rackspaceaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_rackspaceaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
INSERT INTO `craft_relations` VALUES (8,15,2,NULL,8,1,'2017-10-06 20:19:58','2017-10-06 20:19:58','3c611b34-4c27-4244-b113-f5bdc00ead0f');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_routes`
--

DROP TABLE IF EXISTS `craft_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_routes_locale_idx` (`locale`),
  KEY `craft_routes_urlPattern_idx` (`urlPattern`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_routes`
--

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,'de',' janedoe '),(1,'firstname',0,'de',''),(1,'lastname',0,'de',''),(1,'fullname',0,'de',''),(1,'email',0,'de',' janedoe localhost wtf '),(1,'slug',0,'de',''),(2,'slug',0,'de',' homepage '),(2,'title',0,'de',' maria mair '),(2,'field',1,'de',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon development maria mair com will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),(2,'field',7,'de',' geboren und aufgewachsen in der zweisprachigen norditalienischen region suedtirol habe ich 2008 das nest verlassen und bin nach wien gezogen wo ich germanistik und vergleichende literaturwissenschaft mit den nebenfaechern kunstgeschichte und theater film und medienwissenschaften studiert habe die grauen winter habe ich zurueckgezogen in den kalten altbauzimmern in decken eingewickelt und stetig lesend ueberstanden verlassen habe ich diese hin und wieder um pflichtveranstaltungen an der uni zu besuchen in bibliotheken unter schlechten lichtern zu lesen oder neben den kulturell anderweitig wertvollen kneipenbesuchen das theater das kino oder kleine konzerte aufzusuchen die lesende haltung und der dazugehoerige sessel sind fuenf jahre spaeter mit mir nach hamburg weitergezogen wo der master in deutschsprachige literaturen folgte in dessen verlauf ich mich vor allem mit erinnerungskultur auseinandergesetzt habe '),(2,'field',10,'de',' korrektorat '),(2,'field',11,'de',' mein taegliches brot verdiene ich sehr gerne auf der suche nach fluechtigkeitsfehler verstaendnisfallen und grammatischen fehltritten ich korrigiere und redigiere texte schnell und zuverlaessig '),(2,'field',8,'de',' lektorat '),(2,'field',9,'de',' ich suche nach guten geschichten und nach jenen die sie erzaehlen koennen schon in meiner wissenschaftlichen arbeit hat mich stets die faszination fuer sprache und ihren moeglichkeiten der vermittlung angetrieben wie gelangen besondere erfahrungen ideen bilder von einem menschen auf buchseiten und dann auch noch hin bis zu einem oder einer zeitlich und raeumlich entfernten leser in diese frage stellt man sich besonders schnell bei grenzerfahrungen aber auch bei schoenen aufregenden packenden oder romantischen geschichten ich will dabei der schoenheit der sprache und jenen menschen die sowohl talent fuer sie als auch die notwendige disziplin zur literarischen arbeit besitzen als verborgene zuarbeiterin korrektorin motivatorin gedankenordnerin und disziplinatorin sowie recherchefuehrerin beistehen neben dem literarischen lektorat widme ich mich gerne und kompetent auch wissenschaftlichen texten '),(2,'field',12,'de',' uebersetzung '),(2,'field',13,'de',' ich spreche lese und schreibe fliessend italienisch und englisch und kann so auch bei uebersetzungsfragen beistehen und uebersetzungen in das deutsche uebernehmen individuelle preise divergieren je nach texttyp und anforderung und gibt es daher auf anfrage '),(2,'field',16,'de',' bisherige auftraege '),(2,'field',17,'de',' stilistische redaktion fuer snowfyre elfe aus eis von amy erin thyndal erschienen bei dark diamonds einem e book label des carlsen verlags fuer new adult fantasy https www carlsen de epub snowfyre elfe aus eis 83006 lektorat inhalt und stilistische redaktion einschliesslich autorenkommunikation fuer winterzauber in new york von julia k stein erschienen als epub bei impress einem imprint des carlsen verlags fuer paranormal romance coming of age und new adult https www carlsen de epub wi korrektorat von sachtexten fuer den verlag quayou der sich auf business methoden konzentriert sowie lektoratdienstleistungen fuer andere formate anbietet seit februar 2017 https quayou de korrektorat verschiedener artikel und texte fuer die technische universitaet wien im auftrag von univ ass arch dipl ing eva mair http www gbl tuwien ac at ar korrektorat verschiedener artikel fuer die feministische online plattform trust the girls http trustthegirls org 2017 kleinere textarbeiten wie das korrektorat von drehbuechern e mails etc und die erstellung einer pressemappe fuer die regisseurin nathalie borgers der ich von april bis juni 2013 assistiert habe diese arbeit wurde mit dem beginn der arbeit an dem dokumentarfilm fang den haider 2016 in ein praktikum bei der produktionsfirma kurt mayer film umgewandelt http dok at film fang den ha korrektorat für den druck des theaterstücks polaroid panoptikum verfasst von florian scheimpflug aufgeführt im april 2010 im dschungel wien '),(2,'field',6,'de',' die lektorin '),(2,'field',15,'de',' maria mair '),(2,'field',14,'de',' maria mair '),(8,'kind',0,'de',' image '),(8,'extension',0,'de',' jpg '),(8,'filename',0,'de',' maria portrait jpg '),(2,'field',19,'de',' geboren und aufgewachsen in der zweisprachigen norditalienischen region suedtirol habe ich 2008 das nest verlassen und bin nach wien gezogen wo ich germanistik und vergleichende literaturwissenschaft mit den nebenfaechern kunstgeschichte und theater film und medienwissenschaften studiert habe die grauen winter habe ich zurueckgezogen in den kalten altbauzimmern in decken eingewickelt und stetig lesend ueberstanden lesende haltung und dazugehoeriger sessel sind fuenf jahre spaeter mit mir nach hamburg weitergezogen wo der master in deutschsprachige literaturen mit schwerpunkt neuere deutsche literatur folgte wenn ich gerade nicht lese findet man mich auf hamburger fahrradwegen an kletterwaenden in kino und theatersaelen oder der kneipe nebenan '),(2,'field',21,'de',' ich suche nach guten geschichten und nach jenen die sie erzaehlen koennen schon in meiner wissenschaftlichen arbeit hat mich stets die faszination fuer sprache und ihren moeglichkeiten der vermittlung angetrieben wie gelangen besondere erfahrungen ideen bilder auf buchseiten und dann auch noch hin bis zu zeitlich und raeumlich entfernten leser innen diese frage stellt man sich bei grenzerfahrungen aber auch bei schoenen aufregenden packenden oder romantischen geschichten ich will dabei der schoenheit der sprache und jenen menschen die sowohl talent fuer sie als auch die notwendige disziplin zur literarischen arbeit besitzen als verborgene zuarbeiterin korrektorin motivatorin gedankenordnerin und disziplinatorin sowie recherchefuehrerin beistehen neben dem literarischen lektorat widme ich mich gerne und kompetent auch wissenschaftlichen texten und anderen fachtexten '),(2,'field',22,'de',' mein taegliches brot verdiene ich auf der suche nach fluechtigkeitsfehlern verstaendnisfallen und grammatikalischen fehltritten ich korrigiere und redigiere texte schnell und zuverlaessig '),(2,'field',23,'de',' ich spreche lese und schreibe fliessend italienisch und englisch und kann so auch bei uebersetzungsfragen beistehen und uebersetzungen in die deutsche zielsprache uebernehmen '),(2,'field',18,'de',' stilistische redaktion fuer snowfyre elfe aus eis von amy erin thyndal erschienen bei dark diamonds einem e book label des carlsen verlags fuer new adult fantasy https www carlsen de epub snowfyre elfe aus eis 83006 lektorat inhalt und stilistische redaktion einschliesslich autorenkommunikation fuer winterzauber in new york von julia k stein erschienen als epub bei impress einem imprint des carlsen verlags fuer paranormal romance coming of age und new adult https www carlsen de epub wi korrektorat von sachtexten fuer den verlag quayou der sich auf business methoden konzentriert sowie lektoratdienstleistungen fuer andere formate anbietet seit februar 2017 https quayou de korrektorat verschiedener artikel und texte fuer die technische universitaet wien im auftrag von univ ass arch dipl ing eva mair http www gbl tuwien ac at ar korrektorat verschiedener artikel fuer die feministische online plattform trust the girls http trustthegirls org 2017 kleinere textarbeiten wie das korrektorat von drehbuechern e mails etc und die erstellung einer pressemappe fuer die regisseurin nathalie borgers der ich von april bis juni 2013 assistiert habe diese arbeit wurde mit dem beginn der arbeit an dem dokumentarfilm fang den haider 2016 in ein praktikum bei der produktionsfirma kurt mayer film umgewandelt http dok at film fang den ha korrektorat für den druck des theaterstücks polaroid panoptikum verfasst von florian scheimpflug aufgeführt im april 2010 im dschungel wien '),(2,'field',20,'de',' maria mairfreie lektorinoelkersallee 58 22769 hamburg 49 152 269 423 62 info maria mair com '),(8,'slug',0,'de',' maria portrait '),(8,'title',0,'de',' maria mair ');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,NULL,'Homepage','homepage','single',1,'index',1,'2017-08-08 20:12:49','2017-08-08 20:12:49','1c5197f1-5a5e-4d05-8b51-8565c4d58ed9');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_i18n`
--

DROP TABLE IF EXISTS `craft_sections_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_i18n`
--

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;
INSERT INTO `craft_sections_i18n` VALUES (1,1,'de',1,'__home__',NULL,'2017-08-08 20:12:49','2017-08-08 20:12:49','70b272d8-ae69-4f73-88d5-e3229916e756');
/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'387947ca59cb314911f85dfeac1eb4b3c616c76bczozMjoiNlViNFR1QmhCUWJzWm1YZDVpakd5V25hX2daOV84bGMiOw==','2017-08-08 20:12:49','2017-08-08 20:12:49','9ef63fa7-40a1-41dc-80c8-5e97438bca4b'),(2,1,'dd61d75a1dd20b1aaae79450d77a5ad84d6a46deczozMjoicjRjRWhSanc0eEhLVG8xeVM5WnRxTEJXWHdHOHhjNVciOw==','2017-08-12 16:01:55','2017-08-12 16:01:55','153c51c4-66b8-462d-b17f-b5d8716f3bce'),(4,1,'0965afc976cf836071794392e9ee655d8a388c4dczozMjoiR19LZjhycm5sN0EwQkVvMlp0bkU0UFlLcFlpNnk1SmYiOw==','2017-08-20 18:26:14','2017-08-20 18:26:14','967c5a00-0815-441a-ba54-ffe2f67e2f32'),(5,1,'efd2516410ca22420c1f88d607e734126c13acfeczozMjoiakw5U2JNYmtPSHk4UXRPOTFWUlpnblVlSktpZEtlXzUiOw==','2017-09-10 15:03:59','2017-09-10 15:03:59','15cbff2c-6509-453c-8056-3e52b1a851a9');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemsettings`
--

DROP TABLE IF EXISTS `craft_systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemsettings`
--

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;
INSERT INTO `craft_systemsettings` VALUES (1,'email','{\"protocol\":\"php\",\"emailAddress\":\"janedoe@localhost.wtf\",\"senderName\":\"Development Maria Mair\"}','2017-08-08 20:12:49','2017-08-08 20:12:49','d660f8a6-beeb-44d3-b2e7-242b6457c15f');
/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
INSERT INTO `craft_taggroups` VALUES (1,'Default','default',1,'2017-08-08 20:12:49','2017-08-08 20:12:49','71286fe4-0f0c-4966-bb95-d497813c214f');
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tasks`
--

DROP TABLE IF EXISTS `craft_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tasks`
--

LOCK TABLES `craft_tasks` WRITE;
/*!40000 ALTER TABLE `craft_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachecriteria`
--

DROP TABLE IF EXISTS `craft_templatecachecriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachecriteria`
--

LOCK TABLES `craft_templatecachecriteria` WRITE;
/*!40000 ALTER TABLE `craft_templatecachecriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachecriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'janedoe',NULL,'','','janedoe@localhost.wtf','$2y$13$8sML.1FiLCZDJZIlRKsBSOnAcvTtit8TaSatWlBOcTkl1I9akEkfm',NULL,1,1,0,0,0,0,0,'2017-10-06 20:18:32','192.168.50.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-08 20:12:47','2017-08-08 20:12:47','2017-10-06 20:18:32','62cc6dbb-591c-4328-af77-5b67762e1a36');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'RecentEntries',1,NULL,NULL,1,'2017-08-08 20:12:54','2017-08-08 20:12:54','b68abb7a-f087-4411-8d72-18436a2d36f1'),(2,1,'GetHelp',2,NULL,NULL,1,'2017-08-08 20:12:54','2017-08-08 20:12:54','ed63f91d-a3c5-4f99-93ec-3202990c745d'),(3,1,'Updates',3,NULL,NULL,1,'2017-08-08 20:12:54','2017-08-08 20:12:54','97f8e6ab-ad41-488f-a72d-c18794195431'),(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-08-08 20:12:54','2017-08-08 20:12:54','b7f44a31-017e-468a-8b14-b31d1d6fd8f6');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 21:07:48
