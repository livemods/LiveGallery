-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2017 at 02:13 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elkarte`
--

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_albums`
--

DROP TABLE IF EXISTS `elkarte_lgal_albums`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_albums` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `owner` smallint(5) UNSIGNED NOT NULL,
  `owner_name` varchar(80) NOT NULL,
  `groups` varchar(80) NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `num_items` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `flags` (`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_audit`
--

DROP TABLE IF EXISTS `elkarte_lgal_audit`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_audit` (
  `member` mediumint(8) UNSIGNED NOT NULL,
  `item` mediumint(8) UNSIGNED NOT NULL,
  `comment` mediumint(8) UNSIGNED DEFAULT NULL,
  `date_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member`,`item`) USING BTREE,
  KEY `fk_item` (`item`),
  KEY `comment` (`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_comments`
--

DROP TABLE IF EXISTS `elkarte_lgal_comments`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_comments` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item` mediumint(8) UNSIGNED NOT NULL,
  `body` varchar(4096) NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `creator` mediumint(8) UNSIGNED NOT NULL,
  `creator_name` varchar(80) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `flags` (`flags`),
  KEY `creator` (`creator`),
  KEY `item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `elkarte_lgal_comments`
--
DROP TRIGGER IF EXISTS `after_delete_comment`;
DELIMITER $$
CREATE TRIGGER `after_delete_comment` AFTER DELETE ON `elkarte_lgal_comments` FOR EACH ROW BEGIN


		UPDATE elkarte_lgal_items set num_comments= ( select count(*) from elkarte_lgal_comments where item = old.item)where id=old.item;
		
    END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_insert_comment`;
DELIMITER $$
CREATE TRIGGER `after_insert_comment` AFTER INSERT ON `elkarte_lgal_comments` FOR EACH ROW BEGIN


		UPDATE elkarte_lgal_items set num_comments= ( select count(*) from elkarte_lgal_comments where item = new.item)where id=NEW.item;
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_fields`
--

DROP TABLE IF EXISTS `elkarte_lgal_fields`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_fields` (
  `id_field` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `enclose` varchar(4096) NOT NULL,
  `options` varchar(4096) NOT NULL,
  `size` smallint(5) UNSIGNED NOT NULL,
  `default_value` varchar(80) NOT NULL,
  `mask` varchar(20) NOT NULL,
  `regex` varchar(80) NOT NULL,
  `boards` varchar(80) NOT NULL,
  `groups` varchar(80) NOT NULL,
  `bbc` enum('no','yes') NOT NULL,
  `can_search` enum('no','yes') NOT NULL,
  `active` enum('yes','no') NOT NULL,
  `required` enum('yes','no') NOT NULL,
  `eval` enum('no','yes') NOT NULL,
  `topic_only` enum('no','yes') NOT NULL,
  `mi` enum('no','yes') NOT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_items`
--

DROP TABLE IF EXISTS `elkarte_lgal_items`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_items` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `album` smallint(5) UNSIGNED DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `creator` mediumint(8) UNSIGNED NOT NULL,
  `creator_name` varchar(80) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_comments` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `flags` (`flags`),
  KEY `creator` (`creator`),
  KEY `album` (`album`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `elkarte_lgal_items`
--
DROP TRIGGER IF EXISTS `after_delete_item`;
DELIMITER $$
CREATE TRIGGER `after_delete_item` AFTER DELETE ON `elkarte_lgal_items` FOR EACH ROW BEGIN


		UPDATE elkarte_lgal_albums set num_items= ( select count(*) from elkarte_lgal_items where album = old.album)where id=old.album;
		delete from elkarte_lgal_log_mark_read where item=old.id;
		
    END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_insert_item`;
DELIMITER $$
CREATE TRIGGER `after_insert_item` AFTER INSERT ON `elkarte_lgal_items` FOR EACH ROW BEGIN


		UPDATE elkarte_lgal_albums set num_items= ( select count(*) from elkarte_lgal_items where album = new.album)where id=NEW.album;
		INSERT INTO elkarte_lgal_log_mark_read VALUES (NEW.creator,new.id,null);
        INSERT INTO elkarte_lgal_search select * from elkarte_lgal_items where id = new.id;
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_log_mark_read`
--

DROP TABLE IF EXISTS `elkarte_lgal_log_mark_read`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_log_mark_read` (
  `member` mediumint(8) UNSIGNED NOT NULL,
  `item` mediumint(8) UNSIGNED NOT NULL,
  `comment` mediumint(8) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`member`,`item`) USING BTREE,
  KEY `comment` (`comment`),
  KEY `elkarte_lgal_log_mark_read_ibfk_1` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elkarte_lgal_search`
--

DROP TABLE IF EXISTS `elkarte_lgal_search`;
CREATE TABLE IF NOT EXISTS `elkarte_lgal_search` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `album` smallint(5) UNSIGNED DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `creator` mediumint(8) UNSIGNED NOT NULL,
  `creator_name` varchar(80) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_comments` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `flags` (`flags`),
  KEY `creator` (`creator`),
  KEY `album` (`album`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elkarte_lgal_items`
--
ALTER TABLE `elkarte_lgal_items` ADD FULLTEXT KEY `name` (`name`,`description`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `elkarte_lgal_comments`
--
ALTER TABLE `elkarte_lgal_comments`
  ADD CONSTRAINT `elkarte_lgal_comments_ibfk_1` FOREIGN KEY (`item`) REFERENCES `elkarte_lgal_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elkarte_lgal_items`
--
ALTER TABLE `elkarte_lgal_items`
  ADD CONSTRAINT `elkarte_lgal_items_ibfk_1` FOREIGN KEY (`album`) REFERENCES `elkarte_lgal_albums` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elkarte_lgal_log_mark_read`
--
ALTER TABLE `elkarte_lgal_log_mark_read`
  ADD CONSTRAINT `elkarte_lgal_log_mark_read_ibfk_1` FOREIGN KEY (`item`) REFERENCES `elkarte_lgal_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elkarte_lgal_log_mark_read_ibfk_3` FOREIGN KEY (`comment`) REFERENCES `elkarte_lgal_comments` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
