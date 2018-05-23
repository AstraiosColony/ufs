CREATE DATABASE  IF NOT EXISTS `orbital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `orbital`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: orbital
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `access_code`
--

DROP TABLE IF EXISTS `access_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_code` (
  `code` int(11) NOT NULL,
  `valid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `UUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `DivID` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `RankID` tinyint(3) unsigned NOT NULL DEFAULT '13',
  `TitleID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `DisplayName` varchar(64) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `password` char(106) DEFAULT NULL COMMENT '128 char long sha512 hash',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 inactive 1 active',
  `induction_date` date DEFAULT NULL,
  `dh` bit(1) NOT NULL DEFAULT b'0',
  `JoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'BUG: This field should be a Date however we will get ERROR 1607 Invalid value. Please Fix',
  `DOB` date NOT NULL DEFAULT '1990-01-07',
  `birth_place` varchar(64) NOT NULL DEFAULT 'Some Where',
  `height_metric` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `weight_metric` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `hair_color` varchar(3) NOT NULL DEFAULT 'blk',
  `species` varchar(10) NOT NULL DEFAULT 'Human',
  `gender` varchar(50) NOT NULL DEFAULT '1',
  `ethnic_origin` varchar(64) DEFAULT '1',
  `nationality` varchar(64) DEFAULT '1',
  `ident_marks` varchar(64) DEFAULT '1',
  `db_privlage_level` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT 'Administration/viewing privlages',
  `cCode` varchar(32) DEFAULT NULL COMMENT 'Authentication codes',
  `pfp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_accounts_divisions` (`DivID`),
  KEY `FK_accounts_Rank` (`RankID`),
  KEY `FK_accounts_Titles` (`TitleID`)
) ENGINE=MyISAM AUTO_INCREMENT=3460 DEFAULT CHARSET=latin1 COMMENT='Profile information for Staff and Students of StarfleetDelta.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_types` (
  `atid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`atid`),
  UNIQUE KEY `Index 2` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Asset Type Codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) DEFAULT NULL COMMENT 'Asset UUID number for inworld assets',
  `type` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'See Asset Type table for possible values',
  `name` varchar(50) NOT NULL COMMENT 'Human readable Name for asset',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `Index 2` (`uuid`),
  KEY `FK_assets_asset_types` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Contains Asset UUIDs for Sounds and Images for the StarfleetDelta Classes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `FK_committee_accounts` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comms`
--

DROP TABLE IF EXISTS `comms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comms` (
  `comid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int(10) unsigned NOT NULL,
  `ObjectUUID` char(36) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`comid`),
  UNIQUE KEY `Index 3` (`ObjectUUID`),
  UNIQUE KEY `Index 4` (`url`),
  KEY `FK_Comms_accounts` (`accountid`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_UNIQUE` (`setting`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `ClassID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DivID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `AutherID` int(10) unsigned NOT NULL,
  `Class Name` tinytext NOT NULL,
  `Class Description` longtext NOT NULL,
  `Required Score` int(11) NOT NULL DEFAULT '80',
  PRIMARY KEY (`ClassID`),
  UNIQUE KEY `ClassName` (`Class Name`(100)),
  KEY `Divisions` (`DivID`),
  KEY `FK_courses_accounts` (`AutherID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classID` int(10) unsigned NOT NULL DEFAULT '1',
  `asset_id` int(10) unsigned DEFAULT NULL,
  `lineNumber` int(10) unsigned NOT NULL DEFAULT '1',
  `displayText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `Line` (`asset_id`,`displayText`,`lineNumber`),
  KEY `FK_curriculum_courses` (`classID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `did` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL DEFAULT '0',
  `alias` varchar(50) DEFAULT NULL,
  `FileNamePrefix` char(3) DEFAULT NULL,
  `colorX` int(10) unsigned NOT NULL DEFAULT '255',
  `colorY` int(10) unsigned NOT NULL DEFAULT '255',
  `ColorZ` int(10) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`did`),
  UNIQUE KEY `Index 3` (`dname`),
  UNIQUE KEY `Index 2` (`alias`),
  UNIQUE KEY `File name Prefix` (`FileNamePrefix`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='List of UFGQ Divisions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gradebook`
--

DROP TABLE IF EXISTS `gradebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook` (
  `entryIndex` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `StudentID` int(10) unsigned NOT NULL,
  `CourseID` int(10) unsigned NOT NULL,
  `Grade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entryIndex`),
  KEY `FK_gradebook_accounts` (`StudentID`),
  KEY `FK_gradebook_class_test` (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Holds all the grades for each class in StarfleetDelta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!50001 DROP VIEW IF EXISTS `grades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grades` AS SELECT 
 1 AS `Name`,
 1 AS `Class Name`,
 1 AS `Grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL AUTO_INCREMENT,
  `notifications_subject` varchar(250) NOT NULL,
  `notifications_text` text NOT NULL,
  `notifications_status` int(1) NOT NULL,
  PRIMARY KEY (`notifications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth`
--

DROP TABLE IF EXISTS `oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `bitly` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `posted` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posted_UNIQUE` (`posted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pname` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Product information for all of StarfleetDelta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `RankID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) DEFAULT '0',
  `RankLogo` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'â˜…',
  PRIMARY KEY (`RankID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Rank table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `rankname`
--

DROP TABLE IF EXISTS `rankname`;
/*!50001 DROP VIEW IF EXISTS `rankname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `rankname` AS SELECT 
 1 AS `RankLogo`,
 1 AS `rname`,
 1 AS `name`,
 1 AS `tag_name`,
 1 AS `active`,
 1 AS `dname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `roleplay`
--

DROP TABLE IF EXISTS `roleplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleplay` (
  `id` int(11) NOT NULL,
  `stardate` varchar(45) DEFAULT NULL,
  `starend` varchar(45) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `StudentID` int(10) unsigned NOT NULL,
  `QuestionID` int(10) unsigned NOT NULL,
  `answer` char(1) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `Index 4` (`StudentID`,`QuestionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_clock`
--

DROP TABLE IF EXISTS `time_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_clock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID from accounts table',
  `time_in` int(10) unsigned NOT NULL,
  `time_out` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Cross refrences clock times with AV UUIDs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `tid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='Common Group Tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProdID` int(10) unsigned NOT NULL DEFAULT '0',
  `AccountID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `FK_versions_products` (`ProdID`),
  KEY `FK_versions_accounts` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tracks accounts and product version information for the update system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `object` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'orbital'
--

--
-- Dumping routines for database 'orbital'
--
/*!50003 DROP FUNCTION IF EXISTS `ClockUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ClockUpdate`(
	`ACCOUNT_UUID` CHAR(36)


) RETURNS text CHARSET latin1
    DETERMINISTIC
BEGIN

DECLARE AccountID, ClockID INT(10);
SET ClockID = 0;
SET AccountID = 0;

SELECT a.ID INTO AccountID FROM accounts a WHERE a.UUID = ACCOUNT_UUID;
SELECT t.`id` INTO ClockID FROM `time_clock` t WHERE t.`user_id` = AccountID ORDER BY t.`id` DESC LIMIT 1;

IF FOUND_ROWS( ) > 0
THEN
	IF ( SELECT t.`time_out` FROM `time_clock` t WHERE t.`id` = ClockID )
	IS NULL
	THEN
		UPDATE `time_clock` t SET t.`time_out` = UNIX_TIMESTAMP() WHERE t.`id` = ClockID;
		RETURN 'User Clocked Out';
	ELSE
		INSERT INTO `time_clock` (`time_in`, `user_id`) VALUES (UNIX_TIMESTAMP(), AccountID);
		RETURN 'User Clocked In';
	END IF;
ELSE
	INSERT INTO `time_clock` (`time_in`, `user_id`) VALUES (UNIX_TIMESTAMP(), AccountID);
	RETURN 'New Account Created';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CourseLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CourseLine`(
	IN `CourseID` INT
,
	IN `LineNumber` INT
)
BEGIN

	SELECT IFNULL(c.`displayText`, CONCAT('ASSET|',CONCAT(aa.`type`,CONCAT(':',a.`uuid`)))) as `line`
	FROM `curriculum` c
		LEFT JOIN assets a
			ON  c.`asset_id` = a.`aid`
		LEFT JOIN asset_types aa
			ON a.`type`=aa.`atid`
		WHERE c.`classID` = CourseID AND c.lineNumber = LineNumber;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCommLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCommLink`(
	IN `OwnerUUID` CHAR(36),
	IN `ObjectUUID` CHAR(36)
,
	IN `URL` VARCHAR(255)
)
    DETERMINISTIC
BEGIN

	DECLARE AccountID INT(10);

	SELECT a.`ID` INTO AccountID FROM `accounts` a WHERE a.`UUID` = OwnerUUID;
	REPLACE INTO `Comms` (`accountid`, `url`, `ObjectUUID`) VALUES (AccountID, URL, ObjectUUID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `grades`
--

/*!50001 DROP VIEW IF EXISTS `grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grades` AS select ifnull(`a`.`DisplayName`,`a`.`username`) AS `Name`,`c`.`Class Name` AS `Class Name`,`g`.`Grade` AS `Grade` from (((`accounts` `a` join `gradebook` `g` on((`g`.`StudentID` = `a`.`ID`))) join `courses` `c` on((`c`.`ClassID` = `g`.`CourseID`))) join `divisions` `d` on((`c`.`DivID` = `d`.`did`))) order by `a`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rankname`
--

/*!50001 DROP VIEW IF EXISTS `rankname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rankname` AS select `r`.`RankLogo` AS `RankLogo`,`r`.`rname` AS `rname`,ifnull(`a`.`DisplayName`,`a`.`username`) AS `name`,`t`.`tag_name` AS `tag_name`,`a`.`active` AS `active`,`d`.`dname` AS `dname` from (((`accounts` `a` join `divisions` `d` on((`a`.`DivID` = `d`.`did`))) join `rank` `r` on((`a`.`RankID` = `r`.`RankID`))) join `titles` `t` on((`a`.`TitleID` = `t`.`tid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

