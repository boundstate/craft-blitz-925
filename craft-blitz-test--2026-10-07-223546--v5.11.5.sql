-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_csgadktgrdnrksqrzzdwahtlkgjopmizersx` (`primaryOwnerId`),
  CONSTRAINT `fk_csgadktgrdnrksqrzzdwahtlkgjopmizersx` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wywbfoswfwvramnvpeiufbqqyxvjrqpfgudd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_griiohuxlnwlktfdszcvehutxrgghasmoyqn` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_xtutfpbkbnomgxnlyauqrnocnixhmnnafdvt` (`dateRead`),
  KEY `fk_uqblamlwzjjptkoyiffixosrjolpthhacnxu` (`pluginId`),
  CONSTRAINT `fk_uqblamlwzjjptkoyiffixosrjolpthhacnxu` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zqdtevhwixdvekjdlrgyapweyqzyaajqcuts` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qlnaigtdafwfobrkfhluilwlfpztokxhfdco` (`sessionId`,`volumeId`),
  KEY `idx_wdpnnhfchhaelbiokwbplubwhqrtctjwggjn` (`volumeId`),
  CONSTRAINT `fk_jgbmzacoctqdbrzkqnmgkfkvvkgnzprhajez` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pswavxylplhiyjwyqptrvzgblfhwiaksczot` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vwkzjbrzjhzfxcxuerkqryjwendqfeyhjbpq` (`filename`,`folderId`),
  KEY `idx_phxmgrrefzxrgyexuewoyfpoowivlljbrhgl` (`folderId`),
  KEY `idx_ahmfcybbaikszhwkejwsjmojtzkarvrykrqc` (`volumeId`),
  KEY `fk_jxovaibesrfjlhsjcelvposzptbvkluicwkv` (`uploaderId`),
  CONSTRAINT `fk_ejlkesugnwruitpzcrwgcospspxfnjupwjjb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jxovaibesrfjlhsjcelvposzptbvkluicwkv` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_twwgekdqcpduobozbocpyiebpmtvlharnhxn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgioxgtgpnzjuvnfhgrgwrzucwpuujnqeezj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_hgwocmjagzutnkgkxwiqpkpbhbqmqqpnduyh` (`siteId`),
  CONSTRAINT `fk_bulzdoxzltwmdjrbbzcjrdfunwjnxtjemlor` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hgwocmjagzutnkgkxwiqpkpbhbqmqqpnduyh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_llmizzsfprkzyfkqqxvsguaxuzjljduddnww` (`userId`),
  CONSTRAINT `fk_llmizzsfprkzyfkqqxvsguaxuzjljduddnww` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_caches`
--

DROP TABLE IF EXISTS `blitz_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_caches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `uri` varchar(2048) NOT NULL,
  `paginate` int DEFAULT NULL,
  `dateCached` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ztxqrjbxvvnjskoqhbtxymqewwjpfqnsbltz` (`siteId`,`uri`(767)),
  KEY `idx_byrdcvxvlhadsqhfplommulawdjsochqsiad` (`expiryDate`),
  CONSTRAINT `fk_npzwhsruyudggyyvxtfkjfgdnnezvernunze` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_cachetags`
--

DROP TABLE IF EXISTS `blitz_cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_cachetags` (
  `cacheId` int NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`cacheId`,`tag`),
  KEY `idx_rkdplgociwfflhkkydkfwievunlooemfwaik` (`tag`),
  CONSTRAINT `fk_zxfzndwflgtawjwuyvyrplnzwojyuptczzev` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_driverdata`
--

DROP TABLE IF EXISTS `blitz_driverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_driverdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) NOT NULL,
  `data` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementcaches`
--

DROP TABLE IF EXISTS `blitz_elementcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cacheId`,`elementId`,`siteId`),
  KEY `fk_ugxtbuoqwhxdsecbbbpyizdjfkiqpqketqut` (`elementId`),
  CONSTRAINT `fk_bujoudpvtegavoacapgebmttcxamfpywsdba` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ugxtbuoqwhxdsecbbbpyizdjfkiqpqketqut` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementexpirydates`
--

DROP TABLE IF EXISTS `blitz_elementexpirydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementexpirydates` (
  `elementId` int NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`),
  UNIQUE KEY `idx_beycwfwhgbdkzdpkrzlkniukaydczrqrhxkz` (`elementId`),
  KEY `idx_bvzkszevwrhlddhjelrejuyqrwmnmsezrjvk` (`expiryDate`),
  CONSTRAINT `fk_bimzzemlgfddwpribgtanjdipovawiowwcot` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementfieldcaches`
--

DROP TABLE IF EXISTS `blitz_elementfieldcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementfieldcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cacheId`,`elementId`,`siteId`,`fieldInstanceUid`),
  KEY `fk_ozyvkrglkzcofbyglrvgotgoklbripcjqhdf` (`elementId`),
  CONSTRAINT `fk_ozyvkrglkzcofbyglrvgotgoklbripcjqhdf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yivjtvosmmcoykogloxmjipdnnsplkojppie` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueries`
--

DROP TABLE IF EXISTS `blitz_elementqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text,
  `template` varchar(255) DEFAULT NULL,
  `code` text,
  `backtrace` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vnasdmzgroxlywzgzwaofehlqffkiwzjrbso` (`index`),
  KEY `idx_yrnafbxgumajhhvzcasqjzztdlgnknfjkpue` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryattributes`
--

DROP TABLE IF EXISTS `blitz_elementqueryattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueryattributes` (
  `queryId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`queryId`,`attribute`),
  CONSTRAINT `fk_xjiqslzjvshniwcfnqoerwvjbixoiqrzqskt` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerycaches`
--

DROP TABLE IF EXISTS `blitz_elementquerycaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementquerycaches` (
  `cacheId` int NOT NULL,
  `queryId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`queryId`),
  KEY `fk_vkmctlyqyatlnbecxweenhybmtvqfwhpasyu` (`queryId`),
  CONSTRAINT `fk_lnmwywqqeglqizepmjtkwacrzakszxjwwyin` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vkmctlyqyatlnbecxweenhybmtvqfwhpasyu` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryfields`
--

DROP TABLE IF EXISTS `blitz_elementqueryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueryfields` (
  `queryId` int NOT NULL,
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queryId`,`fieldInstanceUid`),
  CONSTRAINT `fk_snnghnyhjehcyzroisvlizlggcnllscwxgak` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerysites`
--

DROP TABLE IF EXISTS `blitz_elementquerysites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementquerysites` (
  `queryId` int NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`queryId`,`siteId`),
  CONSTRAINT `fk_sjcmazwhkuvcdzcamybcvotwbipmothcabib` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerysources`
--

DROP TABLE IF EXISTS `blitz_elementquerysources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementquerysources` (
  `queryId` int NOT NULL,
  `sourceId` int NOT NULL,
  PRIMARY KEY (`queryId`,`sourceId`),
  CONSTRAINT `fk_qavmuskbzbbgmqhifypfubeyuvpuqpbbchic` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_includes`
--

DROP TABLE IF EXISTS `blitz_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_includes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `siteId` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oisxepkzeaebrilyrzxzlxpiojwhvkpokrfh` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_ssiincludecaches`
--

DROP TABLE IF EXISTS `blitz_ssiincludecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_ssiincludecaches` (
  `cacheId` int NOT NULL,
  `includeId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`includeId`),
  KEY `fk_yflndjzsrcbywbtuydgpsdmorqfdkevhbbxm` (`includeId`),
  CONSTRAINT `fk_cuyeedanloacdcpfgrvwoxwuvedrqfunalwb` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yflndjzsrcbywbtuydgpsdmorqfdkevhbbxm` FOREIGN KEY (`includeId`) REFERENCES `blitz_includes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_zeqbmwfmcsgpqtczotozfnmfzgdgvtgsnuen` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_votbtedcxzmzhrufhbttjyhzaxbjzzxypfhm` (`groupId`),
  KEY `fk_ogggcmszaycfwapqbkthbvgvcapmquofvmqv` (`parentId`),
  CONSTRAINT `fk_cxsuhsthjgxpdbphfncupdyispbyxdfgvbub` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fpqejabxbfjygqfykwvrgoffqbdhiagamqjy` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ogggcmszaycfwapqbkthbvgvcapmquofvmqv` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wjsyvvmhvdkgubxvsbhgapputujfsyvsequd` (`name`),
  KEY `idx_dmsifdyrrvsmvwmhnnlqpwncbadmwngsqokw` (`handle`),
  KEY `idx_copeguhildgmocowtaxjcqmtbpmvrycafesc` (`structureId`),
  KEY `idx_gketbcuvmsfxmxerirgixuvtzqzoxmwsneiv` (`fieldLayoutId`),
  KEY `idx_zqdxsvbpulsycirbnfifpcvhheqtbxsfoann` (`dateDeleted`),
  CONSTRAINT `fk_expuebnthtwwjrxznxswgtjtdqtvalatoyve` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfkuoksvwqwcwrcbzpxppfiszervdglsvmdu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lxehfhgbvpwgvabxnvrtlrglblsltdienbhn` (`groupId`,`siteId`),
  KEY `idx_lkibxgndnjrgiqwypaunsjkdyfihfofafdmg` (`siteId`),
  CONSTRAINT `fk_uyytxksmpkrseiwkokskwudmutknnejlktbv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vmrmoqdygktrxbdmfilawjeqyzknnakeqjuf` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_wkswhcmwqokphhgkxihxgckpzdxraogzettr` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_kjngtieeoporuvumvboukwmlatkuwyaoygim` (`siteId`),
  KEY `fk_nnnxrwdkprzkehhybojvxgoshkfbrzritpjt` (`userId`),
  CONSTRAINT `fk_ffxoglebibdpeywwnsxlodwmmbcmhmwtdakh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kjngtieeoporuvumvboukwmlatkuwyaoygim` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nnnxrwdkprzkehhybojvxgoshkfbrzritpjt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_fktruqmheaxthukmqlqmpmpxbwvloecbnzfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wrzcbahnolbhlwrqpbrndcfhoimvgfkkiatm` (`siteId`),
  KEY `fk_fpaiqhcjnkicuprfhpniumbmghvdnosmcyed` (`fieldId`),
  KEY `fk_grmcakleldesuvojoxerabjsstiwcluftygo` (`userId`),
  CONSTRAINT `fk_fpaiqhcjnkicuprfhpniumbmghvdnosmcyed` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grmcakleldesuvojoxerabjsstiwcluftygo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mgzfqhfogzupdllcpsutklxfwtjlgzotvsyr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wrzcbahnolbhlwrqpbrndcfhoimvgfkkiatm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rosqhecjgbffamgfiqfoxdgvtafgdagzrhea` (`primaryOwnerId`),
  KEY `idx_bdssuodizvqkspvvezbjchyluccxxwdiktbm` (`fieldId`),
  CONSTRAINT `fk_hgmojtskqojbaxkcfuxmqhylqkuifysydxyn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lxlnjhnqsbkcnkperfejfhslvbxhivofgsei` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ryeaycdcpwzyaxbfrszmfgsdoulwwhvqnfmg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_aipsvzlnshqrwztkliepsinwzuzegcuhlxvg` (`userId`),
  CONSTRAINT `fk_aipsvzlnshqrwztkliepsinwzuzegcuhlxvg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bhezdjjkomswdysyzyyildwprhyoomiemthz` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_ouvzfulmoxbdsuhxjolysmhhjeifyeuokmax` (`creatorId`,`provisional`),
  KEY `idx_eqjrenpscfvvsztmwwjskwddrymmlpswedho` (`saved`),
  KEY `fk_slsuxlsgwcffomitqchogtmdlqibzaozsdgy` (`canonicalId`),
  CONSTRAINT `fk_cyhttefwckcfcxceultostfadweunjoohrus` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_slsuxlsgwcffomitqchogtmdlqibzaozsdgy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_wmjsaemmkwrdptkfwpbhlfojzyumilrqxoqk` (`elementId`,`timestamp`,`userId`),
  KEY `fk_alhvbthyngubplkzijdsqzazhlfhfinzjoaz` (`userId`),
  KEY `fk_kxgayghnjiljvyvbpkembatfetqhhytifshr` (`siteId`),
  CONSTRAINT `fk_alhvbthyngubplkzijdsqzazhlfhfinzjoaz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ddkgestyvpmrdgnmaykdwendmfikzaxuixmx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxgayghnjiljvyvbpkembatfetqhhytifshr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmfqbcbopcsyjfrhskkrwlnsmkptmpbmoozv` (`dateDeleted`),
  KEY `idx_akvlfcpecaaiiskisgrruxapeeeluoskrxsq` (`fieldLayoutId`),
  KEY `idx_jvfzqdkjrwhchughaulcwxweoenccxqqiaqu` (`type`),
  KEY `idx_jijavtpscjpypnlsxbadlgvvkjfdbuzjamyq` (`enabled`),
  KEY `idx_lohvzmqeapleykicniwcddzpesehojbbibho` (`canonicalId`),
  KEY `idx_okrpaweqaoewuycvcgykoamnhbklximjdshc` (`archived`,`dateCreated`),
  KEY `idx_cyuswrdqqymvhhzuxgbfvsccsydhnuhehxjw` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_aufoejanwhxyqfaydxatwcfaegahgnkrgldj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_cnvionczhsiafqqsqdocbddaeievlkzuwquz` (`draftId`),
  KEY `fk_lmzglzyesxrxdaersovfmqlxpshyqcsjhdph` (`revisionId`),
  CONSTRAINT `fk_cnvionczhsiafqqsqdocbddaeievlkzuwquz` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fljpmcesrsqqrmkbkynoaibahgvtkkupbmoc` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_igmncibkuvdfmfpvubcxsaslvfneognathif` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lmzglzyesxrxdaersovfmqlxpshyqcsjhdph` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_tjvubjevzvjlcuisrgrpmsljmozkxsneuiqh` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `idx_lxwhhpuegwwcyeianfztzahfofeeywaorqgt` (`sortOrder`),
  KEY `fk_lpwbzgsrlkknepsguucjitdpywqligecinhb` (`ownerId`),
  CONSTRAINT `fk_kqxwydfamldfujaorfjuriprscfiafdrteup` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lpwbzgsrlkknepsguucjitdpywqligecinhb` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kpmjkndcxtdswxwaaksqwvgfhcsoepgqqziu` (`elementId`,`siteId`),
  KEY `idx_tgfudkjwfgvejcssuzydiwsasczqomqdaacs` (`siteId`),
  KEY `idx_jefkaggjtncipwlqyjmnvhmufsuntnqvfsud` (`title`,`siteId`),
  KEY `idx_kabckmviunctmaoktwliwlyqqyzdmiuovjod` (`slug`,`siteId`),
  KEY `idx_xvvsoeonpdwrsfvikofvizrcqdicmzwejjbq` (`enabled`),
  KEY `idx_gzshfzbjjvezvnwsgatjhsoqxhapayvuhssy` (`uri`,`siteId`),
  CONSTRAINT `fk_hxyxwmwthyjaaomeezwaitaffxhjfubtlphy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ljrpbiqvrzlnrvdbfpasfyulfbytskudhvmb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ilklvmhznsvpipsnebymlpnqruamezymoazm` (`postDate`),
  KEY `idx_niptdhtzserzupdplhupnwssnrqrhjyxskba` (`expiryDate`),
  KEY `idx_rxbrcnxbhsnmdovzqtzfdxvyqovnsgotmlxs` (`status`),
  KEY `idx_mgoemvwdjizleooduorrfjhfvomkxuciiqgk` (`sectionId`),
  KEY `idx_pxkkuflcavzkxrzphkfvvighignblktsovsf` (`typeId`),
  KEY `idx_aswnbxsnvgxiuwoqghygubypqbnnhjtpuifq` (`primaryOwnerId`),
  KEY `idx_cwrvkqkdmsgvqzisjonkdrccksdfkwnefucl` (`fieldId`),
  KEY `fk_psvcblqbgedjpmrornbuezxwkfwqxbjfwncb` (`parentId`),
  CONSTRAINT `fk_fgqsrcykgyxnlnmicjfqcptrobfywfheyeqp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psvcblqbgedjpmrornbuezxwkfwqxbjfwncb` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qjijfyftovjmkaamoxkzsyneafcaroqeamzz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vbawiyvpjlvtlpujrhjyefgnnomffxozlhgw` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwonrwhwteapwmdppszxuxjnzelhqdphylmp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyiuiamzyjrbehoitsxcnmyuondryzdnfssz` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_qkzoqabptyjwjrdjvqvemqtjlworswovexpm` (`authorId`),
  KEY `idx_pwqyeqsjyaoqfhsovehihxvojadptudmvnzu` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ljqomtxgvbcznakabntzgeqhjldshemafcfc` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sgyndrjdhjbrcdajufhizqjbkxyfsocammwy` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `uiLabelFormat` varchar(255) NOT NULL DEFAULT '{title}',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `allowLineBreaksInTitles` tinyint(1) NOT NULL DEFAULT '0',
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yxonsozhoscdnndwqcpidwfhkwvnpxscqope` (`fieldLayoutId`),
  KEY `idx_lgixhokatlchliwhsxbohnanbnkciteaxpet` (`dateDeleted`),
  CONSTRAINT `fk_lvhwbdcgliqdonplbegvmnladlvtsjwchvef` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wbpcjshjwoukncldpywphxeilcozasjqmwal` (`dateDeleted`),
  KEY `idx_qxiswqzrdgystvzzljzttqdtaezsevrpacup` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtyyowamdiqjjzlnlrjwddvlftfrdtfwqcuu` (`handle`,`context`),
  KEY `idx_zzuiogeacgkwiqnttwlysypsqycolgpjuncq` (`context`),
  KEY `idx_vdvbbqawtutpswtrmcxlwkueccbzyhsdjolp` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rtaiciqvqeuiclhxgjhhcveyujfzxpkwndvz` (`name`),
  KEY `idx_noogcippmbxaorsxoldmunabguyvnrwtbyqy` (`handle`),
  KEY `idx_smnkoakqtjhzxjwsdonoaumtuccrzqszuemz` (`fieldLayoutId`),
  KEY `idx_kzqyokovuydfpqvuogorukbzgxmmqfptgnsh` (`sortOrder`),
  CONSTRAINT `fk_brzenebrqcuszwctophudmhorpwlzmdiiscv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_enutkdafqrrsvbajdohwgbpmtwnkwfthndfl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nglnnfuhxiedldcatusfkhkqqeyolubkimpa` (`accessToken`),
  UNIQUE KEY `idx_jlcmkkewzzduaesiqpvgjhdsaixjzbjcqlwn` (`name`),
  KEY `fk_iuaygkhqxyepvtwmswzwdirrjgfzbxzfubkx` (`schemaId`),
  CONSTRAINT `fk_iuaygkhqxyepvtwmswzwdirrjgfzbxzfubkx` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_swchkbnuxmyauohgziahorhbohdngldhzhhm` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_phcmijjvkdbvtwdgfpgxqjbtdnojgrnyrvvn` (`name`),
  KEY `idx_ghzuomzszuhscgwnglapahgcqkfcfcucsfgs` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ipfvlobrdiirvarqhxkosmlpwdjyleejhleh` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xqjlftvsnnqugwydfzjauehdpkieoofybgck` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_qkadgushuiiiuydwkppldyfdmwhylqovbowd` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_sjddbezmintjvcmmykknbdenchctimnngjcm` (`channel`,`fail`,`timeUpdated`,`delay`),
  KEY `idx_mitqsboqotycdtacpjhiyufyvhonmuofzhcv` (`channel`,`fail`,`timeUpdated`,`priority`,`id`,`timePushed`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nglqoqsprigyzftubjnqztzzebkzvexgzsxo` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_gxepwgsfbnvcylnirxpwqfrioovnguxdxplu` (`sourceId`),
  KEY `idx_grayydkivbmfjfoyubzvucwinvdxlwzrnmke` (`targetId`),
  KEY `idx_qehbstyspijdxzkafagxfcodpjeqowxgukjw` (`sourceSiteId`),
  CONSTRAINT `fk_buxaagekerjqtvmvmgmrjnldhfylqtazuvsm` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_otqhklmlyehftwicabyaqlflvcnglshikqea` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tcdhkdhmcdehrqlbtnewaegmccxbfsjfvquv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rtwhxdbqnalvhwcfiqtzxcwirctnwkckdkqt` (`canonicalId`,`num`),
  KEY `fk_yzalytilbdfuiawmzrgrhdnoifasmionztog` (`creatorId`),
  CONSTRAINT `fk_gliqlrssuhnxroeatrmncuyoxseyytlvfqjn` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yzalytilbdfuiawmzrgrhdnoifasmionztog` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_cllobwvltnzhhybuckbpygyvoiqtuithasrj` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_akvuipaoicsryceuulmjyeokghjyuvlpvzdf` (`elementId`,`siteId`,`reserved`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_kxzoyynqdzcwanfpobshjgzkefmgnfbggiur` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_ytzvqpynfhbotsyuupmyylkfhxqccfgttumd` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `minAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lmcclvxmsfskyzbtskbkcvpoopstzujplznp` (`handle`),
  KEY `idx_diwarucgeibxkgfwdmhhxgxchnjwnxjzgxph` (`name`),
  KEY `idx_nysbiijchejdwiyjhucuobyhcynsqydzevzd` (`structureId`),
  KEY `idx_cffgiqmgeaodfeaeimaxgkhufqgtsemsegrb` (`dateDeleted`),
  CONSTRAINT `fk_juqlklhxzufdrnjzbopgidfmaaaqttouwdnr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_fqmtqkutsxnhhndovehndqjhrmyxcjtkxxul` (`typeId`),
  CONSTRAINT `fk_bychkwzjcxlfdwzqmrbzoaretdgtkckbmfjq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fqmtqkutsxnhhndovehndqjhrmyxcjtkxxul` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqlpuaxdmxtoqonjtnyaznoiynmfhkkjbbte` (`sectionId`,`siteId`),
  KEY `idx_lddxzbjvythelcruekmsvulalymybhnobbry` (`siteId`),
  CONSTRAINT `fk_jstpongcypvgpmnhgzinyrdmsgrnoutonaco` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ynhvwkfkighbvtczbokdjaewkxwfwkgwhoco` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pwnvgympqcsmmptmjtoqxbtqwgmdtppjtydc` (`uid`),
  KEY `idx_uyofkixteflhvqgqwfetswkhddoyrtwgjmst` (`token`),
  KEY `idx_uyrvkjyikvvgbnsptwinvexbroiokxofjrvz` (`dateUpdated`),
  KEY `idx_ducuaenxzdlfoturryznzuvzjirtkqmhcrpr` (`userId`),
  CONSTRAINT `fk_lyntcmanehuogzfuqcysqihlgzcxnmdzsane` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_svauwrfacmpslesbsznmsvqqgrgdyvpfhssl` (`userId`,`message`),
  CONSTRAINT `fk_kpvjvckocibwacvdksxydcqieddfqmxagege` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_icilaekldxswdekifhmigpxxpeoclomnmcrs` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gwyolpycwsvxrhucrvtspoqobdhugylooxqi` (`dateDeleted`),
  KEY `idx_zpkbaelgbkfnempjrcpaxlhpdtolrxrdpmzx` (`handle`),
  KEY `idx_leuxbmskdkfhliemasyjqbtwdcnhiuvtrsyp` (`sortOrder`),
  KEY `fk_nsjnesubyldjnibnqqfjfduyzgfzyrksqycm` (`groupId`),
  CONSTRAINT `fk_nsjnesubyldjnibnqqfjfduyzgfzyrksqycm` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_lglcjyleselpfadxevivrtwrzhdjsrkjaeht` (`userId`),
  CONSTRAINT `fk_lglcjyleselpfadxevivrtwrzhdjsrkjaeht` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_brydgpamhmbsjivwpkjvchgadccnjntvuzac` (`structureId`,`elementId`),
  KEY `idx_cylxgoyhowmmiuitxuvcvttmfhjkgceuuyga` (`root`),
  KEY `idx_wdjugenimwnsxcfobdwapurauzkqdzqfwkkl` (`lft`),
  KEY `idx_usnbrrwayqukyavoxuifqfndcgbhyutdrzcs` (`rgt`),
  KEY `idx_hdtqxonfrfubohybsdxeaeyskqnmygxndije` (`level`),
  KEY `idx_rzjyqhmwpxgrqotrbxotuamamujiunamwqty` (`elementId`),
  CONSTRAINT `fk_xuhgictpiwrbxyxfdlkgigzynelzhjggfowy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jcpdtgqowojtixacoemnnovrwnyezybvxlck` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vzwtkbcxoaormbqctbgfzrvdgfwjmintlhrw` (`key`,`language`),
  KEY `idx_eplpvlrjstrhzgunulzqylrdpegrrawlcult` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_weyuoricjxzjiprgapsnianbdzbkwofytevt` (`name`),
  KEY `idx_mchsnizjjnasnwosuxypbydsuockxzakcvhf` (`handle`),
  KEY `idx_oxolsoygqtslnibyhfzqhjpxkfkdghiepllq` (`dateDeleted`),
  KEY `fk_obrwdnehmtpediufgerwzlatjjxoqixjypup` (`fieldLayoutId`),
  CONSTRAINT `fk_obrwdnehmtpediufgerwzlatjjxoqixjypup` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uaalqnyguubifznhaogoztuzhlcnapzwpnkf` (`groupId`),
  CONSTRAINT `fk_ukiypeujvdzlxiunsahdrfwbxmvgeylztljf` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zpnhptkrldmvgrshquwfrhjkfoubmgrwvyzx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hkhrwushngrmuhzkiaesavujijgofhxdsaby` (`token`),
  KEY `idx_kzsozqvimoxczrdffrwaglzcssyjpnoqzupj` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fowdsfevezdgakhqombkdpukqjgxpdvcuazz` (`handle`),
  KEY `idx_wwlomqwoeintojxfhazszppnbxqgwfzpfmsu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_shdynjuhdzklkqmjvckhwlxmeqrpxvpnmpjx` (`groupId`,`userId`),
  KEY `idx_tzvjdwvolkjczjpxppwioblaikfdgfsivftu` (`userId`),
  CONSTRAINT `fk_nveaxmqchqsqjxjkcrnwdrormldjrswfieyn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rdsqexsbbunroqacvyhsywiypdjhjsmudcny` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tuloliblpkyaaoxzxolrrmfrqqupifyslofg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uysuautkdxszpzzpujadnhjisaxoscotpbws` (`permissionId`,`groupId`),
  KEY `idx_gmfvgdaooplobqorfzqzemtztootdlnyssvx` (`groupId`),
  CONSTRAINT `fk_gbsnqbhvwvzhvukedmoyffnqzcwijilgznei` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_piscegqeupsewuksokbycunznvnorgmymtzl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_knlmthqumcflvvfmdvmedbxkmavuchmmkkhe` (`permissionId`,`userId`),
  KEY `idx_neslapdwiiosnqvftymcfalaevupfteehsvr` (`userId`),
  CONSTRAINT `fk_deqvyulddwtpxwrmtnvzsthhxnexalovoabm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_knaudclngygjkosxdazlpzinsxfyraxvhjyz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_gltrszoythhldlfxkyjqynozljqzqsgwhfxn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dzpxtqgjcynctzbbcyjmrcbcvclzqxltlrcg` (`active`),
  KEY `idx_nidhozqhtyihiwktcahnkqybxccrgkralrzm` (`locked`),
  KEY `idx_ggfzrjtslezdoiaxdojrfpuufqqysnuixjby` (`pending`),
  KEY `idx_jcqiaekgblmjylqsgwdbxmcwyifmehocpomi` (`suspended`),
  KEY `idx_dnvblmggfrpvgurckugwrwquvtekvqckmzyh` (`verificationCode`),
  KEY `idx_kmsxgagvqtefsyjlpcpdypumpimrvoykjkqy` (`email`),
  KEY `idx_douibkzvjahbzxrkbejufysehbormmitoyic` (`username`),
  KEY `fk_nmgplwcwcqzcmcjxoynriogbhrcmdiqbbhqz` (`photoId`),
  KEY `fk_utqyktcfcnbisuongydoxsoubmpbxqzditht` (`affiliatedSiteId`),
  CONSTRAINT `fk_gqntinzrpretffcrqgwelldwceetirdhyakk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nmgplwcwcqzcmcjxoynriogbhrcmdiqbbhqz` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_utqyktcfcnbisuongydoxsoubmpbxqzditht` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xgcvttybjhtmapvijpsfquydimfjefczecgf` (`name`,`parentId`,`volumeId`),
  KEY `idx_nlwqzldjjooenjimyhwwywjlcphbomokstqd` (`parentId`),
  KEY `idx_zbnqcvdgyhebibptozopmfyyhlvznwwbimun` (`volumeId`),
  CONSTRAINT `fk_cxspodpqarscvfaraevmomgxcfbpajreoibo` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dhezctoncajplrwqanosxzsmohoaasdeijyw` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ioxyxedicqjkunaqyffobdtwnrbcbogpigkh` (`name`),
  KEY `idx_zupirvwoxcwkzgirljgfqqaiciofmpquqfjz` (`handle`),
  KEY `idx_busmmnxsshqeuomayoizefatjvwovdelvllo` (`fieldLayoutId`),
  KEY `idx_zhdhbjkwgwiakxiccalcijqmxbdblbiaqwog` (`dateDeleted`),
  CONSTRAINT `fk_gxzyhyekjkpejkjdbnffkjuyopgjavgulvgd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tnywztvlahtcpueznmmemyxtwiufpqqrlzwp` (`userId`),
  CONSTRAINT `fk_tnywztvlahtcpueznmmemyxtwiufpqqrlzwp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rfqztblsszwhiwsmkwlgoupkjgxmgiwnwmbh` (`userId`),
  CONSTRAINT `fk_ptyoheatmratulvgguhxzyoohrdgospmtpab` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-07 15:35:46
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_caches`
--

LOCK TABLES `blitz_caches` WRITE;
/*!40000 ALTER TABLE `blitz_caches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_caches` VALUES (6,1,'',NULL,'2026-10-07 22:35:05',NULL);
/*!40000 ALTER TABLE `blitz_caches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_cachetags`
--

LOCK TABLES `blitz_cachetags` WRITE;
/*!40000 ALTER TABLE `blitz_cachetags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_cachetags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_driverdata`
--

LOCK TABLES `blitz_driverdata` WRITE;
/*!40000 ALTER TABLE `blitz_driverdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_driverdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementcaches`
--

LOCK TABLES `blitz_elementcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementcaches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementcaches` VALUES (6,2,1),(6,10,1),(6,14,1);
/*!40000 ALTER TABLE `blitz_elementcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementexpirydates`
--

LOCK TABLES `blitz_elementexpirydates` WRITE;
/*!40000 ALTER TABLE `blitz_elementexpirydates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementexpirydates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementfieldcaches`
--

LOCK TABLES `blitz_elementfieldcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueries`
--

LOCK TABLES `blitz_elementqueries` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementqueries` VALUES (1,1136567796,'craft\\elements\\Entry','{\"sectionId\":1,\"siteId\":1,\"public\":true}','index.twig:11','{% for entry in craft.entries().section(\'blog\').public(true).all() %} %}','#0 /var/www/html/vendor/putyourlightson/craft-blitz/src/services/GenerateCacheService.php(334): putyourlightson\\blitz\\services\\GenerateCacheService->saveElementQuery()\n#1 /var/www/html/vendor/putyourlightson/craft-blitz/src/services/GenerateCacheService.php(237): putyourlightson\\blitz\\services\\GenerateCacheService->addElementQuery()\n#2 putyourlightson\\blitz\\services\\GenerateCacheService->{closure:putyourlightson\\blitz\\services\\GenerateCacheService::registerElementPrepareEvents():232}()\n#3 /var/www/html/vendor/yiisoft/yii2/base/Event.php(312): call_user_func()\n#4 /var/www/html/vendor/yiisoft/yii2/base/Component.php(657): yii\\base\\Event::trigger()\n#5 /var/www/html/vendor/craftcms/cms/src/elements/db/ElementQuery.php(2483): yii\\base\\Component->trigger()\n#6 /var/www/html/vendor/craftcms/cms/src/elements/db/EntryQuery.php(836): craft\\elements\\db\\ElementQuery->beforePrepare()\n#7 /var/www/html/vendor/craftcms/cms/src/elements/db/ElementQuery.php(1658): craft\\elements\\db\\EntryQuery->beforePrepare()\n#8 /var/www/html/vendor/yiisoft/yii2/db/QueryBuilder.php(229): craft\\elements\\db\\ElementQuery->prepare()\n#9 /var/www/html/vendor/yiisoft/yii2/db/Query.php(157): yii\\db\\QueryBuilder->build()\n#10 /var/www/html/vendor/yiisoft/yii2/db/Query.php(249): yii\\db\\Query->createCommand()\n#11 /var/www/html/vendor/craftcms/cms/src/db/Query.php(292): yii\\db\\Query->all()\n#12 /var/www/html/vendor/craftcms/cms/src/elements/db/ElementQuery.php(1894): craft\\db\\Query->all()\n#13 /var/www/html/vendor/twig/twig/src/Extension/CoreExtension.php(1928): craft\\elements\\db\\ElementQuery->all()\n#14 /var/www/html/vendor/craftcms/cms/src/helpers/Template.php(156): Twig\\Extension\\CoreExtension::getAttribute()\n#15 /var/www/html/storage/runtime/compiled_templates/4c/4cfd2e153095b079bdaaca05aa0d5356.php(65): craft\\helpers\\Template::attribute()\n#16 /var/www/html/vendor/twig/twig/src/Template.php(411): __TwigTemplate_67e0cddedd9ed5f63ad034c9de6d332d->doDisplay()\n#17 /var/www/html/vendor/twig/twig/src/Template.php(366): Twig\\Template->yield()\n#18 /var/www/html/vendor/twig/twig/src/Template.php(381): Twig\\Template->display()\n#19 /var/www/html/vendor/twig/twig/src/TemplateWrapper.php(51): Twig\\Template->render()\n#20 /var/www/html/vendor/twig/twig/src/Environment.php(333): Twig\\TemplateWrapper->render()\n#21 /var/www/html/vendor/craftcms/cms/src/web/View.php(596): Twig\\Environment->render()\n#22 /var/www/html/vendor/craftcms/cms/src/web/View.php(683): craft\\web\\View->renderTemplate()\n#23 /var/www/html/vendor/craftcms/cms/src/web/TemplateResponseFormatter.php(57): craft\\web\\View->renderPageTemplate()\n#24 /var/www/html/vendor/yiisoft/yii2/web/Response.php(1118): craft\\web\\TemplateResponseFormatter->format()\n#25 /var/www/html/vendor/craftcms/cms/src/web/Response.php(358): yii\\web\\Response->prepare()\n#26 /var/www/html/vendor/yiisoft/yii2/web/Response.php(339): craft\\web\\Response->prepare()\n#27 /var/www/html/vendor/yiisoft/yii2/base/Application.php(388): yii\\web\\Response->send()\n#28 /var/www/html/web/index.php(12): yii\\base\\Application->run()');
/*!40000 ALTER TABLE `blitz_elementqueries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryattributes`
--

LOCK TABLES `blitz_elementqueryattributes` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementqueryattributes` VALUES (1,'postDate');
/*!40000 ALTER TABLE `blitz_elementqueryattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerycaches`
--

LOCK TABLES `blitz_elementquerycaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerycaches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementquerycaches` VALUES (6,1);
/*!40000 ALTER TABLE `blitz_elementquerycaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryfields`
--

LOCK TABLES `blitz_elementqueryfields` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementqueryfields` VALUES (1,'9ab07625-68de-43a8-9344-ca553c55431c');
/*!40000 ALTER TABLE `blitz_elementqueryfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerysites`
--

LOCK TABLES `blitz_elementquerysites` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerysites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementquerysites` VALUES (1,1);
/*!40000 ALTER TABLE `blitz_elementquerysites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerysources`
--

LOCK TABLES `blitz_elementquerysources` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerysources` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementquerysources` VALUES (1,1);
/*!40000 ALTER TABLE `blitz_elementquerysources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_includes`
--

LOCK TABLES `blitz_includes` WRITE;
/*!40000 ALTER TABLE `blitz_includes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_includes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_ssiincludecaches`
--

LOCK TABLES `blitz_ssiincludecaches` WRITE;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2026-10-07 22:32:23',0,1),(2,1,'slug','2026-10-07 22:32:23',0,1),(2,1,'status','2026-10-07 22:32:23',0,1),(2,1,'title','2026-10-07 22:32:23',0,1),(2,1,'uri','2026-10-07 22:32:23',0,1),(4,1,'postDate','2026-10-07 22:32:26',0,1),(4,1,'slug','2026-10-07 22:32:26',0,1),(4,1,'status','2026-10-07 22:32:26',0,1),(4,1,'title','2026-10-07 22:32:26',0,1),(4,1,'uri','2026-10-07 22:32:26',0,1),(10,1,'postDate','2026-10-07 22:33:36',0,1),(10,1,'slug','2026-10-07 22:33:36',0,1),(10,1,'status','2026-10-07 22:33:36',0,1),(10,1,'title','2026-10-07 22:33:36',0,1),(10,1,'uri','2026-10-07 22:33:36',0,1),(14,1,'postDate','2026-10-07 22:34:55',0,1),(14,1,'slug','2026-10-07 22:34:55',0,1),(14,1,'status','2026-10-07 22:34:55',0,1),(14,1,'title','2026-10-07 22:34:55',0,1),(14,1,'uri','2026-10-07 22:34:55',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:33:32',0,1),(4,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:33:58',0,1),(7,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:32:56',0,1),(9,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:33:32',0,1),(13,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:33:58',0,1),(14,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:35:12',0,1),(17,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:35:04',0,1),(19,1,1,'9ab07625-68de-43a8-9344-ca553c55431c','2026-10-07 22:35:12',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2026-10-07 22:33:31'),(2,1,1,NULL,'save','2026-10-07 22:33:32'),(4,1,1,NULL,'edit','2026-10-07 22:33:57'),(4,1,1,NULL,'save','2026-10-07 22:33:58'),(10,1,1,NULL,'save','2026-10-07 22:33:36'),(14,1,1,NULL,'edit','2026-10-07 22:35:11'),(14,1,1,NULL,'save','2026-10-07 22:35:12');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-10-07 22:28:36','2026-10-07 22:28:36',NULL,NULL,NULL,'c9de3649-c506-4395-b5ed-5e7b6839d770'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:32:21','2026-10-07 22:33:32',NULL,NULL,NULL,'7593a780-cfaf-4bdd-841d-c108a88b99fd'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:32:23','2026-10-07 22:32:23',NULL,NULL,NULL,'0728ab48-05ff-4366-aa76-37970d47a50f'),(4,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:32:24','2026-10-07 22:33:58',NULL,NULL,NULL,'92f6c02d-3cf5-4355-9181-d381c15c0772'),(5,4,NULL,2,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:32:26','2026-10-07 22:32:26',NULL,NULL,NULL,'d3eddd5c-a5c3-41c0-beab-96ef5a408bb1'),(7,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:32:56','2026-10-07 22:32:56',NULL,NULL,NULL,'1faacc1f-bf45-4d43-beb7-93ede4084585'),(9,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:33:32','2026-10-07 22:33:32',NULL,NULL,NULL,'fc8a7633-af9b-49c1-959a-7c39a691dc1f'),(10,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:33:34','2026-10-07 22:33:36',NULL,NULL,NULL,'26f24456-3e9d-4c21-89eb-021db677a6a2'),(11,10,NULL,5,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:33:36','2026-10-07 22:33:36',NULL,NULL,NULL,'b4b5de14-500e-4844-9c23-e593ad961b06'),(13,4,NULL,6,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:33:58','2026-10-07 22:33:58',NULL,NULL,NULL,'cb60305d-737e-4695-a587-2ea263133758'),(14,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:34:52','2026-10-07 22:35:12',NULL,NULL,NULL,'5d2f6c63-fae4-4ad7-9077-7276e75311d0'),(15,14,NULL,7,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:34:55','2026-10-07 22:34:55',NULL,NULL,NULL,'ac836961-7ba7-4484-8dba-0926fee5e583'),(17,14,NULL,8,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:35:04','2026-10-07 22:35:04',NULL,NULL,NULL,'a735b669-958b-47c8-9d72-f16c8dd294f8'),(19,14,NULL,9,1,'craft\\elements\\Entry',1,0,'2026-10-07 22:35:12','2026-10-07 22:35:12',NULL,NULL,NULL,'e10fbcd9-d776-45a7-85af-c72b93c500fb');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-10-07 22:28:36','2026-10-07 22:28:36','e66b9954-e330-4e4f-95f1-69ba31d6cd88'),(2,2,1,'Test 1','test-1','blob/test-1','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:32:21','2026-10-07 22:33:32','6cf55252-1f22-49df-a449-54dac5ccb2fd'),(3,3,1,'Test 1','test-1','blob/test-1','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:32:23','2026-10-07 22:32:23','776a5c8e-9204-4744-abac-c786a6c2d075'),(4,4,1,'Test 2','test-2','blob/test-2','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:32:24','2026-10-07 22:33:58','ebd35717-97b7-4e16-8e90-b74ad921f872'),(5,5,1,'Test 2','test-2','blob/test-2','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:32:26','2026-10-07 22:32:26','4d219a4a-599f-472a-8461-84b26291ab17'),(7,7,1,'Test 1','test-1','blob/test-1','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:32:56','2026-10-07 22:32:56','6ecf6d63-5d56-457c-aae7-c6268d42b1b4'),(9,9,1,'Test 1','test-1','blob/test-1','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:33:32','2026-10-07 22:33:32','c00c6593-b901-405a-90a0-6a3134350e7a'),(10,10,1,'Test 3','test-3','blob/test-3','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:33:34','2026-10-07 22:33:36','a67c0b2a-f565-4693-bedc-617ee4bfe97d'),(11,11,1,'Test 3','test-3','blob/test-3','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:33:36','2026-10-07 22:33:36','6adc4a86-c608-42b5-b5f3-c1b841e78e5d'),(13,13,1,'Test 2','test-2','blob/test-2','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:33:58','2026-10-07 22:33:58','c474c116-b44c-4412-b969-9b3bf05b2a3c'),(14,14,1,'Test 4','test-4','blob/test-4','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:34:52','2026-10-07 22:35:12','e5dbe876-f866-4c0c-9190-32af9d939686'),(15,15,1,'Test 4','test-4','blob/test-4','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:34:55','2026-10-07 22:34:55','08cb739a-700d-495e-b09e-3768cd725408'),(17,17,1,'Test 4','test-4','blob/test-4','{\"9ab07625-68de-43a8-9344-ca553c55431c\": true}',1,'2026-10-07 22:35:04','2026-10-07 22:35:04','8695eefa-38fb-4ce7-b918-c9cba41b0e94'),(19,19,1,'Test 4','test-4','blob/test-4','{\"9ab07625-68de-43a8-9344-ca553c55431c\": false}',1,'2026-10-07 22:35:12','2026-10-07 22:35:12','6b5c03ab-e584-4741-97c0-9adb50674663');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:32:21','2026-10-07 22:32:23'),(3,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:32:23','2026-10-07 22:32:23'),(4,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:32:24','2026-10-07 22:32:26'),(5,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:32:26','2026-10-07 22:32:26'),(7,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:32:56','2026-10-07 22:32:56'),(9,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:33:32','2026-10-07 22:33:32'),(10,1,NULL,NULL,NULL,1,'2026-10-07 22:33:00',NULL,'live',NULL,NULL,'2026-10-07 22:33:34','2026-10-07 22:33:36'),(11,1,NULL,NULL,NULL,1,'2026-10-07 22:33:00',NULL,'live',NULL,NULL,'2026-10-07 22:33:36','2026-10-07 22:33:36'),(13,1,NULL,NULL,NULL,1,'2026-10-07 22:32:00',NULL,'live',NULL,NULL,'2026-10-07 22:33:58','2026-10-07 22:33:58'),(14,1,NULL,NULL,NULL,1,'2026-10-07 22:34:00',NULL,'live',NULL,NULL,'2026-10-07 22:34:52','2026-10-07 22:34:55'),(15,1,NULL,NULL,NULL,1,'2026-10-07 22:34:00',NULL,'live',NULL,NULL,'2026-10-07 22:34:55','2026-10-07 22:34:55'),(17,1,NULL,NULL,NULL,1,'2026-10-07 22:34:00',NULL,'live',NULL,NULL,'2026-10-07 22:35:04','2026-10-07 22:35:04'),(19,1,NULL,NULL,NULL,1,'2026-10-07 22:34:00',NULL,'live',NULL,NULL,'2026-10-07 22:35:12','2026-10-07 22:35:12');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(7,1,1),(9,1,1),(10,1,1),(11,1,1),(13,1,1),(14,1,1),(15,1,1),(17,1,1),(19,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Post','post',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-10-07 22:30:27','2026-10-07 22:30:27',NULL,'461f2159-e25b-49e2-a22c-290e5184a522');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"cccfc361-354b-4c30-9708-b919dda5661a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"23c45314-0ea5-42de-8fcd-3cf58a697046\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-10-07T22:29:09+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"9ab07625-68de-43a8-9344-ca553c55431c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3\", \"required\": false, \"dateAdded\": \"2026-10-07T22:30:27+00:00\", \"oldFieldUid\": null, \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-10-07 22:30:27','2026-10-07 22:30:27',NULL,'5992d0b8-8c87-4adb-b661-e85f5e40abb2');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Public','public','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":null,\"onLabel\":null,\"showLabelsInCards\":false}','2026-10-07 22:30:25','2026-10-07 22:30:25',NULL,'e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.11.5','5.11.0.2',0,'nkyokxflcrbo','3@vufnlbmufc','2026-10-07 22:28:36','2026-10-07 22:33:26','55c8c9b4-e7d5-4ee9-a63d-256cc4fa742d');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','d4dcff1e-30a9-40a9-8d8f-c52075b7e82c'),(2,'craft','m221101_115859_create_entries_authors_table','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','d6a912b3-461e-48e2-9bc5-f112f91ace44'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','23afe1a1-27ee-41bb-aeac-e96c50cca20e'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','d5df4639-07b8-4759-bbea-2b278aedb8ea'),(5,'craft','m230314_110309_add_authenticator_table','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','7212daca-c873-4a21-acb7-88d48f4649f4'),(6,'craft','m230314_111234_add_webauthn_table','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','f8653f7a-57e4-45b9-a78b-e1d4db9eb532'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','ac6737a2-573e-43fb-9513-c57bbfca97df'),(8,'craft','m230511_000000_field_layout_configs','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','9c84b215-5a55-469a-88b7-734c67c28998'),(9,'craft','m230511_215903_content_refactor','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','11cb00a9-3044-43f3-a2c8-b2c5ecbee234'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','bf8ddf6f-41e2-4aa9-8478-e4ad90b298f5'),(11,'craft','m230524_000001_entry_type_icons','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','0b309836-ea5c-41cd-8d97-02abec159407'),(12,'craft','m230524_000002_entry_type_colors','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','f5e25a92-b56b-414b-a799-adc26cda682e'),(13,'craft','m230524_220029_global_entry_types','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','67ba26ff-c5a1-45b8-86cd-161972258319'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','ab48f24c-5884-4379-8f4f-7e97da14df88'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','85058460-d6a0-4200-8845-bdd6c3767630'),(16,'craft','m230616_173810_kill_field_groups','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','6b00947e-4ad8-4c33-b1c6-a1f7f8eb436d'),(17,'craft','m230616_183820_remove_field_name_limit','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','59aef5d8-32b1-4cec-a28b-1900a650b1e6'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','b20efdb9-de64-43f0-81e8-1fd285348d42'),(19,'craft','m230710_162700_element_activity','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','42bd085a-7a5b-4ea2-882c-f5b71998834a'),(20,'craft','m230820_162023_fix_cache_id_type','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','b6cb9044-3449-4fc4-9b93-d046615cc0e3'),(21,'craft','m230826_094050_fix_session_id_type','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','0ccb936d-654e-4013-87e9-ccc3af81054e'),(22,'craft','m230904_190356_address_fields','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','bf4effa1-3428-4483-a0e2-87ff3796d47e'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','b01fb493-dd19-407c-9b1e-df182d154a63'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','12728f73-f9d7-4dc9-8fbe-fdb45b4377a8'),(25,'craft','m231213_030600_element_bulk_ops','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','85b74050-b1b3-4900-b25a-af783356d587'),(26,'craft','m240129_150719_sites_language_amend_length','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','4bd51a51-3fae-45f4-aa44-7af5b4d0c5c5'),(27,'craft','m240206_035135_convert_json_columns','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','f2e57d9a-841d-4fa9-9f38-3874abc74ecf'),(28,'craft','m240207_182452_address_line_3','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','a5da4d1c-7bee-4560-bac3-36eedf185551'),(29,'craft','m240302_212719_solo_preview_targets','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','7ddcd0fe-2fd7-4f79-991c-b92d58476fb6'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','8f83e485-8198-4c03-9b42-63fe814628ca'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','20908ef3-d75e-4b1c-a52f-ff6f2947e33a'),(32,'craft','m240731_053543_soft_delete_fields','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','02cda7b4-cc75-4179-bb9b-94767605f4c7'),(33,'craft','m240805_154041_sso_identities','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','f13471ce-6845-4d06-ab2a-14fc0f9dd2ec'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','bc39ac21-a99d-4e45-b730-05f98d4b3210'),(35,'craft','m241120_190905_user_affiliated_sites','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','73991d5d-1606-4f7c-afa3-5d62d3f36510'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','ca8b4484-1574-4eec-9f4d-9509c9c19bc4'),(37,'craft','m250119_135304_entry_type_overrides','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','38dad8ab-dce1-4190-ad45-55a8436d593d'),(38,'craft','m250206_135036_search_index_queue','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','a1e9ebcf-d70a-4f33-96cd-ab190f69c98b'),(39,'craft','m250207_172349_bulkop_events','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','19c65aa7-02b6-41cc-b2e4-8fc982f4acb2'),(40,'craft','m250315_131608_unlimited_authors','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','dad384c8-70c1-4a36-8fb3-536f82d621c5'),(41,'craft','m250403_171253_static_statuses','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','21dc06b3-6f35-47c4-8fdb-4248ec4ded86'),(42,'craft','m250512_164202_asset_mime_types','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','9d96b3a1-8f8b-4d7f-8253-b2f24b89afdc'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','3daca90b-8325-4421-b384-caf016a29103'),(44,'craft','m250531_183058_content_blocks','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','86d79c84-ff99-46a1-a039-f59412d815ed'),(45,'craft','m250623_105031_entry_type_descriptions','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','ecf2b668-cc99-4c10-a8ed-72d74c1157ab'),(46,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','0fd69179-fe8a-4bd3-995a-e57f68ce166e'),(47,'craft','m251030_203440_drop_widgets_enabled_column','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','84072cf2-7e8e-499f-abaf-12f838da5985'),(48,'craft','m251110_192405_entry_type_ui_label_formats','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','d707f6cb-0c60-4aca-8b5a-afe51bf3b044'),(49,'craft','m251205_190131_drop_searchindexqueue_fk','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','af53edf4-2217-4083-88b8-6bf48b3219c9'),(50,'craft','m251230_192239_update_field_layouts','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','fb47344a-f70f-4429-86e8-da61013732d7'),(51,'craft','m260106_130629_directive_schema_components','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','5b7caeb4-6054-4692-aa3d-3b32577ee4ed'),(52,'craft','m260120_120907_line_breaks_in_titles','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','7196ad01-69f3-4678-b8d5-0b59c21a2810'),(53,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','fd4c2887-c2f8-424a-bb31-ae47d2931d06'),(54,'craft','m260401_155236_min_authors_setting','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','b01cdf13-1b8a-42e8-98f3-05adaa280ea1'),(55,'craft','m260610_065719_translatable_alt_text_content','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','b3a1edf2-8b76-471d-94db-09a71b3865d1'),(56,'craft','m260812_143000_drop_elementactivity_draftid_fk','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','792d1737-a314-4235-9207-7957f7a172fc'),(57,'craft','m260817_012148_queue_reserve_index','2026-10-07 22:28:37','2026-10-07 22:28:37','2026-10-07 22:28:37','2e09e8bb-5ddf-4114-8f44-512130a4540d'),(58,'plugin:blitz','Install','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','84714ea5-be8a-46b0-997b-502f763d863d'),(59,'plugin:blitz','m240719_120000_remove_legacy_settings','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','dd25a280-1c2d-4510-8b71-b2d032557565'),(60,'plugin:blitz','m240731_120000_add_datecached_column','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','c46f750a-531d-4f96-9f63-26aae4f32acd'),(61,'plugin:blitz','m240820_120000_add_fieldinstanceuid_column','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','12d2d64f-87b2-4593-abb1-74287988bae7'),(62,'plugin:blitz','m240826_120000_convert_cachecontrol_settings','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','f977936a-c21b-45ff-b485-a1228c4b2318'),(63,'plugin:blitz','m240905_120000_convert_enabled_settings','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','ebef1b68-1c52-4e6e-8d49-d59833ce0e95'),(64,'plugin:blitz','m250314_120000_remove_hints_table','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','67dc19dc-cec3-4a07-8c3f-e9cf06eefabe'),(65,'plugin:blitz','m250510_120000_increase_uri_column_length','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','d7d7387d-f56c-4b95-ac8e-f63a63d96723'),(66,'plugin:blitz','m250731_120000_add_element_query_backtrace_columns','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','6eec59d3-3117-43ec-8dd3-b9b2a2070424'),(67,'plugin:blitz','m260911_120000_add_siteid_columns','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','1789c2b6-ad74-4f22-a72b-cac655622792'),(68,'plugin:blitz','m260913_120000_add_elementquerysites_table','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','910768e4-d1f3-4fa6-a410-b7460d0bcf67'),(69,'plugin:blitz','m260925_120000_fix_siteid_primary_keys','2026-10-07 22:29:13','2026-10-07 22:29:13','2026-10-07 22:29:13','77ae5e99-7ac0-403a-845e-baf889bf889f');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'blitz','5.13.4','5.13.0','2026-10-07 22:29:12','2026-10-07 22:29:12','2026-10-07 22:29:12','e5a74f84-0cc8-4b51-98b7-3e29ed8ede1b');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1791412406'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.heading','\"Channels\"'),('elementSources.craft\\elements\\Entry.1.key','\"heading:4df16156-67d6-441d-851e-4420cf72a46d\"'),('elementSources.craft\\elements\\Entry.1.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.1.type','\"heading\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"section:68bf0250-05e1-4188-b566-fda7bb963bed\"'),('elementSources.craft\\elements\\Entry.2.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"field:e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.3','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('email.fromEmail','\"admin@example.com\"'),('email.fromName','\"Craft Blitz Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.allowLineBreaksInTitles','false'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.color','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.description','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.cardThumbAlignment','\"end\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elementCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.autocapitalize','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.autocomplete','false'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.autocorrect','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.class','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.dateAdded','\"2026-10-07T22:29:09+00:00\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.disabled','false'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.elementCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.id','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.inputType','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.instructions','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.label','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.max','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.min','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.name','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.orientation','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.placeholder','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.readonly','false'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.required','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.size','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.step','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.tip','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.title','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.uid','\"23c45314-0ea5-42de-8fcd-3cf58a697046\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.userCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.warning','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.0.width','100'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.dateAdded','\"2026-10-07T22:30:27+00:00\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.editCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.elementCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.fieldUid','\"e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.handle','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.instructions','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.label','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.oldFieldUid','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.required','false'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.tip','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.uid','\"9ab07625-68de-43a8-9344-ca553c55431c\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.userCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.warning','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.elements.1.width','100'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.name','\"Content\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.uid','\"cccfc361-354b-4c30-9708-b919dda5661a\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.tabs.0.userCondition','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.fieldLayouts.5992d0b8-8c87-4adb-b661-e85f5e40abb2.thumbFieldKey','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.handle','\"post\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.hasTitleField','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.icon','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.name','\"Post\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.showSlugField','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.showStatusField','true'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.slugTranslationKeyFormat','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.slugTranslationMethod','\"site\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.titleFormat','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.titleTranslationKeyFormat','null'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.titleTranslationMethod','\"site\"'),('entryTypes.461f2159-e25b-49e2-a22c-290e5184a522.uiLabelFormat','\"{title}\"'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.columnSuffix','null'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.handle','\"public\"'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.instructions','null'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.name','\"Public\"'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.searchable','false'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.settings.default','true'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.settings.offLabel','null'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.settings.onLabel','null'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.settings.showLabelsInCards','false'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.translationKeyFormat','null'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.translationMethod','\"none\"'),('fields.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3.type','\"craft\\\\fields\\\\Lightswitch\"'),('meta.__names__.226b3481-d26c-45da-87aa-0ec2e52d49af','\"Craft Blitz Test\"'),('meta.__names__.461f2159-e25b-49e2-a22c-290e5184a522','\"Post\"'),('meta.__names__.604b0441-e341-4efa-a841-6664d4d5316e','\"Craft Blitz Test\"'),('meta.__names__.68bf0250-05e1-4188-b566-fda7bb963bed','\"Blog\"'),('meta.__names__.e3c06d38-cfe4-4261-bc3f-93abb7bbdbf3','\"Public\"'),('plugins.blitz.edition','\"standard\"'),('plugins.blitz.enabled','true'),('plugins.blitz.schemaVersion','\"5.13.0\"'),('plugins.blitz.settings.apiKey','\"\"'),('plugins.blitz.settings.batchInsertSize','50'),('plugins.blitz.settings.cacheActionRequests','false'),('plugins.blitz.settings.cacheControlHeader','\"public, s-maxage=31536000, max-age=0\"'),('plugins.blitz.settings.cacheControlHeaderExpired','\"public, s-maxage=5, max-age=0\"'),('plugins.blitz.settings.cachedIncludePathParam','\"p\"'),('plugins.blitz.settings.cacheDuration','null'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.0','\"concurrency\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.1','\"3\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.1.0','\"useBasicAuth\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.1.1','\"\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.2.0','\"username\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.2.1','\"\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.3.0','\"password\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.3.1','\"\"'),('plugins.blitz.settings.cacheGeneratorType','\"putyourlightson\\\\blitz\\\\drivers\\\\generators\\\\HttpGenerator\"'),('plugins.blitz.settings.cacheNonHtmlResponses','false'),('plugins.blitz.settings.cachePurgerType','\"putyourlightson\\\\blitz\\\\drivers\\\\purgers\\\\DummyPurger\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.0','\"folderPath\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.1','\"@webroot/cache/blitz\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.0','\"compressCachedValues\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.1','\"\"'),('plugins.blitz.settings.cacheStorageType','\"putyourlightson\\\\blitz\\\\drivers\\\\storage\\\\FileStorage\"'),('plugins.blitz.settings.cachingEnabled','true'),('plugins.blitz.settings.debug','false'),('plugins.blitz.settings.defaultCacheControlHeader','\"no-store\"'),('plugins.blitz.settings.deployerType','\"putyourlightson\\\\blitz\\\\drivers\\\\deployers\\\\DummyDeployer\"'),('plugins.blitz.settings.detectSsiEnabled','true'),('plugins.blitz.settings.driverJobBatchSize','100'),('plugins.blitz.settings.driverJobPriority','100'),('plugins.blitz.settings.esiEnabled','false'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.1.1','\"gclid\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.1.1','\"fbclid\"'),('plugins.blitz.settings.generatePagesWithQueryStringParams','true'),('plugins.blitz.settings.hintsEnabled','false'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.1.1','\".*\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.1.0','\"uriPattern\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.1.1','\".*\"'),('plugins.blitz.settings.injectScriptEvent','\"DOMContentLoaded\"'),('plugins.blitz.settings.injectScriptPosition','3'),('plugins.blitz.settings.integrations.0','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\CommerceIntegration\"'),('plugins.blitz.settings.integrations.1','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\DatastarIntegration\"'),('plugins.blitz.settings.integrations.2','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\SeomaticIntegration\"'),('plugins.blitz.settings.maxRetryAttempts','10'),('plugins.blitz.settings.maxUriIndexLength','767'),('plugins.blitz.settings.maxUriLength','2048'),('plugins.blitz.settings.mutexTimeout','1'),('plugins.blitz.settings.onlyCacheLowercaseUris','false'),('plugins.blitz.settings.outputComments','true'),('plugins.blitz.settings.purgeAssetImagesWhenChanged','true'),('plugins.blitz.settings.queryStringCaching','0'),('plugins.blitz.settings.queueJobTtr','300'),('plugins.blitz.settings.refreshCacheAutomaticallyForGlobals','true'),('plugins.blitz.settings.refreshCacheEnabled','true'),('plugins.blitz.settings.refreshCacheJobPriority','10'),('plugins.blitz.settings.refreshCacheWhenElementMovedInStructure','true'),('plugins.blitz.settings.refreshCacheWhenElementSavedNotLive','false'),('plugins.blitz.settings.refreshCacheWhenElementSavedUnchanged','false'),('plugins.blitz.settings.refreshExpiredCacheAfterVisit','true'),('plugins.blitz.settings.refreshMode','3'),('plugins.blitz.settings.sendPoweredByHeader','true'),('plugins.blitz.settings.ssiEnabled','false'),('plugins.blitz.settings.ssiTagFormat','\"<!--#include virtual=\\\"{uri}\\\" -->\"'),('plugins.blitz.settings.trackElementQueries','true'),('plugins.blitz.settings.trackElements','true'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.defaultPlacement','\"end\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.enableVersioning','true'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.entryTypes.0.uid','\"461f2159-e25b-49e2-a22c-290e5184a522\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.handle','\"blog\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.maxAuthors','1'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.minAuthors','1'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.name','\"Blog\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.previewTargets.0.label','\"Primary entry page\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.previewTargets.0.refresh','\"1\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.previewTargets.0.urlFormat','\"{url}\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.propagationMethod','\"all\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.siteSettings.226b3481-d26c-45da-87aa-0ec2e52d49af.enabledByDefault','true'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.siteSettings.226b3481-d26c-45da-87aa-0ec2e52d49af.hasUrls','true'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.siteSettings.226b3481-d26c-45da-87aa-0ec2e52d49af.template','\"blob/_entry.twig\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.siteSettings.226b3481-d26c-45da-87aa-0ec2e52d49af.uriFormat','\"blob/{slug}\"'),('sections.68bf0250-05e1-4188-b566-fda7bb963bed.type','\"channel\"'),('siteGroups.604b0441-e341-4efa-a841-6664d4d5316e.name','\"Craft Blitz Test\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.handle','\"default\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.hasUrls','true'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.language','\"en\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.name','\"Craft Blitz Test\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.primary','true'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.siteGroup','\"604b0441-e341-4efa-a841-6664d4d5316e\"'),('sites.226b3481-d26c-45da-87aa-0ec2e52d49af.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft Blitz Test\"'),('system.schemaVersion','\"5.11.0.2\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,4,1,1,''),(3,2,1,2,'Applied “Draft 1”'),(4,2,1,3,'Applied “Draft 1”'),(5,10,1,1,''),(6,4,1,2,'Applied “Draft 1”'),(7,14,1,1,''),(8,14,1,2,'Applied “Draft 1”'),(9,14,1,3,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' admin example com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' test 1 '),(2,'title',0,1,' test 1 '),(4,'slug',0,1,' test 2 '),(4,'title',0,1,' test 2 '),(10,'slug',0,1,' test 3 '),(10,'title',0,1,' test 3 '),(14,'slug',0,1,' test 4 '),(14,'title',0,1,' test 4 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Blog','blog','channel',1,1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-10-07 22:30:35','2026-10-07 22:30:44',NULL,'68bf0250-05e1-4188-b566-fda7bb963bed');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'blob/{slug}','blob/_entry.twig',1,'2026-10-07 22:30:35','2026-10-07 22:30:35','987323b1-76b3-4afc-9c9b-f1649058b82b');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft Blitz Test','2026-10-07 22:28:36','2026-10-07 22:28:36',NULL,'604b0441-e341-4efa-a841-6664d4d5316e');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Craft Blitz Test','default','en',1,'$PRIMARY_SITE_URL',1,'2026-10-07 22:28:36','2026-10-07 22:28:36',NULL,'226b3481-d26c-45da-87aa-0ec2e52d49af');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'rE1BDNYBY3Pv4SGUefgCzrNbxqIbLjLn','blitz/generator/generate',NULL,NULL,'2026-10-08 22:32:23','2026-10-07 22:32:23','2026-10-07 22:32:23','ca9ab799-f649-4240-b34d-3dd5e1952b03'),(2,'0tC15upjCutzan_KLpvnkmUE12TkSzkQ','blitz/generator/generate',NULL,NULL,'2026-10-08 22:32:26','2026-10-07 22:32:26','2026-10-07 22:32:26','84111c4d-5c92-486c-854d-7c084f354ed5'),(3,'pMCCrCK1VvGTGFSGfLal9m7GoAsbs5oy','blitz/generator/generate',NULL,NULL,'2026-10-08 22:32:57','2026-10-07 22:32:57','2026-10-07 22:32:57','1409033f-5948-47b1-a0de-4e3becf5124b'),(4,'_ogPGqlR3UX6SNV4_3DEYmnGxE79Kw9A','blitz/generator/generate',NULL,NULL,'2026-10-08 22:33:32','2026-10-07 22:33:32','2026-10-07 22:33:32','55305af5-8b63-4407-8609-41b52f56f890'),(5,'gT4wb0NA9lz6SrkZ0JhkSSTDf8mOX6Se','blitz/generator/generate',NULL,NULL,'2026-10-08 22:33:36','2026-10-07 22:33:36','2026-10-07 22:33:36','85364003-3210-4421-957e-768c2b4c352d'),(6,'ol75ZSe2FzEhOl9aztYMhj6jcY8Fnh_8','blitz/generator/generate',NULL,NULL,'2026-10-08 22:33:58','2026-10-07 22:33:58','2026-10-07 22:33:58','010add25-569a-4c4b-9dd8-913e885a5f30'),(7,'QrILB3fqKXenKVuUXvJCL0wiNlHFBQSt','blitz/generator/generate',NULL,NULL,'2026-10-08 22:34:55','2026-10-07 22:34:55','2026-10-07 22:34:55','6e44ad3f-1e47-49f0-8829-90fcabfedc88'),(8,'hHeTbfqoMWhb16SBMm2jwAD1umn1XNao','blitz/generator/generate',NULL,NULL,'2026-10-08 22:35:04','2026-10-07 22:35:04','2026-10-07 22:35:04','7b1dd770-c398-413f-b935-ef11d5175f38'),(9,'w5u3wWgGqhkT7sJ9hlRwZHo3oVc0XU1J','blitz/generator/generate',NULL,NULL,'2026-10-08 22:35:12','2026-10-07 22:35:12','2026-10-07 22:35:12','4a450834-07b0-4dcc-a66f-9171910b6850');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@example.com','$2y$13$kMqagPr3sDqelV5x5iNu3OZ/HiCE8QEVeqYvWka3vbMWR3c84N.X2','2026-10-07 22:28:46',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-10-07 22:28:36','2026-10-07 22:28:36','2026-10-07 22:28:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}','2026-10-07 22:28:46','2026-10-07 22:28:46','f98362c8-4580-4a72-bde2-0ad8b83f8916'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]','2026-10-07 22:28:46','2026-10-07 22:28:46','be8aee88-8f7c-4d90-8867-64d1421e5b35'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]','2026-10-07 22:28:46','2026-10-07 22:28:46','9e64751e-0796-46a6-9fa7-b934c86a5a8c'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}','2026-10-07 22:28:46','2026-10-07 22:28:46','dd16b691-33ac-4479-b961-bc18ea6cadd2');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-07 15:35:46
