SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS `db767098765`;
CREATE DATABASE IF NOT EXISTS `db767098765` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `db767098765`;

DELIMITER $$
DROP PROCEDURE IF EXISTS `UpdateCommLink`$$
CREATE DEFINER=`dbo767098765`@`%` PROCEDURE `UpdateCommLink` (IN `OwnerUUID` CHAR(36) CHARSET utf8, IN `ObjectUUID` CHAR(36) CHARSET utf8, IN `URL` VARCHAR(255) CHARSET utf8)  MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

	DECLARE AccountID INT(10);

	SELECT a.`ID` INTO AccountID FROM `accounts` a WHERE a.`UUID` = OwnerUUID;
	REPLACE INTO `comms` (`accountid`, `url`, `ObjectUUID`) VALUES (AccountID, URL, ObjectUUID);
END$$

DELIMITER ;
DROP VIEW IF EXISTS `RankName`;
CREATE TABLE IF NOT EXISTS `RankName` (
`RankLogo` varchar(7)
,`rname` varchar(50)
,`name` varchar(64)
,`tag_name` varchar(50)
,`active` tinyint(4)
,`dname` varchar(50)
);

DROP TABLE IF EXISTS `access_code`;
CREATE TABLE IF NOT EXISTS `access_code` (
  `code` int(11) NOT NULL,
  `valid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `UUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `DivID` tinyint(3) UNSIGNED NOT NULL DEFAULT '10',
  `RankID` tinyint(3) UNSIGNED NOT NULL DEFAULT '13',
  `TitleID` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `DisplayName` varchar(64) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `password` char(255) DEFAULT NULL COMMENT '128 char long sha512 hash',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 inactive 1 active',
  `induction_date` date DEFAULT NULL,
  `dh` bit(1) NOT NULL DEFAULT b'0',
  `JoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'BUG: This field should be a Date however we will get ERROR 1607 Invalid value. Please Fix',
  `DOB` date NOT NULL DEFAULT '1990-01-07',
  `birth_place` varchar(64) NOT NULL DEFAULT 'Some Where',
  `height_metric` tinyint(3) UNSIGNED NOT NULL DEFAULT '6',
  `weight_metric` tinyint(3) UNSIGNED NOT NULL DEFAULT '6',
  `hair_color` varchar(3) NOT NULL DEFAULT 'blk',
  `species` varchar(10) NOT NULL DEFAULT 'Human',
  `gender` varchar(50) NOT NULL DEFAULT '1',
  `ethnic_origin` varchar(64) DEFAULT '1',
  `nationality` varchar(64) DEFAULT '1',
  `ident_marks` varchar(64) DEFAULT '1',
  `db_privlage_level` tinyint(3) UNSIGNED NOT NULL DEFAULT '255' COMMENT 'Administration/viewing privlages',
  `cCode` varchar(32) DEFAULT NULL COMMENT 'Authentication codes',
  `pfp` varchar(100) DEFAULT NULL,
  `Position` varchar(100) NOT NULL DEFAULT 'Unstationed',
  PRIMARY KEY (`ID`),
  KEY `FK_accounts_divisions` (`DivID`),
  KEY `FK_accounts_Rank` (`RankID`),
  KEY `FK_accounts_Titles` (`TitleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Profile information for Staff and Students of Orbital';

DROP TABLE IF EXISTS `asset_types`;
CREATE TABLE IF NOT EXISTS `asset_types` (
  `atid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`atid`),
  UNIQUE KEY `Index 2` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) DEFAULT NULL COMMENT 'Asset UUID number for inworld assets',
  `type` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'See Asset Type table for possible values',
  `name` varchar(50) NOT NULL COMMENT 'Human readable Name for asset',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `Index 2` (`uuid`),
  KEY `FK_assets_asset_types` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Contains Asset UUIDs for Sounds and Images for the StarfleetDelta Classes';

DROP TABLE IF EXISTS `committee`;
CREATE TABLE IF NOT EXISTS `committee` (
  `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `FK_committee_accounts` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `comms`;
CREATE TABLE IF NOT EXISTS `comms` (
  `comid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `accountid` int(10) UNSIGNED NOT NULL,
  `ObjectUUID` char(36) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`comid`),
  UNIQUE KEY `Index 3` (`ObjectUUID`),
  UNIQUE KEY `Index 4` (`url`),
  KEY `FK_Comms_accounts` (`accountid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_UNIQUE` (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `ClassID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DivID` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `AutherID` int(10) UNSIGNED NOT NULL,
  `Class Name` tinytext NOT NULL,
  `Class Description` longtext NOT NULL,
  `Required Score` int(11) NOT NULL DEFAULT '80',
  PRIMARY KEY (`ClassID`),
  UNIQUE KEY `ClassName` (`Class Name`(100)),
  KEY `Divisions` (`DivID`),
  KEY `FK_courses_accounts` (`AutherID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE IF NOT EXISTS `curriculum` (
  `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `classID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `asset_id` int(10) UNSIGNED DEFAULT NULL,
  `lineNumber` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `displayText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `Line` (`asset_id`,`displayText`,`lineNumber`),
  KEY `FK_curriculum_courses` (`classID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (
  `did` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL DEFAULT '0',
  `alias` varchar(50) DEFAULT NULL,
  `FileNamePrefix` char(3) DEFAULT NULL,
  `colorX` int(10) UNSIGNED NOT NULL DEFAULT '255',
  `colorY` int(10) UNSIGNED NOT NULL DEFAULT '255',
  `ColorZ` int(10) UNSIGNED NOT NULL DEFAULT '255',
  PRIMARY KEY (`did`),
  UNIQUE KEY `Index 3` (`dname`),
  UNIQUE KEY `Index 2` (`alias`),
  UNIQUE KEY `File name Prefix` (`FileNamePrefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='List of UFGQ Divisions';

DROP TABLE IF EXISTS `gradebook`;
CREATE TABLE IF NOT EXISTS `gradebook` (
  `entryIndex` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `CourseID` int(10) UNSIGNED NOT NULL,
  `Grade` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`entryIndex`),
  KEY `FK_gradebook_accounts` (`StudentID`),
  KEY `FK_gradebook_class_test` (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Holds all the grades for each class in StarfleetDelta';
DROP VIEW IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
`Name` int(1)
,`Class Name` int(1)
,`Grade` int(1)
);

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `notifications_id` int(11) NOT NULL AUTO_INCREMENT,
  `notifications_subject` varchar(250) NOT NULL,
  `notifications_text` text NOT NULL,
  `notifications_status` int(1) NOT NULL,
  PRIMARY KEY (`notifications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `oauth`;
CREATE TABLE IF NOT EXISTS `oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `bitly` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `posted` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posted_UNIQUE` (`posted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` float UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pname` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Product information for all of StarfleetDelta';

DROP TABLE IF EXISTS `rank`;
CREATE TABLE IF NOT EXISTS `rank` (
  `RankID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) DEFAULT '0',
  `RankLogo` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'â˜…',
  PRIMARY KEY (`RankID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Rank table';

DROP TABLE IF EXISTS `roleplay`;
CREATE TABLE IF NOT EXISTS `roleplay` (
  `id` int(11) NOT NULL,
  `stardate` varchar(45) DEFAULT NULL,
  `starend` varchar(45) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `sid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `QuestionID` int(10) UNSIGNED NOT NULL,
  `answer` char(1) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `Index 4` (`StudentID`,`QuestionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `time_clock`;
CREATE TABLE IF NOT EXISTS `time_clock` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID from accounts table',
  `time_in` int(10) UNSIGNED NOT NULL,
  `time_out` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Cross refrences clock times with AV UUIDs';

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `tid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Common Group Tags';

DROP TABLE IF EXISTS `versions`;
CREATE TABLE IF NOT EXISTS `versions` (
  `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProdID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AccountID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `FK_versions_products` (`ProdID`),
  KEY `FK_versions_accounts` (`AccountID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tracks accounts and product version information for the update system';

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `object` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `RankName`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbo767098765`@`%` SQL SECURITY DEFINER VIEW `RankName`  AS  select `r`.`RankLogo` AS `RankLogo`,`r`.`rname` AS `rname`,ifnull(`a`.`DisplayName`,`a`.`username`) AS `name`,`t`.`tag_name` AS `tag_name`,`a`.`active` AS `active`,`d`.`dname` AS `dname` from (((`accounts` `a` join `divisions` `d` on((`a`.`DivID` = `d`.`did`))) join `rank` `r` on((`a`.`RankID` = `r`.`RankID`))) join `titles` `t` on((`a`.`TitleID` = `t`.`tid`))) ;
DROP TABLE IF EXISTS `grades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbo767098765`@`%` SQL SECURITY DEFINER VIEW `grades`  AS  select 1 AS `Name`,1 AS `Class Name`,1 AS `Grade` ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
