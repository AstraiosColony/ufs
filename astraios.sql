-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2019 at 05:08 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astraios`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `UUID` char(36) CHARACTER SET latin1 NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `DivID` tinyint(3) UNSIGNED NOT NULL DEFAULT '10',
  `RankID` tinyint(3) UNSIGNED NOT NULL DEFAULT '13',
  `TitleID` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `DisplayName` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(120) CHARACTER SET latin1 NOT NULL,
  `password` char(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '128 char long sha512 hash',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 inactive 1 active',
  `induction_date` date DEFAULT NULL,
  `dh` bit(1) NOT NULL DEFAULT b'0',
  `JoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'BUG: This field should be a Date however we will get ERROR 1607 Invalid value. Please Fix',
  `DOB` date NOT NULL DEFAULT '1990-01-07',
  `birth_place` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT 'Some Where',
  `height_metric` tinyint(3) UNSIGNED NOT NULL DEFAULT '6',
  `weight_metric` tinyint(3) UNSIGNED NOT NULL DEFAULT '6',
  `hair_color` varchar(3) CHARACTER SET latin1 NOT NULL DEFAULT 'blk',
  `species` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'Human',
  `gender` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `ethnic_origin` varchar(64) CHARACTER SET latin1 DEFAULT '1',
  `nationality` varchar(64) CHARACTER SET latin1 DEFAULT '1',
  `ident_marks` varchar(64) CHARACTER SET latin1 DEFAULT '1',
  `db_privlage_level` tinyint(3) UNSIGNED NOT NULL DEFAULT '255' COMMENT 'Administration/viewing privlages',
  `cCode` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Authentication codes',
  `pfp` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Position` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'Unstationed'
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COMMENT='Profile information for Staff and Students of Orbital';

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `aid` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Asset UUID number for inworld assets',
  `type` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'See Asset Type table for possible values',
  `name` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Human readable Name for asset'
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COMMENT='Contains Asset UUIDs for Sounds and Images for the StarfleetDelta Classes';

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `atid` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

CREATE TABLE `committee` (
  `index` int(10) UNSIGNED NOT NULL,
  `aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comms`
--

CREATE TABLE `comms` (
  `comid` int(10) UNSIGNED NOT NULL,
  `accountid` int(10) UNSIGNED NOT NULL,
  `ObjectUUID` char(36) CHARACTER SET latin1 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `setting` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ClassID` int(10) UNSIGNED NOT NULL,
  `DivID` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `AutherID` int(10) UNSIGNED NOT NULL,
  `Class Name` tinytext NOT NULL,
  `Class Description` longtext NOT NULL,
  `Required Score` int(11) NOT NULL DEFAULT '80'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `index` int(10) UNSIGNED NOT NULL,
  `classID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `asset_id` int(10) UNSIGNED DEFAULT NULL,
  `lineNumber` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `displayText` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `did` tinyint(3) UNSIGNED NOT NULL,
  `dname` varchar(50) NOT NULL DEFAULT '0',
  `alias` varchar(50) DEFAULT NULL,
  `FileNamePrefix` char(3) DEFAULT NULL,
  `colorX` int(10) UNSIGNED NOT NULL DEFAULT '255',
  `colorY` int(10) UNSIGNED NOT NULL DEFAULT '255',
  `ColorZ` int(10) UNSIGNED NOT NULL DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='List of UFGQ Divisions';

-- --------------------------------------------------------

--
-- Table structure for table `gradebook`
--

CREATE TABLE `gradebook` (
  `entryIndex` int(10) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `CourseID` int(10) UNSIGNED NOT NULL,
  `Grade` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Holds all the grades for each class in StarfleetDelta';

-- --------------------------------------------------------

--
-- Stand-in structure for view `grades`
-- (See below for the actual view)
--
CREATE TABLE `grades` (
`Name` int(1)
,`Class Name` int(1)
,`Grade` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL,
  `notifications_subject` varchar(250) NOT NULL,
  `notifications_text` text NOT NULL,
  `notifications_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth`
--

CREATE TABLE `oauth` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `bitly` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `posted` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `version` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Product information for all of StarfleetDelta';

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `RankID` tinyint(3) UNSIGNED NOT NULL,
  `rname` varchar(50) DEFAULT '0',
  `RankLogo` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'â˜…'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Rank table';

-- --------------------------------------------------------

--
-- Stand-in structure for view `RankName`
-- (See below for the actual view)
--
CREATE TABLE `RankName` (
`RankLogo` varchar(7)
,`rname` varchar(50)
,`name` varchar(64)
,`tag_name` varchar(55)
,`active` tinyint(4)
,`dname` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `roleplay`
--

CREATE TABLE `roleplay` (
  `id` int(11) NOT NULL,
  `stardate` varchar(45) DEFAULT NULL,
  `starend` varchar(45) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `sid` int(10) UNSIGNED NOT NULL,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `QuestionID` int(10) UNSIGNED NOT NULL,
  `answer` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `registry` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `class` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `decks` int(9) NOT NULL,
  `compliment` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_clock`
--

CREATE TABLE `time_clock` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID from accounts table',
  `time_in` int(10) UNSIGNED NOT NULL,
  `time_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COMMENT='Cross refrences clock times with AV UUIDs';

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `tid` tinyint(3) UNSIGNED NOT NULL,
  `tag_name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Common Group Tags';

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `vid` int(10) UNSIGNED NOT NULL,
  `ProdID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AccountID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tracks accounts and product version information for the update system';

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

CREATE TABLE `vessels` (
  `registry` varchar(23) COLLATE latin1_general_ci NOT NULL,
  `station` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `name` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `vid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `object` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `grades`
--
DROP TABLE IF EXISTS `grades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbo767098765`@`%` SQL SECURITY DEFINER VIEW `grades`  AS  select 1 AS `Name`,1 AS `Class Name`,1 AS `Grade` ;

-- --------------------------------------------------------

--
-- Structure for view `RankName`
--
DROP TABLE IF EXISTS `RankName`;

CREATE ALGORITHM=UNDEFINED DEFINER=```rootS2MV8yc$#uFG?YgA```@```localhost``` SQL SECURITY DEFINER VIEW `RankName`  AS  select `r`.`RankLogo` AS `RankLogo`,`r`.`rname` AS `rname`,ifnull(`a`.`DisplayName`,`a`.`username`) AS `name`,`t`.`tag_name` AS `tag_name`,`a`.`active` AS `active`,`d`.`dname` AS `dname` from (((`accounts` `a` join `divisions` `d` on((`a`.`DivID` = `d`.`did`))) join `rank` `r` on((`a`.`RankID` = `r`.`RankID`))) join `titles` `t` on((`a`.`TitleID` = `t`.`tid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_accounts_divisions` (`DivID`),
  ADD KEY `FK_accounts_Rank` (`RankID`),
  ADD KEY `FK_accounts_Titles` (`TitleID`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `Index 2` (`uuid`),
  ADD KEY `FK_assets_asset_types` (`type`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`atid`),
  ADD UNIQUE KEY `Index 2` (`type`);

--
-- Indexes for table `committee`
--
ALTER TABLE `committee`
  ADD PRIMARY KEY (`index`),
  ADD UNIQUE KEY `FK_committee_accounts` (`aid`);

--
-- Indexes for table `comms`
--
ALTER TABLE `comms`
  ADD PRIMARY KEY (`comid`),
  ADD UNIQUE KEY `Index 3` (`ObjectUUID`),
  ADD UNIQUE KEY `Index 4` (`url`),
  ADD KEY `FK_Comms_accounts` (`accountid`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_UNIQUE` (`setting`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ClassID`),
  ADD UNIQUE KEY `ClassName` (`Class Name`(100)),
  ADD KEY `Divisions` (`DivID`),
  ADD KEY `FK_courses_accounts` (`AutherID`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`index`),
  ADD UNIQUE KEY `Line` (`asset_id`,`displayText`,`lineNumber`),
  ADD KEY `FK_curriculum_courses` (`classID`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`did`),
  ADD UNIQUE KEY `Index 3` (`dname`),
  ADD UNIQUE KEY `Index 2` (`alias`),
  ADD UNIQUE KEY `File name Prefix` (`FileNamePrefix`);

--
-- Indexes for table `gradebook`
--
ALTER TABLE `gradebook`
  ADD PRIMARY KEY (`entryIndex`),
  ADD KEY `FK_gradebook_accounts` (`StudentID`),
  ADD KEY `FK_gradebook_class_test` (`CourseID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`);

--
-- Indexes for table `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posted_UNIQUE` (`posted`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pname` (`name`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`RankID`);

--
-- Indexes for table `roleplay`
--
ALTER TABLE `roleplay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `Index 4` (`StudentID`,`QuestionID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`registry`);

--
-- Indexes for table `time_clock`
--
ALTER TABLE `time_clock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `FK_versions_products` (`ProdID`),
  ADD KEY `FK_versions_accounts` (`AccountID`);

--
-- Indexes for table `vessels`
--
ALTER TABLE `vessels`
  ADD PRIMARY KEY (`registry`),
  ADD UNIQUE KEY `registry` (`registry`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `atid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `committee`
--
ALTER TABLE `committee`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comms`
--
ALTER TABLE `comms`
  MODIFY `comid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ClassID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `did` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `gradebook`
--
ALTER TABLE `gradebook`
  MODIFY `entryIndex` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `posted` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `RankID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `sid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `time_clock`
--
ALTER TABLE `time_clock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `tid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
